"""Run on the Mac (native JAX). Emits StableHLO MLIR plus reference input/output."""
import argparse
import os
import numpy as np
import jax.numpy as jnp
from vit_model import predict, IMG


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--outdir", default="out")
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)

    x = np.random.default_rng(42).standard_normal((1, IMG, IMG, 3)).astype(np.float32)
    ref = np.asarray(predict(jnp.asarray(x)))

    ir = predict.lower(jnp.asarray(x)).compiler_ir(dialect="stablehlo")
    with open(os.path.join(args.outdir, "vit.mlir"), "w") as f:
        f.write(str(ir))
    np.save(os.path.join(args.outdir, "ref_in.npy"), x)
    np.save(os.path.join(args.outdir, "ref_out.npy"), ref)
    print("logits:", np.round(ref, 4))
    print("top-1 :", int(ref.argmax()))


if __name__ == "__main__":
    main()
