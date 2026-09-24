"""Inline SVG figures for pipeline_record.html. Plain line-art; colours come from page CSS variables."""
import html

FIG_CSS = """
figure.fig{margin:16px 0 20px}
figure.fig svg{width:100%;height:auto;display:block}
figure.fig figcaption{font-size:12.5px;color:var(--mut);margin-top:6px}
.fig text{fill:var(--fg);font-size:12px;font-family:-apple-system,"PingFang SC","Hiragino Sans GB","Microsoft YaHei",sans-serif}
.fig .s{fill:var(--mut);font-size:10.5px}
.fig .m{font-family:"JetBrains Mono","SF Mono",Menlo,Consolas,monospace;font-size:10.5px}
.fig .b{font-weight:600}
.fig .bx{fill:var(--bx);stroke:var(--bxs);stroke-width:1}
.fig .fe{fill:var(--fe);stroke:var(--fes);stroke-width:1}
.fig .npu{fill:var(--npuf);stroke:var(--npus);stroke-width:1.2}
.fig .host{fill:var(--hostf);stroke:var(--hosts);stroke-width:1}
.fig .art{fill:var(--artf);stroke:var(--arts);stroke-width:1}
.fig .grp{fill:none;stroke:var(--bxs);stroke-width:1;stroke-dasharray:5 4}
.fig .ar{stroke:var(--mut);stroke-width:1.2;fill:none}
.fig .ah{fill:var(--mut)}
.fig .ax{stroke:var(--line);stroke-width:1;fill:none}
.fig .c1{fill:var(--k1)} .fig .c2{fill:var(--k2)} .fig .c3{fill:var(--k3)} .fig .c4{fill:var(--k4)}
.fig .ref{fill:var(--fes)} .fig .out{fill:var(--npus)}
:root{--bx:#fff;--bxs:#b9bfc9;--fe:#eaf2fb;--fes:#4a86c5;--npuf:#e3f3ea;--npus:#2e8b57;--hostf:#eef0f3;--hosts:#8a93a1;--artf:#fdf4e1;--arts:#c08a1e;--k1:#d9881a;--k2:#7a5cc0;--k3:#c94f4f;--k4:#aab1bc}
@media (prefers-color-scheme:dark){:root{--bx:#1b1e23;--bxs:#4a515c;--fe:#14263a;--fes:#5b9bd8;--npuf:#143023;--npus:#4fb381;--hostf:#23272d;--hosts:#7d8693;--artf:#33290f;--arts:#d2a544;--k1:#e0a040;--k2:#9a82dc;--k3:#e07a7a;--k4:#5d6572}}
"""

DEFS = ('<defs><marker id="ah" viewBox="0 0 8 8" refX="7" refY="4" markerWidth="7" markerHeight="7" orient="auto-start-reverse">'
        '<path class="ah" d="M0 0L8 4L0 8z"/></marker></defs>')


def e(s):
    return html.escape(str(s), quote=False)


def t(x, y, s, cls="", anchor="middle"):
    c = f' class="{cls}"' if cls else ""
    return f'<text x="{x}" y="{y}" text-anchor="{anchor}"{c}>{e(s)}</text>'


