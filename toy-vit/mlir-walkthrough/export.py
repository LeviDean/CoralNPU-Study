import os, numpy as np, torch
from torch_mlir import fx
from lin_gelu import LinGelu

os.makedirs("out", exist_ok=True)
torch.manual_seed(0)
m = LinGelu().eval()
x = torch.from_numpy(np.random.default_rng(1).standard_normal((17, 32)).astype(np.float32))
with torch.no_grad():
    y = m(x).numpy()
np.save("out/ref_in.npy", x.numpy()); np.save("out/ref_out.npy", y)

ep = torch.export.export(m, (x,))
open("out/1_fx_graph.txt", "w").write(ep.graph_module.code)
open("out/2_torch.mlir", "w").write(str(fx.export_and_import(m, x, output_type="torch", func_name="main")))
open("out/3_stablehlo.mlir", "w").write(str(fx.export_and_import(m, x, output_type="stablehlo", func_name="main")))
print("ok", y.shape, float(y[0, 0]))
