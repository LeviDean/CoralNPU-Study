#!/usr/bin/env python3
"""Generates toy-vit/pipeline_deck.html from the tech-deck template. All numbers are measured."""
import html
import re
import sys

TEMPLATE = "/Users/lydean/.claude/skills/tech-deck/assets/template.html"
OUT = "/Users/lydean/Works/Research/CoralNPU/toy-vit/pipeline_deck.html"

C = {
    "cyan": ("#22d3ee", "rgba(8,51,68,0.45)"),
    "emerald": ("#34d399", "rgba(6,78,59,0.4)"),
    "amber": ("#fbbf24", "rgba(120,53,15,0.4)"),
    "violet": ("#a78bfa", "rgba(76,29,149,0.4)"),
    "rose": ("#fb7185", "rgba(136,19,55,0.3)"),
    "orange": ("#fb923c", "rgba(251,146,60,0.12)"),
    "slate": ("#94a3b8", "rgba(30,41,59,0.5)"),
}
ZONE_FILL = {
    "cyan": "rgba(8,51,68,0.10)", "emerald": "rgba(6,78,59,0.08)", "amber": "rgba(120,53,15,0.08)",
    "violet": "rgba(76,29,149,0.08)", "rose": "rgba(136,19,55,0.07)", "slate": "rgba(30,41,59,0.25)",
    "orange": "rgba(251,146,60,0.06)",
}
MARK = {"slate": "arrowhead", "cyan": "arrow-cyan", "emerald": "arrow-emerald", "amber": "arrow-amber",
        "violet": "arrow-violet", "rose": "arrow-rose", "orange": "arrow-orange"}


def esc(s):
    return html.escape(str(s), quote=False)


def T(x, y, s, size=8, fill="#94a3b8", anchor="start", weight=None, mono=False, raw=False):
    w = f' font-weight="{weight}"' if weight else ""
    a = f' text-anchor="{anchor}"' if anchor != "start" else ""
    body = s if raw else esc(s)
    return f'<text x="{x}" y="{y}" fill="{fill}" font-size="{size}"{w}{a} xml:space="preserve">{body}</text>'


def zone(y, h, color, title, x=40, w=1120):
    st = C[color][0]
    return (f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="12" fill="{ZONE_FILL[color]}" stroke="{st}" '
            f'stroke-width="1" stroke-dasharray="8,4"/>' + T(x + 14, y + 22, title, 11, st, weight=600))


