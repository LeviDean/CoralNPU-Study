#!/usr/bin/env python3
"""Builds mlir_walkthrough.html: a beginner's step-by-step tour of one real compile.

Every IR excerpt is cut from the real artifacts in ./out at build time, so the page shows exactly
what the compiler produced. The example is a single Linear(32->64) + GELU on a 17x32 input.
"""
import collections
import html
import pathlib
import re
import sys

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE.parent / "tools"))
import walk_figs as G  # noqa: E402
from make_record import CSS  # noqa: E402

O = HERE / "out"
S = O / "steps"
EXE = O / "exe"
OUT = HERE / "mlir_walkthrough.html"


# ------------------------------------------------------------------ helpers
def esc(s):
    return html.escape(str(s), quote=False)


def c(s):
    return f"<code>{esc(s)}</code>"


def step_file(prefix):
    fs = sorted(S.glob(f"{prefix}_*.mlir"))
    assert fs, prefix
    return fs[0]


def lines(path):
    return pathlib.Path(path).read_text().split("\n")


BREAKS = [(" ins(", "ins("), (" outs(", "outs("), (" attrs =  {", "attrs = {"), (" iterator_types = [", "iterator_types = ["),
          (" {lowering_config", "{lowering_config"), (" {stream.affinity", "{stream.affinity")]


def clip(l, w=None):
    """Never drops characters. Long lines are broken at list boundaries; the browser soft-wraps the rest."""
    l = l.rstrip()
    if len(l) <= 110:
        return l
    ind = " " * (len(l) - len(l.lstrip()) + 4)
    out = l
    for pat, rep in BREAKS:
        if pat == " {stream.affinity":
            out = re.sub(r"(?<!attrs =) \{stream\.affinity", "\n" + ind + "{stream.affinity", out)
        else:
            out = out.replace(pat, "\n" + ind + rep)
    assert "".join(out.split()) == "".join(l.split())
    return out


def dedent(ls):
    ind = min((len(l) - len(l.lstrip()) for l in ls if l.strip()), default=0)
    return [l[ind:] for l in ls]


def cut(path, start, end=None, count=None, drop=(), width=150, occ=0, before=0, include_end=True):
    """Lines from the occ-th match of `start` up to the first following match of `end` (or `count` lines)."""
    ls = lines(path)
    idx = [i for i, l in enumerate(ls) if re.search(start, l)]
    assert len(idx) > occ, (path, start)
    i = max(0, idx[occ] - before)
    if end is not None:
        j = next(k for k in range(idx[occ] + 1, len(ls)) if re.search(end, ls[k]))
        seg = ls[i: j + 1 if include_end else j]
    else:
        seg = ls[i: i + count]
    seg = [l for l in seg if not any(re.search(d, l) for d in drop)]
    return "\n".join(clip(l, width) for l in dedent(seg))


def pick(path, pats, width=150):
    out = []
    for l in lines(path):
        if any(re.search(p, l) for p in pats):
            out.append(clip(l.strip(), width))
    return "\n".join(out)


def pre(text, cap=None):
    cp = f'<div class="cap">{esc(cap)}</div>' if cap else ""
    return f'<figure class="code">{cp}<pre>{esc(text)}</pre></figure>'


def table(head, rows):
    h = "".join(f"<th>{x}</th>" for x in head)
    b = "".join("<tr>" + "".join(f"<td>{x}</td>" for x in r) + "</tr>" for r in rows)
    return f'<div class="tw"><table><thead><tr>{h}</tr></thead><tbody>{b}</tbody></table></div>'


def count(path, pat):
    return len(re.findall(pat, pathlib.Path(path).read_text()))


def strip_resources(text):
    i = text.find("{-#")
    return (text[:i].rstrip() + "\n\n{-#  dialect_resources: { … 权重的十六进制数据，此处省略 … }  #-}") if i >= 0 else text


def layout_generic(path, start, end):
    """Full (untruncated) linalg.generic excerpt with line breaks inserted at list boundaries.

    Only whitespace is changed; an assert checks that the non-whitespace characters are identical.
    """
    raw = cut(path, start, end, width=10**6)
    head, rest = raw.split("\n", 1)
    h = head
    h = h.replace("{indexing_maps = [affine_map", "{indexing_maps = [\n      affine_map")
    h = h.replace(">, affine_map<", ">,\n      affine_map<")
    h = h.replace(">], iterator_types", ">],\n    iterator_types")
    h = h.replace("} ins(", "}\n  ins(")
    h = h.replace(") outs(", ")\n  outs(")
    h = h.replace(") attrs =  {", ")\n  attrs = {")
    out = h + "\n" + rest
    assert "".join(out.split()) == "".join(raw.split()), "layout changed non-whitespace content"
    return out


def box(kind, title, body):
    return f'<div class="nb {kind}"><div class="nbt">{esc(title)}</div>{body}</div>'


def look(*items):
    return box("look", "看点", "<ul>" + "".join(f"<li>{i}</li>" for i in items) + "</ul>")


def try_it(cmd):
    return box("try", "自己动手看这一步", f"<pre>{esc(cmd)}</pre>")


EXTRA_CSS = """
pre{white-space:pre-wrap;overflow-wrap:anywhere}
.nb{border:1px solid var(--line);border-left-width:4px;border-radius:6px;padding:8px 14px;margin:12px 0;font-size:14px;background:var(--code)}
.nb .nbt{font-weight:600;font-size:13px;margin-bottom:4px}
.nb.look{border-left-color:var(--acc)} .nb.try{border-left-color:var(--ok)} .nb.warn{border-left-color:var(--warn)}
.nb pre{margin:4px 0;background:transparent;border:none;padding:0}
.nb ul{margin:2px 0}
.step-meta{font-size:13px;color:var(--mut);margin:-4px 0 8px}
.step-meta code{font-size:12px}
dl.gl dt{font-weight:600;margin-top:8px} dl.gl dd{margin:2px 0 6px 18px}
"""


def step(num, title, goal, passes, inp, outp):
    return (f'<h3 id="st{num}">步骤 {num} · {esc(title)}</h3>'
            f'<div class="step-meta">输入：{inp} &nbsp;→&nbsp; 输出：{outp} &nbsp;·&nbsp; 负责的 pass：{passes}</div>'
            f"<p>{goal}</p>")


# ------------------------------------------------------------------ measured facts
F_STABLE = step_file("0023")
F_AFF = step_file("0048")
F_TRANS = step_file("0072")
F_HOIST = step_file("0090")
F_JIT = step_file("0501")
F_FUSE = step_file("0520")
F_REGION = step_file("0545")
F_CLONE = step_file("0548")
F_OUTLINE = step_file("0574")
F_STREAM = step_file("0726")
F_IFACE = step_file("0877")
F_TS_REG, F_TS_DTCM, F_TS_WG = step_file("0879"), step_file("0880"), step_file("0881")
F_WG = step_file("0901")
F_TILED = step_file("0930")
F_VEC = step_file("0933")
F_BUF = step_file("0940")
F_VLOW = step_file("0950")
F_PREMATH = step_file("0976")
F_MATH = step_file("0978")
F_LOOPS = step_file("0969")
F_CF = step_file("0985")
F_LLVM = step_file("0997")
F_LL = EXE / "module_main_dispatch_0_embedded_elf_riscv_32.optimized.ll"
F_S = EXE / "module_main_dispatch_0_embedded_elf_riscv_32.s"
F_VM = O / "vm.mlir"

N_PASS_TOTAL = 1334          # from --mlir-print-ir-after-all: number of "IR Dump After" headers
N_PASS_CHANGED = len(list(S.glob("*.mlir")))
RUN = {"diff": "2.38e-07", "vmfb": (O / "model.vmfb").stat().st_size}


def linalg_ops(path):
    return count(path, r"= linalg\.")


