"""Figures for the MLIR walkthrough. Reuses the plain line-art style of tools/record_figs.py."""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from record_figs import DEFS, FIG_CSS, arrow, box, e, path, t, wrap  # noqa: E402,F401


def fig_ladder(n):
    """Two-column dialect ladder: whole-model side on the left, per-kernel codegen on the right."""
    b = []
    left = [("PyTorch 模型", "nn.Module · Python 代码", "fe", "步骤 1"),
            ("FX 图", "aten.* 节点 · torch.export", "fe", "步骤 2"),
            ("Torch 方言", "torch.aten.mm …", "fe", "步骤 3"),
            ("StableHLO 方言", "stablehlo.dot_general …", "art", "步骤 4"),
            ("linalg + tensor + arith + math", "linalg.matmul / generic", "bx", "步骤 5–8"),
            ("flow 方言", "flow.dispatch · flow.executable", "bx", "步骤 9"),
            ("stream 方言", "缓冲、时间点、提交", "bx", "步骤 10"),
            ("hal 方言", "设备、命令缓冲、绑定", "bx", "步骤 11、21"),
            ("vm 方言 → vit.vmfb", "主机上解释执行的字节码", "art", "步骤 21")]
    right = [("配置好的 linalg", "lowering_config 分块参数", "bx", "步骤 12"),
             ("scf 循环 + tensor 切片", "scf.forall / scf.for", "bx", "步骤 13–14"),
             ("vector 方言", "vector.contract 8×8", "bx", "步骤 15"),
             ("memref 方言", "tensor 换成内存缓冲", "bx", "步骤 16"),
             ("vector.fma + 展开的 math", "一次 8 个乘加", "bx", "步骤 17–18"),
             ("llvm 方言", "llvm.intr.fma …", "bx", "步骤 19"),
             ("LLVM IR（.ll）", "@llvm.fma.v8f32", "bx", "步骤 20"),
             ("RISC-V 汇编与 ELF", "vfmadd.vf · vfmadd.vv", "npu", "步骤 20")]
    LX, RX, BW = 80, 540, 340
    lc, rc = LX + BW / 2, RX + BW / 2
    b.append(t(lc, 18, "整个模型：主机侧程序", "b"))
    b.append(t(rc, 18, "单个内核：代码生成（每个 dispatch 各走一遍）", "b"))
    y0, step, h = 30, 52, 40
    for i, (a, s_, cls, tag) in enumerate(left):
        y = y0 + i * step
        b.append(box(LX, y, BW, h, cls, a, s_, mono_sub=True))
        b.append(t(LX - 8, y + 25, tag, "s", "end"))
        if i:
            b.append(arrow(lc, y - step + h + 1, lc, y - 1))
    for i, (a, s_, cls, tag) in enumerate(right):
        y = y0 + i * step
        b.append(box(RX, y, BW, h, cls, a, s_, mono_sub=True))
        b.append(t(RX + BW + 8, y + 25, tag, "s", "start"))
        if i:
            b.append(arrow(rc, y - step + h + 1, rc, y - 1))
    fy = y0 + 5 * step + 20
    b.append(path(f"M {LX + BW} {fy} C {LX + BW + 50} {fy}, {RX - 50} {y0 + 20}, {RX - 1} {y0 + 20}"))
    b.append(t((LX + BW + RX) / 2, fy + 18, "每个 flow.executable", "s"))
    y7b, y8m = y0 + 7 * step + h, y0 + 8 * step + 20
    b.append(path(f"M {rc} {y7b} C {rc} {y8m}, {rc - 120} {y8m}, {LX + BW + 1} {y8m}"))
    b.append(t(rc, y8m + 20, "内核 ELF 被嵌进 vmfb", "s"))
    return wrap(n, "整条链路的方言阶梯。越往下越接近硬件；flow 这一层把模型切成内核，每个内核再单独走右边这条代码生成路线", 960, y0 + 9 * step + 20, b)


