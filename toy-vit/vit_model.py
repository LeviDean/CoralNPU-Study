"""Toy ViT in pure JAX. Weights are closure constants so they get baked into the exported IR."""
import numpy as np
import jax
import jax.numpy as jnp

IMG, PATCH, DIM, HEADS, MLP, DEPTH, CLASSES = 32, 8, 32, 2, 64, 2, 10
NTOK = (IMG // PATCH) ** 2          # 16 patches
HDIM = DIM // HEADS

_rng = np.random.default_rng(0)


def _w(*shape):
    return jnp.asarray(_rng.normal(0.0, 0.02, shape), jnp.float32)


PARAMS = {
    "patch_w": _w(PATCH * PATCH * 3, DIM), "patch_b": jnp.zeros(DIM, jnp.float32),
    "cls": _w(1, 1, DIM), "pos": _w(1, NTOK + 1, DIM),
    "blocks": [
        {
            "ln1_g": jnp.ones(DIM, jnp.float32), "ln1_b": jnp.zeros(DIM, jnp.float32),
            "qkv": _w(DIM, 3 * DIM), "proj": _w(DIM, DIM),
            "ln2_g": jnp.ones(DIM, jnp.float32), "ln2_b": jnp.zeros(DIM, jnp.float32),
            "fc1": _w(DIM, MLP), "fc1_b": jnp.zeros(MLP, jnp.float32),
            "fc2": _w(MLP, DIM), "fc2_b": jnp.zeros(DIM, jnp.float32),
        }
        for _ in range(DEPTH)
    ],
    "ln_g": jnp.ones(DIM, jnp.float32), "ln_b": jnp.zeros(DIM, jnp.float32),
    "head": _w(DIM, CLASSES),
}


def layernorm(x, g, b):
    m = x.mean(-1, keepdims=True)
    v = ((x - m) ** 2).mean(-1, keepdims=True)
    return (x - m) / jnp.sqrt(v + 1e-6) * g + b


def attention(x, blk):
    b, n, _ = x.shape
    qkv = (x @ blk["qkv"]).reshape(b, n, 3, HEADS, HDIM)
    q, k, v = qkv[:, :, 0], qkv[:, :, 1], qkv[:, :, 2]
    att = jnp.einsum("bnhd,bmhd->bhnm", q, k) / np.sqrt(HDIM).astype(np.float32)
    att = jax.nn.softmax(att, axis=-1)
    out = jnp.einsum("bhnm,bmhd->bnhd", att, v).reshape(b, n, DIM)
    return out @ blk["proj"]


@jax.jit
def predict(img):
    """img: [1, 32, 32, 3] float32 -> logits [1, 10]."""
    p = PARAMS
    b = img.shape[0]
    x = img.reshape(b, IMG // PATCH, PATCH, IMG // PATCH, PATCH, 3)
    x = x.transpose(0, 1, 3, 2, 4, 5).reshape(b, NTOK, PATCH * PATCH * 3)
    x = x @ p["patch_w"] + p["patch_b"]
    x = jnp.concatenate([jnp.broadcast_to(p["cls"], (b, 1, DIM)), x], axis=1) + p["pos"]
    for blk in p["blocks"]:
        x = x + attention(layernorm(x, blk["ln1_g"], blk["ln1_b"]), blk)
        h = jax.nn.gelu(layernorm(x, blk["ln2_g"], blk["ln2_b"]) @ blk["fc1"] + blk["fc1_b"])
        x = x + h @ blk["fc2"] + blk["fc2_b"]
    return layernorm(x[:, 0], p["ln_g"], p["ln_b"]) @ p["head"]
