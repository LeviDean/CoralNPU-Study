#!/usr/bin/env python3
"""Builds toy-vit/pipeline_record.html: a plain, factual record of the PyTorch -> Coral NPU run.

Code excerpts are read from the real artifacts under toy-vit/out_torch so the page cannot drift
from what was actually produced. Numbers that are not read from files were measured on 2026-09-17
and are hard-coded below with a note of where they came from.
"""
import html
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import record_figs as F  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parents[1]
OT = ROOT / "out_torch"
ST = OT / "stages"
OUT = ROOT / "pipeline_record.html"


def esc(s):
    return html.escape(str(s), quote=False)


def clip(line, n=200):
    line = line.rstrip("\n")
    return line if len(line) <= n else line[: n - 1] + "…"


def lines_of(path, a, b, n=200):
    ls = path.read_text().split("\n")
    return "\n".join(clip(l, n) for l in ls[a - 1:b])


def pre(text, caption=None):
    cap = f'<div class="cap">{esc(caption)}</div>' if caption else ""
    return f'<figure class="code">{cap}<pre>{esc(text)}</pre></figure>'


def table(head, rows, cls=""):
    h = "".join(f"<th>{c}</th>" for c in head)
    body = "".join("<tr>" + "".join(f"<td>{c}</td>" for c in r) + "</tr>" for r in rows)
    return f'<div class="tw"><table class="{cls}"><thead><tr>{h}</tr></thead><tbody>{body}</tbody></table></div>'


def c(s):
    return f"<code>{esc(s)}</code>"


# ------------------------------------------------------------------ data taken from artifacts
def asm_inner_loop():
    ls = (ST / "module_main_dispatch_5_embedded_elf_riscv_32.s").read_text().split("\n")
    start = next(i for i, l in enumerate(ls) if l.startswith("main_dispatch_5_matmul"))
    k = next(i for i in range(start, len(ls)) if "vfmadd" in ls[i])
    out = [l.replace("\t", "  ", 1).replace("\t", " ") for l in ls[k - 9:k + 7] if ".loc" not in l and l.strip()]
    return "\n".join(out)


def lowering_config():
    t = (ST / "configured_module_main_dispatch_5.mlir").read_text()
    m = re.search(r"lowering_config = (#iree_cpu\.lowering_config<[^>]*>)", t)
    p = re.search(r"translation_info = (#iree_codegen\.translation_info<[^>]*>)", t)
    return p.group(1), m.group(1)


def stablehlo_hist():
    t = (OT / "vit.mlir").read_text()
    from collections import Counter
    cnt = Counter(re.findall(r"(stablehlo\.[a-z_]+|arith\.[a-z_]+)", t))
    return cnt.most_common()


def torch_hist():
    t = (OT / "vit.torch_dialect.mlir").read_text()
    from collections import Counter
    cnt = Counter(re.findall(r"torch\.(aten\.[A-Za-z_.]+|prim\.[A-Za-z]+|vtensor\.literal|constant\.[a-z]+)", t))
    return cnt.most_common(14)


def input_dialects():
    from collections import Counter
    t = (ST / "input.mlir").read_text()
    ops = re.findall(r'= "?([a-z_]+)\.([a-z_.]+)', t)
    by = Counter(d for d, _ in ops)
    mem = {d: Counter(o for dd, o in ops if dd == d).most_common(5) for d in by}
    role = {"tensor": "张量的分配、整形与切片", "linalg": "计算的循环骨架", "arith": "标量算术与常量", "math": "标量数学函数"}
    rows = []
    for d, n in by.most_common():
        members = "、".join(f"{c(o)} {k}" for o, k in mem[d])
        rows.append([c(d), n, role.get(d, "—"), members])
    rows.append(["合计", sum(by.values()), "", ""])
    return rows


def unit_source(num, width=150):
    t = (ST / "flow.mlir").read_text()
    m = re.search(r"(  flow\.executable private @main_dispatch_%d \{.*?\n  \}\n)" % num, t, re.S)
    return "\n".join(clip(l[2:] if l.startswith("  ") else l, width) for l in m.group(1).rstrip().split("\n"))


UNIT_NOTE = {
    0: "patch 重排：多维转置的一部分",
    1: "patch 线性投影：矩阵乘 + 加偏置",
    2: "加位置编码：17×32 = 544 个元素逐个相加",
    3: "LN 前半：求均值并减去。内部没有权重，所以 4 个 block 内 LN 共用这一份",
    4: "LN 后半（block 1 · LN1）：平方、求和、加 ε、开方、相除、乘 γ 加 β",
    5: "qkv 投影：纯矩阵乘，无偏置",
    6: "转置 17×6×16 → 6×17×16（6 = Q、K、V × 2 头）",
    7: "Q·Kᵀ 批量矩阵乘，再除以 √16",
    8: "softmax：此时仍是一个 linalg.softmax 算子，到代码生成才展开",
    9: "注意力权重 × V，再转置回 17×2×16",
    10: "注意力输出投影：矩阵乘 + 残差相加",
    12: "LN 后半（block 1 · LN2）",
    13: "fc1：矩阵乘 + 加偏置 + 整个 gelu，全在一个循环体里",
    14: "fc2（block 1）：矩阵乘 + 加偏置 + 残差相加",
    16: "LN 后半（block 2 · LN1）",
    24: "LN 后半（block 2 · LN2）",
    26: "fc2（block 2）：只有矩阵乘，偏置与残差被挪到了 27",
    27: "只读 cls 那一行（sizes = [1, 1, 32]）：fc2 输出 + 残差 + 偏置",
    28: "末层 LN：求和（算均值）",
    29: "末层 LN：减均值",
    30: "末层 LN：平方和",
    31: "末层 LN：加 ε、开方、相除、乘 γ 加 β",
    32: "分类头：向量 × 矩阵",
}


def dispatch_units():
    """Parses every flow.executable in flow.mlir: call count, IO tensor types, ops inside, device."""
    from collections import Counter
    t = (ST / "flow.mlir").read_text()
    blocks = re.findall(r"flow\.executable private @(main_dispatch_(\d+)) \{(.*?)\n  \}\n", t, re.S)
    calls = Counter(re.findall(r"flow\.dispatch @(main_dispatch_\d+)::", t))
    rows = []
    for name, num, body in blocks:
        fn = re.search(r"func\.func @(\w+)\((.*?)\) \{", body, re.S)
        args = re.findall(r"dispatch\.tensor<(readonly|writeonly|readwrite):tensor<([^>]+)>>", fn.group(2))
        ins = [x.replace("xf32", "") .replace("f32", "标量") for k, x in args if k == "readonly"]
        outs = [x.replace("xf32", "").replace("f32", "标量") for k, x in args if k != "readonly"]
        ops = Counter(re.findall(r"(linalg\.(?!yield)[a-z_]+|arith\.(?!constant)[a-z_]+|math\.[a-z_]+)", body))
        m = re.search(r"attributes \{stream\.affinity = #hal\.device\.affinity<@__device_(\d)>", body)
        final = "NPU" if int(num) in NPU else "主机"
        dev = final if m else f"此时未标注，最终 {final}"
        short = fn.group(1).replace(f"main_dispatch_{num}_", "").replace("_f32", "").replace("xf32_dispatch_tensor_store", "")
        rows.append((int(num), calls[name], short, ins, outs, ops, dev))
    return rows