def box(x, y, w, h, color, title, subs=(), sw=1.5, dashed=False, tsize=10.5, tag=None):
    st, fl = C[color]
    d = ' stroke-dasharray="5,4"' if dashed else ""
    o = [f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="6" fill="#0f172a"/>',
         f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="6" fill="{fl}" stroke="{st}" stroke-width="{sw}"{d}/>']
    cx = x + w / 2
    o.append(T(cx, y + 21, title, tsize, "white", "middle", 600))
    yy = y + 37
    for s in subs:
        o.append(T(cx, yy, s, 8, "#94a3b8", "middle"))
        yy += 13
    if tag:
        o.append(T(cx, y + h - 9, tag, 8, "#fbbf24", "middle", 600))
    return "".join(o)


def line(x1, y1, x2, y2, color="slate", dashed=False, sw=1.5):
    d = ' stroke-dasharray="5,4"' if dashed else ""
    return (f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="{C[color][0]}" stroke-width="{sw}"{d} '
            f'marker-end="url(#{MARK[color]})"/>')


def curve(x1, y1, x2, y2, color="slate", dashed=False, vertical=False):
    d = ' stroke-dasharray="5,4"' if dashed else ""
    if vertical:
        my = (y1 + y2) / 2
        p = f"M {x1} {y1} C {x1} {my}, {x2} {my}, {x2} {y2}"
    else:
        mx = (x1 + x2) / 2
        p = f"M {x1} {y1} C {mx} {y1}, {mx} {y2}, {x2} {y2}"
    return (f'<path d="{p}" fill="none" stroke="{C[color][0]}" stroke-width="1.5"{d} '
            f'marker-end="url(#{MARK[color]})"/>')


def conclusion(y, s):
    return T(600, y, s, 10, "#fb923c", "middle", 600)


def svg(h, body, defs):
    return (f'<svg viewBox="0 0 1200 {h}">\n{defs}\n<rect width="100%" height="100%" fill="url(#grid)" />\n'
            + "\n".join(body) + "\n</svg>")


def section(num, color, name, hint, svg_str, cards):
    cs = []
    for dot, title, items in cards:
        lis = "".join(f"<li>• {esc(i)}</li>" for i in items)
        cs.append(f'<div class="card"><div class="card-header"><div class="card-dot {dot}"></div>'
                  f'<h3>{esc(title)}</h3></div><ul>{lis}</ul></div>')
    return (f'<h2 class="section-title"><span class="num {color}">{num}</span>{esc(name)}'
            f'<span class="hint">{esc(hint)}</span></h2>\n<div class="diagram-container">\n{svg_str}\n</div>\n'
            f'<div class="cards">{"".join(cs)}</div>\n')


# ---------------------------------------------------------------- 图一 全景
def fig1(defs):
    b = []
    b.append(zone(30, 200, "cyan", "① 前端：PyTorch → StableHLO —— 容器内 venv-torch，一次 fx.export_and_import() 调用内部走完三步"))
    xs = [60, 330, 600, 870]
    front = [
        ("cyan", "1 · PyTorch 模型", ["vit_torch.py · nn.Module · eval()", "23,968 个参数 · 输入 1×32×32×3"], "产物 ref_in.npy / ref_out.npy"),
        ("cyan", "2 · torch.export 捕获图", ["动态图追踪成静态 FX 图", "111 个节点 · 17 种 ATen 算子"], "产物 ExportedProgram（内存对象）"),
        ("cyan", "3 · 导入 Torch 方言", ["FX 节点逐个翻译为 MLIR", "190 个 torch.aten.* 算子"], "产物 vit.torch_dialect.mlir · 231 KB"),
        ("amber", "4 · 降级到 StableHLO", ["aten.mm→dot_general 等改写", "297 个算子 · 权重 27 块内嵌"], "产物 vit.mlir · 220 KB"),
    ]
    for x, (c, t, s, tag) in zip(xs, front):
        b.append(box(x, 78, 230, 84, c, t, s, tag=tag))
    for x in xs[:-1]:
        b.append(line(x + 234, 120, x + 266, 120, "cyan"))
    b.append(T(60, 186, "口径：图中所有“算子数 / 节点数”均为整个模型一次前向的总数，来自对产物文件的 grep 统计", 8, "#64748b"))
    b.append(T(60, 204, "前端与编译器之间唯一的接口是 vit.mlir 这个文本文件 —— JAX 路线也产出同一种文件，之后完全共用", 8, "#64748b"))

    b.append(zone(260, 200, "emerald", "② 编译器：coralnpu-compile —— 一条命令内部的四个阶段（回程：自右向左），用 --compile-to 逐段导出"))
    xr = [920, 705, 490, 275, 60]
    comp = [
        ("emerald", "5 · 输入降级 → linalg", ["StableHLO 插件改写成循环描述", "174 generic + 42 个命名算子"], "产物 input.mlir · 93 KB"),
        ("emerald", "6 · 切分 dispatch", ["融合分组成可独立下发的单元", "33 次调用 · 23 个不同单元"], "产物 flow.mlir · 76 KB"),
        ("violet", "7 · 设备分配与调度", ["NPU 插件给每个单元选设备", "并插入两设备间的数据搬运"], "产物 stream.mlir · 100 KB"),
        ("emerald", "8 · 代码生成", ["linalg→LLVM IR→汇编→ELF", "11 个 RV32 ELF + 1 个 x86 库"], "产物 109 KB + 13 KB"),
        ("amber", "9 · 打包", ["二进制+调度字节码+权重", "FlatBuffer 容器，不是 ELF"], "产物 vit.vmfb · 243 KB"),
    ]
    for x, (c, t, s, tag) in zip(xr, comp):
        b.append(box(x, 308, 190, 84, c, t, s, tag=tag, sw=2 if "设备" in t else 1.5))
    for x in xr[:-1]:
        b.append(line(x - 4, 350, x - 21, 350, "emerald"))
    b.append(curve(985, 166, 1015, 304, "amber", vertical=True))
    b.append(T(1030, 240, "vit.mlir", 8, "#fbbf24", weight=600))
    b.append(T(290, 416, "第 8 步每个单元各自走完 .codegen.ll → .optimized.ll → .s → .o → .so；NPU 侧 11 个 ELF 不合并，为了各自放得进很小的 ITCM", 8, "#64748b"))
    b.append(T(290, 434, "NPU 目标三元组 riscv32-unknown-unknown-eabi-elf · 特性 +m,+f,+zvl128b,+zve32f（摘自 stream.mlir 的 #hal.device.target）", 8, "#64748b"))

    b.append(zone(490, 210, "violet", "③ 运行：IREE 运行时 + MPACT 仿真器 —— run_vit.py 同时挂载两个设备，按调度字节码逐个执行 33 次 dispatch"))
    b.append(box(60, 560, 210, 84, "violet", "IREE 虚拟机（主机）", ["加载 vit.vmfb", "解释调度字节码，逐个下发"], tag="模块名 module · 入口 main"))
    b.append(box(370, 530, 300, 60, "slate", "设备 local-sync —— 主机 x86", ["直接调用 x86 库里的函数 · 15 次 dispatch"]))
    b.append(box(370, 610, 300, 60, "emerald", "设备 coralnpu —— MPACT 指令级仿真", ["HAL 驱动装载 RV32 ELF 与数据后执行 · 18 次"], sw=2))
    b.append(curve(155, 396, 155, 556, "amber", vertical=True))
    b.append(T(166, 480, "vit.vmfb", 8, "#fbbf24", weight=600))
    b.append(curve(274, 590, 366, 560, "slate"))
    b.append(curve(274, 614, 366, 640, "emerald"))
    b.append(box(770, 560, 170, 84, "cyan", "输出 logits", ["tensor 1×10 f32", "top-1 = 类别 9"]))
    b.append(curve(674, 560, 766, 592, "cyan"))
    b.append(curve(674, 640, 766, 616, "cyan"))
    b.append(box(980, 560, 160, 84, "orange", "与参考答案比对", ["ref_out.npy（第 1 步产出）", "最大绝对误差 8.4e-06"], tag="SUCCESS"))
    b.append(line(944, 602, 976, 602, "orange"))
    b.append(conclusion(726, "九步里真正换了工具的只有前四步：vit.mlir 之后，PyTorch 与 JAX 两条路线完全共用编译器与运行时"))
    return svg(750, b, defs)


# ---------------------------------------------------------------- 图二 一个算子的七次变身
KEYWORDS = ["nn.Linear", "aten.linear.default", "torch.aten.mm", "stablehlo.dot_general", "linalg.matmul",
            "flow.dispatch", "vfmadd.vv"]


MONO = "'JetBrains Mono','Menlo','SF Mono','Consolas','DejaVu Sans Mono',monospace"


def _mono(x, y, body, fill):
    return (f'<text x="{x}" y="{y}" fill="{fill}" font-size="8.5" font-family="{MONO}" '
            f'xml:space="preserve">{body}</text>')


def codeline(x, y, s, maxc=172, comment_dx=300):
    m = re.search(r"\s{2,}#\s?(.*)$", s)
    comment = None
    if m:
        comment, s = m.group(1), s[: m.start()]
    s = s if len(s) <= maxc else s[: maxc - 1] + "…"
    body = esc(s)
    for k in KEYWORDS:
        if k in s:
            a, c = s.split(k, 1)
            body = f'{esc(a)}<tspan fill="#fbbf24" font-weight="600">{esc(k)}</tspan>{esc(c)}'
            break
    out = _mono(x, y, body, "#cbd5e1")
    if comment:
        out += T(x + comment_dx, y, "# " + comment, 8, "#64748b")
    return out


def fig2(defs):
    rows = [
        ("cyan", "PyTorch 源码", "vit_torch.py", [
            "self.qkv = nn.Linear(DIM, 3 * DIM, bias=False)          # DIM = 32，输出 96 = Q、K、V 各 32",
            "qkv = self.qkv(self.ln1(x)).reshape(b, n, 3, HEADS, HDIM).permute(2, 0, 3, 1, 4)"]),
        ("cyan", "FX 图节点", "torch.export", [
            "add_2 = torch.ops.aten.add.Tensor(mul, p_blocks_0_ln1_b);  mul = p_blocks_0_ln1_b = None",
            "linear_1 = torch.ops.aten.linear.default(add_2, p_blocks_0_qkv_weight);  add_2 = p_blocks_0_qkv_weight = None",
            "reshape_2 = torch.ops.aten.reshape.default(linear_1, [1, 17, 3, 2, 16]);  linear_1 = None"]),
        ("cyan", "Torch 方言", "vit.torch_dialect.mlir:86–89", [
            "%61 = torch.aten.permute %20, %60 : !torch.vtensor<[96,32],f32>, !torch.list<int> -> !torch.vtensor<[32,96],f32>",
            "%63 = torch.aten.view %59, %62 : !torch.vtensor<[1,17,32],f32>, !torch.list<int> -> !torch.vtensor<[17,32],f32>",
            "%64 = torch.aten.mm %63, %61 : !torch.vtensor<[17,32],f32>, !torch.vtensor<[32,96],f32> -> !torch.vtensor<[17,96],f32>"]),
        ("amber", "StableHLO", "vit.mlir:86–87", [
            "%44 = stablehlo.reshape %42 : (tensor<1x17x32xf32>) -> tensor<17x32xf32>",
            "%45 = stablehlo.dot_general %44, %43, contracting_dims = [1] x [0] : (tensor<17x32xf32>, tensor<32x96xf32>) -> tensor<17x96xf32>"]),
        ("emerald", "linalg", "input.mlir:234–236", [
            "%70 = tensor.empty() : tensor<17x96xf32>",
            "%71 = linalg.fill ins(%cst_9 : f32) outs(%70 : tensor<17x96xf32>) -> tensor<17x96xf32>",
            "%72 = linalg.matmul ins(%collapsed_45, %69 : tensor<17x32xf32>, tensor<32x96xf32>) outs(%71 : tensor<17x96xf32>) -> tensor<17x96xf32>"]),
        ("violet", "flow dispatch", "flow.mlir:635", [
            "%13 = flow.dispatch @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%12, %__constant_tensor_96x32xf32_3)",
            "        {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<96x32xf32>) -> tensor<17x96xf32>"]),
        ("emerald", "RISC-V 汇编", "main_dispatch_5_…riscv_32.s", [
            "vsetivli  zero, 8, e32, m2, ta, ma        # 向量长度 8，元素 32 位",
            "vlse32.v  v18, (t0), a5                   # 按步长从内存取 8 个 f32",
            "vrgather.vi v16, v2, 0",
            "vfmadd.vv v16, v18, v4                    # 8 路浮点乘加：v16 = v16*v18 + v4",
            "vmerge.vvm v4, v4, v16, v0                # 按掩码写回累加器"]),
    ]
    b = []
    y = 40
    centers = []
    for color, name, src, lines in rows:
        h = 22 + 15 * len(lines)
        b.append(box(40, y, 170, h, color, name, [], tsize=10.5))
        b.append(T(125, y + 38 if h > 50 else y + 36, src, 7.5, "#94a3b8", "middle"))
        b.append(f'<rect x="222" y="{y}" width="938" height="{h}" rx="6" fill="#0b1220" stroke="#1e293b" stroke-width="1"/>')
        ly = y + 19
        for ln in lines:
            b.append(codeline(234, ly, ln))
            ly += 15
        centers.append((y, h))
        y += h + 24
    for (y0, h0), (y1, _) in zip(centers, centers[1:]):
        b.append(line(125, y0 + h0 + 3, 125, y1 - 4, "slate"))
    notes = ["追踪：Python 调用变成图节点", "翻译：Linear 被拆成 permute + view + mm", "改写：aten.mm → dot_general，类型从 vtensor 变 tensor",
             "改写：补上输出缓冲与清零，矩阵乘成为可分析的循环", "切分：这个矩阵乘独占一个 dispatch，并被标上 NPU 设备", "代码生成：循环被向量化成 8 路浮点乘加"]
    for (y0, h0), n in zip(centers, notes):
        b.append(T(140, y0 + h0 + 16, n, 8, "#64748b"))
    b.append(T(40, y + 6, "口径：七段文字描述的是同一个运算 —— 第一个 Transformer block 的 qkv 投影，17 个 token × 32 维 → 96 维。除注释外均为产物文件原文，超长处以 … 截断", 8, "#64748b"))
    b.append(conclusion(y + 30, "抽象层级一路下降，但形状 17×32 · 32×96 → 17×96 从头到尾没变 —— 顺着形状就能在任意一层找到同一个算子"))
    return svg(y + 50, b, defs)


# ---------------------------------------------------------------- 图三 规模漏斗
def fig3(defs):
    rows = [
        ("cyan", "FX 图节点（ATen 算子）", 111, "torch.export 之后"),
        ("cyan", "Torch 方言 aten 算子", 190, "Linear 等复合算子被拆开，所以变多"),
        ("amber", "StableHLO 算子", 297, "softmax / layernorm 继续拆成基础运算"),
        ("emerald", "linalg 层全部操作", 617, "最细的一层：每个循环、每个缓冲、每次 reshape 都显式写出"),
        ("violet", "dispatch 调用次数", 33, "融合之后：617 个操作收拢成 33 次下发"),
        ("violet", "不同的 dispatch 单元", 23, "两个 block 形状相同，单元可复用"),
        ("emerald", "最终二进制个数", 12, "11 个 RV32 ELF（NPU）+ 1 个 x86 库（主机）"),
    ]
    b = [zone(30, 360, "slate", "① 每个阶段“有多少个东西” —— 先越拆越细，再融合收拢")]
    scale = 700 / 617
    y = 78
    for color, label, n, note in rows:
        st, fl = C[color]
        w = max(6, n * scale)
        b.append(T(330, y + 16, label, 9.5, "white", "end", 600))
        b.append(f'<rect x="350" y="{y}" width="{w:.1f}" height="24" rx="3" fill="{fl}" stroke="{st}" stroke-width="1.2"/>')
        b.append(T(350 + w + 10, y + 16, str(n), 10, st, weight=700))
        if w > 500:
            b.append(T(362, y + 16, note, 8, "#cbd5e1"))
        else:
            b.append(T(350 + w + 10 + 8 * len(str(n)) + 6, y + 16, note, 8, "#94a3b8"))
        y += 40
    b.append(T(60, 372, "口径：条形等比（700 px = 617）。各行数的是该层级自己的“操作”，层级不同不可直接相加，只看趋势", 8, "#64748b"))
    b.append(conclusion(416, "前四层是“翻译”，数量越翻越多；编译器真正的工作发生在 617 → 33 这一步：决定哪些循环合并成一个可下发的内核"))
    return svg(440, b, defs)


# ---------------------------------------------------------------- 图四 dispatch 序列与设备分配
SEQ = [(0, "T", "重排"), (1, "mm", "投影"), (2, "elt", "+pos"),
       (3, "red", "LN1"), (4, "red", "LN1"), (5, "mm", "qkv"), (6, "T", "分头"), (7, "bmm", "QKᵀ"), (8, "smax", "smax"),
       (9, "bmm", "AV"), (10, "mm", "proj"), (3, "red", "LN2"), (12, "red", "LN2"), (13, "mm", "fc1"), (14, "mm", "fc2"),
       (3, "red", "LN1"), (16, "red", "LN1"), (5, "mm", "qkv"), (6, "T", "分头"), (7, "bmm", "QKᵀ"), (8, "smax", "smax"),
       (9, "bmm", "AV"), (10, "mm", "proj"), (3, "red", "LN2"), (24, "red", "LN2"), (13, "mm", "fc1"), (26, "mm", "fc2"),
       (27, "elt", "LN"), (28, "red", "LN"), (29, "elt", "LN"), (30, "red", "LN"), (31, "elt", "LN"), (32, "vm", "head")]
NPU = {1, 5, 6, 7, 8, 9, 10, 13, 14, 26, 32}


def fig4(defs):
    assert len(SEQ) == 33 and sum(1 for i, _, _ in SEQ if i in NPU) == 18
    b = [zone(30, 215, "emerald", "① 一次推理的 33 次 dispatch，按执行顺序自左向右 —— 格内数字 = dispatch 编号（flow.mlir 中的调用顺序）")]
    x0, step, w = 58, 33, 29
    groups = [(0, 2, "Patch 嵌入"), (3, 14, "Transformer block 1"), (15, 26, "Transformer block 2"), (27, 32, "末层 LN + 分类头")]
    for a, z, name in groups:
        xa, xz = x0 + a * step, x0 + z * step + w
        b.append(f'<path d="M {xa} 92 L {xa} 86 L {xz} 86 L {xz} 92" fill="none" stroke="#64748b" stroke-width="1"/>')
        b.append(T((xa + xz) / 2, 80, name, 8.5, "#94a3b8", "middle", 600))
    for k, (i, kind, role) in enumerate(SEQ):
        x = x0 + k * step
        color = "emerald" if i in NPU else "slate"
        st, fl = C[color]
        b.append(f'<rect x="{x}" y="100" width="{w}" height="44" rx="4" fill="#0f172a"/>')
        b.append(f'<rect x="{x}" y="100" width="{w}" height="44" rx="4" fill="{fl}" stroke="{st}" stroke-width="{1.8 if i in NPU else 1}"/>')
        b.append(T(x + w / 2, 119, str(i), 10, "white", "middle", 700))
        b.append(T(x + w / 2, 135, kind, 7.5, st, "middle", 600))
        b.append(T(x + w / 2, 160, role, 7.5, "#94a3b8", "middle"))
    b.append(T(58, 186, "第一行缩写 = 编译器起的类型名：mm 矩阵乘 · bmm 批量矩阵乘 · smax softmax · vm 向量×矩阵 · T transpose · red reduction · elt elementwise", 8, "#64748b"))
    b.append(T(58, 204, "第二行 = 它在模型里的角色。block 2 里编号 3、5–10、13 与 block 1 相同 —— 形状一样，复用同一份二进制；LN 的第二个 reduction 与 fc2 各有独立版本", 8, "#64748b"))
    b.append(T(58, 232, "口径：编号与类型来自 flow.mlir 的调用序列；NPU / 主机归属来自导出目录里哪些单元生成了 riscv_32 ELF", 8, "#64748b"))

    b.append(zone(275, 190, "violet", "② 分给谁 —— 编译器自己的估算（--coralnpu-dump-affinity-profile-format=pretty 的输出）"))
    bars = [("按估算工作量（Op-Elems）", 80.9, "1.28 M", 19.1, "0.30 M"), ("按 dispatch 次数", 54.5, "18 次", 45.5, "15 次")]
    y = 322
    for label, pn, tn, ph, th in bars:
        b.append(T(300, y + 17, label, 9.5, "white", "end", 600))
        wn, wh = pn * 8.0, ph * 8.0
        b.append(f'<rect x="320" y="{y}" width="{wn:.0f}" height="26" rx="3" fill="{C["emerald"][1]}" stroke="#34d399" stroke-width="1.5"/>')
        b.append(f'<rect x="{320 + wn:.0f}" y="{y}" width="{wh:.0f}" height="26" rx="3" fill="{C["slate"][1]}" stroke="#94a3b8" stroke-width="1"/>')
        b.append(T(320 + wn / 2, y + 17, f"NPU {pn}% · {tn}", 9, "white", "middle", 600))
        b.append(T(320 + wn + wh / 2, y + 17, f"主机 {ph}% · {th}", 8.5, "white", "middle"))
        y += 46
    b.append(T(60, 428, "口径：两条均为整次推理的总量，800 px = 100%。工作量是编译器按张量元素数做的静态估算，不是仿真器实测的周期数", 8, "#64748b"))
    b.append(T(60, 446, "去 NPU 的：全部矩阵乘、注意力两个 bmm、softmax、分头 transpose、分类头。留主机的：layernorm 的均值方差（reduction）与零碎逐元素运算", 8, "#64748b"))

    b.append(f'<rect x="900" y="400" width="246" height="58" rx="6" fill="rgba(30,41,59,0.5)" stroke="#475569" stroke-width="1"/>')
    b.append(T(912, 415, "怎么读这张图", 8.5, "white", weight=600))
    b.append(f'<rect x="912" y="422" width="14" height="10" rx="2" fill="{C["emerald"][1]}" stroke="#34d399" stroke-width="1.5"/>')
    b.append(T(932, 431, "绿 = 在 NPU（MPACT）上执行", 8, "#94a3b8"))
    b.append(f'<rect x="912" y="438" width="14" height="10" rx="2" fill="{C["slate"][1]}" stroke="#94a3b8" stroke-width="1"/>')
    b.append(T(932, 447, "灰 = 在主机 x86 上执行", 8, "#94a3b8"))
    b.append(conclusion(490, "次数上两边接近五五开，但重活几乎都在 NPU：18 次 dispatch 承担了 81% 的估算工作量"))
    return svg(512, b, defs)


# ---------------------------------------------------------------- 图五 NPU 内核指令构成
def fig5(defs):
    b = [zone(30, 250, "amber", "① NPU 内核函数里都是什么指令 —— 只统计内核函数本身，不含同文件里的运行时辅助函数")]
    cats = [("向量浮点 vf*", "amber"), ("向量其他 v*", "violet"), ("标量浮点 f*", "rose"), ("标量整数与控制", "slate")]
    data = [("dispatch_5 矩阵乘 17×32·32×96", 304, [9, 117, 1, 177]), ("dispatch_8 softmax 2×17×17", 255, [41, 55, 24, 135])]
    y = 84
    for label, tot, vals in data:
        b.append(T(60, y - 8, f"{label}  ——  共 {tot} 条指令", 9.5, "white", weight=600))
        x = 60.0
        for (cn, col), v in zip(cats, vals):
            w = v / tot * 1080
            st, fl = C[col]
            b.append(f'<rect x="{x:.1f}" y="{y}" width="{w:.1f}" height="28" rx="2" fill="{fl}" stroke="{st}" stroke-width="1.2"/>')
            if w > 60:
                b.append(T(x + w / 2, y + 18, f"{v} · {v / tot * 100:.0f}%", 8.5, "white", "middle", 600))
            elif w > 16:
                b.append(T(x + w / 2, y + 18, str(v), 8, "white", "middle"))
            x += w
        y += 78
    lx = 60
    for cn, col in cats:
        st, fl = C[col]
        b.append(f'<rect x="{lx}" y="232" width="14" height="10" rx="2" fill="{fl}" stroke="{st}" stroke-width="1.2"/>')
        b.append(T(lx + 20, 241, cn, 8, "#94a3b8"))
        lx += 170
    b.append(T(760, 241, "口径：条宽 1080 px = 该内核 100% 指令；数的是汇编里的静态指令条数，不是执行次数", 8, "#64748b"))
    b.append(T(60, 266, "矩阵乘内核只有 9 条向量浮点指令，但它们在最内层循环里，执行次数占绝大多数；117 条“向量其他”是取数、掩码、寄存器搬运", 8, "#64748b"))

    b.append(zone(310, 250, "emerald", "② 矩阵乘最内层循环原文（main_dispatch_5 的 .s 文件）"))
    b.append(f'<rect x="60" y="346" width="640" height="196" rx="6" fill="#0b1220" stroke="#1e293b" stroke-width="1"/>')
    asm = ["vsetivli   zero, 8, e32, m2, ta, ma", "vmv1r.v    v0, v1", "slli       t0, s6, 2", "add        t0, a6, t0",
           "vlse32.v   v18, (t0), a5", "vrgather.vi v16, v2, 0", "vfmadd.vv  v16, v18, v4", "vmerge.vvm v4, v4, v16, v0",
           "vrgather.vi v16, v2, 1", "vfmadd.vv  v16, v18, v6", "vmerge.vvm v6, v6, v16, v0"]
    yy = 366
    for a in asm:
        b.append(codeline(76, yy, a))
        yy += 16
    ann = [(366, "设向量长度 8、元素宽 32 位 —— 一次处理 8 个 f32", "amber"),
           (430, "按步长 a5 从矩阵里取一列的 8 个元素", "violet"),
           (462, "8 路融合乘加：v16 = v16 × v18 + v4，一条指令 8 个浮点", "amber"),
           (478, "按掩码 v0 选择性地把结果写回累加器 v4", "violet")]
    for ay, s, col in ann:
        b.append(f'<line x1="330" y1="{ay - 3}" x2="716" y2="{ay - 3}" stroke="{C[col][0]}" stroke-width="0.8" stroke-dasharray="3,3"/>')
        b.append(T(724, ay, s, 8.5, C[col][0]))
    b.append(T(724, 518, "同一个 .s 文件总共 1,227 条指令，内核只占 304 条；", 8, "#64748b"))
    b.append(T(724, 534, "其余是链接进来的运行时辅助函数（半精度转换、fma 等）", 8, "#64748b"))
    b.append(conclusion(592, "f32 矩阵乘在 NPU 上是向量化执行的：编译目标特性含 +zve32f，内核用 vfmadd.vv 一次算 8 个浮点乘加"))
    return svg(614, b, defs)


# ---------------------------------------------------------------- 图六 结果验证
NPU_OUT = [0.134575754404068, -0.14951390027999878, -0.09309281408786774, -0.10619933158159256, -0.6472049355506897,
           -0.3886367976665497, -0.42838895320892334, 0.009810278192162514, -0.20992045104503632, 0.35687947273254395]
REF_OUT = [0.13456737995147705, -0.14951276779174805, -0.09309092164039612, -0.1062011644244194, -0.647202730178833,
           -0.38863253593444824, -0.4283960461616516, 0.009806618094444275, -0.2099165916442871, 0.35688352584838867]


def fig6(defs):
    b = [zone(30, 400, "cyan", "① 10 个类别的 logits：PyTorch 参考值 vs NPU 仿真输出 —— 同一张输入（固定种子的 1×32×32×3 随机张量）")]
    axis, sc = 210, 230
    b.append(f'<line x1="90" y1="{axis}" x2="1130" y2="{axis}" stroke="#475569" stroke-width="1"/>')
    for v in (0.4, 0.2, -0.2, -0.4, -0.6):
        yy = axis - v * sc
        b.append(f'<line x1="90" y1="{yy:.0f}" x2="1130" y2="{yy:.0f}" stroke="#1e293b" stroke-width="1" stroke-dasharray="2,4"/>')
        b.append(T(84, yy + 3, f"{v:+.1f}", 7.5, "#64748b", "end"))
    b.append(T(84, axis + 3, "0", 7.5, "#64748b", "end"))
    top = max(range(10), key=lambda i: NPU_OUT[i])
    for i in range(10):
        cx = 150 + i * 103
        for off, val, col in ((-26, REF_OUT[i], "cyan"), (2, NPU_OUT[i], "emerald")):
            h = abs(val) * sc
            y = axis - h if val >= 0 else axis
            st, fl = C[col]
            b.append(f'<rect x="{cx + off}" y="{y:.1f}" width="24" height="{max(h, 1):.1f}" rx="2" fill="{fl}" stroke="{st}" stroke-width="1.3"/>')
        val = NPU_OUT[i]
        ly = axis - abs(val) * sc - 8 if val >= 0 else axis + abs(val) * sc + 14
        b.append(T(cx, ly, f"{val:+.4f}", 8, "#fbbf24" if i == top else "#cbd5e1", "middle", 700 if i == top else None))
        b.append(T(cx, 386, f"类别 {i}", 8.5, "#fbbf24" if i == top else "#94a3b8", "middle", 600))
        b.append(T(cx, 402, f"|差| {abs(NPU_OUT[i] - REF_OUT[i]):.1e}", 7.5, "#64748b", "middle"))
    b.append(f'<rect x="880" y="60" width="14" height="10" rx="2" fill="{C["cyan"][1]}" stroke="#22d3ee" stroke-width="1.3"/>')
    b.append(T(900, 69, "PyTorch 参考（ref_out.npy）", 8, "#94a3b8"))
    b.append(f'<rect x="880" y="78" width="14" height="10" rx="2" fill="{C["emerald"][1]}" stroke="#34d399" stroke-width="1.3"/>')
    b.append(T(900, 87, "NPU 仿真输出（MPACT）", 8, "#94a3b8"))
    b.append(T(60, 422, "口径：柱高 230 px = 1.0。两根柱子肉眼无法区分，差异在第 6 位小数：最大 |差| = 8.4e-06，出现在类别 0", 8, "#64748b"))
    b.append(conclusion(462, "top-1 两边都是类别 9；误差量级是 f32 运算顺序不同带来的正常舍入差，说明编译与仿真在功能上完全正确"))
    return svg(484, b, defs)


def main():
    tpl = open(TEMPLATE, encoding="utf-8").read()
    defs = re.search(r"<defs>.*?</defs>", tpl, re.S).group(0)
    head, rest = tpl.split('<!-- ============================================================', 1)
    tail = rest.split("<!-- Footer -->", 1)[1]
    title = "Toy ViT：从 PyTorch 到 Coral NPU 仿真"
    head = head.replace("{{标题}}：主流程 · 量化 · 存储 · KV Cache", title + " · 全流程与中间产物").replace("{{标题}}", title)
    head = head.replace("{{副标题 —— 概念视图，受众}}",
                        "实现级视图 · 每个数字都来自本机实测产物（toy-vit/out_torch 与容器内 ~/work/vit-torch/stages）· PyTorch 2.14 + torch-mlir → coralnpu-compile → MPACT")
    head = head.replace(".section-title .num.rose { background: #fb7185; }",
                        ".section-title .num.rose { background: #fb7185; }\n    .section-title .num.emerald { background: #34d399; }")
    tail = tail.replace("{{页脚：标题 · 场景}}", "Toy ViT → Coral NPU · PyTorch 路线全流程 · 数据采集自 2026-09-17 的一次完整运行")

    secs = [
        section("图一", "cyan", "全景：九步、三个阶段、每步的产物", "前端 · 编译器 · 运行", fig1(defs), [
            ("cyan", "前端四步都在一个函数里", ["fx.export_and_import(model, x, output_type=\"stablehlo\") 内部依次做了捕获、导入、降级", "把 output_type 换成 \"torch\" 就能停在第 3 步，图二的 Torch 方言原文就是这样导出的", "torch-mlir 只有 Linux x86 的 wheel，所以这四步在容器里跑；Rosetta 下实测正常"]),
            ("emerald", "编译器四步也能逐段停", ["--compile-to=input / flow / stream 分别停在第 5、6、7 步并写出 MLIR 文本", "--iree-hal-dump-executable-files-to=目录 会把第 8 步每个单元的 .ll / .s / .o / .so 全部留下", "这些导出只为观察，正常使用时一条命令直接得到 vit.vmfb"]),
            ("violet", "运行时是“主机调度 + 设备执行”", ["vit.vmfb 由主机上的 IREE 虚拟机加载，NPU 只执行被分给它的内核", "这与 TFLM 路线不同：那边整个解释器和模型都在 NPU 上，主机只负责写输入读输出", "stream.mlir 里两个设备互相声明为 unified_memory，编译器据此安排数据传递"]),
        ]),
        section("图二", "amber", "一个算子的七次变身：qkv 投影从 Python 到 RISC-V 指令", "同一运算 · 七层表示 · 产物原文", fig2(defs), [
            ("cyan", "PyTorch 特有的痕迹", ["nn.Linear 的权重按 [out, in] = [96, 32] 存，用之前要先 permute 成 [32, 96]", "所以 Torch 方言里一个 Linear 变成 permute + view + mm 三条", "这也是 PyTorch 版 reshape / transpose 数量远多于 JAX 版的原因，但后面会被编译器融合掉"]),
            ("amber", "StableHLO 是交接面", ["到这一层已经看不出模型来自 PyTorch 还是 JAX", "类型从 !torch.vtensor<[17,32],f32> 变成标准的 tensor<17x32xf32>", "编译器只加载了 input_stablehlo 和 input_tosa 两个输入插件，所以必须降到这一层"]),
            ("emerald", "linalg 之后才谈得上优化", ["linalg.matmul 把输出缓冲、清零、乘加循环都显式化，编译器能看见循环结构", "flow.dispatch 上的 stream.affinity 属性就是设备分配的结果，@__device_1 = coralnpu", "最终汇编里能直接看到向量长度 8、元素宽 32 位的浮点乘加"]),
        ]),
        section("图三", "violet", "规模漏斗：每个阶段有多少个“东西”", "先拆细 · 再融合", fig3(defs), [
            ("cyan", "为什么越翻越多", ["高层算子是复合的：一个 softmax 到 StableHLO 变成 exp + reduce + divide + broadcast", "到 linalg 层，连每个输出缓冲的分配（tensor.empty）都是一条独立操作", "变多不是变慢，只是表示更细，方便后面重新组合"]),
            ("violet", "617 → 33 是关键一步", ["编译器把能在一个循环里算完的相邻操作融合成一个 dispatch", "例如 dispatch_13：fc1 矩阵乘与紧跟的 gelu（tanh、powf）在同一个内核里", "融合得越好，设备间来回搬数据的次数越少"]),
            ("emerald", "33 → 23 → 12", ["两个 Transformer block 形状相同，8 个单元直接复用，所以 33 次调用只需 23 个单元", "主机侧 12 个单元链接成 1 个 x86 库；NPU 侧 11 个各自独立成 ELF", "NPU 侧不合并是硬件约束：每个 ELF 要能单独放进 ITCM"]),
        ]),
        section("图四", "emerald", "33 次 dispatch 的执行序列与设备分配", "执行顺序 · NPU / 主机 · 工作量占比", fig4(defs), [
            ("emerald", "NPU 拿到了什么", ["全部 7 类矩阵乘：patch 投影、qkv、注意力输出、fc1、fc2（两个版本）、分类头", "注意力核心：QKᵀ 和 AV 两个批量矩阵乘，以及中间的 softmax", "一个 PyTorch 风格的分头 transpose 也被放上了 NPU"]),
            ("slate", "主机留下了什么", ["layernorm 的均值和方差：每个 LN 是两次 reduction，全模型 5 个 LN", "patch 重排、cls 拼接与位置编码相加、末层 LN 的逐元素部分", "这些运算量小，放 NPU 的收益抵不过下发开销"]),
            ("amber", "这张图的局限", ["占比是编译器的静态估算，不是实测；这条路线的运行器目前不输出 NPU 周期数", "每次 NPU dispatch 都要经过装载 ELF、搬数据、启动仿真，真实硬件上这部分开销需要单独评估", "想减少来回切换，方向是让 layernorm 也能融合进 NPU 内核"]),
        ]),
        section("图五", "rose", "NPU 内核里到底是什么指令", "指令构成 · 内层循环原文", fig5(defs), [
            ("amber", "结论：f32 是向量化执行的", ["编译目标特性 +m,+f,+zvl128b,+zve32f：128 位向量寄存器，支持 32 位浮点向量", "128 位装 4 个 f32；内核用 LMUL=2（m2）把两个寄存器拼起来，一次算 8 个", "softmax 内核的向量浮点指令更多（41 条），同时还保留了 24 条标量浮点"]),
            ("rose", "一处需要更正的说法", ["此前曾据整份 .s 文件的统计得出“浮点是标量执行”的结论，那是错的", "整份文件 1,227 条指令里有 923 条属于链接进来的运行时辅助函数，标量浮点几乎都在那里", "只看内核函数：矩阵乘 304 条里标量浮点仅 1 条"]),
            ("violet", "一个尚未解释的出入", ["coralnpu 硬件仓库 README 写的指令集是 rv32imf_zve32x（整数向量）", "而编译器以 zve32f（浮点向量）为目标，MPACT 仿真器也正确执行了这些指令", "真实 RTL 是否支持浮点向量，需要到 Verilator 周期精确仿真上验证，目前未做"]),
        ]),
        section("图六", "cyan", "结果验证：NPU 输出对比 PyTorch 参考", "logits · 逐类误差", fig6(defs), [
            ("cyan", "验证方法", ["第 1 步在 PyTorch 里用固定种子的输入跑一次前向，存下 ref_in.npy 与 ref_out.npy", "第 9 步把同一份输入喂给编译后的模块，逐元素比较 logits", "判定标准 np.allclose(atol=1e-3, rtol=1e-3)，实测最大误差 8.4e-06"]),
            ("emerald", "这个结果说明了什么", ["导出、降级、切分、设备分配、代码生成、仿真执行，整条链路功能正确", "权重是随机初始化的，所以“类别 9”本身没有含义，只用来核对两边一致", "换成训练过的权重，流程与命令完全不变"]),
            ("amber", "下一步可以做的", ["int8 量化后重走一遍，对比 dispatch 分配和内核指令的变化", "同一模型走 TFLM 路线，拿到 MPACT 周期数做两条路线的对比", "把同一批 RISC-V ELF 放到 Verilator 上，验证浮点向量指令在 RTL 上的支持情况"]),
        ]),
    ]
    out = head + "\n".join(secs) + "\n    <!-- Footer -->" + tail
    open(OUT, "w", encoding="utf-8").write(out)
    print("wrote", OUT, len(out), "bytes")


if __name__ == "__main__":
    sys.exit(main())