def fig_tiling(n):
    """17x64 output tile map + the 8x8 outer-product accumulation."""
    b = []
    X, Y, cw, rh = 60, 40, 7, 11
    W, H = 64 * cw, 17 * rh
    b.append(t(X + W / 2, 22, "输出 C：17 行 × 64 列", "b"))
    for r in range(17):
        for c8 in range(8):
            x = X + c8 * 8 * cw
            y = Y + r * rh
            cls = "npu" if r < 16 else "art"
            b.append(f'<rect x="{x}" y="{y}" width="{8 * cw}" height="{rh}" class="{cls}" style="stroke-width:0.4"/>')
    for r in (8, 16):
        b.append(f'<line x1="{X - 6}" y1="{Y + r * rh}" x2="{X + W + 6}" y2="{Y + r * rh}" style="stroke:var(--fg);stroke-width:{2 if r == 16 else 1.2}"/>')
    for c in range(0, 65, 8):
        b.append(f'<line x1="{X + c * cw}" y1="{Y - 4}" x2="{X + c * cw}" y2="{Y + H + 4}" style="stroke:var(--fg);stroke-width:1"/>')
    b.append(t(X - 8, Y + 8 * rh / 2 + 4 + 0, "行 0–7", "s", "end"))
    b.append(t(X - 8, Y + 12 * rh + 4, "行 8–15", "s", "end"))
    b.append(t(X - 8, Y + 16 * rh + 9, "行 16", "s", "end"))
    b.append(t(X + W + 12, Y + 8 * rh + 4, "工作组 0：行 0–15", "s", "start"))
    b.append(t(X + W + 12, Y + 16 * rh + 9, "工作组 1：只有行 16", "s", "start"))
    b.append(t(X + 4 * cw, Y + H + 18, "8 列", "s"))
    b.append(t(X, Y + H + 36, "粗横线：工作组边界，每 16 行一组。细线：8×8 的向量块。", "s", "start"))
    b.append(t(X, Y + H + 52, "黄色那一行凑不满 8 行，靠掩码只写这 1 行。", "s", "start"))
    ox = 640
    b.append(t(ox + 120, 22, "一个 8×8 块怎么算出来", "b"))
    b.append(box(ox, 44, 60, 110, "fe", "A 列", "8 个数", None))
    b.append(t(ox + 30, 170, "A[行块, k]", "s m"))
    b.append(box(ox + 80, 44, 150, 34, "fe", "B 行 · 8 个数"))
    b.append(t(ox + 155, 92, "B[列块, k]", "s m"))
    b.append(box(ox + 80, 100, 150, 54, "npu", "累加器 8×8", "+= A 列 ⊗ B 行"))
    b.append(t(ox + 120, 190, "对 k = 0 … 31 重复 32 次", "s"))
    b.append(t(ox + 120, 206, "每次 = 8 条 8 路 fma", "s"))
    return wrap(n, "fc1 的输出如何被切块：先按 16 行分给工作组，再切成 8×8 的向量块；每个块由 32 次“列乘行”的外积累加得到", 920, 292, b)


def fig_bindings(n):
    b = []
    rows = [("binding 0 · 输入 x", [("17×32 f32", 2176, "fe")], 2176),
            ("binding 1 · 常量", [("偏置 64", 256, "art"), ("权重 64×32 f32", 8192, "art")], 8448),
            ("binding 2 · 输出 y", [("17×64 f32", 4352, "npu")], 4352)]
    sc = 700 / 8448
    for i, (lab, segs, tot) in enumerate(rows):
        y = 20 + i * 52
        b.append(t(182, y + 20, lab, "", "end"))
        x = 196
        for name, sz, cls in segs:
            w = sz * sc
            b.append(f'<rect x="{x:.1f}" y="{y}" width="{w:.1f}" height="30" rx="3" class="{cls}"/>')
            b.append(t(x + w / 2, y + 19, f"{name} · {sz} B") if w > 120 else t(x + w + 6, y - 5, f"{name} · {sz} B", "s", "start"))
            x += w
        if i == 1:
            b.append(t(196, y + 44, "偏置在偏移 0 处，权重从偏移 256 开始，合计 8448 字节", "s", "start"))
    return wrap(n, "内核看到的三块内存。权重和偏置被打包进同一块常量缓冲，用偏移区分；条宽按字节等比", 920, 180, b)
