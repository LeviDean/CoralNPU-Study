#!/usr/bin/env bash
# Toy ViT -> StableHLO -> coralnpu-compile -> MPACT, end to end.
# Export runs natively on the Mac (jaxlib needs AVX, which Rosetta lacks);
# compile + simulate run inside the x86 container.
set -euo pipefail

C="${CONTAINER:-$(docker ps --filter ancestor=coralnpu-dev --format '{{.Names}}' | head -1)}"
W=/home/builder/work
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE"

echo "=== 1. Export StableHLO (Mac, native JAX) ==="
source ../.venv-jax/bin/activate
python export_vit.py --outdir out

echo "=== 2. Copy into container $C ==="
docker exec "$C" mkdir -p "$W/vit" "$W/coralnpu-compiler/examples/toy-vit-aot"
docker cp container/run_vit.py  "$C:$W/coralnpu-compiler/examples/toy-vit-aot/"
docker cp container/BUILD.bazel "$C:$W/coralnpu-compiler/examples/toy-vit-aot/"
for f in vit.mlir ref_in.npy ref_out.npy; do docker cp "out/$f" "$C:$W/vit/"; done
docker exec -u root "$C" chown -R builder:builder "$W/vit" "$W/coralnpu-compiler/examples/toy-vit-aot"

echo "=== 3. Compile to VMFB ==="
docker exec "$C" bash -c "cd $W/coralnpu-compiler && bazel-bin/compiler/tools/coralnpu-compile \
  --iree-hal-target-device=local \
  --iree-hal-local-target-device-backends=llvm-cpu \
  --iree-llvmcpu-target-cpu-features=host \
  --iree-hal-target-device=coralnpu \
  --coralnpu-dump-affinity-profile-format=pretty \
  $W/vit/vit.mlir -o $W/vit/vit.vmfb 2>&1 | tee $W/vit/compile.log"
docker cp "$C:$W/vit/compile.log" out/compile.log

echo "=== 4. Run on MPACT and compare with JAX reference ==="
docker exec "$C" bash -c "cd $W/coralnpu-compiler && bazel build --config=dev //examples/toy-vit-aot:run_vit 2>&1 | tail -2 && \
  LD_LIBRARY_PATH=\$PWD/runtime/sim bazel-bin/examples/toy-vit-aot/run_vit \
  --vmfb=$W/vit/vit.vmfb --input=$W/vit/ref_in.npy --ref=$W/vit/ref_out.npy"
