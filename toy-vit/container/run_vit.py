"""Runs the compiled toy ViT on CoralNPU (MPACT) via IREE and checks against the JAX reference."""
import argparse
import sys
import time
import numpy as np
import iree.runtime as ireert


def load(vmfb_path, module_name):
    instance = ireert.VmInstance()
    print("Available drivers:", ireert.query_available_drivers())
    cpu = ireert.get_device("local-sync")
    npu = ireert.get_device("coralnpu")
    hal = ireert.create_hal_module(instance, devices=[cpu, npu])

    class Cfg:
        def __init__(self):
            self.device = cpu
            self.vm_instance = instance
            self.default_vm_modules = (hal,)

    ctx = ireert.SystemContext(config=Cfg())
    ctx.add_vm_module(ireert.VmModule.mmap(instance, vmfb_path))
    print('Modules in context:', list(ctx.modules.keys()))
    return getattr(ctx.modules, module_name).main


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--vmfb", required=True)
    ap.add_argument("--input", required=True)
    ap.add_argument("--ref", required=True)
    ap.add_argument("--module", default="jit_predict", help="IREE module name: jit_predict for JAX exports, module for torch-mlir exports")
    ap.add_argument("--json", default=None, help="Write full-precision outputs to this JSON file")
    args, _ = ap.parse_known_args()

    fn = load(args.vmfb, args.module)
    x = np.load(args.input)
    ref = np.load(args.ref)

    t0 = time.time()
    out = np.asarray(fn(x))
    print(f"Inference wall time: {time.time() - t0:.3f}s")

    print("npu logits:", np.round(out, 4))
    print("ref logits:", np.round(ref, 4))
    print("top-1 npu/ref:", int(out.argmax()), int(ref.argmax()))
    if args.json:
        import json
        with open(args.json, "w") as f:
            json.dump({"npu": out.ravel().tolist(), "ref": ref.ravel().tolist()}, f)
    print("max abs diff:", float(np.max(np.abs(out - ref))))
    if np.allclose(out, ref, atol=1e-3, rtol=1e-3):
        print("SUCCESS: matches framework reference")
    else:
        print("ERROR: mismatch")
        sys.exit(1)


if __name__ == "__main__":
    main()