def box(x, y, w, h, cls, title, sub=None, sub2=None, mono_sub=False):
    o = [f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="5" class="{cls}"/>']
    n = 1 + bool(sub) + bool(sub2)
    cy = y + h / 2
    ys = {1: [cy + 4], 2: [cy - 4, cy + 12], 3: [cy - 11, cy + 4, cy + 18]}[n]
    o.append(t(x + w / 2, ys[0], title, "b"))
    sc = "s m" if mono_sub else "s"
    if sub:
        o.append(t(x + w / 2, ys[1], sub, sc))
    if sub2:
        o.append(t(x + w / 2, ys[2], sub2, "s"))
    return "".join(o)


def arrow(x1, y1, x2, y2):
    return f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" class="ar" marker-end="url(#ah)"/>'


def path(d):
    return f'<path d="{d}" class="ar" marker-end="url(#ah)"/>'


def wrap(n, caption, w, h, body):
    return (f'<figure class="fig"><svg class="fig" viewBox="0 0 {w} {h}" role="img" aria-label="{e(caption)}">{DEFS}'
            + "".join(body) + f'</svg><figcaption>图 {n} · {e(caption)}</figcaption></figure>')


# ---------------------------------------------------------------- 图 1 链路
def fig_pipeline(n):
    b = []
    rows = [(34, "前端", "torch-mlir"), (150, "编译器", "coralnpu-compile"), (266, "运行", "IREE + MPACT")]
    for y, a, s in rows:
        b.append(t(8, y + 26, a, "b", "start"))
        b.append(t(8, y + 42, s, "s", "start"))
    r1 = [("1 PyTorch 模型", "ref_in / ref_out.npy"), ("2 torch.export", "FX 图 · 111 节点"),
          ("3 Torch 方言", "torch_dialect.mlir · 231 KB"), ("4 StableHLO", "vit.mlir · 220 KB")]
    for i, (a, s) in enumerate(r1):
        x = 120 + i * 200
        b.append(box(x, 34, 185, 58, "fe" if i < 3 else "art", a, s, mono_sub=True))
        if i:
            b.append(arrow(x - 15, 63, x - 1, 63))
    r2 = [("5 输入降级", "input.mlir · 93 KB"), ("6 切分 dispatch", "flow.mlir · 76 KB"), ("7 调度", "stream.mlir · 100 KB"),
          ("8 代码生成", "11 ELF + 1 库"), ("9 打包", "vit.vmfb · 243 KB")]
    for i, (a, s) in enumerate(r2):
        x = 120 + i * 160
        b.append(box(x, 150, 145, 58, "bx" if i < 4 else "art", a, s, mono_sub=True))
        if i:
            b.append(arrow(x - 15, 179, x - 1, 179))
    b.append(path("M 812 92 L 812 121 L 192 121 L 192 149"))
    b.append(t(502, 116, "vit.mlir —— 前端与编译器之间唯一的接口", "s"))
    b.append(path("M 832 208 L 832 237 L 205 237 L 205 265"))
    b.append(t(518, 232, "vit.vmfb", "s"))
    b.append(box(120, 266, 170, 74, "bx", "IREE 虚拟机", "主机进程 · 解释调度字节码", "逐个下发 33 次 dispatch"))
    b.append(box(340, 266, 250, 32, "host", "local-sync · 主机 x86 · 15 次"))
    b.append(box(340, 308, 250, 32, "npu", "coralnpu · MPACT 仿真 · 18 次"))
    b.append(path("M 290 294 C 315 294, 315 282, 339 282"))
    b.append(path("M 290 312 C 315 312, 315 324, 339 324"))
    b.append(box(640, 266, 120, 74, "bx", "logits", "1×10 f32"))
    b.append(path("M 590 282 C 615 282, 615 296, 639 296"))
    b.append(path("M 590 324 C 615 324, 615 310, 639 310"))
    b.append(box(790, 266, 115, 74, "art", "比对", "ref_out.npy", "|差| ≤ 8.4e-06"))
    b.append(arrow(760, 303, 789, 303))
    return wrap(n, "九步链路。蓝色为前端阶段，黄色为落盘的关键产物，绿色为在 NPU 仿真器上执行的部分", 920, 356, b)


# ---------------------------------------------------------------- 图 2 模型结构
def fig_model(n):
    b = []
    top = [("输入图像", "1×32×32×3"), ("切 patch", "1×16×192"), ("线性投影", "1×16×32"), ("拼 cls + 位置", "1×17×32"),
           ("Block ×2", "1×17×32"), ("末层 LN 取 cls", "1×32"), ("分类头", "1×10")]
    for i, (a, s) in enumerate(top):
        x = 5 + i * 132
        b.append(box(x, 20, 118, 46, "npu" if i == 4 else "bx", a, s, mono_sub=True))
        if i:
            b.append(arrow(x - 14, 43, x - 1, 43))
    b.append('<rect x="5" y="104" width="910" height="176" rx="8" class="grp"/>')
    b.append(t(18, 124, "一个 Block 的内部（两个 Block 结构与形状完全相同）", "b", "start"))
    b.append('<path d="M 533 66 L 300 104 M 651 66 L 760 104" class="ar" style="stroke-dasharray:3 3"/>')
    r1 = [("LN1", "17×32"), ("qkv 线性", "17×96"), ("拆成 Q K V", "3 × 2×17×16"), ("Q·Kᵀ / √16", "2×17×17"), ("softmax", "2×17×17"),
          ("× V", "2×17×16"), ("合头 + proj", "17×32"), ("⊕ 残差", "17×32")]
    for i, (a, s) in enumerate(r1):
        x = 18 + i * 112
        b.append(box(x, 138, 98, 46, "bx", a, s, mono_sub=True))
        if i:
            b.append(arrow(x - 14, 161, x - 1, 161))
    r2 = [("LN2", "17×32"), ("fc1", "17×64"), ("gelu", "17×64"), ("fc2", "17×32"), ("⊕ 残差", "17×32")]
    for i, (a, s) in enumerate(r2):
        x = 18 + i * 112
        b.append(box(x, 216, 98, 46, "bx", a, s, mono_sub=True))
        if i:
            b.append(arrow(x - 14, 239, x - 1, 239))
    b.append(path("M 851 184 L 851 200 L 67 200 L 67 215"))
    b.append(t(590, 235, "共 23,968 个参数", "s", "start"))
    b.append(t(590, 251, "17 = 16 个 patch + 1 个 cls token；2 个头，每头 16 维", "s", "start"))
    return wrap(n, "模型结构与各处张量形状。后面各层中间表示里的算子，都可以凭这些形状对回到这张图上", 920, 292, b)


# ---------------------------------------------------------------- 图 3 规模
def fig_funnel(n):
    rows = [("FX 图节点", 111, "fe"), ("Torch 方言 aten 算子", 190, "fe"), ("StableHLO 算子", 297, "art"), ("linalg 层全部操作", 617, "bx"),
            ("dispatch 调用", 33, "bx"), ("不同的 dispatch 单元", 23, "bx"), ("最终二进制", 12, "npu")]
    b = []
    sc = 640 / 617
    for i, (lab, v, cls) in enumerate(rows):
        y = 14 + i * 30
        b.append(t(188, y + 15, lab, "", "end"))
        w = max(3, v * sc)
        b.append(f'<rect x="200" y="{y}" width="{w:.1f}" height="20" rx="2" class="{cls}"/>')
        b.append(t(200 + w + 8, y + 15, v, "b", "start"))
    b.append('<path d="M 196 8 L 196 228" class="ax"/>')
    return wrap(n, "各层表示里“操作”的个数。前四层是翻译，越翻越细；617 → 33 是编译器把相邻操作融合成可下发的内核", 920, 236, b)


# ---------------------------------------------------------------- 图 4 dispatch 序列
def fig_dispatch(n, seq, npu):
    short = ["重排", "投影", "+pos", "LN1", "LN1", "qkv", "拆头", "QKᵀ", "smax", "AV", "proj", "LN2", "LN2", "fc1", "fc2",
             "LN1", "LN1", "qkv", "拆头", "QKᵀ", "smax", "AV", "proj", "LN2", "LN2", "fc1", "fc2", "LN", "LN", "LN", "LN", "LN", "head"]
    b = []
    x0, st, w = 14, 27, 24
    for a, z, name in [(0, 2, "Patch 嵌入"), (3, 14, "Block 1"), (15, 26, "Block 2"), (27, 32, "末层 LN + 头")]:
        xa, xz = x0 + a * st, x0 + z * st + w
        b.append(f'<path d="M {xa} 30 L {xa} 24 L {xz} 24 L {xz} 30" class="ax"/>')
        b.append(t((xa + xz) / 2, 18, name, "s"))
    for k, (i, _, _) in enumerate(seq):
        x = x0 + k * st
        b.append(f'<rect x="{x}" y="36" width="{w}" height="30" rx="3" class="{"npu" if i in npu else "host"}"/>')
        b.append(t(x + w / 2, 56, i, "b"))
        b.append(t(x + w / 2, 80, short[k], "s"))
    b.append(t(14, 104, "格内数字是 dispatch 编号；Block 2 中与 Block 1 同号的格子复用同一份二进制", "s", "start"))
    for j, (lab, pn, tn, ph, th) in enumerate([("估算工作量", 80.9, "1.28 M op-elems", 19.1, "0.30 M"), ("dispatch 次数", 54.5, "18 次", 45.5, "15 次")]):
        y = 124 + j * 34
        b.append(t(118, y + 16, lab, "", "end"))
        wn, wh = pn * 7.7, ph * 7.7
        b.append(f'<rect x="130" y="{y}" width="{wn:.0f}" height="24" rx="2" class="npu"/>')
        b.append(f'<rect x="{130 + wn:.0f}" y="{y}" width="{wh:.0f}" height="24" rx="2" class="host"/>')
        b.append(t(130 + wn / 2, y + 16, f"NPU {pn}% · {tn}"))
        b.append(t(130 + wn + wh / 2, y + 16, f"主机 {ph}% · {th}", "s"))
    b.append('<rect x="130" y="200" width="12" height="12" rx="2" class="npu"/>' + t(148, 210, "NPU（MPACT 仿真）", "s", "start"))
    b.append('<rect x="280" y="200" width="12" height="12" rx="2" class="host"/>' + t(298, 210, "主机 x86", "s", "start"))
    b.append(t(400, 210, "工作量为编译器按张量元素数的静态估算，不是实测", "s", "start"))
    return wrap(n, "一次推理的 33 次 dispatch 按执行顺序排列，以及两种口径下 NPU 与主机的占比", 920, 222, b)


# ---------------------------------------------------------------- 设备分配判定
def fig_affinity(n):
    b = []
    b.append(box(10, 40, 100, 50, "bx", "每个算子", "全局优化阶段"))
    b.append(box(150, 40, 170, 50, "bx", "是 linalg 计算算子？", "实现 LinalgOp 接口"))
    b.append(box(370, 40, 190, 50, "bx", "在白名单且类型受支持？", "canBeVectorized()"))
    b.append(box(610, 40, 170, 50, "bx", "输入输出字节数在阈值内？", "默认 0 – 64 MB"))
    b.append(box(825, 40, 90, 50, "npu", "标给 NPU", "本模型 14 个"))
    for x1, x2 in ((110, 149), (320, 369), (560, 609), (780, 824)):
        b.append(arrow(x1, 65, x2, 65))
    for x in (345, 585, 802):
        b.append(t(x, 58, "是", "s"))
    b.append(box(130, 150, 210, 64, "bx", "不标注", "之后随相邻算子或默认设备（主机）", "例：linalg.softmax、后生成的 transpose"))
    b.append(box(360, 150, 210, 64, "host", "标给主机 —— fallback", "例：全部 126 个 linalg.generic", "和 7 个 linalg.fill"))
    b.append(box(600, 150, 190, 64, "bx", "不标注", "留给相邻算子融合", "本模型未触发"))
    for x in (235, 465, 695):
        b.append(arrow(x, 90, x, 149))
        b.append(t(x + 12, 124, "否", "s"))
    b.append(t(10, 240, "白名单：卷积、池化、矩阵乘类、具名逐元素算子、linalg.reduce、broadcast。linalg.generic 不在其中；transpose 与 pack/unpack 在源码里被注释掉，标着 TODO。", "s", "start"))
    return wrap(n, "CoralNPUAffinityAnnotation pass 的判定流程（据源码整理），以及本模型各分支上的算子数", 920, 250, b)


# ---------------------------------------------------------------- 图 5 运行时
def fig_runtime(n):
    b = []
    b.append('<rect x="150" y="14" width="440" height="216" rx="8" class="grp"/>')
    b.append(t(162, 32, "主机进程 run_vit.py（x86，容器内）", "b", "start"))
    b.append(box(8, 60, 110, 44, "art", "vit.vmfb", "243 KB", mono_sub=True))
    b.append(box(8, 136, 110, 44, "art", "ref_in.npy", "1×32×32×3", mono_sub=True))
    b.append(box(170, 84, 150, 80, "bx", "IREE 虚拟机", "解释调度字节码", "模块 hal + module"))
    b.append(arrow(118, 82, 169, 108))
    b.append(arrow(118, 158, 169, 140))
    b.append(box(370, 52, 200, 50, "host", "HAL 设备 local-sync", "直接调用 x86 库中的函数"))
    b.append(box(370, 146, 200, 50, "npu", "HAL 设备 coralnpu", "驱动：装载 ELF 与缓冲、启动、取回"))
    b.append(path("M 320 112 C 345 112, 345 77, 369 77"))
    b.append(path("M 320 136 C 345 136, 345 171, 369 171"))
    b.append(t(345, 70, "15 次", "s"))
    b.append(t(345, 192, "18 次", "s"))
    b.append(box(640, 120, 270, 102, "npu", "MPACT 指令级仿真器", "执行 11 个 RV32 ELF 中被调用的那个", "runtime/sim 下的动态库"))
    b.append(path("M 570 171 L 639 171"))
    b.append(t(604, 164, "dispatch", "s"))
    b.append(box(640, 28, 130, 50, "bx", "logits", "1×10 f32", mono_sub=True))
    b.append(box(800, 28, 110, 50, "art", "ref_out.npy", "比对"))
    b.append(path("M 590 40 L 639 46"))
    b.append(t(614, 34, "返回值", "s"))
    b.append(arrow(770, 53, 799, 53))
    b.append(t(162, 218, "两个设备在 stream.mlir 中互相声明 unified_memory = true", "s", "start"))
    return wrap(n, "运行时结构。调度在主机上，NPU 只执行分给它的内核；这与 TFLM 路线（整个解释器和模型都在 NPU 上）不同", 920, 240, b)


# ---------------------------------------------------------------- 图 6 指令构成
def fig_instr(n):
    b = []
    data = [("dispatch_5 矩阵乘内核 · 304 条", [9, 117, 1, 177]), ("dispatch_8 softmax 内核 · 255 条", [41, 55, 24, 135])]
    names = ["向量浮点 vf*", "向量其他 v*", "标量浮点 f*", "标量整数与控制"]
    for j, (lab, vals) in enumerate(data):
        y = 26 + j * 58
        b.append(t(10, y - 6, lab, "b", "start"))
        x, tot = 10.0, sum(vals)
        for k, v in enumerate(vals):
            w = v / tot * 900
            b.append(f'<rect x="{x:.1f}" y="{y}" width="{w:.1f}" height="24" class="c{k + 1}"/>')
            if w > 34:
                b.append(f'<text x="{x + w / 2:.1f}" y="{y + 16}" text-anchor="middle" style="fill:#fff;font-weight:600">{v}</text>')
            x += w
    y = 142
    b.append(t(10, y - 6, "整份 dispatch_5 的 .s 文件 · 1,227 条", "b", "start"))
    w1 = 304 / 1227 * 900
    b.append(f'<rect x="10" y="{y}" width="{w1:.1f}" height="24" class="npu"/><rect x="{10 + w1:.1f}" y="{y}" width="{900 - w1:.1f}" height="24" class="host"/>')
    b.append(t(10 + w1 / 2, y + 16, "内核 304"))
    b.append(t(10 + w1 + (900 - w1) / 2, y + 16, "链接进来的运行时辅助函数 923（半精度转换、fma 等）", "s"))
    for k, nm in enumerate(names):
        x = 10 + k * 170
        b.append(f'<rect x="{x}" y="186" width="12" height="12" class="c{k + 1}"/>' + t(x + 18, 196, nm, "s", "start"))
    return wrap(n, "NPU 内核的静态指令构成。矩阵乘内核里标量浮点只有 1 条，浮点乘加由向量指令完成；标量浮点集中在辅助函数里", 920, 206, b)


# ---------------------------------------------------------------- 图 7 logits
def fig_logits(n, ref, out):
    b = []
    axis, sc = 118, 150
    for v in (0.4, 0.2, 0, -0.2, -0.4, -0.6):
        y = axis - v * sc
        b.append(f'<line x1="60" y1="{y:.0f}" x2="910" y2="{y:.0f}" class="ax"/>')
        b.append(t(52, y + 4, f"{v:+.1f}" if v else "0", "s", "end"))
    top = max(range(10), key=lambda i: out[i])
    for i in range(10):
        cx = 105 + i * 85
        for off, val, cls in ((-21, ref[i], "ref"), (1, out[i], "out")):
            h = abs(val) * sc
            y = axis - h if val >= 0 else axis
            b.append(f'<rect x="{cx + off}" y="{y:.1f}" width="20" height="{max(h, 1):.1f}" class="{cls}"/>')
        v = out[i]
        ly = axis - abs(v) * sc - 6 if v >= 0 else axis + abs(v) * sc + 14
        b.append(t(cx, ly, f"{v:+.4f}", "s b" if i == top else "s"))
        b.append(t(cx, 246, f"类别 {i}", "b" if i == top else ""))
        b.append(t(cx, 261, f"{abs(out[i] - ref[i]):.1e}", "s"))
    b.append(t(52, 261, "|差|", "s", "end"))
    b.append('<rect x="700" y="8" width="12" height="12" class="ref"/>' + t(718, 18, "PyTorch 参考", "s", "start"))
    b.append('<rect x="810" y="8" width="12" height="12" class="out"/>' + t(828, 18, "NPU 仿真", "s", "start"))
    return wrap(n, "10 个类别的 logits。两组柱子肉眼无法区分，差异在小数第 6 位；top-1 均为类别 9", 920, 270, b)