def asm_stats():
    ls = lines(F_S)
    s = next(i for i, l in enumerate(ls) if l.startswith("main_dispatch_0_matmul"))
    e = next(i for i in range(s + 1, len(ls)) if re.match(r"^[A-Za-z_][\w.]*:", ls[i]))
    ins = [l.split()[0] for l in ls[s:e] if re.match(r"^\s+[a-z]", l) and not l.strip().startswith(".")]
    m = collections.Counter(ins)
    total_file = len([l for l in ls if re.match(r"^\s+[a-z]", l) and not l.strip().startswith(".")])
    k = next(j for j in range(s, e) if "vfmadd.vv" in ls[j])
    snippet = "\n".join(l.replace("\t", "  ", 1).replace("\t", " ") for l in ls[k - 10:k + 3] if ".loc" not in l and l.strip())
    return dict(n=len(ins), total=total_file, vv=m["vfmadd.vv"], vf=m["vfmadd.vf"], vec=sum(v for kk, v in m.items() if kk.startswith("v")),
                sf=sum(v for kk, v in m.items() if kk.startswith("f")), vl2r=m["vl2r.v"], vs2r=m["vs2r.v"], csrr=m["csrr"], snip=snippet)


def cfg_of(path):
    m = re.search(r"lowering_config = #iree_cpu\.lowering_config<([^>]*)>", path.read_text())
    return m.group(1)