SEQ = [(0, "transpose_4x8x4x24", "patch 重排"), (1, "matmul_16x32x192", "patch 线性投影 + 偏置"), (2, "elementwise_544", "加位置编码"),
       (3, "reduction_17x32", "LN 前半：减均值"), (4, "reduction_17x32", "LN1 后半：归一化、γ、β"), (5, "matmul_17x96x32", "qkv 投影"),
       (6, "transpose_17x6x16", "拆头转置"), (7, "batch_matmul_2x17x17x16", "Q·Kᵀ，再除以 √16"), (8, "softmax_2x17x17", "注意力 softmax"),
       (9, "batch_matmul_2x17x16x17", "注意力 × V，再转置"), (10, "matmul_17x32x32", "输出投影 + 残差"), (3, "reduction_17x32", "LN 前半：减均值"),
       (12, "reduction_17x32", "LN2 后半：归一化、γ、β"), (13, "matmul_17x64x32", "fc1 + 偏置 + gelu"), (14, "matmul_17x32x64", "fc2 + 偏置 + 残差"),
       (3, "reduction_17x32", "LN 前半：减均值"), (16, "reduction_17x32", "LN1 后半：归一化、γ、β"), (5, "matmul_17x96x32", "qkv 投影"),
       (6, "transpose_17x6x16", "拆头转置"), (7, "batch_matmul_2x17x17x16", "Q·Kᵀ，再除以 √16"), (8, "softmax_2x17x17", "注意力 softmax"),
       (9, "batch_matmul_2x17x16x17", "注意力 × V，再转置"), (10, "matmul_17x32x32", "输出投影 + 残差"), (3, "reduction_17x32", "LN 前半：减均值"),
       (24, "reduction_17x32", "LN2 后半：归一化、γ、β"), (13, "matmul_17x64x32", "fc1 + 偏置 + gelu"), (26, "matmul_17x32x64", "fc2，仅矩阵乘"),
       (27, "elementwise_32", "取 cls 行：fc2 输出 + 残差 + 偏置"), (28, "reduction_32", "末层 LN：求和"), (29, "elementwise_32", "末层 LN：减均值"),
       (30, "reduction_32", "末层 LN：平方和"), (31, "elementwise_32", "末层 LN：归一化、γ、β"), (32, "vecmat_10x32", "分类头")]
NPU = {1, 5, 6, 7, 8, 9, 10, 13, 14, 26, 32}
ELF = {10: 10772, 13: 13860, 14: 10820, 1: 8932, 26: 9380, 32: 8356, 5: 9476, 6: 8404, 7: 9748, 8: 9268, 9: 9588}
GROUPS = [(0, "Patch 嵌入"), (3, "Transformer block 1"), (15, "Transformer block 2"), (27, "末层 LN 与分类头")]
NPU_OUT = [0.134575754404068, -0.14951390027999878, -0.09309281408786774, -0.10619933158159256, -0.6472049355506897,
           -0.3886367976665497, -0.42838895320892334, 0.009810278192162514, -0.20992045104503632, 0.35687947273254395]
REF_OUT = [0.13456737995147705, -0.14951276779174805, -0.09309092164039612, -0.1062011644244194, -0.647202730178833,
           -0.38863253593444824, -0.4283960461616516, 0.009806618094444275, -0.2099165916442871, 0.35688352584838867]

CSS = """
:root{--bg:#fbfbfa;--fg:#1c1d1f;--mut:#5c6370;--line:#dcdfe4;--code:#f2f3f5;--acc:#0b5cad;--ok:#1a7f4b;--warn:#9a5b00;--bad:#b3261e;--npu:#e6f4ec;--host:#f1f2f4}
@media (prefers-color-scheme:dark){:root{--bg:#15171a;--fg:#e4e6ea;--mut:#9aa3b0;--line:#30353d;--code:#1d2026;--acc:#6db3f2;--ok:#5fc28c;--warn:#e0a445;--bad:#f0827a;--npu:#16302398;--host:#22262c}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.7 -apple-system,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","Segoe UI",sans-serif}
main{max-width:980px;margin:0 auto;padding:40px 24px 80px}
h1{font-size:26px;line-height:1.3;margin:0 0 6px}
h2{font-size:20px;margin:48px 0 12px;padding-top:12px;border-top:1px solid var(--line)}
h3{font-size:16px;margin:30px 0 8px}
h4{font-size:14px;margin:18px 0 6px;color:var(--mut);font-weight:600}
p{margin:8px 0}
.meta{color:var(--mut);font-size:13px;margin-bottom:22px}
a{color:var(--acc)}
code,pre{font-family:"JetBrains Mono","SF Mono",Menlo,Consolas,monospace}
code{background:var(--code);padding:1px 5px;border-radius:4px;font-size:12.5px}
figure.code{margin:10px 0 14px}
figure.code .cap{font-size:12px;color:var(--mut);margin-bottom:4px}
pre{background:var(--code);border:1px solid var(--line);border-radius:6px;padding:10px 12px;margin:0;font-size:12px;line-height:1.55;overflow-x:auto;white-space:pre}
.tw{overflow-x:auto;margin:10px 0 16px}
table{border-collapse:collapse;width:100%;font-size:13px}
th,td{border:1px solid var(--line);padding:6px 9px;text-align:left;vertical-align:top}
th{background:var(--code);font-weight:600;white-space:nowrap}
td.num,th.num{text-align:right;font-variant-numeric:tabular-nums}
tr.npu td{background:var(--npu)} tr.host td{background:var(--host)}
tr.grp td{background:transparent;font-weight:600;color:var(--mut);border-left:none;border-right:none;padding-top:12px}
.tag{display:inline-block;font-size:11.5px;padding:0 7px;border-radius:9px;border:1px solid currentColor;line-height:18px;white-space:nowrap}
.ok{color:var(--ok)} .warn{color:var(--warn)} .bad{color:var(--bad)} .mut{color:var(--mut)}
.note{border-left:3px solid var(--warn);background:var(--code);padding:8px 12px;margin:12px 0;font-size:14px}
.note.err{border-color:var(--bad)}
nav{font-size:13.5px;columns:2;column-gap:32px;margin:14px 0 8px}
nav a{display:block;text-decoration:none;padding:1px 0}
ul{margin:6px 0 10px;padding-left:22px} li{margin:3px 0}
.kv td:first-child{white-space:nowrap;color:var(--mut);width:1%}
@media (max-width:640px){nav{columns:1}main{padding:24px 16px 60px}}
"""


