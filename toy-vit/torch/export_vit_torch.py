"""Run inside the Linux x86 container. PyTorch -> StableHLO via torch-mlir."""
import argparse
import os
import numpy as np
import torch
from torch_mlir import fx
from vit_torch import ToyViT, IMG


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--outdir", default="out_torch")
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)

    torch.manual_seed(0)
    model = ToyViT().eval()
    x = torch.from_numpy(np.random.default_rng(42).standard_normal((1, IMG, IMG, 3)).astype(np.float32))
    with torch.no_grad():
        ref = model(x).numpy()

    module = fx.export_and_import(model, x, output_type="stablehlo", func_name="main")
    with open(os.path.join(args.outdir, "vit.mlir"), "w") as f:
        f.write(str(module))
    np.save(os.path.join(args.outdir, "ref_in.npy"), x.numpy())
    np.save(os.path.join(args.outdir, "ref_out.npy"), ref)
    print("logits:", np.round(ref, 4))
    print("top-1 :", int(ref.argmax()))


if __name__ == "__main__":
    main()
