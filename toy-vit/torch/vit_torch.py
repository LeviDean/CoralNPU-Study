"""Toy ViT in PyTorch. Same architecture as vit_model.py (JAX).

Layernorm and GELU are written out by hand so the graph only contains basic
ops (matmul, add, mul, tanh, softmax, sqrt), which keeps the StableHLO
lowering in torch-mlir on well-trodden paths.
"""
import math
import torch
import torch.nn as nn

IMG, PATCH, DIM, HEADS, MLP, DEPTH, CLASSES = 32, 8, 32, 2, 64, 2, 10
NTOK = (IMG // PATCH) ** 2
HDIM = DIM // HEADS


class LayerNorm(nn.Module):
    def __init__(self, dim):
        super().__init__()
        self.g = nn.Parameter(torch.ones(dim))
        self.b = nn.Parameter(torch.zeros(dim))

    def forward(self, x):
        m = x.mean(-1, keepdim=True)
        v = ((x - m) ** 2).mean(-1, keepdim=True)
        return (x - m) / torch.sqrt(v + 1e-6) * self.g + self.b


def gelu(x):
    return 0.5 * x * (1.0 + torch.tanh(math.sqrt(2.0 / math.pi) * (x + 0.044715 * x ** 3)))


class Block(nn.Module):
    def __init__(self):
        super().__init__()
        self.ln1, self.ln2 = LayerNorm(DIM), LayerNorm(DIM)
        self.qkv = nn.Linear(DIM, 3 * DIM, bias=False)
        self.proj = nn.Linear(DIM, DIM, bias=False)
        self.fc1, self.fc2 = nn.Linear(DIM, MLP), nn.Linear(MLP, DIM)

    def forward(self, x):
        b, n, _ = x.shape
        qkv = self.qkv(self.ln1(x)).reshape(b, n, 3, HEADS, HDIM).permute(2, 0, 3, 1, 4)
        q, k, v = qkv[0], qkv[1], qkv[2]                      # b, h, n, d
        att = torch.softmax(q @ k.transpose(-2, -1) / math.sqrt(HDIM), dim=-1)
        x = x + self.proj((att @ v).transpose(1, 2).reshape(b, n, DIM))
        return x + self.fc2(gelu(self.fc1(self.ln2(x))))


class ToyViT(nn.Module):
    def __init__(self):
        super().__init__()
        self.patch = nn.Linear(PATCH * PATCH * 3, DIM)
        self.cls = nn.Parameter(torch.randn(1, 1, DIM) * 0.02)
        self.pos = nn.Parameter(torch.randn(1, NTOK + 1, DIM) * 0.02)
        self.blocks = nn.ModuleList([Block() for _ in range(DEPTH)])
        self.ln = LayerNorm(DIM)
        self.head = nn.Linear(DIM, CLASSES, bias=False)

    def forward(self, img):                                   # img: [1, 32, 32, 3]
        b = img.shape[0]
        g = IMG // PATCH
        x = img.reshape(b, g, PATCH, g, PATCH, 3).permute(0, 1, 3, 2, 4, 5).reshape(b, NTOK, PATCH * PATCH * 3)
        x = torch.cat([self.cls.expand(b, -1, -1), self.patch(x)], dim=1) + self.pos
        for blk in self.blocks:
            x = blk(x)
        return self.head(self.ln(x[:, 0]))
