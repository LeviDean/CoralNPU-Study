"""教程用的最小例子：一层 Linear(32→64) 接 gelu，输入 17×32。和 toy ViT 里的 fc1 完全同形状。"""
import math
import torch
import torch.nn as nn


class LinGelu(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc = nn.Linear(32, 64)

    def forward(self, x):                      # x: [17, 32]
        h = self.fc(x)                          # [17, 64]
        return 0.5 * h * (1.0 + torch.tanh(math.sqrt(2.0 / math.pi) * (h + 0.044715 * h ** 3)))