# ------------------------------------------------------------------ page
def build():
    A = []
    P = A.append
    a = asm_stats()

    P("<h1>MLIR 是怎么把一个模型一步步变成 NPU 指令的</h1>")
    P('<div class="meta">一个完整的真实例子 · PyTorch → torch-mlir → StableHLO → coralnpu-compile（IREE）→ Coral NPU（MPACT 仿真）· 生成于 2026-09-23</div>')
    P("<p>这份文档跟着一个很小的模型，把它从 PyTorch 代码一路编译成 Coral NPU 上的机器指令，并在仿真器上跑出结果。每一步都会告诉你：这一步要解决什么问题、是哪个 pass 做的、IR 在这一步前后长什么样、你应该从中看出什么。</p>")
    P("<p>文中所有 IR 片段都是编译器的真实输出，由生成脚本从产物文件里原样截取，只做了三种处理：省略一部分行（会注明省略了什么）、去掉公共缩进、超长的行在 ins、outs、attrs 等边界处换行，其余由浏览器自动折行。字符一个不删，每段代码在生成时都校验过。不需要任何编译器背景，第 1 节会从“怎么读一行 MLIR”讲起。</p>")

    toc = ["例子与结果", "先学会读 MLIR", "pass 与 lowering 是什么", "逐步走一遍", "回顾：一张表看完全程", "自己动手", "术语表"]
    P("<nav>" + "".join(f'<a href="#s{i}">{i}. {t}</a>' for i, t in enumerate(toc)) + "</nav>")

    # 0 ------------------------------------------------------------
    P('<h2 id="s0">0. 例子与结果</h2>')
    P("<p>例子是 toy ViT 里的 fc1：一个全连接层接一个 gelu 激活。输入 17×32，输出 17×64。之所以选它，是因为它足够小，每一层 IR 都能完整贴出来；又足够真实，矩阵乘、逐元素运算、融合、分块、向量化这些关键环节它都会经过。</p>")
    P(pre((HERE / "lin_gelu.py").read_text().strip(), "lin_gelu.py · 模型的全部代码"))
    P(table(["项目", "结果"], [
        ["编译出的内核", "1 个（" + c("main_dispatch_0_matmul_17x64x32_f32") + "），整个模型都在 NPU 上执行"],
        ["NPU 仿真输出 vs PyTorch", f"1,088 个输出值的最大绝对误差 {RUN['diff']}，判定通过"],
        ["编译器运行的 pass", f"共 {N_PASS_TOTAL:,} 次执行，其中 {N_PASS_CHANGED} 次真正改动了 IR"],
        ["最终产物 " + c("model.vmfb"), f"{RUN['vmfb']:,} 字节，内含一个 RISC-V ELF 和主机侧调度程序"],
    ]))

    # 1 ------------------------------------------------------------
    P('<h2 id="s1">1. 先学会读 MLIR</h2>')
    P("<p>IR 是 intermediate representation，中间表示。编译器不直接把 Python 变成机器码，而是先把程序写成一种它方便分析和改写的文本格式，改写很多遍，最后再输出机器码。MLIR 就是这样一种格式，它的特点是可以同时容纳许多不同抽象层次的“方言”。</p>")
    P("<h3>1.1 一行 MLIR 的结构</h3>")
    P("<p>下面是从第 3 步产物里摘的一行真实代码，意思是“矩阵乘”：</p>")
    P(pre(pick(O / "2_torch.mlir", [r"%4 = torch.aten.mm"], 200)))
    P(table(["片段", "叫什么", "含义"], [
        [c("%4"), "SSA 值", "这一行算出来的结果。每个 %名字 只被赋值一次，之后只读不写，所以编译器看一眼就知道数据从哪来、到哪去。名字本身只是编号，没有含义"],
        [c("="), "", "左边是结果，右边是运算"],
        [c("torch.aten.mm"), "操作名（op）", "点号前是方言名 torch，点号后是这个方言里的操作 aten.mm。所有操作都是“方言.操作”的形式"],
        [c("%arg0, %3"), "操作数", "输入。%arg0 是函数参数，%3 是前面某一行的结果"],
        [c(": … -> …"), "类型", "冒号后是输入的类型，箭头后是输出的类型。" + c("!torch.vtensor<[17,32],f32>") + " 表示 17×32 的 32 位浮点张量"],
    ]))
    P("<p>类型写在每一行里，是 MLIR 的一个重要习惯：编译器在任何一步都能立刻知道每个值的形状和数据类型，不需要回头去推。</p>")
    P("<h3>1.2 带“身体”的操作：region 与 block</h3>")
    P("<p>有些操作内部还包着一段代码。最常见的是后面会反复出现的 " + c("linalg.generic") + "，下面是第 8 步里的真实片段：</p>")
    P(pre(layout_generic(F_FUSE, r"%5 = linalg.generic", r"\} -> tensor<17x64xf32>"), "步骤 8 的产物，gelu 融合后的样子。原文第一行很长，这里只加了换行和缩进，字符没有改动"))
    P(table(["片段", "含义"], [
        [c("indexing_maps = [...]"), "每个输入输出张量怎么随循环变量取元素。下一小节细讲"],
        [c('iterator_types = ["parallel", "parallel"]'), "有两层循环，两层都是 parallel，也就是各个元素之间互不依赖，可以任意顺序甚至同时计算"],
        [c("ins(%4, %__hoisted_tensor_64xf32 …)"), "两个输入：矩阵乘的结果、提前算好的偏置"],
        [c("outs(%2 …)"), "一个输出：结果写进哪个张量"],
        [c("{ ^bb0(%in, %in_6, %out): … }"), "花括号里是一个 region，region 里是 block，" + c("^bb0") + " 是 block 的名字。block 的参数代表“当前这一个元素”"],
        [c("linalg.yield %16"), "把这一个元素的计算结果交出去，写进输出的对应位置"],
    ]))
    P("<p><b>block 的参数怎么和输入对上？按位置。</b>规则是：block 的参数先依次对应 " + c("ins") + " 里的每个操作数，再依次对应 " + c("outs") + " 里的；" + c("indexing_maps") + " 里的 map 也按同样的顺序排。三组列表竖着对齐读：</p>")
    P(table(["位置", "操作数", "它是什么", "indexing_map", "block 参数"], [
        ["第 1 个", c("%4") + "（ins）", "矩阵乘的结果，17×64", c("(d0, d1) -> (d0, d1)"), c("%in")],
        ["第 2 个", c("%__hoisted_tensor_64xf32") + "（ins）", "提前算好的偏置，64 个数", c("(d0, d1) -> (d1)"), c("%in_6")],
        ["第 3 个", c("%2") + "（outs）", "输出张量，17×64", c("(d0, d1) -> (d0, d1)"), c("%out")],
    ]))
    P("<p>循环走到第 d0 行、第 d1 列时：" + c("%in") + " 是 " + c("%4[d0][d1]") + "；" + c("%in_6") + " 是偏置的第 d1 个，因为它的 map 只保留了 d1，同一列的 17 行都拿到同一个偏置，这就是广播；" + c("%out") + " 对应输出的 " + c("[d0][d1]") + "，" + c("linalg.yield") + " 把结果写到这里。所以 body 第一行 " + c("arith.addf %in, %in_6") + " 就是“这一格的矩阵乘结果加上这一列的偏置”。</p>")
    P("<p><b>d0、d1 是什么？</b>是 " + c("linalg.generic") + " 自带的隐形循环的下标，d 是 dimension 的意思。循环有几层，看 " + c("iterator_types") + " 有几项，这里两项，所以是 d0、d1；矩阵乘有三项，就多一个 d2。每层走多少次，代码里没写，是编译器从 indexing_map 和张量形状反推的：输出的 map 是 " + c("(d0, d1) -> (d0, d1)") + "、形状是 17×64，所以 d0 取 0–16（行号），d1 取 0–63（列号）；偏置的 map " + c("(d0, d1) -> (d1)") + " 配上长度 64，也和 d1 的范围吻合。写成普通代码就是：</p>")
    P(pre("for d0 in range(17):          # 第 1 个 iterator：行\n    for d1 in range(64):      # 第 2 个 iterator：列\n        in_  = mm[d0][d1]     # 第 1 个 map (d0, d1) -> (d0, d1)\n        in_6 = bias[d1]       # 第 2 个 map (d0, d1) -> (d1)\n        out[d0][d1] = body(in_, in_6)   # 第 3 个 map；yield 的值写到这里", "等价的 Python 写法（示意）"))
    P("<p>之所以不直接写 for，是因为两层都标了 parallel，各位置互不依赖，循环不写死，编译器才能自由地重新安排。第 13、14 步里，同样这两个维度被切成了“每 16 行、每 8 行、每 8 列”的多层真实循环，那时才出现显式的 " + c("scf.forall") + " 和 " + c("scf.for") + "，它们的循环变量对应的就是这里的 d0 和 d1。</p>")
    P("<p><b>" + c("%out") + " 是 " + c("%2") + " 吗？</b>" + c("%2") + " 是整个输出张量，" + c("%out") + " 是其中“当前这一格”的那个元素，类型是 f32。再往上看 " + c("%2") + " 的来历：</p>")
    P(pre(pick(F_FUSE, [r"%2 = tensor.empty", r"%3 = linalg.fill", r"%4 = linalg.matmul", r"%5 = linalg.generic"]), "steps/0520 · 同一个函数里的四行"))
    P("<p>" + c("%2") + " 是 " + c("tensor.empty()") + "，只声明“要一块 17×64 的张量”，里面没有有意义的值；gelu 的 body 也从头到尾没有读 " + c("%out") + "。这里 outs 的作用只是告诉编译器结果的形状和去处，这种写法叫 destination-passing style。结果也不是把 " + c("%2") + " 改掉了，而是产生一个新值 " + c("%5") + "：在 tensor 这一层，值是不可变的。要到第 16 步缓冲化之后，这个“去处”才变成一块会被原地写入的真实内存。</p>")
    P("<p>对比同一段里的 " + c("linalg.matmul") + "：它的 outs 是 " + c("%3") + "，也就是先用 " + c("linalg.fill") + " 把 " + c("%2") + " 填成 0 的结果。矩阵乘是累加，每一步都在做 out = out + a × b，要读 out 的当前值，所以必须先清零。同样是 outs，在逐元素运算里只是“去处”，在累加运算里还是“初值”。</p>")
    P("<p>名字本身没有含义。" + c("%in") + "、" + c("%in_6") + "、" + c("%out") + " 是打印 IR 时自动起的：来自 ins 的叫 in，来自 outs 的叫 out，重名时加一个编号后缀去重，" + c("_6") + " 只是去重用的编号，和“第几个”无关。把它们改名成 %a、%b、%c，意思完全不变，决定对应关系的只有位置。</p>")
    P("<p>所以这段代码的意思是：对 17×64 的每个位置，取矩阵乘结果和偏置，做 body 里那 9 步标量运算，把结果写到输出的同一位置。整个 gelu 就是这 9 步：加偏置、立方、乘 0.044715、相加、乘 0.7979、tanh、加 1、乘 0.5x 的另一半、相乘。</p>")
    P("<h3>1.3 affine_map：循环变量到数组下标的映射</h3>")
    P("<p>看第 7 步里矩阵乘的写法：</p>")
    P(pre(pick(F_TRANS, [r"%4 = linalg.matmul"], 250)))
    P("<p>" + c("affine_map<(d0, d1, d2) -> (d0, d2)>") + " 可以读成一个小函数：给定三层循环的下标 d0、d1、d2，返回该取数组的哪个位置。三个 map 分别对应两个输入和一个输出：</p>")
    P(table(["map", "对应", "读法"], [
        [c("(d0, d1, d2) -> (d0, d2)"), "输入 x，17×32", "x[i][k]，i 是行，k 是被求和的那一维"],
        [c("(d0, d1, d2) -> (d1, d2)"), "输入权重，64×32", "W[j][k]。注意是 W 本身而不是它的转置"],
        [c("(d0, d1, d2) -> (d0, d1)"), "输出，17×64", "y[i][j]"],
    ]))
    P("<p>合起来就是 y[i][j] += x[i][k] × W[j][k]，正是 x 乘以 W 的转置。编译器后面所有的分块、向量化，都是在改写这三层循环。</p>")
    P("<h3>1.4 其他会见到的结构</h3>")
    P("<ul><li><b>module</b>：最外层的容器，一个文件就是一个 module。</li><li><b>func.func / util.func</b>：函数。" + c("util.func") + " 是 IREE 自己的函数写法，功能相同。</li><li><b>attribute</b>：花括号里的 " + c("{stream.affinity = …}") + " 这类键值对，是贴在操作上的附加信息，不参与计算，但会影响编译器怎么处理它。</li><li><b>#map = …</b>：文件开头的别名定义，后面用 " + c("#map") + " 代替很长的 affine_map，纯粹为了少写字。</li></ul>")

    # 2 ------------------------------------------------------------
    P('<h2 id="s2">2. pass 与 lowering 是什么</h2>')
    P("<p><b>方言</b>是一组操作的集合，每个方言工作在一个抽象层次上。" + c("torch") + " 方言说的是 PyTorch 的语言，" + c("linalg") + " 说的是循环和张量，" + c("vector") + " 说的是向量寄存器，" + c("llvm") + " 已经接近机器指令。</p>")
    P("<p><b>pass</b> 是编译器里的一道工序：读入一份 IR，做一件具体的改动，交出一份仍然合法的 IR。下面是一个真实的例子，" + c("iree-global-opt-propagate-linalg-transpose") + " 这个 pass 执行前后，矩阵乘那一行的变化：</p>")
    P(pre("执行前：\n" + pick(F_AFF, [r"linalg.matmul"], 200) + "\n\n执行后：\n" + pick(F_TRANS, [r"linalg.matmul"], 200)))
    P("<p>执行前，矩阵乘读的是一个已经转置好的 32×64 权重，这个转置需要单独算一遍。执行后，矩阵乘直接读原始的 64×32 权重，把“转置”写进了 indexing_maps 里的 " + c("(d1, d2)") + "。转置这个操作就此消失，这就是一个 pass 做的全部事情。</p>")
    P("<p><b>lowering</b>，降级，就是一长串这样的 pass 依次执行，每道只把 IR 往下推一小步，最终从 PyTorch 的语义一路推到机器指令。整体路线见图 1。</p>")
    P(G.fig_ladder(1))
    P("<p>pass 大致分三类：</p><ul>"
      "<li><b>转换类</b>：把一种方言换成另一种，例如 StableHLO 换成 linalg、linalg 换成 vector。这是字面意义上的降级。</li>"
      "<li><b>变换类</b>：方言不变，只改结构，例如融合、分块、缓冲化。</li>"
      "<li><b>分析与标注类</b>：不改计算，只贴属性，例如决定每个运算放在哪个设备。</li></ul>")
    P("<p>另有两个清理工几乎夹在每道工序之间：" + c("canonicalize") + " 负责化简，比如把乘 1 去掉；" + c("cse") + " 负责合并重复的计算。一次编译里它们会被调用几百次。</p>")
    P("<p>pass 还有一个“作用对象”：有的作用于整个 module，有的只作用于一个函数，有的只作用于一个内核。编译器的 pass 管理器按层级把它们套起来运行，所以代码生成阶段的 pass 会对每个内核各跑一遍。</p>")

    # 3 ------------------------------------------------------------
    P('<h2 id="s3">3. 逐步走一遍</h2>')
    P("<p>下面 22 步按执行顺序排列。步骤 1–4 在 torch-mlir 里完成，步骤 5–21 是 " + c("coralnpu-compile") + " 一条命令的内部过程，步骤 22 是运行。每一步标题下的灰色小字给出输入、输出与负责的 pass。</p>")

    # --- front end
    P('<h4>第一部分 · 前端：从 PyTorch 到 StableHLO</h4>')
    P(step(1, "PyTorch 模型", "起点就是第 0 节那段 Python 代码。PyTorch 执行时是“边跑边算”的：每行 Python 立刻调用一个算子。这对训练很方便，但编译器拿不到“整个程序长什么样”，没法做全局优化，所以第一件事是把它变成一张静态的图。", "—", "Python 代码", "nn.Module"))
    P(step(2, "torch.export：把 Python 变成计算图", "用一个示例输入把 forward 跑一遍，记录下每次调用了哪个底层算子，得到 FX 图。这一步之后，Python 的 if、for、类、方法调用都消失了，只剩一串算子调用。", c("torch.export.export()"), "nn.Module + 示例输入", "FX 图（ExportedProgram）"))
    P(pre((O / "1_fx_graph.txt").read_text().strip(), "out/1_fx_graph.txt · 完整内容"))
    P(look("self.fc(x) 变成了一个 " + c("aten.linear") + " 节点，权重和偏置变成了函数参数 " + c("p_fc_weight") + "、" + c("p_fc_bias") + "。",
           "gelu 公式被逐项拆开，每个 + − × 都是一个节点，常数 " + c("0.7978845608028654") + " 就是 √(2/π)。",
           "每个节点末尾的 " + c("x = … = None") + " 是在释放不再用的变量，可以忽略。"))

    P(step(3, "导入为 Torch 方言", "torch-mlir 把 FX 图逐个节点翻译成 MLIR。这是第一次出现 MLIR 格式，操作名、类型都还是 PyTorch 的样子。", c('fx.export_and_import(…, output_type="torch")'), "FX 图", "Torch 方言 MLIR"))
    P(pre(strip_resources((O / "2_torch.mlir").read_text()), "out/2_torch.mlir · 完整内容，仅省略末尾的权重数据"))
    P(look(c("aten.linear") + " 被拆成三件事：" + c("aten.permute") + " 转置权重、" + c("aten.mm") + " 矩阵乘、" + c("aten.add.Tensor") + " 加偏置。",
           "两处 " + c("aten.mul.Scalar … %int1") + " 是乘 1。这是分解 linear 时留下的系数，本身没有意义，后面会被消掉或提前算好。",
           "权重不再是参数，而是 " + c("torch.vtensor.literal(dense_resource<…>)") + "：常量本体放在文件末尾的 dialect_resources 里，正文只放一个引用名，这样正文不会被几千个数字淹没。"))

    P(step(4, "降级为 StableHLO", "StableHLO 是一个与框架无关的“交接格式”，JAX、TensorFlow、PyTorch 都能导出它。Coral NPU 的编译器只认 StableHLO 和 TOSA 两种输入，所以必须降到这里。", c('fx.export_and_import(…, output_type="stablehlo")'), "Torch 方言", "StableHLO MLIR"))
    P(pre(strip_resources((O / "3_stablehlo.mlir").read_text()), "out/3_stablehlo.mlir · 完整内容"))
    P(look("类型从 " + c("!torch.vtensor<[17,32],f32>") + " 变成标准的 " + c("tensor<17x32xf32>") + "。从这一行开始，已经看不出模型来自 PyTorch。",
           c("aten.permute") + " → " + c("stablehlo.transpose") + "，" + c("aten.mm") + " → " + c("stablehlo.dot_general") + "，" + c("contracting_dims = [1] x [0]") + " 说明对第一个输入的第 1 维和第二个输入的第 0 维求和。",
           "为什么多出一大堆 " + c("convert / reshape / broadcast_in_dim") + "？因为 PyTorch 里的标量常数，比如 0.5，在这里被表示成 1 个元素的 64 位浮点张量，要先转成 32 位、去掉维度、再广播成 17×64，才能和张量逐元素相乘。这些看起来很啰嗦，但后面的 pass 会把它们全部化简掉。"))

    # --- input & global opt
    P('<h4>第二部分 · 编译器前段：整理与优化整个模型</h4>')
    n23 = linalg_ops(F_STABLE)
    P(step(5, "输入转换：StableHLO → linalg", "编译器的第一件事是把 StableHLO 换成它内部通用的表示：linalg 描述计算的循环结构，tensor 负责张量的分配和变形，arith 与 math 负责标量运算。之后所有优化都在这套表示上进行。", c("iree-stablehlo-to-iree-input"), "StableHLO", "linalg + tensor + arith + math"))
    P(pre(cut(F_STABLE, r"%0 = tensor.empty\(\) : tensor<32x64xf32>", r"%10 = linalg.generic", width=175, drop=()) + "\n  …", "steps/0023 · 从权重转置到第一个乘 1"))
    P(look(f"整个模型现在是 {n23} 个 linalg 操作。每个 StableHLO 操作都变成了“先 " + c("tensor.empty") + " 分配一块输出，再用一个 linalg 操作填它”的固定套路。",
           c("stablehlo.transpose") + " 变成了一个 " + c("linalg.generic") + "，它的 body 只有 " + c("linalg.yield %in") + "：原样搬运，搬运的方式由 indexing_maps 里的 " + c("(d1, d0)") + " 决定，这就是转置。",
           c("dot_general") + " 变成了 " + c("linalg.fill") + " 清零加 " + c("linalg.matmul") + "。矩阵乘是累加运算，输出必须先清零。",
           "每个 " + c("stablehlo.multiply") + " 都变成一个 body 里只有一条 " + c("arith.mulf") + " 的 generic。“对每个元素做一次乘法”这件事，被拆成了“循环结构”和“单个元素上的运算”两部分。"))
    P(try_it("coralnpu-compile <目标参数> --compile-to=input model.mlir -o input.mlir"))

    P(step(6, "确定设备与函数接口，并分配设备", "编译器要知道有哪些设备、函数怎么被外部调用、每个运算放在哪个设备上。这一步由几个 pass 组成：把入口函数包装成接收 " + c("!hal.buffer_view") + " 的形式，从命令行参数生成两个设备，再由 Coral NPU 自己的 pass 给每个 linalg 操作贴上设备标签。", c("iree-abi-wrap-entry-points") + "、" + c("iree-hal-materialize-target-devices") + "、" + c("coralnpu-affinity-annotation"), "linalg", "带设备标签的 linalg"))
    P(pre(pick(F_AFF, [r"util.global private @__device_", r"^#device_target", r"util.func public @main\("], 175), "steps/0048 · 设备定义与入口函数"))
    P(pre(pick(F_AFF, [r"%4 = linalg.fill", r"%5 = linalg.matmul", r"%9 = linalg.generic"], 200), "steps/0048 · 三个操作被贴上的设备标签"))
    P(look(c("@__device_0") + " 是主机（local，x86），" + c("@__device_1") + " 是 NPU（coralnpu，embedded-elf-riscv_32）。",
           "矩阵乘标给了 " + c("@__device_1") + "，清零和逐元素运算标给了 " + c("@__device_0") + "。原因是 NPU 的规则是一张白名单：矩阵乘在里面，" + c("linalg.generic") + " 和 " + c("linalg.fill") + " 不在里面。",
           "但这只是初步标签。到第 9 步你会看到，逐元素运算最终会跟着矩阵乘一起去 NPU。",
           "入口函数现在接收 " + c("!hal.buffer_view") + "，也就是运行时传进来的一块带形状信息的内存。外部调用者不认识 MLIR 的 tensor 类型，这里是 MLIR 世界和外部世界的接口。"))

    P(step(7, "全局优化：吸收转置、提前算好常量", "在切分内核之前，编译器对整个模型做一些不改变结果、但能减少工作量的改写。这个例子里发生了两件事。", c("iree-global-opt-propagate-linalg-transpose") + "、" + c("iree-util-hoist-into-globals") + "、" + c("iree-consteval-jit-globals"), "带设备标签的 linalg", "更少的 linalg + 预先算好的全局常量"))
    P("<p><b>第一件：转置被吸收进矩阵乘。</b>这就是第 2 节那个例子，执行后单独的转置操作消失了。</p>")
    P("<p><b>第二件：常量折叠。</b>偏置乘 1 这件事，输入和输出都是常量，没必要每次推理都算。" + c("iree-util-hoist-into-globals") + " 把它挪进一个只在初始化时运行的函数，结果存进全局变量：</p>")
    P(pre(cut(F_HOIST, r"util.global private @__hoisted_tensor_64xf32", r"util.return", width=175), "steps/0090 · 被提出来的常量计算"))
    P("<p>然后 " + c("iree-consteval-jit-globals") + " 做了一件有意思的事：它把这个初始化函数单独编译成一个小程序，在编译期当场运行，把算出的 64 个数直接写回全局变量：</p>")
    P(pre(pick(F_JIT, [r"util.global private @__hoisted_tensor_64xf32"], 200), "steps/0501 · 执行后，全局变量有了值（数据被打印工具省略为 __elided__）"))
    P(look(f"操作数从第 5 步的 {n23} 个降到 {linalg_ops(F_TRANS)} 个。",
           "编译器在编译期间又调用了一次完整的编译流程，只为算出这 64 个数。一次编译里 pass 的执行次数中，有一部分就属于这次嵌套编译。",
           "初始化函数 " + c("util.initializer") + " 在模型加载时运行一次，之后每次推理都直接读全局变量。"))

    P(step(8, "融合：把一串逐元素运算合成一个", "现在从矩阵乘到输出之间还有二十多个逐元素的 generic，每个都要完整地读一遍 17×64 的张量、写一遍 17×64 的张量。融合把它们合并成一个 generic，body 里依次做完所有标量运算，中间结果不再落到内存里。", c("iree-dispatch-creation-elementwise-op-fusion"), f"{linalg_ops(F_TRANS)} 个 linalg 操作", f"{linalg_ops(F_FUSE)} 个 linalg 操作"))
    P(pre(cut(F_FUSE, r"%0 = hal.tensor.import", r"util.return", width=175), "steps/0520 · 融合后的整个 main 函数（省略了常数定义）"))
    P(look(f"只剩 {linalg_ops(F_FUSE)} 个 linalg 操作：清零、矩阵乘、一个融合后的 generic。",
           "generic 的第二个输入是 " + c("%__hoisted_tensor_64xf32") + "，就是第 7 步算好的偏置。它的 indexing_map 是 " + c("(d0, d1) -> (d1)") + "：只看列号，同一列的每一行都用同一个偏置，这就是“广播”。",
           "第 4 步那些 convert、reshape、broadcast 全部消失了，乘 1 也被化简掉了：body 第一行直接是 " + c("arith.addf") + "，矩阵乘结果加偏置。",
           c("hal.tensor.import") + " 和 " + c("hal.tensor.export") + " 分别把外部传入的 buffer_view 转成 tensor、再把结果转回去。"))

    # --- dispatch
    P('<h4>第三部分 · 切分内核与调度</h4>')
    P(step(9, "形成 dispatch：决定哪些运算打包成一个内核", "内核就是一段可以被独立下发到某个设备执行的代码。编译器先用 " + c("flow.dispatch.region") + " 圈出哪些操作属于同一个内核，再把圈出来的部分剪成独立的函数。", c("iree-dispatch-creation-form-dispatch-regions") + "、" + c("clone-producers-into-dispatch-regions") + "、" + c("iree-flow-outline-dispatch-regions"), "融合后的 linalg", "flow.executable + flow.dispatch 调用"))
    P(pre(cut(F_REGION, r"%3 = linalg.fill", r"flow.return", width=175), "steps/0545 · 圈出的区域"))
    P("<p>接着清零操作被复制进区域里，再把整个区域剪出去，成为一个独立的 " + c("flow.executable") + "。主函数里只剩一次调用：</p>")
    P(pre(cut(F_OUTLINE, r"flow.executable private @main_dispatch_0", r"^\s+return$", width=165), "steps/0574 · 剪出来的内核"))
    P(pre(cut(F_OUTLINE, r"util.func public @main\(", r"util.return", width=200), "steps/0574 · 主函数只剩一次 flow.dispatch"))
    P(look("整个区域被标为 " + c("@__device_1") + "，也就是 NPU。区域里的 generic 自己的标签是主机，但它被融合进了矩阵乘的区域，于是跟着一起上了 NPU。设备的最终归属由标签、融合、相邻关系共同决定。",
           "内核的参数类型变成了 " + c("!iree_tensor_ext.dispatch.tensor<readonly:…>") + " 和 " + c("<writeonly:…>") + "。内核只能通过这四个参数读写外部数据，读写方向是明确声明的。",
           "内核里第一件事是 " + c("dispatch.tensor.load") + " 把参数读成普通 tensor，最后一件事是 " + c("dispatch.tensor.store") + " 写回。中间就是第 8 步那三个操作。",
           "如果模型更大，这里会出现很多个 flow.executable。toy ViT 就有 23 个。"))

    P(step(10, "stream：安排内存和执行顺序", "tensor 是抽象的“值”，没有说它放在哪块内存、什么时候算。stream 这一层把它们落实成带大小的内存资源，并安排异步执行的先后顺序。", c("iree-stream-conversion") + " 及其后一系列 " + c("iree-stream-*") + " pass", "flow", "stream"))
    P(pre(cut(F_STREAM, r"%0 = stream.tensor.import", r"util.return", width=175), "steps/0726 · 调度完成后的主函数"))
    P(look("内存大小都已经算好：输入 2176 = 17×32×4 字节，权重 8192 = 64×32×4，偏置 256 = 64×4，输出 4352 = 17×64×4。",
           "资源分两种：" + c("resource<external>") + " 是外部传进来或要交出去的输入输出，" + c("resource<constant>") + " 是常量。",
           c("stream.cmd.execute on(@__device_1)") + " 表示在 NPU 上执行一批命令，这里只有一条 " + c("stream.cmd.dispatch") + "。每个缓冲前的 " + c("ro") + " 和 " + c("wo") + " 是只读和只写。",
           c("timepoint") + " 是时间点，代表“某件异步的事完成了”。" + c("await") + " 就是等它完成。执行是异步的，主机下发命令后不会停下来等，除非明确要求。"))

    P(step(11, "hal：确定内核看到的内存接口", "hal 是硬件抽象层。这一步把 stream 里的资源映射成内核可以访问的“绑定”，并把内核放进一个带目标平台信息的 " + c("hal.executable") + " 里。", c("iree-hal-materialize-interfaces"), "stream", "hal.executable + 绑定"))
    P(pre(cut(F_IFACE, r"hal.executable private @main_dispatch_0", r"%7 = tensor.empty", width=170, drop=[r"arith.constant"]), "steps/0877 · 内核的新样子（省略了常数定义）"))
    P(G.fig_bindings(2))
    P(look("内核变成了没有参数的函数，数据通过 " + c("hal.interface.binding.subspan") + " 从绑定里取。",
           "偏置和权重共用 " + c("binding(1)") + "：偏置在偏移 0，权重在偏移 256。编译器把所有常量打包成一块，减少绑定的数量。",
           c("hal.executable.variant @embedded_elf_riscv_32") + " 说明这是给 RISC-V 目标的版本。如果一个内核同时要在主机上跑，还会有一个 x86 的 variant。"))

    # --- codegen
    P('<h4>第四部分 · 代码生成：把一个内核变成 NPU 指令</h4>')
    P("<p>从这里开始，只关注这一个内核。前面的 linalg 描述的是“算什么”，接下来要决定“怎么算”：循环怎么切、怎么用上向量寄存器、数据放在哪。</p>")
    P(step(12, "选择分块参数", "Coral NPU 的编译器用三个 pass，依次按向量寄存器、片上内存 DTCM、工作组三个层次，给矩阵乘贴上分块参数，然后选定代码生成的流水线。", c("coralnpu-tile-size-selection-register") + "、" + c("-dtcm") + "、" + c("-workgroup") + "、" + c("iree-hal-configure-executables"), "hal.executable", "带 lowering_config 的 linalg"))
    P(table(["pass 执行后", "matmul 上的 lowering_config"], [
        [c("…-register"), c(cfg_of(F_TS_REG))],
        [c("…-dtcm"), c(cfg_of(F_TS_DTCM))],
        [c("…-workgroup"), c(cfg_of(F_TS_WG))],
    ]))
    P("<p>每个方括号里的三个数，对应矩阵乘的三层循环：第 0 维是输出的行，第 1 维是输出的列，第 2 维是求和的 k。0 表示这一维不切。</p>")
    P(table(["参数", "值", "含义"], [
        [c("vector_common_parallel"), "[8, 8, 0]", "最内层每次算一个 8 行 × 8 列的小块。NPU 的向量寄存器是 128 位，编译目标里 native_vector_size 是 32 字节，一次能装 8 个 f32"],
        [c("vector_reduction"), "[0, 0, 1]", "求和维每次走 1 步：每一步用 A 的一列乘 B 的一行，加到 8×8 的累加器上"],
        [c("cache_parallel"), "[16, 0, 0]", "按片上内存容量再切一层：每次处理 16 行"],
        [c("distribution"), "[16, 0, 0]", "工作组的划分：每 16 行分给一个工作组。17 行因此分成两个工作组"],
    ]))
    P("<p>同时选定的流水线是 " + c("CPUDoubleTilingExpert") + "，意思是按“先切大块、再切到向量大小”的两级分块方式生成代码。这是 IREE CPU 后端的现成流水线，Coral NPU 借用了它，只换了分块参数。</p>")

    P(step(13, "按工作组切分", "把输出的行按 16 行一组分开，每组是一个可以独立执行的工作组。", c("iree-codegen-tile-and-distribute-to-workgroups-using-forall-op"), "带配置的 linalg", "scf.forall 循环"))
    P(pre(cut(F_WG, r"%8 = scf.forall", r"mapping = \[#iree_codegen.workgroup_mapping", width=170), "steps/0901 · 工作组循环（省略了常数与绑定）"))
    P(look(c("scf.forall (%arg0) = (0) to (17) step (16)") + "：%arg0 取 0 和 16，一共两个工作组。forall 表示各次迭代可以并行。",
           c("affine.min (-d0 + 17, 16)") + " 算出这一组实际有几行：第一组 16 行，第二组 17 − 16 = 1 行。于是张量类型里出现了问号 " + c("tensor<?x64xf32>") + "，行数不再固定。",
           c("tensor.extract_slice") + " 从大张量里切出这一组要用的部分，" + c("tensor.parallel_insert_slice") + " 把算好的部分放回去。原来的三个操作被原样搬进了循环体里。"))

    P(step(14, "继续切到向量大小", "在每个工作组内部，再按 16 行、8 行、8 列切下去，最内层对求和维 k 逐个循环，形成一个多层循环嵌套。", c("iree-llvmcpu-tile-and-fuse-producer-consumer") + "（执行 3 次）、" + c("iree-codegen-forall-to-for"), "scf.forall", "五层循环"))
    P(pre(cut(F_TILED, r"%8 = scf.forall", r"mapping = \[#iree_codegen.workgroup_mapping", width=160,
              drop=[r"^\s+\^bb0", r"= arith\.", r"= math\.", r"linalg.yield"]), "steps/0930 · 切分后的循环嵌套（省略了 gelu 的 9 行标量运算）"))
    P(G.fig_tiling(3))
    P(look("从外到内五层：工作组（每 16 行）、缓存块（每 16 行）、行块（每 8 行）、列块（每 8 列）、求和（k 从 0 到 31，每次 1）。",
           "最内层的矩阵乘现在只处理 " + c("tensor<?x1xf32>") + " 乘 " + c("tensor<8x1xf32>") + "：A 的一小列乘 B 的一小行，加到 8×8 的块上。",
           "gelu 那个 generic 没有进入 k 循环，而是紧跟在它后面，对算完的 8×8 块做一次。这叫“融合到消费者”：每个块算完立刻做激活，不必等整个矩阵乘结束。",
           "为什么行块是 8，缓存块也是 16？因为这个例子太小，一共才 17 行，两层 16 的切分都只切出一块。模型更大时这几层才会拉开差距。"))

    P(step(15, "向量化", "把最内层的小块运算换成向量操作。从这里开始，一次操作处理的不再是一个数，而是一整排 8 个数。", c("iree-codegen-generic-vectorization"), "scf 循环里的 linalg", "vector 方言"))
    P(pre(cut(F_VEC, r"scf.for %arg8 = %c0 to %c32 step %c1", r"%33 = vector.transfer_write", width=170), "steps/0933 · k 循环与 gelu 部分"))
    P(look(c("vector.transfer_read") + " 把一块内存读进一个向量值，比如 " + c("vector<8x8xf32>") + "；" + c("vector.transfer_write") + " 写回去。",
           c("vector.contract") + " 是向量化后的矩阵乘，它的 indexing_maps 和第 1.3 节里的一模一样，只是操作对象从张量变成了 8×8 的向量。",
           c("vector.create_mask") + " 生成掩码。最后一组只有 1 行，读写时只处理掩码为真的那一行，其余 7 行不碰，这就是图 3 里黄色那一行的处理方式。",
           "gelu 的 9 步运算原封不动地变成了对 " + c("vector<8x8xf32>") + " 的运算，比如 " + c("math.tanh %28 : vector<8x8xf32>") + "。"))

    P(step(16, "缓冲化：张量变成内存", "到目前为止，tensor 都是“值”：每次修改都在概念上产生一个新张量，没有说数据存在哪。缓冲化把 tensor 换成 memref，也就是一块具体的内存，修改就是原地写入。", c("iree-codegen-iree-comprehensive-bufferize"), "vector + tensor", "vector + memref"))
    P(pre(cut(F_BUF, r"func.func @main_dispatch_0", r"scf.for %arg3 = %c0 to %7 step %c8", width=170, drop=[r"arith.constant", r"hal.interface.binding.subspan"]), "steps/0940 · 函数开头（省略了常数与绑定）"))
    P(look("出现了三块 " + c("memref.alloca() : memref<8x8xf32>") + "：在栈上开的 8×8 临时空间，用来放累加器等中间结果。",
           c("memref.subview") + " 是在已有内存上开一个“窗口”，只是换个视角看同一块内存，不复制数据。它取代了之前的 " + c("tensor.extract_slice") + "。",
           "类型里的 " + c("strided<[64, 1], offset: ?>") + " 描述内存布局：行与行相隔 64 个元素，同一行相邻元素相隔 1 个。",
           "循环不再需要把张量作为结果传出来，因为数据是原地写进输出缓冲的。"))

    P(step(17, "把向量运算拆成硬件能执行的形状", "硬件的向量寄存器只能装一维的一排数，没有 8×8 这种二维向量。这一步把二维的 " + c("vector.contract") + " 拆成 8 条一维的 " + c("vector.fma") + "，每条处理累加器的一行。", c("iree-llvmcpu-virtual-vector-lowering") + "、" + c("iree-codegen-vector-transfer-lowering"), "二维 vector", "一维 vector.fma"))
    P(pre(cut(F_VLOW, r"scf.for %arg3 = %c0 to %c32 step %c1", None, count=24, width=165), "steps/0950 · k 循环的开头 24 行"))
    P(look("每一步 k：先读出 A 的一列 8 个数 %27、B 的一行 8 个数 %31。",
           "然后对累加器的第 0 行：取出 A 列的第 0 个数，" + c("vector.broadcast") + " 复制成 8 份，做 " + c("vector.fma %33, %31, %34") + "，即 累加器第 0 行 += A[0] × B 行。第 1 行用 A[1]，依此类推，一共 8 条 fma。",
           "fma 是 fused multiply-add，融合乘加：一条指令同时完成 a×b+c，比分开做乘和加更快也更精确。",
           c("arith.select") + " 配合掩码：对超出范围的行保留原值，不写入新结果。"))

    P(step(18, "展开数学函数", "硬件没有 tanh 这样的指令，也没有通用的幂运算指令。这一步用加减乘除把它们重新写出来。", c("iree-codegen-math-transform"), f"含 math.tanh {count(F_PREMATH, r'math.tanh')} 处、math.powf {count(F_PREMATH, r'math.powf')} 处", f"含 math.tanh {count(F_MATH, r'math.tanh')} 处、math.powf {count(F_MATH, r'math.powf')} 处"))
    P(pre(cut(F_MATH, r"%67 = arith.addf %64, %66", r"%94 = arith.mulf %93, %92", width=150), "steps/0978 · gelu 部分展开后的样子"))
    P(look(c("math.powf(x, 3)") + " 变成了两次乘法：" + c("%68 = x*x") + "，" + c("%69 = %68*x") + "。编译器看出指数是常数 3，就不必调用通用的幂函数。",
           c("math.tanh") + " 变成了一个有理多项式近似：先把输入夹在一个范围内（" + c("cmpf / select") + "），再算一个分子多项式和一个分母多项式（那一串 " + c("math.fma") + "），最后相除。对很小的输入，直接返回输入本身。",
           "每一步都作用在 " + c("vector<8x8xf32>") + " 上，所以 64 个 tanh 是一起算的。"))

    P(step(19, "降到 llvm 方言", "把剩下的结构全部换成接近 LLVM 的形式：" + c("scf.for") + " 这种结构化循环变成基本块加跳转，memref 变成指针和地址计算，vector 与 arith 变成 llvm 的指令。这是 MLIR 这一侧的最后一步。", c("convert-scf-to-cf") + "、" + c("iree-convert-to-llvm"), "vector + memref + scf", "llvm 方言"))
    P(pre("\n".join(pick(F_CF, [r"cf\.(cond_)?br"], 80).split("\n")[:4]), "steps/0985 · 循环变成了条件跳转（前 4 处）"))
    P(pre(pick(F_LLVM, [r"llvm.func @main_dispatch_0"], 180) + "\n  …\n" + "\n".join(pick(F_LLVM, [r"llvm.intr.fma"], 150).split("\n")[:3]), "steps/0997 · 函数签名与三条 fma"))
    P(look(f"llvm 方言里共有 {count(F_LLVM, r'llvm.intr.fma')} 条 " + c("llvm.intr.fma") + "，操作的都是 " + c("vector<8xf32>") + "。",
           "函数参数变成了 " + c("!llvm.ptr") + "，即指针。IREE 按约定把绑定、工作组编号等信息通过这几个指针传进内核。",
           f"同一个内核，第 13 步时 {len(lines(F_WG))} 行，到这里是 {len(lines(F_LLVM))} 行：抽象被一层层兑现成了具体的指令。"))

    P(step(20, "LLVM 生成 RISC-V 机器码", "MLIR 把 llvm 方言翻译成标准的 LLVM IR 文件，交给 LLVM 后端。LLVM 负责最后的指令选择、寄存器分配和指令调度，输出 RISC-V 汇编，再汇编链接成 ELF。", "LLVM 后端（不是 MLIR pass）", "LLVM IR", "RISC-V ELF"))
    P(pre(pick(F_LL, [r"^define .*@main_dispatch_0"], 170) + "\n  …\n" + "\n".join(pick(F_LL, [r"@llvm.fma.v8f32\("], 170).split("\n")[:2]), "exe/…optimized.ll · LLVM IR 里的 8 路 fma"))
    P(pre(a["snip"], "exe/…riscv_32.s · 内核汇编里 vfmadd.vv 附近"))
    P(table(["统计（只算内核函数本身）", "条数"], [
        ["全部指令", f"{a['n']:,}（整个 .s 文件 {a['total']:,}，其余属于链接进来的运行时辅助函数）"],
        [c("vfmadd.vv") + "：向量 × 向量 + 向量", a["vv"]],
        [c("vfmadd.vf") + "：向量 × 标量 + 向量", a["vf"]],
        ["全部向量指令", a["vec"]],
        ["标量浮点指令", a["sf"]],
        [c("vl2r.v") + " / " + c("vs2r.v") + "：成组读回 / 存出向量寄存器", f"{a['vl2r']} / {a['vs2r']}"],
    ]))
    P(look("第 17 步的 " + c("vector.fma") + " 最终变成了 " + c("vfmadd") + "。其中一部分是 " + c(".vf") + " 形式：LLVM 发现 fma 的一个输入是由标量广播来的，就直接用“向量乘标量”的指令，省掉了广播。",
           "一个 8 个 f32 的向量是 256 位，而 NPU 的向量寄存器是 128 位，所以每个向量占两个寄存器。这就是指令里 " + c("m2") + "、" + c("vl2r") + " 这类“2”的来源。",
           f"{a['vl2r']} 条 {c('vl2r.v')} 和 {a['vs2r']} 条 {c('vs2r.v')} 是在把向量寄存器存到栈上又读回来，大量的 " + c("csrr vlenb") + " 是在计算栈上的地址。原因是寄存器不够用：RISC-V 向量扩展有 32 个向量寄存器，两个一组就只剩 16 组，而 8×8 的累加器一个就要占 8 组，再加上 A 列、B 行和各种临时值，只好借用内存周转。这叫寄存器溢出，是这个内核一个明显的性能改进点。"))

    P(step(21, "主机侧程序：从 hal 到 vm", "内核编好之后，主机侧的调度逻辑，也就是分配内存、提交内核、等待完成，被翻译成 IREE 虚拟机的字节码，和内核 ELF 一起打包进 vmfb。", c("iree-hal-conversion") + "、" + c("iree-vm-conversion") + " 等", "stream + hal", "vm 方言 → model.vmfb"))
    P(pre(cut(F_VM, r"vm.func private @main\(", r"vm.fail", width=165, drop=[r"vm.const.i", r"vm.const.ref.zero", r"vm.discard"]), "out/vm.mlir · 每次推理执行的 main（省略了常数与引用释放）"))
    P(look("每次推理，主机上的 main 只做五件事：检查输入形状是 17×32、在 NPU 上申请 4352 字节的输出、提交命令、等待完成、把输出包装成 17×64 的 buffer_view 返回。",
           "提交的命令缓冲 " + c("@__main_memoize_result_0_device_1") + " 是在初始化时就录制好的，里面就是那一次 dispatch。因为形状固定，每次推理的命令都一样，录一次反复用。",
           "这里没有任何矩阵乘或加法。主机只负责指挥，计算全部在 NPU 的内核里。"))

    P(step(22, "在 NPU 仿真器上运行", "运行时加载 vmfb：IREE 虚拟机在主机上执行第 21 步的 main；HAL 驱动把 RISC-V ELF 和三块缓冲交给 MPACT 仿真器，仿真器逐条执行第 20 步的指令，结果写回输出缓冲。", "运行时，不属于编译", "model.vmfb + 输入", "17×64 输出"))
    P(pre("LD_LIBRARY_PATH=$PWD/runtime/sim bazel-bin/examples/toy-vit-aot/run_vit \\\n  --vmfb=model.vmfb --input=ref_in.npy --ref=ref_out.npy --module=module\n\nModules in context: ['hal', 'module']\nmax abs diff: 2.384185791015625e-07\nSUCCESS: matches framework reference", "运行命令与输出"))
    P("<p>和 PyTorch 在 Mac 上算出的结果相比，1,088 个输出值的最大误差是 2.4e-07。误差来自浮点运算顺序不同，以及 tanh 用多项式近似，属于正常范围。</p>")

    # 4 ------------------------------------------------------------
    P('<h2 id="s4">4. 回顾：一张表看完全程</h2>')
    P(table(["步骤", "所在层", "发生了什么", "fc1 + gelu 在这一步的样子"], [
        ["1–2", "PyTorch → FX", "Python 变成静态图", "linear + 9 个逐元素节点"],
        ["3", "torch", "图变成 MLIR", "permute + mm + add + gelu 各项"],
        ["4", "stablehlo", "变成框架无关的格式", "transpose + dot_general + 大量广播"],
        ["5", "linalg", "变成循环描述", f"{n23} 个 linalg 操作"],
        ["6", "linalg", "确定设备，贴标签", "矩阵乘标 NPU，其余标主机"],
        ["7", "linalg", "全局优化", "转置被吸收，偏置在编译期算好"],
        ["8", "linalg", "融合", f"{linalg_ops(F_FUSE)} 个操作：清零、矩阵乘、融合的 gelu"],
        ["9", "flow", "切出内核", "1 个 flow.executable，整体放 NPU"],
        ["10", "stream", "定内存、定顺序", "4 块缓冲，1 次异步提交"],
        ["11", "hal", "定内核的内存接口", "3 个绑定，常量打包"],
        ["12", "linalg + 配置", "选分块参数", "8×8 向量块，16 行一组"],
        ["13–14", "scf", "切循环", "五层循环"],
        ["15", "vector", "向量化", "vector.contract 8×8"],
        ["16", "memref", "缓冲化", "在真实内存上读写"],
        ["17–18", "vector", "拆成一维，展开数学函数", "每步 k 8 条 fma；tanh 变多项式"],
        ["19", "llvm", "降到 LLVM 方言", f"{count(F_LLVM, r'llvm.intr.fma')} 条 llvm.intr.fma"],
        ["20", "RISC-V", "LLVM 生成机器码", f"{a['n']:,} 条指令，{a['vv'] + a['vf']} 条 vfmadd"],
        ["21", "vm", "主机调度程序", "检查、分配、提交、等待、返回"],
        ["22", "运行", "仿真执行", f"最大误差 {RUN['diff']}"],
    ]))
    P("<p>如果只记住一件事：<b>每一步只做一件事，而形状 17×32 × 64×32 → 17×64 从头到尾都在。</b>凭形状，你可以在任意一层的 IR 里找到同一个运算，看它此刻变成了什么。</p>")

    # 5 ------------------------------------------------------------
    P('<h2 id="s5">5. 自己动手</h2>')
    P("<p>以下命令都在容器 " + c("coralnpu-work") + " 里、" + c("~/work/coralnpu-compiler") + " 目录下执行。先定义一个变量省去重复参数：</p>")
    P(pre('CC="bazel-bin/compiler/tools/coralnpu-compile \\\n  --iree-hal-target-device=local --iree-hal-local-target-device-backends=llvm-cpu \\\n  --iree-llvmcpu-target-cpu-features=host --iree-hal-target-device=coralnpu"'))
    P(table(["想看什么", "命令"], [
        ["停在某个阶段看整个模块", c("$CC --compile-to=input|flow|stream|hal|vm model.mlir -o x.mlir")],
        ["每个 pass 之后都打印", c("$CC --mlir-print-ir-after-all --mlir-elide-elementsattrs-if-larger=8 model.mlir -o /dev/null 2> all.txt")],
        ["只看某几个 pass 之后", c("$CC --mlir-print-ir-after=iree-codegen-generic-vectorization,iree-convert-to-llvm …")],
        ["只打印改动了 IR 的 pass", c("加上 --mlir-print-ir-after-change")],
        ["每个 pass 用了多久", c("$CC --mlir-timing --mlir-timing-display=list …")],
        ["保留每个内核的 .ll / .s / .o", c("$CC --iree-hal-dump-executable-files-to=exe/ …")],
        ["看设备分配汇总", c("$CC --coralnpu-dump-affinity-profile-format=pretty …")],
    ]))
    P("<p>建议的练习：把 " + c("lin_gelu.py") + " 里的 17 改成 64，重新编译，看第 13 步的工作组数、第 15 步的掩码怎么变；或者删掉 gelu 只留 Linear，看第 8 步融合后还剩什么。</p>")
    P("<p>本文用到的全部产物都在 " + c("toy-vit/mlir-walkthrough/out/") + "：" + c("steps/") + " 下是每个改动了 IR 的 pass 之后的完整 IR，文件名是“执行序号_pass 名”；" + c("exe/") + " 下是内核的各级产物。</p>")

    # 6 ------------------------------------------------------------
    P('<h2 id="s6">6. 术语表</h2>')
    gl = [("IR", "中间表示。编译器内部用来表示程序的格式。"),
          ("MLIR", "一种可以容纳多种抽象层次的 IR 框架，本身是 LLVM 项目的一部分。"),
          ("方言 dialect", "一组相关操作和类型的集合，比如 linalg、vector、llvm。"),
          ("操作 op", "IR 里的一条语句，形如 方言.名字。"),
          ("SSA", "静态单赋值。每个值只被赋值一次，便于分析数据流。"),
          ("region / block", "操作内部包含的代码块。block 可以有参数，以 ^bb 命名。"),
          ("attribute", "贴在操作上的附加信息，不参与计算。"),
          ("affine_map", "从循环下标到数组下标的线性映射。"),
          ("pass", "一道把 IR 改写成另一份 IR 的工序。"),
          ("lowering 降级", "把 IR 从高抽象层次改写到低抽象层次的过程。"),
          ("canonicalize / cse", "化简 / 公共子表达式消除，两种最常用的清理 pass。"),
          ("tensor", "张量值。不可变，没有内存位置的概念。"),
          ("memref", "内存引用。一块有地址、有布局的真实内存。"),
          ("缓冲化 bufferization", "把 tensor 换成 memref 的过程。"),
          ("融合 fusion", "把相邻的运算合并，中间结果不写回内存。"),
          ("分块 tiling", "把一个大循环切成多层小循环，让数据能装进寄存器或缓存。"),
          ("向量化 vectorization", "把逐个元素的运算换成一次处理一排元素的向量运算。"),
          ("掩码 mask", "指明向量里哪些位置有效，用来处理凑不满一整排的边界。"),
          ("dispatch / 内核", "一段可以被独立下发到某个设备执行的代码。"),
          ("工作组 workgroup", "内核执行时的并行单位，每个处理输出的一部分。"),
          ("fma", "融合乘加，一条指令完成 a×b+c。"),
          ("寄存器溢出 spill", "寄存器不够用时，把值临时存到内存再读回。"),
          ("HAL", "硬件抽象层。IREE 用它统一描述不同设备。"),
          ("vmfb", "IREE 的模块文件，内含调度字节码、内核二进制和常量。")]
    P('<dl class="gl">' + "".join(f"<dt>{esc(k)}</dt><dd>{esc(v)}</dd>" for k, v in gl) + "</dl>")

    doc = ('<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">'
           "<title>MLIR 逐步拆解</title><style>" + CSS + G.FIG_CSS + EXTRA_CSS + "</style></head><body><main>" + "\n".join(A) + "</main></body></html>")
    OUT.write_text(doc, encoding="utf-8")
    print("wrote", OUT, len(doc))


if __name__ == "__main__":
    build()