def build():
    pipe, lcfg = lowering_config()
    P = []
    A = P.append

    A("<h1>Toy ViT：从 PyTorch 到 Coral NPU 仿真的链路记录</h1>")
    A('<div class="meta">记录日期 2026-09-17 · PyTorch → torch-mlir → StableHLO → coralnpu-compile（IREE）→ MPACT 指令级仿真 · 状态：功能跑通，输出与 PyTorch 一致</div>')
    A("<p>这份文档按实际发生的顺序，记录一个两层 ViT 从 PyTorch 模型定义到在 Coral NPU 仿真器上得到推理结果的全过程：每一步用了什么工具和命令、产出了什么文件、文件里是什么内容，以及过程中出过的错和处理方式。文中的代码片段由生成脚本直接从产物文件读取，数字来自对这些文件的统计或终端输出。</p>")

    A("<nav>" + "".join(f'<a href="#s{i}">{i}. {t}</a>' for i, t in enumerate(
        ["", "结果摘要", "环境", "链路总览", "逐步记录", "NPU 内核细节", "设备分配规则与 fallback", "33 次 dispatch 全表", "过程中遇到的问题", "与 JAX 路线的差异", "未验证事项与局限", "文件索引与复现"], 0) if i) + "</nav>")

    # 1
    A('<h2 id="s1">1. 结果摘要</h2>')
    A(table(["项目", "值", "来源"], [
        ["模型", "两层 ViT，23,968 个参数，随机初始化（" + c("torch.manual_seed(0)") + "）", c("torch/vit_torch.py")],
        ["输入 / 输出", "1×32×32×3 f32 → 1×10 f32 logits", c("vit.mlir") + " 的函数签名"],
        ["top-1（NPU 仿真 / PyTorch）", "9 / 9", c("run_vit.py") + " 输出"],
        ["logits 最大绝对误差", "8.37e-06", "同上"],
        ["dispatch 次数", "33，其中 NPU 18 次、主机 15 次", "编译器 affinity profile"],
        ["编译器估算工作量占比", "NPU 80.9%，主机 19.1%", "同上（静态估算，非实测）"],
        ["编译耗时", "约 32 秒", "JAX 版用 " + c("time") + " 实测；PyTorch 版未单独计时，体感相同"],
        ["推理墙钟时间", "0.158 秒", c("run_vit.py") + "，含主机与仿真，非 NPU 周期数"],
    ], "kv"))

    # 2
    A('<h2 id="s2">2. 环境</h2>')
    A(table(["项", "值"], [
        ["宿主机", "MacBook Pro，Apple Silicon（arm64），macOS 26.5.2"],
        ["容器运行时", "OrbStack（Docker 29.4.0），x86_64 容器经 Rosetta 翻译执行"],
        ["容器镜像", c("coralnpu-dev") + "，由 " + c("coralnpu/utils/coralnpu.dockerfile") + " 构建；Debian 13 (trixie)、clang 19.1.7、Python 3.13.5、Bazel 8.6.0"],
        ["容器内看到的 CPU", c("VirtualApple @ 2.50GHz") + "，10 核；LLVM 将其识别为 " + c("westmere") + "，特性中 " + c("-avx,-avx2")],
        ["编译器仓库", "google-coral/coralnpu-compiler @ " + c("3557f63") + "（2026-09-15）；内含 IREE @ " + c("e4a3b04")],
        ["本地改动", c("MODULE.bazel") + " 第 138 行启用 " + c("extra_pip_args") + " 指向清华 PyPI 源；新增 " + c("examples/toy-vit-aot/")],
        ["PyTorch 侧", "容器内 venv " + c("~/work/venv-torch") + "：torch 2.14.0（CPU）、torch-mlir 20260916.878、numpy 2.5.3"],
        ["持久化", "命名卷 " + c("coralnpu-src") + " 挂到 " + c("~/work") + "（源码、venv、产物）；" + c("coralnpu-bazel-cache") + " 挂到 " + c("~/.cache")],
    ], "kv"))

    # 3
    A('<h2 id="s3">3. 链路总览</h2>')
    A("<p>共九步。第 2–4 步是 " + c("torch_mlir.fx.export_and_import()") + " 一次调用的内部阶段，第 5–9 步是 " + c("coralnpu-compile") + " 一条命令的内部阶段；为了观察，分别让它们在中途停下并写出中间结果。</p>")
    A(F.fig_pipeline(1))
    A(table(["#", "做什么", "工具", "输入", "产物", "大小"], [
        ["1", "定义模型，算参考输出", "PyTorch", "—", c("ref_in.npy") + " " + c("ref_out.npy"), "12 KB / 168 B"],
        ["2", "捕获静态计算图", c("torch.export"), "nn.Module + 示例输入", "ExportedProgram（内存对象）", "111 个节点"],
        ["3", "导入为 Torch 方言", "torch-mlir", "FX 图", c("vit.torch_dialect.mlir"), "231 KB"],
        ["4", "降级为 StableHLO", "torch-mlir", "Torch 方言", c("vit.mlir"), "220 KB"],
        ["5", "输入降级为 linalg / tensor / arith / math", "coralnpu-compile", c("vit.mlir"), c("stages/input.mlir"), "93 KB"],
        ["6", "融合并切分 dispatch", "同上", "linalg", c("stages/flow.mlir"), "76 KB"],
        ["7", "调度：把设备归属落实为缓冲、搬运与提交顺序", "同上", "flow", c("stages/stream.mlir"), "100 KB"],
        ["8", "逐单元代码生成", "同上（LLVM）", "各 dispatch", "11 个 RV32 ELF + 1 个 x86 库", "109 KB + 13 KB"],
        ["9", "打包、加载、执行、比对", "IREE 运行时 + MPACT", c("vit.vmfb") + " + " + c("ref_in.npy"), "logits", "vmfb 243 KB"],
    ]))

    # 4
    A('<h2 id="s4">4. 逐步记录</h2>')

    A("<h3>4.1 模型定义与参考输出</h3>")
    A("<p>结构：图像 32×32×3，patch 8×8 → 16 个 token，加 1 个 cls token 共 17 个；维度 32，2 个注意力头（每头 16 维），MLP 隐层 64，2 个 block，10 类输出。layernorm 与 gelu 手写成基础运算（mean、sub、pow、sqrt、div、tanh），目的是让图里只有 torch-mlir 支持较稳的算子。</p>")
    A(F.fig_model(2))
    A(pre(lines_of(ROOT / "torch" / "vit_torch.py", 32, 46), "torch/vit_torch.py · Block"))
    A("<p>导出脚本先用固定种子造输入，在 PyTorch 里跑一次前向，保存输入和 logits 作为后续比对的唯一标准。</p>")
    A(pre("cd ~/work/vit-torch && source ~/work/venv-torch/bin/activate\npython export_vit_torch.py --outdir out", "容器内执行"))

    A("<h3>4.2 torch.export：动态图 → FX 图</h3>")
    A("<p>用示例输入把 " + c("forward") + " 追踪一遍，得到 111 个 " + c("call_function") + " 节点、17 种 ATen 算子：" + c("add.Tensor, cat, div.Tensor, expand, linear, matmul, mean.dim, mul.Tensor, permute, pow.Tensor_Scalar, reshape, select.int, softmax.int, sqrt, sub.Tensor, tanh, transpose.int") + "。Python 层的结构在这一步消失：block 循环被展开，" + c("nn.Linear") + " 变成 " + c("aten.linear") + " 节点，参数变成图的输入（如 " + c("p_blocks_0_qkv_weight") + "）。</p>")
    A(pre("add_2 = torch.ops.aten.add.Tensor(mul, p_blocks_0_ln1_b);  mul = p_blocks_0_ln1_b = None\n"
          "linear_1 = torch.ops.aten.linear.default(add_2, p_blocks_0_qkv_weight);  add_2 = p_blocks_0_qkv_weight = None\n"
          "reshape_2 = torch.ops.aten.reshape.default(linear_1, [1, 17, 3, 2, 16]);  linear_1 = None",
          "ExportedProgram.graph_module.code 中 qkv 投影附近的三行（在 Mac 上用同一模型代码导出查看）"))

    A("<h3>4.3 导入为 Torch 方言 MLIR</h3>")
    A("<p>torch-mlir 把 FX 节点逐个翻译成 MLIR。把 " + c('output_type="torch"') + " 传给 " + c("export_and_import") + " 可以停在这一层。这一层保留 PyTorch 的类型系统（" + c("!torch.vtensor") + "、" + c("!torch.list<int>") + "），共 190 个 " + c("torch.aten.*") + " 算子。" + c("aten.linear") + " 在这里已被分解为 permute + view + mm。</p>")
    A(pre(lines_of(OT / "vit.torch_dialect.mlir", 86, 89, 190), "out_torch/vit.torch_dialect.mlir:86–89 · qkv 投影"))
    A(table(["算子", "次数"], [[c(k), v] for k, v in torch_hist()]))

    A("<h3>4.4 降级为 StableHLO</h3>")
    A("<p>同一次调用的最后阶段。类型变为标准 " + c("tensor<…xf32>") + "，" + c("aten.mm") + " 变为 " + c("stablehlo.dot_general") + "，softmax 拆成 exponential + reduce + divide。权重以 " + c("dense_resource") + " 引用，十六进制数据集中放在文件末尾的 " + c("{-# dialect_resources … #-}") + " 段，共 27 块；另有 12 个小常量用 " + c("dense<…>") + " 内联。模块没有名字，IREE 加载后模块名为 " + c("module") + "。</p>")
    A(pre(lines_of(OT / "vit.mlir", 1, 5, 170) + "\n    …\n" + lines_of(OT / "vit.mlir", 86, 87, 190), "out_torch/vit.mlir · 头部与 qkv 投影"))
    A(table(["算子", "次数"], [[c(k), v] for k, v in stablehlo_hist()]))
    A('<p class="mut">从这个文件开始，后面的流程与模型来自哪个框架无关。编译器只加载了 ' + c("input_stablehlo") + " 和 " + c("input_tosa") + " 两个输入插件（" + c("coralnpu-compile --iree-list-plugins") + "），没有 Torch 方言输入，所以必须降到这一层。</p>")

    A("<h3>4.5 编译命令</h3>")
    A(pre("cd ~/work/coralnpu-compiler\nbazel-bin/compiler/tools/coralnpu-compile \\\n  --iree-hal-target-device=local \\\n  --iree-hal-local-target-device-backends=llvm-cpu \\\n  --iree-llvmcpu-target-cpu-features=host \\\n  --iree-hal-target-device=coralnpu \\\n  --coralnpu-dump-affinity-profile-format=pretty \\\n  ~/work/vit-torch/out/vit.mlir -o ~/work/vit-torch/out/vit.vmfb",
          "正常使用：一条命令直接得到 vit.vmfb"))
    A("<p>两个 " + c("--iree-hal-target-device") + " 声明了两个设备：" + c("@__device_0") + " 是主机（llvm-cpu，embedded-elf-x86_64），" + c("@__device_1") + " 是 NPU（embedded-elf-riscv_32）。为了看中间结果，另外加了以下参数各跑一次：</p>")
    A(pre("--compile-to=input   -o stages/input.mlir     # 停在输入降级之后（linalg/tensor/arith/math）\n--compile-to=flow    -o stages/flow.mlir      # 停在 dispatch 切分之后\n--compile-to=stream  -o stages/stream.mlir    # 停在设备分配与调度之后\n--iree-hal-dump-executable-files-to=stages/exe   # 保留每个单元的 .ll/.s/.o/.so"))

    A("<h3>4.6 输入降级：StableHLO → linalg + tensor + arith + math</h3>")
    A("<p>" + c("input.mlir") + " 中不再有 " + c("stablehlo.") + "。常说的“降到 linalg”是简称，实际是四种方言的混合，linalg 只占约三分之一。编译器帮助文本对这一阶段的描述是 lowering into core IREE input dialects (linalg/etc)。函数外壳也从 " + c("func.func") + " 换成了 IREE 的 " + c("util.func") + "。</p>")
    A(table(["方言", "操作数", "负责什么", "本文件中的主要成员"], input_dialects()))
    A("<p>四者是分工关系：" + c("linalg.generic") + " 只描述循环结构，即在哪些维度上迭代、读哪些输入、写哪个输出；每个点上具体算什么，写在它的函数体里，用的是 " + c("arith") + " 与 " + c("math") + " 的标量运算；" + c("tensor") + " 方言负责计算之外的事：分配输出缓冲、改形状、切片。下面是 gelu 里 tanh 那一步：</p>")
    A(pre(lines_of(ST / "input.mlir", 553, 558, 150), "stages/input.mlir:553–558 · 一个逐元素 linalg.generic，函数体里是 math.tanh"))
    A("<p>矩阵乘则是具名 linalg 算子，前面配一个 " + c("tensor.empty") + " 分配输出、一个 " + c("linalg.fill") + " 清零。第 6 节的设备标注只处理 linalg 算子，" + c("tensor") + " 的整形与搬运操作不标注，以便自由融合进相邻 dispatch。</p>")
    A(pre(lines_of(ST / "input.mlir", 234, 236, 190), "stages/input.mlir:234–236 · qkv 投影"))

    A("<h3>4.7 融合与 dispatch 切分</h3>")
    A("<p>这一步解决的是粒度问题，与有几个设备无关：如果每条 linalg 操作都单独下发，准备参数、搬数据、启动执行的开销会远大于计算本身。融合还省掉中间结果的落盘，例如矩阵乘的输出直接在同一内核里接着算 gelu。</p>")
    A("<p>617 条操作被融合分组为 23 个不同的 dispatch 单元，主函数变成 33 次 " + c("flow.dispatch") + " 调用（两个 block 形状相同，8 个单元被复用）。10 块权重提升为全局常量（" + c("@__constant_tensor_96x32xf32_3") + " 等）。设备归属此时已作为属性挂在调用上：</p>")
    A(pre(lines_of(ST / "flow.mlir", 635, 635, 330), "stages/flow.mlir:635"))
    A(F.fig_funnel(3))
    A("<h4>23 个 dispatch 单元一览</h4>")
    A("<p>每个单元在 " + c("flow.mlir") + " 里是一个 " + c("flow.executable") + "，内部是一个普通函数：输入输出是带读写方向的张量，函数体仍是 4.6 那四种方言。下表由生成脚本解析 " + c("flow.mlir") + " 得到；“内部运算”只列计算类操作，省略了读入、写出与缓冲分配；形状省略了 f32。“设备”一列读的是单元导出项上的 " + c("stream.affinity") + " 属性；没有该属性的单元写明“此时未标注”，其最终归属取自代码生成结果。</p>")
    urows = []
    for num, ncall, short, ins_, outs_, ops, dev in dispatch_units():
        opstr = "、".join(f"{k.split('.')[1]}" + (f"×{v}" if v > 1 else "") for k, v in ops.most_common())
        urows.append([num, ncall, c(short), "<br>".join(ins_), "<br>".join(outs_), opstr, dev, UNIT_NOTE.get(num, "")])
    A(table(["编号", "调用", "编译器命名", "输入", "输出", "内部运算", "设备", "它是什么"], urows))
    A("<p>几处从表里能直接读出来的事：</p><ul>"
      "<li><b>融合的形态。</b>矩阵乘单元大多带着紧随其后的逐元素运算：1 带偏置，10 带残差，14 带偏置和残差，13 带偏置和整个 gelu。7 把除以 √16 并了进去，9 把转置并了进去。</li>"
      "<li><b>为什么同形状的 LN 后半有四份（4、12、16、24）。</b>逐行比对它们的函数体，只差两行：内嵌的 γ、β 常量指向不同的权重块（" + c("torch_tensor_32_torch.float32_1/_2") + " 对 " + c("_3/_4") + " 等）。权重被当作常量嵌进了单元内部，内容不同就无法合并。LN 前半（3）不含权重，所以一份被调用了 4 次。</li>"
      "<li><b>编译器把“只取 cls”提前了。</b>模型最后只用 cls 那一行。block 2 的 fc2（26）因此只做矩阵乘，偏置和残差挪到了 27，而 27 只读两个 1×17×32 张量的第一行（" + c("sizes = [1, 1, 32]") + "），其余 16 行的偏置和残差根本没算。末层 LN 也就只作用在 32 个数上，被拆成了 28–31 四个很小的单元。</li>"
      "<li><b>softmax 此时还是一个整体算子</b> " + c("linalg.softmax") + "，要到代码生成阶段才展开成 exp、求和、相除。</li>"
      "</ul>")
    A("<p>一个完整单元的原文，fc1 + gelu（" + c("dispatch_13") + "）。" + c("linalg.generic") + " 的函数体就是手写 gelu 的逐步计算：加偏置、立方、乘 0.044715、相加、乘 √(2/π) ≈ 0.7979、tanh、加 1、乘 0.5x。</p>")
    A(pre(unit_source(13), "stages/flow.mlir · flow.executable @main_dispatch_13（超长行以 … 截断）"))
    A("<p>融合的一个实例：" + c("dispatch_13") + " 内同时含 " + c("linalg.matmul") + "、" + c("math.tanh") + "、" + c("math.powf") + "，即 fc1 与紧随的 gelu 在同一个内核里。</p>")

    A("<h3>4.8 调度：落实设备归属</h3>")
    A("<p>先澄清三件容易混在一起的事。<b>标注</b>决定每个算子归哪个设备，它发生得最早：在全局优化阶段，由 NPU 插件的 pass 给 linalg 算子挂上 " + c("stream.affinity") + " 属性（规则见第 6 节）。<b>切分</b>（4.7）决定粒度，把相邻操作融合成可独立编译、独立下发的函数；融合受设备属性约束，dispatch 也继承其中算子的属性，所以 " + c("flow.mlir") + " 里每次调用上已经带着设备。<b>调度</b>是本步：依据这些属性，决定在哪个设备上分配缓冲、哪里需要跨设备传递、哪些相邻的同设备 dispatch 合并成一次提交。</p>")
    A("<p>" + c("stream.mlir") + " 里 82 处标注 " + c("@__device_0") + "、56 处标注 " + c("@__device_1") + "；33 个 " + c("stream.cmd.dispatch") + " 被组织进 13 个 " + c("stream.cmd.execute") + " 区域（相邻且同设备的 dispatch 合并提交），另有 3 次 " + c("stream.cmd.copy") + "、3 次 " + c("stream.timepoint.await") + "、21 次资源分配。两个设备互相声明 " + c("unified_memory = true, transparent_access = true") + "。</p>")
    A(pre((ST / "compile.log").read_text().split("/home/builder")[0].rstrip(), "编译器输出的 affinity profile（stages/compile.log）"))
    A('<p class="mut">profile 之后编译器还给了一条 warning：多设备模块暂不支持 executable benchmarks。不影响产物。</p>')

    A("<h3>4.9 代码生成与打包</h3>")
    A("<p>每个 dispatch 单元独立走完 " + c(".codegen.ll → .linked.ll → .optimized.ll → .s → .o → .so") + "。NPU 侧 11 个单元各成一个 ELF，不合并（" + c("--coralnpu-link-executables") + " 默认 false，帮助文本说明是为了放进 ITCM）；主机侧 12 个单元链接成一个 " + c("vit_linked_embedded_elf_x86_64.so") + "（13,168 字节）。</p>")
    A(table(["项", "NPU 目标", "主机目标"], [
        ["triple", c("riscv32-unknown-unknown-eabi-elf"), "embedded-elf-x86_64"],
        ["cpu / features", c("+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma"), c("westmere") + "，" + c("-avx,-avx2,…")],
        ["ABI / data layout", c("ilp32") + " · " + c("e-m:e-p:32:32-i64:64-n32-S128"), "—"],
        ["native_vector_size", "32 字节", "—"],
        ["max_stack_allocation_size", "32768", "—"],
    ], "kv"))
    A("<p>汇编文件的属性行给出最终使用的 ISA：" + c("rv32i2p1_m2p0_f2p2_zicsr2p0_zmmul1p0_zfbfmin1p0_zve32f1p0_zve32x1p0_zvfbfmin1p0_zvfbfwma1p0_zvl128b1p0…") + "。最后所有二进制、调度字节码、权重常量打包为 " + c("vit.vmfb") + "（FlatBuffer 容器，242,805 字节）。</p>")

    A("<h3>4.10 运行与比对</h3>")
    A(pre("bazel build --config=dev //examples/toy-vit-aot:run_vit\nLD_LIBRARY_PATH=\"$PWD/runtime/sim\" bazel-bin/examples/toy-vit-aot/run_vit \\\n  --vmfb=$HOME/work/vit-torch/out/vit.vmfb \\\n  --input=$HOME/work/vit-torch/out/ref_in.npy --ref=$HOME/work/vit-torch/out/ref_out.npy \\\n  --module=module"))
    A("<p>" + c("run_vit.py") + " 创建 " + c("local-sync") + " 与 " + c("coralnpu") + " 两个 HAL 设备（可用驱动列表为 " + c("['local-sync', 'local-task', 'coralnpu']") + "），用两者建 HAL 模块，mmap 加载 vmfb，上下文中的模块为 " + c("['hal', 'module']") + "，调用 " + c("module.main") + "。IREE 虚拟机在主机上解释调度字节码：主机的 dispatch 直接调 x86 函数，NPU 的 dispatch 由 HAL 驱动交给 MPACT 仿真器执行对应的 RV32 ELF。" + c("LD_LIBRARY_PATH") + " 指向 " + c("runtime/sim") + " 是为了让驱动找到仿真后端的动态库。</p>")
    A(F.fig_runtime(4))
    A(F.fig_logits(5, REF_OUT, NPU_OUT))
    rows = []
    for i in range(10):
        d = abs(NPU_OUT[i] - REF_OUT[i])
        rows.append([i, f"{REF_OUT[i]:+.8f}", f"{NPU_OUT[i]:+.8f}", f"{d:.2e}"])
    A(table(["类别", "PyTorch 参考", "NPU 仿真", "|差|"], rows))
    A("<p>判定标准 " + c("np.allclose(atol=1e-3, rtol=1e-3)") + "，通过。误差量级符合 f32 下运算顺序不同造成的舍入差。权重是随机的，类别 9 本身没有语义，只用于核对两边一致。</p>")

    # 5
    A('<h2 id="s5">5. NPU 内核细节（以 qkv 矩阵乘 dispatch_5 为例）</h2>')
    A("<p>codegen 配置（" + c("configured_module_main_dispatch_5.mlir") + "）：</p>")
    A(pre(f"translation_info = {pipe}\nlowering_config  = {lcfg}"))
    A("<p>流水线是 IREE CPU 后端的 CPUDoubleTilingExpert。分块参数：分发级与缓存级在第 0 维按 16 分块，向量级在前两维按 8 分块，归约维向量级为 1。向量级的 8 与下面汇编里的向量长度 8 对应。</p>")
    A(pre(asm_inner_loop(), "stages/module_main_dispatch_5_embedded_elf_riscv_32.s · 内层循环（已去掉 .loc 调试行）"))
    A("<ul><li>" + c("vsetivli zero, 8, e32, m2") + "：向量长度 8、元素 32 位、LMUL=2。128 位寄存器装 4 个 f32，m2 把两个寄存器拼成一组，一次处理 8 个。</li><li>" + c("vlse32.v") + "：带步长的向量读取，从矩阵里按列取 8 个元素。</li><li>" + c("vfmadd.vv v16, v18, v4") + "：向量浮点融合乘加，v16 = v16 × v18 + v4。</li><li>" + c("vmerge.vvm … v0") + "：按掩码寄存器 v0 选择性写回累加器。</li></ul>")
    A(table(["内核函数", "总指令", "向量浮点 vf*", "向量其他 v*", "标量浮点 f*", "其余"], [
        [c("main_dispatch_5_matmul_17x96x32_f32"), 304, 9, 117, 1, 177],
        [c("main_dispatch_8_softmax_2x17x17xf32…"), 255, 41, 55, 24, 135],
    ]))
    A(F.fig_instr(6))
    A("<p class=\"mut\">统计口径：汇编中的静态指令条数，只算内核函数本身。同一个 " + c(".s") + " 文件共 1,227 条指令，其余 923 条属于链接进来的运行时辅助函数（" + c("iree_h2f_ieee") + "、" + c("__extendhfsf2") + "、" + c("fma") + " 等）。</p>")

    # 6
    AFF = ST / "CoralNPUAffinityAnnotation.cpp"
    A('<h2 id="s6">6. 设备分配规则：主机上的 15 次是 fallback</h2>')
    A("<p>哪个算子去 NPU、哪个留主机，由编译器里的 " + c("compiler/Transforms/CoralNPUAffinityAnnotation.cpp") + " 决定。它在全局优化阶段逐个检查算子，给它们挂上 " + c("stream.affinity") + " 属性；规则是一张算子类型白名单，不在白名单里的被明确标给主机，源码注释称之为 host device fallback。</p>")
    A(F.fig_affinity(7))
    A(pre(lines_of(AFF, 354, 376, 120), "CoralNPUAffinityAnnotation.cpp:354–376 · 判定主体"))
    A(pre(lines_of(AFF, 138, 145, 120) + "\n  …\n" + lines_of(AFF, 194, 214, 120), "同文件 · 白名单 canBeVectorized() 的节选：矩阵乘类，以及被注释掉的 transpose"))
    A("<p>让编译器停在 " + c("--compile-to=global-optimization") + "，统计每种算子被标给了谁（" + c("stages/global-optimization.mlir") + "）：</p>")
    A(table(["算子", "个数", "标给", "原因"], [
        [c("linalg.matmul"), 9, "NPU", "白名单"],
        [c("linalg.batch_matmul"), 4, "NPU", "白名单"],
        [c("linalg.vecmat"), 1, "NPU", "白名单"],
        [c("linalg.generic"), 126, "主机", "不在白名单，fallback"],
        [c("linalg.fill"), 7, "主机", "不在白名单，fallback"],
        [c("linalg.softmax"), 2, "未标注", "不实现 LinalgOp 接口，pass 不处理"],
        [c("linalg.generic") + "（另 2 个）", 2, "未标注", "—"],
    ]))
    A("<p><b>为什么 layernorm 和逐元素运算都落到了主机。</b>白名单里其实有 " + c("linalg.reduce") + " 和具名的 " + c("linalg.add / sub / mul / div / sqrt") + "，但 StableHLO 输入转换产生的不是这些具名形式，而是通用的 " + c("linalg.generic") + "（归约、逐元素、转置都是）。" + c("linalg.generic") + " 不在白名单里，于是全部走了 fallback 分支。这是形式对不上白名单，不是 NPU 做不了这些运算。</p>")
    A("<p><b>两个没进白名单却在 NPU 上执行的单元。</b>" + c("linalg.softmax") + " 在标注阶段没有被处理，它前后紧挨着两个标给 NPU 的批量矩阵乘，后续的设备分析把它放到了 NPU（" + c("dispatch_8") + "）。" + c("dispatch_6") + " 的 17×6×16 转置在标注阶段还不存在（" + c("global-optimization.mlir") + " 中搜不到这个形状），是切分 dispatch 时才生成的，同样随相邻算子去了 NPU。反过来，fc1 后面的 gelu 是被标给主机的 " + c("linalg.generic") + "，却与矩阵乘融合进了同一个 NPU 内核（" + c("dispatch_13") + "）。最终归属 = 标注 + 融合 + 相邻关系，三者共同决定。</p>")
    A("<p><b>代价。</b>每次 fallback 都是一次设备切换。一个 Block 内 LN 出现两次，执行流在 NPU 与主机之间往返四趟；" + c("stream.mlir") + " 里 33 次 dispatch 被分成 13 个提交区域，就是这些切换的直接体现。</p>")

    # 7
    A('<h2 id="s7">7. 33 次 dispatch 全表</h2>')
    A("<p>顺序取自 " + c("flow.mlir") + " 中 " + c("flow.dispatch") + " 的出现顺序；设备归属取自导出目录中哪些单元生成了 riscv_32 ELF；“角色”一列依据各单元的内部运算填写（见 4.7 的一览表）；“归属原因”按第 6 节的规则填写。</p>")
    A(F.fig_dispatch(8, SEQ, NPU))
    body = []
    gmap = dict(GROUPS)
    why_npu = {6: "未标注，随相邻 NPU 算子", 8: "未标注，随相邻 NPU 算子", 13: "白名单（matmul），并融合了 gelu"}
    for k, (i, name, role) in enumerate(SEQ):
        if k in gmap:
            body.append(f'<tr class="grp"><td colspan="7">{gmap[k]}</td></tr>')
        npu = i in NPU
        reuse = "复用" if any(j == i for j, _, _ in SEQ[:k]) else ""
        why = why_npu.get(i, "白名单") if npu else "fallback（linalg.generic）"
        body.append(f'<tr class="{"npu" if npu else "host"}"><td class="num">{k + 1}</td><td class="num">{i}</td><td><code>{name}</code></td>'
                    f'<td>{role}</td><td>{"NPU" if npu else "主机"}</td><td>{why}</td><td class="num">{ELF.get(i, "") if npu and not reuse else reuse}</td></tr>')
    A('<div class="tw"><table><thead><tr><th class="num">序</th><th class="num">编号</th><th>编译器命名（省略 _f32）</th><th>角色</th><th>设备</th><th>归属原因</th><th class="num">ELF 字节 / 复用</th></tr></thead><tbody>'
      + "".join(body) + "</tbody></table></div>")
    A("<p>NPU 侧 11 个 ELF 合计 108,604 字节。主机侧 12 个单元不单独成文件。主机侧 12 个单元在 " + c("flow.mlir") + " 里全部带有明确的主机设备属性，即都走了 fallback 分支；未标注的只有 6 号和 8 号两个单元（见 4.7 的一览表）。</p>")

    # 8
    A('<h2 id="s8">8. 过程中遇到的问题</h2>')
    A("<p>按发生顺序。包括分析过程中给出过的错误判断。</p>")
    ok, wk, bd = '<span class="tag ok">已解决</span>', '<span class="tag warn">已绕开</span>', '<span class="tag bad">错误判断</span>'
    A(table(["#", "现象", "原因", "处理", "状态"], [
        [1, "在 Mac 上 clone coralnpu 时 git 警告 " + c("SRAM.scala") + " / " + c("Sram.scala") + " 冲突，只保留其一", "macOS 默认文件系统不区分大小写", "只影响 Chisel RTL 生成；之后的仓库改在容器的 Linux 卷内 clone", wk],
        [2, "另一台 x86 实体机上 " + c("docker build") + " 报 " + c('"platform" requires API version 1.32') + "；安装脚本 " + c("get.docker.com") + " 连接被重置", "该机 Docker 为 API 1.24 的旧版；网络出口限制", "未继续，改回 Mac + OrbStack", wk],
        [3, "Mac 上 " + c("docker build") + " 拉 " + c("debian:trixie") + " 元数据时 EOF", "访问 Docker Hub 不稳定", "用户侧解决后镜像构建成功；具体采用代理还是镜像源未记录", ok],
        [4, c("FATAL: mkdir('/home/builder/.cache/bazel/…'): Permission denied"), "命名卷首次创建时属主为 root，容器用户是 builder", c("sudo chown -R builder:builder ~/.cache"), ok],
        [5, "官方 MobileNetV2 示例下载模型时 " + c("IncompleteRead(113354 bytes read, 78197431 more expected)"), c("storage.googleapis.com") + " 传输中断", "放弃该示例，改用无需下载的 " + c("matmul-aot") + " 做冒烟测试，再做 toy ViT", wk],
        [6, "在 Mac 上执行 submodule 初始化时 " + c("zsh: command not found: nproc"), "macOS 无 " + c("nproc"), "改到容器内 clone 与初始化", ok],
        [7, "Bazel 取 pip 依赖失败：" + c("Could not find a version that satisfies the requirement scipy==1.17.1 (from versions: none)"), "未完全查明。容器内 curl 访问 pypi.org 与清华源均返回 200；rules_python 以 " + c("--isolated") + " 调 pip，环境变量与 pip.conf 均不生效", "启用 " + c("MODULE.bazel:138") + " 预留的 " + c("extra_pip_args") + "，指向清华源后通过", ok],
        [8, "容器内 " + c("import jax") + " 报 " + c("This version of jaxlib was built using AVX instructions"), "Rosetta 翻译的 x86 环境不提供 AVX", "JAX 导出改在 Mac 本机原生执行，产物拷入容器", wk],
        [9, "设置 " + c("ROSETTA_ADVERTISE_AVX=1") + " 后所有程序报 " + c("rosetta error: invalid ROSETTA_ environment variable") + " 并 trap", "该变量在 Linux 版 Rosetta 中不被接受；这是我给出的错误建议", c("unset") + " 后恢复", bd],
        [10, "构建 " + c("run_matmul") + " 时下载 " + c("robin-map v1.3.0") + " 报 " + c("SocketTimeoutException: Read timed out"), "GitHub 下载不稳定。此时编译器本体已在缓存中（14,234 个 action 命中）", "加 " + c("--http_timeout_scaling=10") + " 等参数重试；随后二进制构建成功", ok],
        [11, "PyTorch 无法直接进编译器", "编译器只加载 " + c("input_stablehlo") + "、" + c("input_tosa") + "；torch-mlir 与 torch-xla 均无 macOS arm64 的 wheel", "在容器内用 torch-mlir 导出 StableHLO；Rosetta 下 torch 与 torch-mlir 运行正常", ok],
        [12, "曾得出“f32 计算在 NPU 上是标量执行”的结论", "统计时用了整份 " + c(".s") + " 文件，其中 75% 是运行时辅助函数", "改为只统计内核函数；结论更正为向量化执行（见第 5 节）", bd],
        [13, c("run_vit.py") + " 打印的模块列表是字典方法名", "对 " + c("ctx.modules") + " 用了 " + c("dir()"), "改为 " + c("list(ctx.modules.keys())"), ok],
    ]))

    # 8
    A('<h2 id="s9">9. 与 JAX 路线的差异</h2>')
    A("<p>同结构的模型也用纯 JAX 写过一版并走通（" + c("vit_model.py") + "，产物在 " + c("out/") + "）。两版权重初始化方式不同，logits 不可比；可比的是流程与编译结果的形态。</p>")
    A(table(["对比项", "JAX 版", "PyTorch 版"], [
        ["导出位置", "Mac 本机（容器内 jaxlib 需要 AVX）", "容器内（torch-mlir 只有 Linux wheel）"],
        ["导出方式", c("predict.lower(x).compiler_ir(dialect=\"stablehlo\")"), c("fx.export_and_import(…, output_type=\"stablehlo\")")],
        ["IREE 模块名", c("jit_predict"), c("module")],
        ["权重在 MLIR 中", "数值字面量内联", c("dense_resource") + " 十六进制块"],
        ["StableHLO 中 reshape / transpose", "13 / 3", "67 / 17"],
        ["dispatch 次数", "37", "33"],
        ["NPU dispatch / 估算工作量", "16 / 72.4%", "18 / 80.9%"],
        ["与框架参考的最大误差", "4.5e-08", "8.4e-06"],
    ]))
    A("<p>PyTorch 版 reshape 与 transpose 多，来自 " + c("nn.Linear") + " 权重的 [out, in] 存放方式和 " + c("permute") + " 式的多头拆分；它们大多在融合阶段被消掉，其中一个（" + c("dispatch_6_transpose_17x6x16") + "）被放到了 NPU 上。</p>")

    # 9
    A('<h2 id="s10">10. 未验证事项与局限</h2>')
    A("<ul>"
      "<li><b>指令集出入。</b>coralnpu 硬件仓库 README 写的是 " + c("rv32imf_zve32x") + "（整数向量），而编译器以 " + c("+zve32f") + "（浮点向量）为目标，MPACT 也正确执行了这些指令。真实 RTL 是否支持浮点向量指令未验证，需要把这些 ELF 放到 Verilator 周期精确仿真上确认。</li>"
      "<li><b>没有性能数据。</b>MPACT 是指令级功能仿真；这条路线的运行器目前只给墙钟时间，不输出 NPU 指令数或周期数。0.158 秒不能当作 NPU 性能。</li>"
      "<li><b>主机侧 15 次 dispatch 是白名单外的 fallback</b>（第 6 节）。layernorm 与逐元素运算以 " + c("linalg.generic") + " 形式出现而未被放到 NPU，由此带来的设备往返开销在功能仿真里看不出来。</li>"
      "<li><b>工作量占比是静态估算。</b>80.9% 来自编译器按张量元素数的估计，不反映每次 NPU dispatch 的装载与数据搬运开销。</li>"
      "<li><b>f32、未量化。</b>整条链路是浮点模型。int8 量化模型经 torch-mlir 能否保留量化语义到 StableHLO 未尝试。</li>"
      "<li><b>运行在 Rosetta 翻译的 x86 容器里。</b>功能结果不受影响，编译与仿真耗时不代表原生 x86 主机。</li>"
      "<li><b>pip 取包失败的根因没有查清</b>（第 8 节第 7 条），只是换源后绕过。</li>"
      "<li><b>权重随机。</b>验证的是数值一致性，不是分类精度。</li>"
      "</ul>")

    # 10
    A('<h2 id="s11">11. 文件索引与复现</h2>')
    A(table(["路径", "内容"], [
        [c("toy-vit/torch/vit_torch.py"), "PyTorch 模型"],
        [c("toy-vit/torch/export_vit_torch.py"), "导出 StableHLO 与参考输入输出（容器内运行）"],
        [c("toy-vit/container/run_vit.py") + "、" + c("BUILD.bazel"), "运行器，放入编译器仓库的 " + c("examples/toy-vit-aot/")],
        [c("toy-vit/out_torch/vit.torch_dialect.mlir"), "第 3 步产物"],
        [c("toy-vit/out_torch/vit.mlir"), "第 4 步产物，编译器的输入"],
        [c("toy-vit/out_torch/stages/{input,flow,stream}.mlir"), "第 5–7 步中间结果"],
        [c("toy-vit/out_torch/stages/compile.log"), "affinity profile"],
        [c("toy-vit/out_torch/stages/*dispatch_5*"), "qkv 矩阵乘单元的 codegen 配置、优化后 LLVM IR、汇编"],
        [c("toy-vit/out_torch/stages/CoralNPUAffinityAnnotation.cpp"), "编译器设备分配 pass 的源码副本（取自 3557f63）"],
        [c("toy-vit/out_torch/stages/global-optimization.mlir"), "标注刚完成时的 IR，用于统计各算子的设备归属"],
        [c("toy-vit/tools/make_record.py") + "、" + c("record_figs.py"), "本页与图的生成脚本"],
        ["容器内 " + c("~/work/vit-torch/stages/exe/"), "全部 23 个单元的 .ll / .s / .o / .so（未全部拷出）"],
    ]))
    A("<h4>从零复现（容器已就绪的前提下）</h4>")
    A(pre("# Mac：送文件进容器\ncd toy-vit && C=<容器名>\ndocker exec $C mkdir -p /home/builder/work/vit-torch /home/builder/work/coralnpu-compiler/examples/toy-vit-aot\ndocker cp torch/. $C:/home/builder/work/vit-torch/\ndocker cp container/. $C:/home/builder/work/coralnpu-compiler/examples/toy-vit-aot/\n\n# 容器：一次性装环境\npython3 -m venv ~/work/venv-torch && source ~/work/venv-torch/bin/activate\npip install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy\npip install torch --index-url https://download.pytorch.org/whl/cpu\npip install --pre torch-mlir -f https://github.com/llvm/torch-mlir-release/releases/expanded_assets/dev-wheels\n\n# 容器：导出 → 编译 → 运行（命令见 4.1、4.5、4.10）"))

    doc = ('<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">'
           "<title>Toy ViT → Coral NPU 链路记录</title><style>" + CSS + F.FIG_CSS + "</style></head><body><main>" + "\n".join(P) + "</main></body></html>")
    OUT.write_text(doc, encoding="utf-8")
    print("wrote", OUT, len(doc))


if __name__ == "__main__":
    build()
