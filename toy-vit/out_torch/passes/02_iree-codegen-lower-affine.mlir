#composite_of_2304b = #util.composite<2304xi8, [
    dense_resource<__elided__> : tensor<32xf32>,
    dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>,
]>
#composite_of_94336b = #util.composite<94336xi8, [
    dense_resource<__elided__> : tensor<32xf32>,
    dense_resource<__elided__> : tensor<1x17x32xf32>,
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<__elided__> : tensor<32xf32>,
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<__elided__> : tensor<32x10xf32>,
    dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>,
    dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>,
    dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>,
    dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
    dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>,
    dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>,
    dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>,
]>
#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
#loop_unroll = #llvm.loop_unroll<disable = true>
#pipeline_layout = #hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#pipeline_layout1 = #hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#pipeline_layout2 = #hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#pipeline_layout3 = #hal.pipeline.layout<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#pipeline_layout4 = #hal.pipeline.layout<constants = 1, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#pipeline_layout5 = #hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
module attributes {stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  hal.executable private @vit_linked {
    hal.executable.variant public @embedded_elf_x86_64 target(#executable_target_embedded_elf_x86_64) {
      hal.executable.export public @main_dispatch_0_transpose_4x8x4x24_f32 ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_2_elementwise_544_f32 ordinal(1) layout(#pipeline_layout1) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_3_reduction_17x32_f32 ordinal(2) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_4_reduction_17x32_f32 ordinal(3) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_12_reduction_17x32_f32 ordinal(4) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_16_reduction_17x32_f32 ordinal(5) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_24_reduction_17x32_f32 ordinal(6) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_27_elementwise_32_f32 ordinal(7) layout(#pipeline_layout2) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_28_reduction_32_f32 ordinal(8) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_29_elementwise_32_f32 ordinal(9) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_30_reduction_32_f32 ordinal(10) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      hal.executable.export public @main_dispatch_31_elementwise_32_f32 ordinal(11) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module {
        llvm.func @main_dispatch_0_transpose_4x8x4x24_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.constant(192 : index) : i64
          %2 = llvm.mlir.constant(64 : index) : i64
          %3 = llvm.mlir.constant(true) : i1
          %4 = llvm.mlir.constant(96 : index) : i64
          %5 = llvm.mlir.constant(768 : index) : i64
          %6 = llvm.mlir.constant(1 : index) : i64
          %7 = llvm.mlir.constant(24 : index) : i64
          %8 = llvm.mlir.constant(8 : index) : i64
          %9 = llvm.mlir.constant(4 : index) : i64
          %10 = llvm.mlir.constant(0 : index) : i64
          %11 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %12 = llvm.extractvalue %11[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %13 = llvm.load %12 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %3 ["align"(%13, %2 : !llvm.ptr, i64)] : i1
          %14 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.extractvalue %14[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %16 = llvm.getelementptr %15[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %3 ["align"(%17, %2 : !llvm.ptr, i64)] : i1
          llvm.br ^bb1(%10 : i64)
        ^bb1(%18: i64):  // 2 preds: ^bb0, ^bb10
          %19 = llvm.icmp "slt" %18, %9 : i64
          llvm.cond_br %19, ^bb2(%10 : i64), ^bb11
        ^bb2(%20: i64):  // 2 preds: ^bb1, ^bb9
          %21 = llvm.icmp "slt" %20, %8 : i64
          llvm.cond_br %21, ^bb3(%10 : i64), ^bb10
        ^bb3(%22: i64):  // 2 preds: ^bb2, ^bb8
          %23 = llvm.icmp "slt" %22, %9 : i64
          llvm.cond_br %23, ^bb4(%10 : i64), ^bb9
        ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb7
          %25 = llvm.icmp "slt" %24, %7 : i64
          llvm.cond_br %25, ^bb5(%10 : i64), ^bb8
        ^bb5(%26: i64):  // 2 preds: ^bb4, ^bb6
          %27 = llvm.icmp "slt" %26, %9 : i64
          llvm.cond_br %27, ^bb6, ^bb7
        ^bb6:  // pred: ^bb5
          %28 = llvm.add %24, %26 : i64
          %29 = llvm.mul %18, %5 overflow<nsw, nuw> : i64
          %30 = llvm.mul %20, %4 overflow<nsw, nuw> : i64
          %31 = llvm.add %29, %30 overflow<nsw, nuw> : i64
          %32 = llvm.mul %22, %7 overflow<nsw, nuw> : i64
          %33 = llvm.add %31, %32 overflow<nsw, nuw> : i64
          %34 = llvm.add %33, %28 overflow<nsw, nuw> : i64
          %35 = llvm.getelementptr inbounds|nuw %13[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %36 = llvm.load %35 : !llvm.ptr -> f32
          %37 = llvm.mul %22, %1 overflow<nsw, nuw> : i64
          %38 = llvm.add %29, %37 overflow<nsw, nuw> : i64
          %39 = llvm.mul %20, %7 overflow<nsw, nuw> : i64
          %40 = llvm.add %38, %39 overflow<nsw, nuw> : i64
          %41 = llvm.add %40, %28 overflow<nsw, nuw> : i64
          %42 = llvm.getelementptr inbounds|nuw %17[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %36, %42 : f32, !llvm.ptr
          %43 = llvm.add %26, %6 : i64
          llvm.br ^bb5(%43 : i64)
        ^bb7:  // pred: ^bb5
          %44 = llvm.add %24, %9 : i64
          llvm.br ^bb4(%44 : i64)
        ^bb8:  // pred: ^bb4
          %45 = llvm.add %22, %6 : i64
          llvm.br ^bb3(%45 : i64)
        ^bb9:  // pred: ^bb3
          %46 = llvm.add %20, %6 : i64
          llvm.br ^bb2(%46 : i64)
        ^bb10:  // pred: ^bb2
          %47 = llvm.add %18, %6 : i64
          llvm.br ^bb1(%47 : i64)
        ^bb11:  // pred: ^bb1
          llvm.return %0 : i32
        }
        llvm.func @main_dispatch_2_elementwise_544_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(32 : i64) : i64
          %3 = llvm.mlir.constant(64 : index) : i64
          %4 = llvm.mlir.constant(true) : i1
          %5 = llvm.mlir.constant(4 : index) : i64
          %6 = llvm.mlir.constant(544 : index) : i64
          %7 = llvm.mlir.constant(0 : index) : i64
          %8 = llvm.mlir.constant(128 : index) : i64
          %9 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %10 = llvm.extractvalue %9[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %11 = llvm.load %10 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %4 ["align"(%11, %3 : !llvm.ptr, i64)] : i1
          %12 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %13 = llvm.extractvalue %12[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %14 = llvm.getelementptr %13[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %15 = llvm.load %14 : !llvm.ptr -> !llvm.ptr
          %16 = llvm.mul %8, %1 : i64
          %17 = llvm.udiv %16, %2 : i64
          %18 = llvm.getelementptr %15[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %4 ["align"(%18, %3 : !llvm.ptr, i64)] : i1
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %21 = llvm.getelementptr %20[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %22 = llvm.load %21 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %4 ["align"(%22, %3 : !llvm.ptr, i64)] : i1
          llvm.br ^bb1(%7 : i64)
        ^bb1(%23: i64):  // 2 preds: ^bb0, ^bb2
          %24 = llvm.icmp "slt" %23, %6 : i64
          llvm.cond_br %24, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %25 = llvm.getelementptr %11[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %26 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %27 = llvm.getelementptr %18[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %28 = llvm.load %27 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %29 = llvm.fadd %26, %28 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %30 = llvm.getelementptr %22[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %29, %30 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %31 = llvm.add %23, %5 : i64
          llvm.br ^bb1(%31 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %0 : i32
        }
        llvm.func @main_dispatch_3_reduction_17x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<4xf32>
          %1 = llvm.mlir.constant(0 : i32) : i32
          %2 = llvm.mlir.poison : vector<1xf32>
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(64 : index) : i64
          %5 = llvm.mlir.constant(true) : i1
          %6 = llvm.mlir.constant(dense<3.200000e+01> : vector<1xf32>) : vector<1xf32>
          %7 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %8 = llvm.mlir.constant(4 : index) : i64
          %9 = llvm.mlir.constant(32 : index) : i64
          %10 = llvm.mlir.constant(0 : index) : i64
          %11 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %12 = llvm.extractvalue %11[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %13 = llvm.load %12 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%13, %4 : !llvm.ptr, i64)] : i1
          %14 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.extractvalue %14[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %16 = llvm.getelementptr %15[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%17, %4 : !llvm.ptr, i64)] : i1
          %18 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %19 = llvm.extractvalue %18[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %20 = llvm.zext %19 : i32 to i64
          llvm.br ^bb1(%10, %7 : i64, vector<1xf32>)
        ^bb1(%21: i64, %22: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %23 = llvm.icmp "slt" %21, %9 : i64
          llvm.cond_br %23, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %24 = llvm.mul %20, %9 : i64
          %25 = llvm.add %24, %21 : i64
          %26 = llvm.getelementptr %13[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %27 = llvm.load %26 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %28 = llvm.extractelement %22[%3 : i64] : vector<1xf32>
          %29 = "llvm.intr.vector.reduce.fadd"(%28, %27) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %30 = llvm.insertelement %29, %2[%1 : i32] : vector<1xf32>
          %31 = llvm.add %21, %8 : i64
          llvm.br ^bb1(%31, %30 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %32 = llvm.fdiv %22, %6 : vector<1xf32>
          llvm.br ^bb4(%10 : i64)
        ^bb4(%33: i64):  // 2 preds: ^bb3, ^bb5
          %34 = llvm.icmp "slt" %33, %9 : i64
          llvm.cond_br %34, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %35 = llvm.mul %20, %9 : i64
          %36 = llvm.add %35, %33 : i64
          %37 = llvm.getelementptr %13[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %38 = llvm.load %37 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %39 = llvm.extractelement %32[%3 : i64] : vector<1xf32>
          %40 = llvm.insertelement %39, %0[%1 : i32] : vector<4xf32>
          %41 = llvm.shufflevector %40, %0 [0, 0, 0, 0] : vector<4xf32> 
          %42 = llvm.fsub %38, %41 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %43 = llvm.getelementptr %17[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %42, %43 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %44 = llvm.add %33, %8 : i64
          llvm.br ^bb4(%44 : i64)
        ^bb6:  // pred: ^bb4
          llvm.return %1 : i32
        }
        llvm.mlir.global private constant @__constant_32xf32_0(dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.mlir.global private constant @__constant_32xf32(dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.func @main_dispatch_4_reduction_17x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<4xf32>
          %1 = llvm.mlir.constant(0 : i32) : i32
          %2 = llvm.mlir.poison : vector<1xf32>
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(8 : i64) : i64
          %5 = llvm.mlir.constant(32 : i64) : i64
          %6 = llvm.mlir.constant(64 : index) : i64
          %7 = llvm.mlir.constant(true) : i1
          %8 = llvm.mlir.addressof @__constant_32xf32_0 : !llvm.ptr
          %9 = llvm.mlir.addressof @__constant_32xf32 : !llvm.ptr
          %10 = llvm.mlir.constant(32 : index) : i64
          %11 = llvm.mlir.constant(4 : index) : i64
          %12 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %13 = llvm.mlir.constant(dense<3.200000e+01> : vector<1xf32>) : vector<1xf32>
          %14 = llvm.mlir.constant(dense<9.99999997E-7> : vector<1xf32>) : vector<1xf32>
          %15 = llvm.mlir.constant(2176 : index) : i64
          %16 = llvm.mlir.constant(0 : index) : i64
          %17 = llvm.getelementptr %9[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %18 = llvm.getelementptr %8[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %7 ["align"(%21, %6 : !llvm.ptr, i64)] : i1
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %24 = llvm.getelementptr %23[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          %26 = llvm.mul %15, %4 : i64
          %27 = llvm.udiv %26, %5 : i64
          %28 = llvm.getelementptr %25[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %7 ["align"(%28, %6 : !llvm.ptr, i64)] : i1
          %29 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %30 = llvm.extractvalue %29[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %31 = llvm.zext %30 : i32 to i64
          llvm.br ^bb1(%16, %12 : i64, vector<1xf32>)
        ^bb1(%32: i64, %33: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %34 = llvm.icmp "slt" %32, %10 : i64
          llvm.cond_br %34, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %35 = llvm.mul %31, %10 : i64
          %36 = llvm.add %35, %32 : i64
          %37 = llvm.getelementptr %21[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %38 = llvm.load %37 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %39 = llvm.fmul %38, %38 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %40 = llvm.extractelement %33[%3 : i64] : vector<1xf32>
          %41 = "llvm.intr.vector.reduce.fadd"(%40, %39) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %42 = llvm.insertelement %41, %2[%1 : i32] : vector<1xf32>
          %43 = llvm.add %32, %11 : i64
          llvm.br ^bb1(%43, %42 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %44 = llvm.fdiv %33, %13 : vector<1xf32>
          %45 = llvm.fadd %44, %14 {fastmathFlags = #llvm.fastmath<contract>} : vector<1xf32>
          %46 = llvm.intr.sqrt(%45) : (vector<1xf32>) -> vector<1xf32>
          llvm.br ^bb4(%16 : i64)
        ^bb4(%47: i64):  // 2 preds: ^bb3, ^bb5
          %48 = llvm.icmp "slt" %47, %10 : i64
          llvm.cond_br %48, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %49 = llvm.mul %31, %10 : i64
          %50 = llvm.add %49, %47 : i64
          %51 = llvm.getelementptr %21[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %52 = llvm.load %51 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %53 = llvm.getelementptr %18[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %54 = llvm.load %53 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %55 = llvm.getelementptr %17[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %56 = llvm.load %55 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %57 = llvm.extractelement %46[%3 : i64] : vector<1xf32>
          %58 = llvm.insertelement %57, %0[%1 : i32] : vector<4xf32>
          %59 = llvm.shufflevector %58, %0 [0, 0, 0, 0] : vector<4xf32> 
          %60 = llvm.fdiv %52, %59 : vector<4xf32>
          %61 = llvm.fmul %60, %54 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %62 = llvm.fadd %61, %56 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %63 = llvm.getelementptr %28[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %62, %63 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %64 = llvm.add %47, %11 : i64
          llvm.br ^bb4(%64 : i64)
        ^bb6:  // pred: ^bb4
          llvm.return %1 : i32
        }
        llvm.mlir.global private constant @__constant_32xf32_0_0(dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.mlir.global private constant @__constant_32xf32_1(dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.func @main_dispatch_12_reduction_17x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<4xf32>
          %1 = llvm.mlir.constant(0 : i32) : i32
          %2 = llvm.mlir.poison : vector<1xf32>
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(64 : index) : i64
          %5 = llvm.mlir.constant(true) : i1
          %6 = llvm.mlir.addressof @__constant_32xf32_0_0 : !llvm.ptr
          %7 = llvm.mlir.addressof @__constant_32xf32_1 : !llvm.ptr
          %8 = llvm.mlir.constant(32 : index) : i64
          %9 = llvm.mlir.constant(4 : index) : i64
          %10 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %11 = llvm.mlir.constant(dense<3.200000e+01> : vector<1xf32>) : vector<1xf32>
          %12 = llvm.mlir.constant(dense<9.99999997E-7> : vector<1xf32>) : vector<1xf32>
          %13 = llvm.mlir.constant(0 : index) : i64
          %14 = llvm.getelementptr %7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %15 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%18, %4 : !llvm.ptr, i64)] : i1
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %21 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %22 = llvm.load %21 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%22, %4 : !llvm.ptr, i64)] : i1
          %23 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.extractvalue %23[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %25 = llvm.zext %24 : i32 to i64
          llvm.br ^bb1(%13, %10 : i64, vector<1xf32>)
        ^bb1(%26: i64, %27: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %28 = llvm.icmp "slt" %26, %8 : i64
          llvm.cond_br %28, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %29 = llvm.mul %25, %8 : i64
          %30 = llvm.add %29, %26 : i64
          %31 = llvm.getelementptr %18[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %32 = llvm.load %31 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %33 = llvm.fmul %32, %32 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %34 = llvm.extractelement %27[%3 : i64] : vector<1xf32>
          %35 = "llvm.intr.vector.reduce.fadd"(%34, %33) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %36 = llvm.insertelement %35, %2[%1 : i32] : vector<1xf32>
          %37 = llvm.add %26, %9 : i64
          llvm.br ^bb1(%37, %36 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %38 = llvm.fdiv %27, %11 : vector<1xf32>
          %39 = llvm.fadd %38, %12 {fastmathFlags = #llvm.fastmath<contract>} : vector<1xf32>
          %40 = llvm.intr.sqrt(%39) : (vector<1xf32>) -> vector<1xf32>
          llvm.br ^bb4(%13 : i64)
        ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb5
          %42 = llvm.icmp "slt" %41, %8 : i64
          llvm.cond_br %42, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %43 = llvm.mul %25, %8 : i64
          %44 = llvm.add %43, %41 : i64
          %45 = llvm.getelementptr %18[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %46 = llvm.load %45 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %47 = llvm.getelementptr %15[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %48 = llvm.load %47 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %49 = llvm.getelementptr %14[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %50 = llvm.load %49 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %51 = llvm.extractelement %40[%3 : i64] : vector<1xf32>
          %52 = llvm.insertelement %51, %0[%1 : i32] : vector<4xf32>
          %53 = llvm.shufflevector %52, %0 [0, 0, 0, 0] : vector<4xf32> 
          %54 = llvm.fdiv %46, %53 : vector<4xf32>
          %55 = llvm.fmul %54, %48 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %56 = llvm.fadd %55, %50 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %57 = llvm.getelementptr %22[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %56, %57 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %58 = llvm.add %41, %9 : i64
          llvm.br ^bb4(%58 : i64)
        ^bb6:  // pred: ^bb4
          llvm.return %1 : i32
        }
        llvm.mlir.global private constant @__constant_32xf32_0_1(dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.mlir.global private constant @__constant_32xf32_2(dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.func @main_dispatch_16_reduction_17x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<4xf32>
          %1 = llvm.mlir.constant(0 : i32) : i32
          %2 = llvm.mlir.poison : vector<1xf32>
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(64 : index) : i64
          %5 = llvm.mlir.constant(true) : i1
          %6 = llvm.mlir.addressof @__constant_32xf32_0_1 : !llvm.ptr
          %7 = llvm.mlir.addressof @__constant_32xf32_2 : !llvm.ptr
          %8 = llvm.mlir.constant(32 : index) : i64
          %9 = llvm.mlir.constant(4 : index) : i64
          %10 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %11 = llvm.mlir.constant(dense<3.200000e+01> : vector<1xf32>) : vector<1xf32>
          %12 = llvm.mlir.constant(dense<9.99999997E-7> : vector<1xf32>) : vector<1xf32>
          %13 = llvm.mlir.constant(0 : index) : i64
          %14 = llvm.getelementptr %7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %15 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%18, %4 : !llvm.ptr, i64)] : i1
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %21 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %22 = llvm.load %21 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%22, %4 : !llvm.ptr, i64)] : i1
          %23 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.extractvalue %23[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %25 = llvm.zext %24 : i32 to i64
          llvm.br ^bb1(%13, %10 : i64, vector<1xf32>)
        ^bb1(%26: i64, %27: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %28 = llvm.icmp "slt" %26, %8 : i64
          llvm.cond_br %28, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %29 = llvm.mul %25, %8 : i64
          %30 = llvm.add %29, %26 : i64
          %31 = llvm.getelementptr %18[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %32 = llvm.load %31 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %33 = llvm.fmul %32, %32 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %34 = llvm.extractelement %27[%3 : i64] : vector<1xf32>
          %35 = "llvm.intr.vector.reduce.fadd"(%34, %33) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %36 = llvm.insertelement %35, %2[%1 : i32] : vector<1xf32>
          %37 = llvm.add %26, %9 : i64
          llvm.br ^bb1(%37, %36 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %38 = llvm.fdiv %27, %11 : vector<1xf32>
          %39 = llvm.fadd %38, %12 {fastmathFlags = #llvm.fastmath<contract>} : vector<1xf32>
          %40 = llvm.intr.sqrt(%39) : (vector<1xf32>) -> vector<1xf32>
          llvm.br ^bb4(%13 : i64)
        ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb5
          %42 = llvm.icmp "slt" %41, %8 : i64
          llvm.cond_br %42, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %43 = llvm.mul %25, %8 : i64
          %44 = llvm.add %43, %41 : i64
          %45 = llvm.getelementptr %18[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %46 = llvm.load %45 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %47 = llvm.getelementptr %15[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %48 = llvm.load %47 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %49 = llvm.getelementptr %14[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %50 = llvm.load %49 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %51 = llvm.extractelement %40[%3 : i64] : vector<1xf32>
          %52 = llvm.insertelement %51, %0[%1 : i32] : vector<4xf32>
          %53 = llvm.shufflevector %52, %0 [0, 0, 0, 0] : vector<4xf32> 
          %54 = llvm.fdiv %46, %53 : vector<4xf32>
          %55 = llvm.fmul %54, %48 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %56 = llvm.fadd %55, %50 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %57 = llvm.getelementptr %22[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %56, %57 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %58 = llvm.add %41, %9 : i64
          llvm.br ^bb4(%58 : i64)
        ^bb6:  // pred: ^bb4
          llvm.return %1 : i32
        }
        llvm.mlir.global private constant @__constant_32xf32_0_2(dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.mlir.global private constant @__constant_32xf32_3(dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.func @main_dispatch_24_reduction_17x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<4xf32>
          %1 = llvm.mlir.constant(0 : i32) : i32
          %2 = llvm.mlir.poison : vector<1xf32>
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(64 : index) : i64
          %5 = llvm.mlir.constant(true) : i1
          %6 = llvm.mlir.addressof @__constant_32xf32_0_2 : !llvm.ptr
          %7 = llvm.mlir.addressof @__constant_32xf32_3 : !llvm.ptr
          %8 = llvm.mlir.constant(32 : index) : i64
          %9 = llvm.mlir.constant(4 : index) : i64
          %10 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %11 = llvm.mlir.constant(dense<3.200000e+01> : vector<1xf32>) : vector<1xf32>
          %12 = llvm.mlir.constant(dense<9.99999997E-7> : vector<1xf32>) : vector<1xf32>
          %13 = llvm.mlir.constant(0 : index) : i64
          %14 = llvm.getelementptr %7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %15 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%18, %4 : !llvm.ptr, i64)] : i1
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %21 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %22 = llvm.load %21 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%22, %4 : !llvm.ptr, i64)] : i1
          %23 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.extractvalue %23[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %25 = llvm.zext %24 : i32 to i64
          llvm.br ^bb1(%13, %10 : i64, vector<1xf32>)
        ^bb1(%26: i64, %27: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %28 = llvm.icmp "slt" %26, %8 : i64
          llvm.cond_br %28, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %29 = llvm.mul %25, %8 : i64
          %30 = llvm.add %29, %26 : i64
          %31 = llvm.getelementptr %18[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %32 = llvm.load %31 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %33 = llvm.fmul %32, %32 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %34 = llvm.extractelement %27[%3 : i64] : vector<1xf32>
          %35 = "llvm.intr.vector.reduce.fadd"(%34, %33) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %36 = llvm.insertelement %35, %2[%1 : i32] : vector<1xf32>
          %37 = llvm.add %26, %9 : i64
          llvm.br ^bb1(%37, %36 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %38 = llvm.fdiv %27, %11 : vector<1xf32>
          %39 = llvm.fadd %38, %12 {fastmathFlags = #llvm.fastmath<contract>} : vector<1xf32>
          %40 = llvm.intr.sqrt(%39) : (vector<1xf32>) -> vector<1xf32>
          llvm.br ^bb4(%13 : i64)
        ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb5
          %42 = llvm.icmp "slt" %41, %8 : i64
          llvm.cond_br %42, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %43 = llvm.mul %25, %8 : i64
          %44 = llvm.add %43, %41 : i64
          %45 = llvm.getelementptr %18[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %46 = llvm.load %45 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %47 = llvm.getelementptr %15[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %48 = llvm.load %47 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %49 = llvm.getelementptr %14[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %50 = llvm.load %49 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %51 = llvm.extractelement %40[%3 : i64] : vector<1xf32>
          %52 = llvm.insertelement %51, %0[%1 : i32] : vector<4xf32>
          %53 = llvm.shufflevector %52, %0 [0, 0, 0, 0] : vector<4xf32> 
          %54 = llvm.fdiv %46, %53 : vector<4xf32>
          %55 = llvm.fmul %54, %48 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %56 = llvm.fadd %55, %50 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %57 = llvm.getelementptr %22[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %56, %57 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %58 = llvm.add %41, %9 : i64
          llvm.br ^bb4(%58 : i64)
        ^bb6:  // pred: ^bb4
          llvm.return %1 : i32
        }
        llvm.func @main_dispatch_27_elementwise_32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.constant(64 : index) : i64
          %2 = llvm.mlir.constant(true) : i1
          %3 = llvm.mlir.constant(544 : index) : i64
          %4 = llvm.mlir.constant(4 : index) : i64
          %5 = llvm.mlir.constant(32 : index) : i64
          %6 = llvm.mlir.constant(0 : index) : i64
          %7 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %8 = llvm.extractvalue %7[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %9 = llvm.load %8 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %2 ["align"(%9, %1 : !llvm.ptr, i64)] : i1
          %10 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %11 = llvm.extractvalue %10[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %12 = llvm.getelementptr %11[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %13 = llvm.load %12 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %2 ["align"(%13, %1 : !llvm.ptr, i64)] : i1
          %14 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.extractvalue %14[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %16 = llvm.getelementptr %15[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %2 ["align"(%17, %1 : !llvm.ptr, i64)] : i1
          %18 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.extractvalue %18[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %20 = llvm.getelementptr %19[3] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %2 ["align"(%21, %1 : !llvm.ptr, i64)] : i1
          llvm.br ^bb1(%6 : i64)
        ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb2
          %23 = llvm.icmp "slt" %22, %5 : i64
          llvm.cond_br %23, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %24 = llvm.mul %6, %3 : i64
          %25 = llvm.mul %6, %5 : i64
          %26 = llvm.add %24, %25 : i64
          %27 = llvm.add %26, %22 : i64
          %28 = llvm.getelementptr %13[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %29 = llvm.load %28 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %30 = llvm.getelementptr %9[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %31 = llvm.load %30 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %32 = llvm.getelementptr %17[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %33 = llvm.load %32 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %34 = llvm.fadd %31, %33 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %35 = llvm.fadd %29, %34 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %36 = llvm.getelementptr %21[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %35, %36 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %37 = llvm.add %22, %4 : i64
          llvm.br ^bb1(%37 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %0 : i32
        }
        llvm.func @main_dispatch_28_reduction_32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.poison : vector<1xf32>
          %2 = llvm.mlir.constant(0 : i64) : i64
          %3 = llvm.mlir.constant(8 : i64) : i64
          %4 = llvm.mlir.constant(32 : i64) : i64
          %5 = llvm.mlir.constant(64 : index) : i64
          %6 = llvm.mlir.constant(true) : i1
          %7 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %8 = llvm.mlir.constant(4 : index) : i64
          %9 = llvm.mlir.constant(32 : index) : i64
          %10 = llvm.mlir.constant(0 : index) : i64
          %11 = llvm.mlir.constant(128 : index) : i64
          %12 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %13 = llvm.extractvalue %12[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %14 = llvm.load %13 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%14, %5 : !llvm.ptr, i64)] : i1
          %15 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.extractvalue %15[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %17 = llvm.getelementptr %16[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.mul %11, %3 : i64
          %20 = llvm.udiv %19, %4 : i64
          %21 = llvm.getelementptr %18[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %6 ["align"(%21, %5 : !llvm.ptr, i64)] : i1
          llvm.br ^bb1(%10, %7 : i64, vector<1xf32>)
        ^bb1(%22: i64, %23: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %24 = llvm.icmp "slt" %22, %9 : i64
          llvm.cond_br %24, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %25 = llvm.getelementptr %14[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %26 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %27 = llvm.extractelement %23[%2 : i64] : vector<1xf32>
          %28 = "llvm.intr.vector.reduce.fadd"(%27, %26) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %29 = llvm.insertelement %28, %1[%0 : i32] : vector<1xf32>
          %30 = llvm.add %22, %8 : i64
          llvm.br ^bb1(%30, %29 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %31 = llvm.extractelement %23[%2 : i64] : vector<1xf32>
          llvm.store %31, %21 : f32, !llvm.ptr
          llvm.return %0 : i32
        }
        llvm.func @main_dispatch_29_elementwise_32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.poison : vector<4xf32>
          %2 = llvm.mlir.constant(0 : i64) : i64
          %3 = llvm.mlir.constant(8 : i64) : i64
          %4 = llvm.mlir.constant(32 : i64) : i64
          %5 = llvm.mlir.constant(64 : index) : i64
          %6 = llvm.mlir.constant(true) : i1
          %7 = llvm.mlir.constant(dense<3.200000e+01> : vector<f32>) : vector<1xf32>
          %8 = llvm.mlir.constant(4 : index) : i64
          %9 = llvm.mlir.constant(32 : index) : i64
          %10 = llvm.mlir.constant(0 : index) : i64
          %11 = llvm.mlir.constant(128 : index) : i64
          %12 = llvm.mlir.constant(192 : index) : i64
          %13 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.extractvalue %13[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %15 = llvm.load %14 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%15, %5 : !llvm.ptr, i64)] : i1
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.mul %11, %3 : i64
          %20 = llvm.udiv %19, %4 : i64
          %21 = llvm.getelementptr %18[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %6 ["align"(%21, %5 : !llvm.ptr, i64)] : i1
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %24 = llvm.getelementptr %23[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          %26 = llvm.mul %12, %3 : i64
          %27 = llvm.udiv %26, %4 : i64
          %28 = llvm.getelementptr %25[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %6 ["align"(%28, %5 : !llvm.ptr, i64)] : i1
          %29 = llvm.load %21 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %30 = llvm.fdiv %29, %7 : vector<1xf32>
          %31 = llvm.extractelement %30[%2 : i64] : vector<1xf32>
          %32 = llvm.insertelement %31, %1[%0 : i32] : vector<4xf32>
          %33 = llvm.shufflevector %32, %1 [0, 0, 0, 0] : vector<4xf32> 
          llvm.br ^bb1(%10 : i64)
        ^bb1(%34: i64):  // 2 preds: ^bb0, ^bb2
          %35 = llvm.icmp "slt" %34, %9 : i64
          llvm.cond_br %35, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %36 = llvm.getelementptr %15[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %37 = llvm.load %36 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %38 = llvm.fsub %37, %33 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %39 = llvm.getelementptr %28[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %38, %39 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %40 = llvm.add %34, %8 : i64
          llvm.br ^bb1(%40 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %0 : i32
        }
        llvm.func @main_dispatch_30_reduction_32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.poison : vector<1xf32>
          %2 = llvm.mlir.constant(0 : i64) : i64
          %3 = llvm.mlir.constant(64 : index) : i64
          %4 = llvm.mlir.constant(true) : i1
          %5 = llvm.mlir.constant(8 : i64) : i64
          %6 = llvm.mlir.constant(32 : i64) : i64
          %7 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %8 = llvm.mlir.constant(4 : index) : i64
          %9 = llvm.mlir.constant(32 : index) : i64
          %10 = llvm.mlir.constant(192 : index) : i64
          %11 = llvm.mlir.constant(0 : index) : i64
          %12 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %13 = llvm.extractvalue %12[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %14 = llvm.load %13 : !llvm.ptr -> !llvm.ptr
          %15 = llvm.mul %10, %5 : i64
          %16 = llvm.udiv %15, %6 : i64
          %17 = llvm.getelementptr %14[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %4 ["align"(%17, %3 : !llvm.ptr, i64)] : i1
          %18 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.extractvalue %18[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %20 = llvm.getelementptr %19[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %4 ["align"(%21, %3 : !llvm.ptr, i64)] : i1
          llvm.br ^bb1(%11, %7 : i64, vector<1xf32>)
        ^bb1(%22: i64, %23: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %24 = llvm.icmp "slt" %22, %9 : i64
          llvm.cond_br %24, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %25 = llvm.getelementptr %17[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %26 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %27 = llvm.extractelement %23[%2 : i64] : vector<1xf32>
          %28 = llvm.fmul %26, %26 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %29 = "llvm.intr.vector.reduce.fadd"(%27, %28) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
          %30 = llvm.insertelement %29, %1[%0 : i32] : vector<1xf32>
          %31 = llvm.add %22, %8 : i64
          llvm.br ^bb1(%31, %30 : i64, vector<1xf32>)
        ^bb3:  // pred: ^bb1
          %32 = llvm.extractelement %23[%2 : i64] : vector<1xf32>
          llvm.store %32, %21 : f32, !llvm.ptr
          llvm.return %0 : i32
        }
        llvm.mlir.global private constant @__constant_32xf32_0_3(dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.mlir.global private constant @__constant_32xf32_4(dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>) {addr_space = 0 : i32, alignment = 64 : i64, sym_visibility = "private"} : !llvm.array<32 x f32>
        llvm.func @main_dispatch_31_elementwise_32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.poison : vector<4xf32>
          %2 = llvm.mlir.constant(0 : i64) : i64
          %3 = llvm.mlir.constant(64 : index) : i64
          %4 = llvm.mlir.constant(true) : i1
          %5 = llvm.mlir.constant(8 : i64) : i64
          %6 = llvm.mlir.constant(32 : i64) : i64
          %7 = llvm.mlir.addressof @__constant_32xf32_0_3 : !llvm.ptr
          %8 = llvm.mlir.addressof @__constant_32xf32_4 : !llvm.ptr
          %9 = llvm.mlir.constant(32 : index) : i64
          %10 = llvm.mlir.constant(4 : index) : i64
          %11 = llvm.mlir.constant(dense<3.200000e+01> : vector<f32>) : vector<1xf32>
          %12 = llvm.mlir.constant(dense<9.99999997E-7> : vector<f32>) : vector<1xf32>
          %13 = llvm.mlir.constant(0 : index) : i64
          %14 = llvm.mlir.constant(192 : index) : i64
          %15 = llvm.getelementptr %8[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %16 = llvm.getelementptr %7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<32 x f32>
          %17 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %18 = llvm.extractvalue %17[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %19 = llvm.load %18 : !llvm.ptr -> !llvm.ptr
          %20 = llvm.mul %14, %5 : i64
          %21 = llvm.udiv %20, %6 : i64
          %22 = llvm.getelementptr %19[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.intr.assume %4 ["align"(%22, %3 : !llvm.ptr, i64)] : i1
          %23 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %24 = llvm.extractvalue %23[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %4 ["align"(%25, %3 : !llvm.ptr, i64)] : i1
          %26 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %27 = llvm.extractvalue %26[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %28 = llvm.getelementptr %27[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %29 = llvm.load %28 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %4 ["align"(%29, %3 : !llvm.ptr, i64)] : i1
          %30 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %31 = llvm.fdiv %30, %11 : vector<1xf32>
          %32 = llvm.fadd %31, %12 {fastmathFlags = #llvm.fastmath<contract>} : vector<1xf32>
          %33 = llvm.intr.sqrt(%32) : (vector<1xf32>) -> vector<1xf32>
          %34 = llvm.extractelement %33[%2 : i64] : vector<1xf32>
          %35 = llvm.insertelement %34, %1[%0 : i32] : vector<4xf32>
          %36 = llvm.shufflevector %35, %1 [0, 0, 0, 0] : vector<4xf32> 
          llvm.br ^bb1(%13 : i64)
        ^bb1(%37: i64):  // 2 preds: ^bb0, ^bb2
          %38 = llvm.icmp "slt" %37, %9 : i64
          llvm.cond_br %38, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %39 = llvm.getelementptr %22[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %40 = llvm.load %39 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %41 = llvm.getelementptr %16[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %42 = llvm.load %41 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %43 = llvm.getelementptr %15[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          %44 = llvm.load %43 {alignment = 4 : i64} : !llvm.ptr -> vector<4xf32>
          %45 = llvm.fdiv %40, %36 : vector<4xf32>
          %46 = llvm.fmul %45, %42 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %47 = llvm.fadd %46, %44 {fastmathFlags = #llvm.fastmath<contract>} : vector<4xf32>
          %48 = llvm.getelementptr %29[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %47, %48 {alignment = 4 : i64} : vector<4xf32>, !llvm.ptr
          %49 = llvm.add %37, %10 : i64
          llvm.br ^bb1(%49 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %0 : i32
        }
      }
    }
  }
  util.global private @__device_0 : !hal.device
  util.initializer {
    %c18_i32 = arith.constant 18 : i32
    %false = arith.constant false
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = util.null : !hal.device
    %device_count = hal.devices.count : index
    %1:3 = scf.while (%arg0 = %c0, %arg1 = %c0, %arg2 = %0) : (index, index, !hal.device) -> (index, index, !hal.device) {
      %3 = util.cmp.eq %arg2, %0 : !hal.device
      %4 = arith.cmpi slt, %arg0, %device_count : index
      %5 = arith.andi %3, %4 : i1
      scf.condition(%5) %arg0, %arg1, %arg2 : index, index, !hal.device
    } do {
    ^bb0(%arg0: index, %arg1: index, %arg2: !hal.device):
      %device_n = hal.devices.get %arg0 : !hal.device
      %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "local*") : i1, i1 = false
      %3 = scf.if %value -> (i1) {
        %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
        scf.yield %value_1 : i1
      } else {
        scf.yield %false : i1
      }
      %4 = arith.cmpi eq, %arg1, %c0 : index
      %5 = arith.select %3, %c1, %c0 : index
      %6 = arith.addi %arg1, %5 : index
      %7 = arith.andi %3, %4 : i1
      %8 = arith.select %7, %device_n, %0 : !hal.device
      %9 = arith.addi %arg0, %c1 : index
      scf.yield %9, %6, %8 : index, index, !hal.device
    }
    %2 = util.cmp.eq %1#2, %0 : !hal.device
    scf.if %2 {
      util.status.check_ok %c18_i32, "HAL device `__device_0` not found or unavailable: #hal.device.target<\22local\22, [#hal.executable.target<\22llvm-cpu\22, \22embedded-elf-x86_64\22, {cpu = \22westmere\22, cpu_features = \22+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu\22, data_layout = \22e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128\22, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = \22x86_64-unknown-unknown-eabi-elf\22}>]>"
    }
    util.global.store %1#2, @__device_0 : !hal.device
    util.return
  }
  util.global private @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1
  util.initializer {
    %__device_0 = util.global.load @__device_0 : !hal.device
    %ok, %value = hal.device.query<%__device_0 : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
    util.global.store %value, @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1
    util.return
  }
  util.global private @__device_0_executable_0_vit_linked : !hal.executable
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %c-1 = arith.constant -1 : index
    %c0 = arith.constant 0 : index
    %c14_i32 = arith.constant 14 : i32
    %0 = util.null : !hal.executable
    %__device_0_query_0_hal_executable_format_embedded_elf_x86_64 = util.global.load @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1
    %__device_0 = util.global.load @__device_0 : !hal.device
    %1 = arith.select %__device_0_query_0_hal_executable_format_embedded_elf_x86_64, %c0, %c-1 : index
    %2 = arith.cmpi eq, %1, %c0 : index
    %3 = scf.if %2 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_0 : !hal.device) affinity(%c-1_i64) target(@vit_linked::@embedded_elf_x86_64) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_0` does not support any variant of executable `vit_linked`; available formats: [embedded-elf-x86_64]"
      scf.yield %0 : !hal.executable
    }
    util.global.store %3, @__device_0_executable_0_vit_linked : !hal.executable
    util.return
  }
  util.global private @__device_1 : !hal.device
  util.initializer {
    %c18_i32 = arith.constant 18 : i32
    %false = arith.constant false
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = util.null : !hal.device
    %device_count = hal.devices.count : index
    %1:3 = scf.while (%arg0 = %c0, %arg1 = %c0, %arg2 = %0) : (index, index, !hal.device) -> (index, index, !hal.device) {
      %3 = util.cmp.eq %arg2, %0 : !hal.device
      %4 = arith.cmpi slt, %arg0, %device_count : index
      %5 = arith.andi %3, %4 : i1
      scf.condition(%5) %arg0, %arg1, %arg2 : index, index, !hal.device
    } do {
    ^bb0(%arg0: index, %arg1: index, %arg2: !hal.device):
      %device_n = hal.devices.get %arg0 : !hal.device
      %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "coralnpu") : i1, i1 = false
      %3 = scf.if %value -> (i1) {
        %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
        scf.yield %value_1 : i1
      } else {
        scf.yield %false : i1
      }
      %4 = arith.cmpi eq, %arg1, %c0 : index
      %5 = arith.select %3, %c1, %c0 : index
      %6 = arith.addi %arg1, %5 : index
      %7 = arith.andi %3, %4 : i1
      %8 = arith.select %7, %device_n, %0 : !hal.device
      %9 = arith.addi %arg0, %c1 : index
      scf.yield %9, %6, %8 : index, index, !hal.device
    }
    %2 = util.cmp.eq %1#2, %0 : !hal.device
    scf.if %2 {
      util.status.check_ok %c18_i32, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
    }
    util.global.store %1#2, @__device_1 : !hal.device
    util.return
  }
  util.global private @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  util.initializer {
    %__device_1 = util.global.load @__device_1 : !hal.device
    %ok, %value = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
    util.global.store %value, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
    util.return
  }
  util.global private @__device_1_executable_0_main_dispatch_1 : !hal.executable
  util.global private @__device_1_executable_1_main_dispatch_5 : !hal.executable
  util.global private @__device_1_executable_2_main_dispatch_6 : !hal.executable
  util.global private @__device_1_executable_3_main_dispatch_7 : !hal.executable
  util.global private @__device_1_executable_4_main_dispatch_8 : !hal.executable
  util.global private @__device_1_executable_5_main_dispatch_9 : !hal.executable
  util.global private @__device_1_executable_6_main_dispatch_10 : !hal.executable
  util.global private @__device_1_executable_7_main_dispatch_13 : !hal.executable
  util.global private @__device_1_executable_8_main_dispatch_14 : !hal.executable
  util.global private @__device_1_executable_9_main_dispatch_26 : !hal.executable
  util.global private @__device_1_executable_10_main_dispatch_32 : !hal.executable
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %c-1 = arith.constant -1 : index
    %c0 = arith.constant 0 : index
    %c14_i32 = arith.constant 14 : i32
    %0 = util.null : !hal.executable
    %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 = util.global.load @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
    %__device_1 = util.global.load @__device_1 : !hal.device
    %1 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %2 = arith.cmpi eq, %1, %c0 : index
    %3 = scf.if %2 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_1::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_1`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %4 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %5 = arith.cmpi eq, %4, %c0 : index
    %6 = scf.if %5 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_5::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_5`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %7 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %8 = arith.cmpi eq, %7, %c0 : index
    %9 = scf.if %8 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_6::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_6`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %10 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %11 = arith.cmpi eq, %10, %c0 : index
    %12 = scf.if %11 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_7::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_7`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %13 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %14 = arith.cmpi eq, %13, %c0 : index
    %15 = scf.if %14 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_8::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_8`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %16 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %17 = arith.cmpi eq, %16, %c0 : index
    %18 = scf.if %17 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_9::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_9`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %19 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %20 = arith.cmpi eq, %19, %c0 : index
    %21 = scf.if %20 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_10::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_10`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %22 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %23 = arith.cmpi eq, %22, %c0 : index
    %24 = scf.if %23 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_13::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_13`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %25 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %26 = arith.cmpi eq, %25, %c0 : index
    %27 = scf.if %26 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_14::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_14`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %28 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %29 = arith.cmpi eq, %28, %c0 : index
    %30 = scf.if %29 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_26::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_26`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    %31 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
    %32 = arith.cmpi eq, %31, %c0 : index
    %33 = scf.if %32 -> (!hal.executable) {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_32::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    } else {
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_32`; available formats: [embedded-elf-riscv_32]"
      scf.yield %0 : !hal.executable
    }
    util.global.store %3, @__device_1_executable_0_main_dispatch_1 : !hal.executable
    util.global.store %33, @__device_1_executable_10_main_dispatch_32 : !hal.executable
    util.global.store %6, @__device_1_executable_1_main_dispatch_5 : !hal.executable
    util.global.store %9, @__device_1_executable_2_main_dispatch_6 : !hal.executable
    util.global.store %12, @__device_1_executable_3_main_dispatch_7 : !hal.executable
    util.global.store %15, @__device_1_executable_4_main_dispatch_8 : !hal.executable
    util.global.store %18, @__device_1_executable_5_main_dispatch_9 : !hal.executable
    util.global.store %21, @__device_1_executable_6_main_dispatch_10 : !hal.executable
    util.global.store %24, @__device_1_executable_7_main_dispatch_13 : !hal.executable
    util.global.store %27, @__device_1_executable_8_main_dispatch_14 : !hal.executable
    util.global.store %30, @__device_1_executable_9_main_dispatch_26 : !hal.executable
    util.return
  }
  util.global private @__hoisted_tensor_32xf32 : !hal.buffer
  util.global private @__hoisted_tensor_32xf32_2 : !hal.buffer
  util.initializer {
    %c-1_i32 = arith.constant -1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c-1_i64 = arith.constant -1 : i64
    %c0 = arith.constant 0 : index
    %c94336 = arith.constant 94336 : index
    %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #composite_of_94336b
    %c0_i64 = arith.constant 0 : i64
    %0 = util.null : !hal.fence
    %buffer_cst_0 = util.buffer.constant {alignment = 64 : index} : !util.buffer = #composite_of_2304b
    %c2304 = arith.constant 2304 : index
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %allocator = hal.device.allocator<%__device_0 : !hal.device> : !hal.allocator
    %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst_0 : !util.buffer)[%c0, %c2304] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
    cf.cond_br %did_import, ^bb2(%0, %mapped : !hal.fence, !hal.buffer), ^bb1
  ^bb1:  // pred: ^bb0
    %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c2304}
    %memory_file = hal.ex.file.from_memory device(%__device_0 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst_0 : !util.buffer)[%c0 for %c2304] flags(%c0_i32) : !hal.file
    %fence = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.read<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) source(%memory_file : !hal.file)[%c0_i64] target(%buffer : !hal.buffer)[%c0] length(%c2304) flags("None")
    cf.br ^bb2(%fence, %buffer : !hal.fence, !hal.buffer)
  ^bb2(%1: !hal.fence, %2: !hal.buffer):  // 2 preds: ^bb0, ^bb1
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %allocator_1 = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
    %did_import_2, %mapped_3 = hal.allocator.import<%allocator_1 : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c94336] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
    cf.cond_br %did_import_2, ^bb4(%0, %mapped_3 : !hal.fence, !hal.buffer), ^bb3
  ^bb3:  // pred: ^bb2
    %buffer_4 = hal.allocator.allocate<%allocator_1 : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c94336}
    %memory_file_5 = hal.ex.file.from_memory device(%__device_1 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst : !util.buffer)[%c0 for %c94336] flags(%c0_i32) : !hal.file
    %fence_6 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.read<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence_6) source(%memory_file_5 : !hal.file)[%c0_i64] target(%buffer_4 : !hal.buffer)[%c0] length(%c94336) flags("None")
    cf.br ^bb4(%fence_6, %buffer_4 : !hal.fence, !hal.buffer)
  ^bb4(%3: !hal.fence, %4: !hal.buffer):  // 2 preds: ^bb2, ^bb3
    %status = hal.fence.await until([%1]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    %status_7 = hal.fence.await until([%3]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status_7, "failed to wait on timepoint"
    util.global.store %4, @__hoisted_tensor_32xf32 : !hal.buffer
    util.global.store %2, @__hoisted_tensor_32xf32_2 : !hal.buffer
    util.return
  }
  hal.executable private @main_dispatch_1 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_1_matmul_16x32x192_f32 ordinal(0) layout(#pipeline_layout1) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_1_matmul_16x32x192_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i32) : i32
          %1 = llvm.mlir.constant(6 : i32) : i32
          %2 = llvm.mlir.constant(5 : i32) : i32
          %3 = llvm.mlir.constant(4 : i32) : i32
          %4 = llvm.mlir.constant(3 : i32) : i32
          %5 = llvm.mlir.constant(2 : i32) : i32
          %6 = llvm.mlir.constant(1 : i32) : i32
          %7 = llvm.mlir.poison : vector<8xf32>
          %8 = llvm.mlir.constant(0 : i32) : i32
          %9 = llvm.mlir.constant(32 : index) : i32
          %10 = llvm.mlir.constant(8 : i32) : i32
          %11 = llvm.mlir.constant(32 : i32) : i32
          %12 = llvm.mlir.constant(64 : index) : i32
          %13 = llvm.mlir.constant(true) : i1
          %14 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %15 = llvm.mlir.constant(-1 : index) : i32
          %16 = llvm.mlir.constant(7 : index) : i32
          %17 = llvm.mlir.constant(6 : index) : i32
          %18 = llvm.mlir.constant(5 : index) : i32
          %19 = llvm.mlir.constant(4 : index) : i32
          %20 = llvm.mlir.constant(3 : index) : i32
          %21 = llvm.mlir.constant(2 : index) : i32
          %22 = llvm.mlir.constant(dense<0.000000e+00> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %23 = llvm.mlir.constant(8 : index) : i32
          %24 = llvm.mlir.constant(16 : index) : i32
          %25 = llvm.mlir.constant(1 : index) : i32
          %26 = llvm.mlir.constant(192 : index) : i32
          %27 = llvm.mlir.constant(0 : index) : i32
          %28 = llvm.mlir.constant(69760 : index) : i32
          %29 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %30 = llvm.extractvalue %29[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %31 = llvm.load %30 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %13 ["align"(%31, %12 : !llvm.ptr, i32)] : i1
          %32 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %33 = llvm.extractvalue %32[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %34 = llvm.getelementptr %33[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %35 = llvm.load %34 : !llvm.ptr -> !llvm.ptr
          %36 = llvm.mul %28, %10 : i32
          %37 = llvm.udiv %36, %11 : i32
          %38 = llvm.getelementptr %35[%37] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %13 ["align"(%38, %12 : !llvm.ptr, i32)] : i1
          %39 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %40 = llvm.extractvalue %39[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %41 = llvm.getelementptr %40[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %42 = llvm.load %41 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %13 ["align"(%42, %12 : !llvm.ptr, i32)] : i1
          %43 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %44 = llvm.extractvalue %43[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %45 = llvm.getelementptr %44[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %46 = llvm.load %45 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %13 ["align"(%46, %12 : !llvm.ptr, i32)] : i1
          %47 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %48 = llvm.extractvalue %47[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %49 = llvm.sdiv %48, %21 : i32
          %50 = llvm.mul %49, %21 : i32
          %51 = llvm.icmp "ne" %48, %50 : i32
          %52 = llvm.icmp "slt" %48, %27 : i32
          %53 = llvm.and %51, %52 : i1
          %54 = llvm.add %49, %15 : i32
          %55 = llvm.select %53, %54, %49 : i1, i32
          %56 = llvm.srem %48, %21 : i32
          %57 = llvm.icmp "slt" %56, %27 : i32
          %58 = llvm.add %56, %21 overflow<nsw> : i32
          %59 = llvm.select %57, %58, %56 : i1, i32
          %60 = llvm.mul %55, %23 overflow<nsw> : i32
          %61 = llvm.mul %59, %24 overflow<nsw> : i32
          llvm.br ^bb1(%27 : i32)
        ^bb1(%62: i32):  // 2 preds: ^bb0, ^bb4
          %63 = llvm.icmp "slt" %62, %24 : i32
          llvm.cond_br %63, ^bb2(%27, %22 : i32, !llvm.array<8 x vector<8xf32>>), ^bb5
        ^bb2(%64: i32, %65: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb1, ^bb3
          %66 = llvm.icmp "slt" %64, %26 : i32
          llvm.cond_br %66, ^bb3, ^bb4
        ^bb3:  // pred: ^bb2
          %67 = llvm.add %62, %61 : i32
          %68 = llvm.mul %67, %26 : i32
          %69 = llvm.add %68, %64 : i32
          %70 = llvm.getelementptr %38[%69] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %71 = llvm.load %70 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %72 = llvm.add %67, %25 : i32
          %73 = llvm.mul %72, %26 : i32
          %74 = llvm.add %73, %64 : i32
          %75 = llvm.getelementptr %38[%74] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %76 = llvm.load %75 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %77 = llvm.add %67, %21 : i32
          %78 = llvm.mul %77, %26 : i32
          %79 = llvm.add %78, %64 : i32
          %80 = llvm.getelementptr %38[%79] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %81 = llvm.load %80 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %82 = llvm.add %67, %20 : i32
          %83 = llvm.mul %82, %26 : i32
          %84 = llvm.add %83, %64 : i32
          %85 = llvm.getelementptr %38[%84] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %86 = llvm.load %85 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %87 = llvm.add %67, %19 : i32
          %88 = llvm.mul %87, %26 : i32
          %89 = llvm.add %88, %64 : i32
          %90 = llvm.getelementptr %38[%89] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %91 = llvm.load %90 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %92 = llvm.add %67, %18 : i32
          %93 = llvm.mul %92, %26 : i32
          %94 = llvm.add %93, %64 : i32
          %95 = llvm.getelementptr %38[%94] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %96 = llvm.load %95 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %97 = llvm.add %67, %17 : i32
          %98 = llvm.mul %97, %26 : i32
          %99 = llvm.add %98, %64 : i32
          %100 = llvm.getelementptr %38[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %101 = llvm.load %100 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %102 = llvm.add %67, %16 : i32
          %103 = llvm.mul %102, %26 : i32
          %104 = llvm.add %103, %64 : i32
          %105 = llvm.getelementptr %38[%104] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %106 = llvm.load %105 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %107 = llvm.extractelement %71[%8 : i32] : vector<1xf32>
          %108 = llvm.extractelement %76[%8 : i32] : vector<1xf32>
          %109 = llvm.extractelement %81[%8 : i32] : vector<1xf32>
          %110 = llvm.extractelement %86[%8 : i32] : vector<1xf32>
          %111 = llvm.extractelement %91[%8 : i32] : vector<1xf32>
          %112 = llvm.extractelement %96[%8 : i32] : vector<1xf32>
          %113 = llvm.extractelement %101[%8 : i32] : vector<1xf32>
          %114 = llvm.extractelement %106[%8 : i32] : vector<1xf32>
          %115 = llvm.insertelement %107, %7[%8 : i32] : vector<8xf32>
          %116 = llvm.insertelement %108, %115[%6 : i32] : vector<8xf32>
          %117 = llvm.insertelement %109, %116[%5 : i32] : vector<8xf32>
          %118 = llvm.insertelement %110, %117[%4 : i32] : vector<8xf32>
          %119 = llvm.insertelement %111, %118[%3 : i32] : vector<8xf32>
          %120 = llvm.insertelement %112, %119[%2 : i32] : vector<8xf32>
          %121 = llvm.insertelement %113, %120[%1 : i32] : vector<8xf32>
          %122 = llvm.insertelement %114, %121[%0 : i32] : vector<8xf32>
          %123 = llvm.mul %60, %26 overflow<nsw, nuw> : i32
          %124 = llvm.add %123, %64 overflow<nsw, nuw> : i32
          %125 = llvm.getelementptr inbounds|nuw %31[%124] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %126 = llvm.load %125 : !llvm.ptr -> f32
          %127 = llvm.insertelement %126, %7[%8 : i32] : vector<8xf32>
          %128 = llvm.shufflevector %127, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %129 = llvm.extractvalue %65[0] : !llvm.array<8 x vector<8xf32>> 
          %130 = llvm.intr.fmuladd(%128, %122, %129) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %131 = llvm.add %60, %25 : i32
          %132 = llvm.mul %131, %26 overflow<nsw, nuw> : i32
          %133 = llvm.add %132, %64 overflow<nsw, nuw> : i32
          %134 = llvm.getelementptr inbounds|nuw %31[%133] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %135 = llvm.load %134 : !llvm.ptr -> f32
          %136 = llvm.insertelement %135, %7[%8 : i32] : vector<8xf32>
          %137 = llvm.shufflevector %136, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %138 = llvm.extractvalue %65[1] : !llvm.array<8 x vector<8xf32>> 
          %139 = llvm.intr.fmuladd(%137, %122, %138) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %140 = llvm.add %60, %21 : i32
          %141 = llvm.mul %140, %26 overflow<nsw, nuw> : i32
          %142 = llvm.add %141, %64 overflow<nsw, nuw> : i32
          %143 = llvm.getelementptr inbounds|nuw %31[%142] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %144 = llvm.load %143 : !llvm.ptr -> f32
          %145 = llvm.insertelement %144, %7[%8 : i32] : vector<8xf32>
          %146 = llvm.shufflevector %145, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %147 = llvm.extractvalue %65[2] : !llvm.array<8 x vector<8xf32>> 
          %148 = llvm.intr.fmuladd(%146, %122, %147) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %149 = llvm.add %60, %20 : i32
          %150 = llvm.mul %149, %26 overflow<nsw, nuw> : i32
          %151 = llvm.add %150, %64 overflow<nsw, nuw> : i32
          %152 = llvm.getelementptr inbounds|nuw %31[%151] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %153 = llvm.load %152 : !llvm.ptr -> f32
          %154 = llvm.insertelement %153, %7[%8 : i32] : vector<8xf32>
          %155 = llvm.shufflevector %154, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %156 = llvm.extractvalue %65[3] : !llvm.array<8 x vector<8xf32>> 
          %157 = llvm.intr.fmuladd(%155, %122, %156) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %158 = llvm.add %60, %19 : i32
          %159 = llvm.mul %158, %26 overflow<nsw, nuw> : i32
          %160 = llvm.add %159, %64 overflow<nsw, nuw> : i32
          %161 = llvm.getelementptr inbounds|nuw %31[%160] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %162 = llvm.load %161 : !llvm.ptr -> f32
          %163 = llvm.insertelement %162, %7[%8 : i32] : vector<8xf32>
          %164 = llvm.shufflevector %163, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %165 = llvm.extractvalue %65[4] : !llvm.array<8 x vector<8xf32>> 
          %166 = llvm.intr.fmuladd(%164, %122, %165) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %167 = llvm.add %60, %18 : i32
          %168 = llvm.mul %167, %26 overflow<nsw, nuw> : i32
          %169 = llvm.add %168, %64 overflow<nsw, nuw> : i32
          %170 = llvm.getelementptr inbounds|nuw %31[%169] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %171 = llvm.load %170 : !llvm.ptr -> f32
          %172 = llvm.insertelement %171, %7[%8 : i32] : vector<8xf32>
          %173 = llvm.shufflevector %172, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %174 = llvm.extractvalue %65[5] : !llvm.array<8 x vector<8xf32>> 
          %175 = llvm.intr.fmuladd(%173, %122, %174) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %176 = llvm.add %60, %17 : i32
          %177 = llvm.mul %176, %26 overflow<nsw, nuw> : i32
          %178 = llvm.add %177, %64 overflow<nsw, nuw> : i32
          %179 = llvm.getelementptr inbounds|nuw %31[%178] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %180 = llvm.load %179 : !llvm.ptr -> f32
          %181 = llvm.insertelement %180, %7[%8 : i32] : vector<8xf32>
          %182 = llvm.shufflevector %181, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %183 = llvm.extractvalue %65[6] : !llvm.array<8 x vector<8xf32>> 
          %184 = llvm.intr.fmuladd(%182, %122, %183) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %185 = llvm.add %60, %16 : i32
          %186 = llvm.mul %185, %26 overflow<nsw, nuw> : i32
          %187 = llvm.add %186, %64 overflow<nsw, nuw> : i32
          %188 = llvm.getelementptr inbounds|nuw %31[%187] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %189 = llvm.load %188 : !llvm.ptr -> f32
          %190 = llvm.insertelement %189, %7[%8 : i32] : vector<8xf32>
          %191 = llvm.shufflevector %190, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %192 = llvm.extractvalue %65[7] : !llvm.array<8 x vector<8xf32>> 
          %193 = llvm.intr.fmuladd(%191, %122, %192) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %194 = llvm.insertvalue %130, %14[0] : !llvm.array<8 x vector<8xf32>> 
          %195 = llvm.insertvalue %139, %194[1] : !llvm.array<8 x vector<8xf32>> 
          %196 = llvm.insertvalue %148, %195[2] : !llvm.array<8 x vector<8xf32>> 
          %197 = llvm.insertvalue %157, %196[3] : !llvm.array<8 x vector<8xf32>> 
          %198 = llvm.insertvalue %166, %197[4] : !llvm.array<8 x vector<8xf32>> 
          %199 = llvm.insertvalue %175, %198[5] : !llvm.array<8 x vector<8xf32>> 
          %200 = llvm.insertvalue %184, %199[6] : !llvm.array<8 x vector<8xf32>> 
          %201 = llvm.insertvalue %193, %200[7] : !llvm.array<8 x vector<8xf32>> 
          %202 = llvm.add %64, %25 : i32
          llvm.br ^bb2(%202, %201 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb4:  // pred: ^bb2
          %203 = llvm.add %62, %61 : i32
          %204 = llvm.getelementptr %42[%203] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %205 = llvm.load %204 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
          %206 = llvm.extractvalue %65[0] : !llvm.array<8 x vector<8xf32>> 
          %207 = llvm.fadd %206, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %208 = llvm.extractvalue %65[1] : !llvm.array<8 x vector<8xf32>> 
          %209 = llvm.fadd %208, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %210 = llvm.extractvalue %65[2] : !llvm.array<8 x vector<8xf32>> 
          %211 = llvm.fadd %210, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %212 = llvm.extractvalue %65[3] : !llvm.array<8 x vector<8xf32>> 
          %213 = llvm.fadd %212, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %214 = llvm.extractvalue %65[4] : !llvm.array<8 x vector<8xf32>> 
          %215 = llvm.fadd %214, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %216 = llvm.extractvalue %65[5] : !llvm.array<8 x vector<8xf32>> 
          %217 = llvm.fadd %216, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %218 = llvm.extractvalue %65[6] : !llvm.array<8 x vector<8xf32>> 
          %219 = llvm.fadd %218, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %220 = llvm.extractvalue %65[7] : !llvm.array<8 x vector<8xf32>> 
          %221 = llvm.fadd %220, %205 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %222 = llvm.mul %60, %9 : i32
          %223 = llvm.add %222, %203 : i32
          %224 = llvm.getelementptr %46[%223] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %207, %224 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %225 = llvm.add %60, %25 : i32
          %226 = llvm.mul %225, %9 : i32
          %227 = llvm.add %226, %203 : i32
          %228 = llvm.getelementptr %46[%227] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %209, %228 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %229 = llvm.add %60, %21 : i32
          %230 = llvm.mul %229, %9 : i32
          %231 = llvm.add %230, %203 : i32
          %232 = llvm.getelementptr %46[%231] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %211, %232 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %233 = llvm.add %60, %20 : i32
          %234 = llvm.mul %233, %9 : i32
          %235 = llvm.add %234, %203 : i32
          %236 = llvm.getelementptr %46[%235] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %213, %236 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %237 = llvm.add %60, %19 : i32
          %238 = llvm.mul %237, %9 : i32
          %239 = llvm.add %238, %203 : i32
          %240 = llvm.getelementptr %46[%239] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %215, %240 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %241 = llvm.add %60, %18 : i32
          %242 = llvm.mul %241, %9 : i32
          %243 = llvm.add %242, %203 : i32
          %244 = llvm.getelementptr %46[%243] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %217, %244 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %245 = llvm.add %60, %17 : i32
          %246 = llvm.mul %245, %9 : i32
          %247 = llvm.add %246, %203 : i32
          %248 = llvm.getelementptr %46[%247] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %219, %248 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %249 = llvm.add %60, %16 : i32
          %250 = llvm.mul %249, %9 : i32
          %251 = llvm.add %250, %203 : i32
          %252 = llvm.getelementptr %46[%251] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %221, %252 {alignment = 4 : i64} : vector<8xf32>, !llvm.ptr
          %253 = llvm.add %62, %23 : i32
          llvm.br ^bb1(%253 : i32) {loop_annotation = #loop_annotation}
        ^bb5:  // pred: ^bb1
          llvm.return %8 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_5 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_5_matmul_17x96x32_f32 ordinal(0) layout(#pipeline_layout3) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_5_matmul_17x96x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i64) : i64
          %1 = llvm.mlir.constant(6 : i64) : i64
          %2 = llvm.mlir.constant(5 : i64) : i64
          %3 = llvm.mlir.constant(4 : i64) : i64
          %4 = llvm.mlir.constant(3 : i64) : i64
          %5 = llvm.mlir.constant(2 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(7 : i32) : i32
          %9 = llvm.mlir.constant(6 : i32) : i32
          %10 = llvm.mlir.constant(5 : i32) : i32
          %11 = llvm.mlir.constant(4 : i32) : i32
          %12 = llvm.mlir.constant(3 : i32) : i32
          %13 = llvm.mlir.constant(2 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.poison : vector<8xi32>
          %17 = llvm.mlir.constant(64 : index) : i32
          %18 = llvm.mlir.constant(true) : i1
          %19 = llvm.mlir.constant(8 : i32) : i32
          %20 = llvm.mlir.constant(32 : i32) : i32
          %21 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %22 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %23 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %24 = llvm.mlir.constant(-16 : index) : i32
          %25 = llvm.mlir.constant(17 : index) : i32
          %26 = llvm.mlir.constant(16 : index) : i32
          %27 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %28 = llvm.mlir.poison : vector<8xf32>
          %29 = llvm.mlir.constant(7 : index) : i32
          %30 = llvm.mlir.constant(6 : index) : i32
          %31 = llvm.mlir.constant(5 : index) : i32
          %32 = llvm.mlir.constant(4 : index) : i32
          %33 = llvm.mlir.constant(3 : index) : i32
          %34 = llvm.mlir.constant(2 : index) : i32
          %35 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %36 = llvm.mlir.constant(8 : index) : i32
          %37 = llvm.mlir.constant(96 : index) : i32
          %38 = llvm.mlir.constant(1 : index) : i32
          %39 = llvm.mlir.constant(32 : index) : i32
          %40 = llvm.mlir.constant(0 : index) : i32
          %41 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %42 = llvm.extractvalue %41[9] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %43 = llvm.load %42 : !llvm.ptr -> i32
          %44 = llvm.getelementptr %42[1] : (!llvm.ptr) -> !llvm.ptr, i32
          %45 = llvm.load %44 : !llvm.ptr -> i32
          %46 = llvm.extractvalue %41[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %47 = llvm.load %46 : !llvm.ptr -> !llvm.ptr
          %48 = llvm.mul %43, %19 : i32
          %49 = llvm.udiv %48, %20 : i32
          %50 = llvm.getelementptr %47[%49] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %18 ["align"(%50, %17 : !llvm.ptr, i32)] : i1
          %51 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %52 = llvm.extractvalue %51[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %53 = llvm.getelementptr %52[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %54 = llvm.load %53 : !llvm.ptr -> !llvm.ptr
          %55 = llvm.mul %45, %19 : i32
          %56 = llvm.udiv %55, %20 : i32
          %57 = llvm.getelementptr %54[%56] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %18 ["align"(%57, %17 : !llvm.ptr, i32)] : i1
          %58 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %59 = llvm.extractvalue %58[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %60 = llvm.getelementptr %59[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %61 = llvm.load %60 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %18 ["align"(%61, %17 : !llvm.ptr, i32)] : i1
          %62 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %63 = llvm.extractvalue %62[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %64 = llvm.mul %63, %26 overflow<nsw> : i32
          %65 = llvm.mul %63, %24 overflow<nsw> : i32
          %66 = llvm.add %65, %25 : i32
          %67 = llvm.icmp "slt" %66, %26 : i32
          %68 = llvm.select %67, %66, %26 : i1, i32
          %69 = llvm.icmp "sgt" %68, %40 : i32
          llvm.cond_br %69, ^bb1(%40 : i32), ^bb14
        ^bb1(%70: i32):  // 2 preds: ^bb0, ^bb13
          %71 = llvm.icmp "slt" %70, %68 : i32
          llvm.cond_br %71, ^bb2, ^bb14
        ^bb2:  // pred: ^bb1
          %72 = llvm.sub %68, %70 : i32
          %73 = llvm.icmp "slt" %72, %36 : i32
          %74 = llvm.select %73, %72, %36 : i1, i32
          %75 = llvm.icmp "sgt" %74, %40 : i32
          %76 = llvm.select %75, %23, %22 : i1, vector<8xi1>
          %77 = llvm.icmp "sgt" %74, %38 : i32
          %78 = llvm.select %77, %23, %22 : i1, vector<8xi1>
          %79 = llvm.icmp "sgt" %74, %34 : i32
          %80 = llvm.select %79, %23, %22 : i1, vector<8xi1>
          %81 = llvm.icmp "sgt" %74, %33 : i32
          %82 = llvm.select %81, %23, %22 : i1, vector<8xi1>
          %83 = llvm.icmp "sgt" %74, %32 : i32
          %84 = llvm.select %83, %23, %22 : i1, vector<8xi1>
          %85 = llvm.icmp "sgt" %74, %31 : i32
          %86 = llvm.select %85, %23, %22 : i1, vector<8xi1>
          %87 = llvm.icmp "sgt" %74, %30 : i32
          %88 = llvm.select %87, %23, %22 : i1, vector<8xi1>
          %89 = llvm.icmp "sgt" %74, %29 : i32
          %90 = llvm.select %89, %23, %22 : i1, vector<8xi1>
          %91 = llvm.add %70, %64 : i32
          llvm.br ^bb3(%40 : i32)
        ^bb3(%92: i32):  // 2 preds: ^bb2, ^bb12
          %93 = llvm.icmp "slt" %92, %37 : i32
          llvm.cond_br %93, ^bb4, ^bb13
        ^bb4:  // pred: ^bb3
          %94 = llvm.mul %91, %37 : i32
          %95 = llvm.add %94, %92 : i32
          %96 = llvm.getelementptr %61[%95] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %96, %76 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %97 = llvm.add %91, %38 : i32
          %98 = llvm.mul %97, %37 : i32
          %99 = llvm.add %98, %92 : i32
          %100 = llvm.getelementptr %61[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %100, %78 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %101 = llvm.add %91, %34 : i32
          %102 = llvm.mul %101, %37 : i32
          %103 = llvm.add %102, %92 : i32
          %104 = llvm.getelementptr %61[%103] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %104, %80 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %105 = llvm.add %91, %33 : i32
          %106 = llvm.mul %105, %37 : i32
          %107 = llvm.add %106, %92 : i32
          %108 = llvm.getelementptr %61[%107] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %108, %82 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %109 = llvm.add %91, %32 : i32
          %110 = llvm.mul %109, %37 : i32
          %111 = llvm.add %110, %92 : i32
          %112 = llvm.getelementptr %61[%111] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %112, %84 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %113 = llvm.add %91, %31 : i32
          %114 = llvm.mul %113, %37 : i32
          %115 = llvm.add %114, %92 : i32
          %116 = llvm.getelementptr %61[%115] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %116, %86 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %117 = llvm.add %91, %30 : i32
          %118 = llvm.mul %117, %37 : i32
          %119 = llvm.add %118, %92 : i32
          %120 = llvm.getelementptr %61[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %120, %88 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %121 = llvm.add %91, %29 : i32
          %122 = llvm.mul %121, %37 : i32
          %123 = llvm.add %122, %92 : i32
          %124 = llvm.getelementptr %61[%123] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %35, %124, %90 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %125 = llvm.intr.masked.load %96, %76, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %126 = llvm.intr.masked.load %100, %78, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %127 = llvm.intr.masked.load %104, %80, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %128 = llvm.intr.masked.load %108, %82, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %129 = llvm.intr.masked.load %112, %84, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %130 = llvm.intr.masked.load %116, %86, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %131 = llvm.intr.masked.load %120, %88, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %132 = llvm.intr.masked.load %124, %90, %28 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %133 = llvm.insertvalue %125, %21[0] : !llvm.array<8 x vector<8xf32>> 
          %134 = llvm.insertvalue %126, %133[1] : !llvm.array<8 x vector<8xf32>> 
          %135 = llvm.insertvalue %127, %134[2] : !llvm.array<8 x vector<8xf32>> 
          %136 = llvm.insertvalue %128, %135[3] : !llvm.array<8 x vector<8xf32>> 
          %137 = llvm.insertvalue %129, %136[4] : !llvm.array<8 x vector<8xf32>> 
          %138 = llvm.insertvalue %130, %137[5] : !llvm.array<8 x vector<8xf32>> 
          %139 = llvm.insertvalue %131, %138[6] : !llvm.array<8 x vector<8xf32>> 
          %140 = llvm.insertvalue %132, %139[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%40, %140 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%141: i32, %142: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %143 = llvm.icmp "slt" %141, %39 : i32
          llvm.cond_br %143, ^bb6, ^bb12
        ^bb6:  // pred: ^bb5
          %144 = llvm.insertelement %74, %16[%15 : i32] : vector<8xi32>
          %145 = llvm.shufflevector %144, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %146 = llvm.icmp "sgt" %145, %27 : vector<8xi32>
          llvm.br ^bb7(%40, %28 : i32, vector<8xf32>)
        ^bb7(%147: i32, %148: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %149 = llvm.icmp "slt" %147, %36 : i32
          llvm.cond_br %149, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %150 = llvm.extractelement %146[%147 : i32] : vector<8xi1>
          llvm.cond_br %150, ^bb9, ^bb10(%148 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %151 = llvm.add %91, %147 : i32
          %152 = llvm.mul %151, %39 overflow<nsw, nuw> : i32
          %153 = llvm.add %152, %141 overflow<nsw, nuw> : i32
          %154 = llvm.getelementptr inbounds|nuw %50[%153] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %155 = llvm.load %154 : !llvm.ptr -> f32
          %156 = llvm.insertelement %155, %148[%147 : i32] : vector<8xf32>
          llvm.br ^bb10(%156 : vector<8xf32>)
        ^bb10(%157: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %158 = llvm.add %147, %38 : i32
          llvm.br ^bb7(%158, %157 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %159 = llvm.mul %92, %39 : i32
          %160 = llvm.add %159, %141 : i32
          %161 = llvm.getelementptr %57[%160] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %162 = llvm.load %161 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %163 = llvm.add %92, %38 : i32
          %164 = llvm.mul %163, %39 : i32
          %165 = llvm.add %164, %141 : i32
          %166 = llvm.getelementptr %57[%165] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %167 = llvm.load %166 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %168 = llvm.add %92, %34 : i32
          %169 = llvm.mul %168, %39 : i32
          %170 = llvm.add %169, %141 : i32
          %171 = llvm.getelementptr %57[%170] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %172 = llvm.load %171 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %173 = llvm.add %92, %33 : i32
          %174 = llvm.mul %173, %39 : i32
          %175 = llvm.add %174, %141 : i32
          %176 = llvm.getelementptr %57[%175] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %177 = llvm.load %176 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %178 = llvm.add %92, %32 : i32
          %179 = llvm.mul %178, %39 : i32
          %180 = llvm.add %179, %141 : i32
          %181 = llvm.getelementptr %57[%180] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %182 = llvm.load %181 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %183 = llvm.add %92, %31 : i32
          %184 = llvm.mul %183, %39 : i32
          %185 = llvm.add %184, %141 : i32
          %186 = llvm.getelementptr %57[%185] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %187 = llvm.load %186 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %188 = llvm.add %92, %30 : i32
          %189 = llvm.mul %188, %39 : i32
          %190 = llvm.add %189, %141 : i32
          %191 = llvm.getelementptr %57[%190] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %192 = llvm.load %191 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %193 = llvm.add %92, %29 : i32
          %194 = llvm.mul %193, %39 : i32
          %195 = llvm.add %194, %141 : i32
          %196 = llvm.getelementptr %57[%195] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %197 = llvm.load %196 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %198 = llvm.extractelement %162[%15 : i32] : vector<1xf32>
          %199 = llvm.extractelement %167[%15 : i32] : vector<1xf32>
          %200 = llvm.extractelement %172[%15 : i32] : vector<1xf32>
          %201 = llvm.extractelement %177[%15 : i32] : vector<1xf32>
          %202 = llvm.extractelement %182[%15 : i32] : vector<1xf32>
          %203 = llvm.extractelement %187[%15 : i32] : vector<1xf32>
          %204 = llvm.extractelement %192[%15 : i32] : vector<1xf32>
          %205 = llvm.extractelement %197[%15 : i32] : vector<1xf32>
          %206 = llvm.insertelement %198, %28[%15 : i32] : vector<8xf32>
          %207 = llvm.insertelement %199, %206[%14 : i32] : vector<8xf32>
          %208 = llvm.insertelement %200, %207[%13 : i32] : vector<8xf32>
          %209 = llvm.insertelement %201, %208[%12 : i32] : vector<8xf32>
          %210 = llvm.insertelement %202, %209[%11 : i32] : vector<8xf32>
          %211 = llvm.insertelement %203, %210[%10 : i32] : vector<8xf32>
          %212 = llvm.insertelement %204, %211[%9 : i32] : vector<8xf32>
          %213 = llvm.insertelement %205, %212[%8 : i32] : vector<8xf32>
          %214 = llvm.extractelement %148[%7 : i64] : vector<8xf32>
          %215 = llvm.insertelement %214, %28[%15 : i32] : vector<8xf32>
          %216 = llvm.shufflevector %215, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %217 = llvm.extractvalue %142[0] : !llvm.array<8 x vector<8xf32>> 
          %218 = llvm.intr.fmuladd(%216, %213, %217) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %219 = llvm.select %76, %218, %217 : vector<8xi1>, vector<8xf32>
          %220 = llvm.extractelement %148[%6 : i64] : vector<8xf32>
          %221 = llvm.insertelement %220, %28[%15 : i32] : vector<8xf32>
          %222 = llvm.shufflevector %221, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %223 = llvm.extractvalue %142[1] : !llvm.array<8 x vector<8xf32>> 
          %224 = llvm.intr.fmuladd(%222, %213, %223) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %225 = llvm.select %78, %224, %223 : vector<8xi1>, vector<8xf32>
          %226 = llvm.extractelement %148[%5 : i64] : vector<8xf32>
          %227 = llvm.insertelement %226, %28[%15 : i32] : vector<8xf32>
          %228 = llvm.shufflevector %227, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %229 = llvm.extractvalue %142[2] : !llvm.array<8 x vector<8xf32>> 
          %230 = llvm.intr.fmuladd(%228, %213, %229) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %231 = llvm.select %80, %230, %229 : vector<8xi1>, vector<8xf32>
          %232 = llvm.extractelement %148[%4 : i64] : vector<8xf32>
          %233 = llvm.insertelement %232, %28[%15 : i32] : vector<8xf32>
          %234 = llvm.shufflevector %233, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %235 = llvm.extractvalue %142[3] : !llvm.array<8 x vector<8xf32>> 
          %236 = llvm.intr.fmuladd(%234, %213, %235) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %237 = llvm.select %82, %236, %235 : vector<8xi1>, vector<8xf32>
          %238 = llvm.extractelement %148[%3 : i64] : vector<8xf32>
          %239 = llvm.insertelement %238, %28[%15 : i32] : vector<8xf32>
          %240 = llvm.shufflevector %239, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %241 = llvm.extractvalue %142[4] : !llvm.array<8 x vector<8xf32>> 
          %242 = llvm.intr.fmuladd(%240, %213, %241) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %243 = llvm.select %84, %242, %241 : vector<8xi1>, vector<8xf32>
          %244 = llvm.extractelement %148[%2 : i64] : vector<8xf32>
          %245 = llvm.insertelement %244, %28[%15 : i32] : vector<8xf32>
          %246 = llvm.shufflevector %245, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %247 = llvm.extractvalue %142[5] : !llvm.array<8 x vector<8xf32>> 
          %248 = llvm.intr.fmuladd(%246, %213, %247) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %249 = llvm.select %86, %248, %247 : vector<8xi1>, vector<8xf32>
          %250 = llvm.extractelement %148[%1 : i64] : vector<8xf32>
          %251 = llvm.insertelement %250, %28[%15 : i32] : vector<8xf32>
          %252 = llvm.shufflevector %251, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %253 = llvm.extractvalue %142[6] : !llvm.array<8 x vector<8xf32>> 
          %254 = llvm.intr.fmuladd(%252, %213, %253) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %255 = llvm.select %88, %254, %253 : vector<8xi1>, vector<8xf32>
          %256 = llvm.extractelement %148[%0 : i64] : vector<8xf32>
          %257 = llvm.insertelement %256, %28[%15 : i32] : vector<8xf32>
          %258 = llvm.shufflevector %257, %28 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %259 = llvm.extractvalue %142[7] : !llvm.array<8 x vector<8xf32>> 
          %260 = llvm.intr.fmuladd(%258, %213, %259) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %261 = llvm.select %90, %260, %259 : vector<8xi1>, vector<8xf32>
          %262 = llvm.insertvalue %219, %21[0] : !llvm.array<8 x vector<8xf32>> 
          %263 = llvm.insertvalue %225, %262[1] : !llvm.array<8 x vector<8xf32>> 
          %264 = llvm.insertvalue %231, %263[2] : !llvm.array<8 x vector<8xf32>> 
          %265 = llvm.insertvalue %237, %264[3] : !llvm.array<8 x vector<8xf32>> 
          %266 = llvm.insertvalue %243, %265[4] : !llvm.array<8 x vector<8xf32>> 
          %267 = llvm.insertvalue %249, %266[5] : !llvm.array<8 x vector<8xf32>> 
          %268 = llvm.insertvalue %255, %267[6] : !llvm.array<8 x vector<8xf32>> 
          %269 = llvm.insertvalue %261, %268[7] : !llvm.array<8 x vector<8xf32>> 
          %270 = llvm.add %141, %38 : i32
          llvm.br ^bb5(%270, %269 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12:  // pred: ^bb5
          %271 = llvm.extractvalue %142[0] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %271, %96, %76 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %272 = llvm.extractvalue %142[1] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %272, %100, %78 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %273 = llvm.extractvalue %142[2] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %273, %104, %80 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %274 = llvm.extractvalue %142[3] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %274, %108, %82 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %275 = llvm.extractvalue %142[4] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %275, %112, %84 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %276 = llvm.extractvalue %142[5] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %276, %116, %86 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %277 = llvm.extractvalue %142[6] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %277, %120, %88 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %278 = llvm.extractvalue %142[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %278, %124, %90 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %279 = llvm.add %92, %36 : i32
          llvm.br ^bb3(%279 : i32) {loop_annotation = #loop_annotation}
        ^bb13:  // pred: ^bb3
          %280 = llvm.add %70, %36 : i32
          llvm.br ^bb1(%280 : i32) {loop_annotation = #loop_annotation}
        ^bb14:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_6 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_6_transpose_17x6x16_f32 ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_6_transpose_17x6x16_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.constant(272 : index) : i32
          %2 = llvm.mlir.constant(8 : i32) : i32
          %3 = llvm.mlir.constant(32 : i32) : i32
          %4 = llvm.mlir.constant(64 : index) : i32
          %5 = llvm.mlir.constant(true) : i1
          %6 = llvm.mlir.constant(96 : index) : i32
          %7 = llvm.mlir.constant(16 : index) : i32
          %8 = llvm.mlir.constant(1 : index) : i32
          %9 = llvm.mlir.constant(6 : index) : i32
          %10 = llvm.mlir.constant(17 : index) : i32
          %11 = llvm.mlir.constant(0 : index) : i32
          %12 = llvm.mlir.constant(6528 : index) : i32
          %13 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.extractvalue %13[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %15 = llvm.load %14 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %5 ["align"(%15, %4 : !llvm.ptr, i32)] : i1
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %18 = llvm.getelementptr %17[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %19 = llvm.load %18 : !llvm.ptr -> !llvm.ptr
          %20 = llvm.mul %12, %2 : i32
          %21 = llvm.udiv %20, %3 : i32
          %22 = llvm.getelementptr %19[%21] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %5 ["align"(%22, %4 : !llvm.ptr, i32)] : i1
          llvm.br ^bb1(%11 : i32)
        ^bb1(%23: i32):  // 2 preds: ^bb0, ^bb6
          %24 = llvm.icmp "slt" %23, %10 : i32
          llvm.cond_br %24, ^bb2(%11 : i32), ^bb7
        ^bb2(%25: i32):  // 2 preds: ^bb1, ^bb5
          %26 = llvm.icmp "slt" %25, %9 : i32
          llvm.cond_br %26, ^bb3(%11 : i32), ^bb6
        ^bb3(%27: i32):  // 2 preds: ^bb2, ^bb4
          %28 = llvm.icmp "slt" %27, %7 : i32
          llvm.cond_br %28, ^bb4, ^bb5
        ^bb4:  // pred: ^bb3
          %29 = llvm.mul %23, %6 overflow<nsw, nuw> : i32
          %30 = llvm.mul %25, %7 overflow<nsw, nuw> : i32
          %31 = llvm.add %29, %30 overflow<nsw, nuw> : i32
          %32 = llvm.add %31, %27 overflow<nsw, nuw> : i32
          %33 = llvm.getelementptr inbounds|nuw %15[%32] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %34 = llvm.load %33 : !llvm.ptr -> f32
          %35 = llvm.mul %25, %1 overflow<nsw, nuw> : i32
          %36 = llvm.mul %23, %7 overflow<nsw, nuw> : i32
          %37 = llvm.add %35, %36 overflow<nsw, nuw> : i32
          %38 = llvm.add %37, %27 overflow<nsw, nuw> : i32
          %39 = llvm.getelementptr inbounds|nuw %22[%38] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %34, %39 : f32, !llvm.ptr
          %40 = llvm.add %27, %8 : i32
          llvm.br ^bb3(%40 : i32)
        ^bb5:  // pred: ^bb3
          %41 = llvm.add %25, %8 : i32
          llvm.br ^bb2(%41 : i32)
        ^bb6:  // pred: ^bb2
          %42 = llvm.add %23, %8 : i32
          llvm.br ^bb1(%42 : i32) {loop_annotation = #loop_annotation}
        ^bb7:  // pred: ^bb1
          llvm.return %0 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_7 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_7_batch_matmul_2x17x17x16_f32 ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_7_batch_matmul_2x17x17x16_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(3 : i64) : i64
          %1 = llvm.mlir.constant(2 : i64) : i64
          %2 = llvm.mlir.constant(1 : i64) : i64
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.poison : vector<8xi32>
          %5 = llvm.mlir.poison : vector<4xi32>
          %6 = llvm.mlir.constant(0 : i32) : i32
          %7 = llvm.mlir.poison : vector<8xi64>
          %8 = llvm.mlir.constant(289 : index) : i32
          %9 = llvm.mlir.constant(64 : index) : i32
          %10 = llvm.mlir.constant(true) : i1
          %11 = llvm.mlir.constant(544 : index) : i32
          %12 = llvm.mlir.constant(272 : index) : i32
          %13 = llvm.mlir.constant(8 : i32) : i32
          %14 = llvm.mlir.constant(32 : i32) : i32
          %15 = llvm.mlir.poison : !llvm.array<4 x vector<8xf32>>
          %16 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %17 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi64>) : vector<8xi64>
          %18 = llvm.mlir.constant(-1 : index) : i32
          %19 = llvm.mlir.constant(3 : index) : i32
          %20 = llvm.mlir.constant(-16 : index) : i32
          %21 = llvm.mlir.constant(17 : index) : i32
          %22 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %23 = llvm.mlir.poison : vector<4xf32>
          %24 = llvm.mlir.constant(dense<[0, 1, 2, 3]> : vector<4xi32>) : vector<4xi32>
          %25 = llvm.mlir.poison : vector<8xf32>
          %26 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %27 = llvm.mlir.constant(dense<4.000000e+00> : vector<4x8xf32>) : !llvm.array<4 x vector<8xf32>>
          %28 = llvm.mlir.constant(0 : index) : i32
          %29 = llvm.mlir.constant(6528 : index) : i32
          %30 = llvm.mlir.constant(1 : index) : i32
          %31 = llvm.mlir.constant(16 : index) : i32
          %32 = llvm.mlir.constant(2 : index) : i32
          %33 = llvm.mlir.constant(4 : index) : i32
          %34 = llvm.mlir.constant(8 : index) : i32
          %35 = llvm.mlir.constant(32 : index) : i32
          %36 = llvm.alloca %35 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %37 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %38 = llvm.extractvalue %37[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %39 = llvm.load %38 : !llvm.ptr -> !llvm.ptr
          %40 = llvm.mul %29, %13 : i32
          %41 = llvm.udiv %40, %14 : i32
          %42 = llvm.getelementptr %39[%41] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %10 ["align"(%42, %9 : !llvm.ptr, i32)] : i1
          %43 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %44 = llvm.extractvalue %43[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %45 = llvm.getelementptr %44[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %46 = llvm.load %45 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %10 ["align"(%46, %9 : !llvm.ptr, i32)] : i1
          %47 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %48 = llvm.extractvalue %47[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %49 = llvm.sdiv %48, %32 : i32
          %50 = llvm.mul %49, %32 : i32
          %51 = llvm.icmp "ne" %48, %50 : i32
          %52 = llvm.icmp "slt" %48, %28 : i32
          %53 = llvm.and %51, %52 : i1
          %54 = llvm.add %49, %18 : i32
          %55 = llvm.select %53, %54, %49 : i1, i32
          %56 = llvm.srem %48, %32 : i32
          %57 = llvm.icmp "slt" %56, %28 : i32
          %58 = llvm.add %56, %32 overflow<nsw> : i32
          %59 = llvm.select %57, %58, %56 : i1, i32
          %60 = llvm.mul %55, %31 overflow<nsw> : i32
          %61 = llvm.mul %59, %31 overflow<nsw> : i32
          %62 = llvm.mul %55, %20 overflow<nsw> : i32
          %63 = llvm.add %62, %21 : i32
          %64 = llvm.icmp "slt" %63, %31 : i32
          %65 = llvm.select %64, %63, %31 : i1, i32
          %66 = llvm.mul %59, %20 overflow<nsw> : i32
          %67 = llvm.add %66, %21 : i32
          %68 = llvm.icmp "slt" %67, %31 : i32
          %69 = llvm.select %68, %67, %31 : i1, i32
          %70 = llvm.icmp "sgt" %65, %28 : i32
          llvm.cond_br %70, ^bb1, ^bb21
        ^bb1:  // pred: ^bb0
          %71 = llvm.icmp "sgt" %69, %28 : i32
          llvm.cond_br %71, ^bb2(%28 : i32), ^bb21
        ^bb2(%72: i32):  // 2 preds: ^bb1, ^bb20
          %73 = llvm.icmp "slt" %72, %32 : i32
          llvm.cond_br %73, ^bb3(%28 : i32), ^bb21
        ^bb3(%74: i32):  // 2 preds: ^bb2, ^bb19
          %75 = llvm.icmp "slt" %74, %65 : i32
          llvm.cond_br %75, ^bb4(%28 : i32), ^bb20
        ^bb4(%76: i32):  // 2 preds: ^bb3, ^bb18
          %77 = llvm.icmp "slt" %76, %69 : i32
          llvm.cond_br %77, ^bb5, ^bb19
        ^bb5:  // pred: ^bb4
          %78 = llvm.sub %65, %74 : i32
          %79 = llvm.icmp "slt" %78, %33 : i32
          %80 = llvm.select %79, %78, %33 : i1, i32
          %81 = llvm.sub %69, %76 : i32
          %82 = llvm.icmp "slt" %81, %34 : i32
          %83 = llvm.select %82, %81, %34 : i1, i32
          %84 = llvm.sext %83 : i32 to i64
          %85 = llvm.insertelement %84, %7[%6 : i32] : vector<8xi64>
          %86 = llvm.shufflevector %85, %7 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi64> 
          %87 = llvm.icmp "sgt" %86, %17 : vector<8xi64>
          %88 = llvm.icmp "sgt" %80, %28 : i32
          %89 = llvm.select %88, %87, %16 : i1, vector<8xi1>
          %90 = llvm.icmp "sgt" %80, %30 : i32
          %91 = llvm.select %90, %87, %16 : i1, vector<8xi1>
          %92 = llvm.icmp "sgt" %80, %32 : i32
          %93 = llvm.select %92, %87, %16 : i1, vector<8xi1>
          %94 = llvm.icmp "sgt" %80, %19 : i32
          %95 = llvm.select %94, %87, %16 : i1, vector<8xi1>
          %96 = llvm.mul %28, %35 : i32
          %97 = llvm.mul %28, %34 : i32
          %98 = llvm.add %96, %97 : i32
          %99 = llvm.add %98, %28 : i32
          %100 = llvm.getelementptr %36[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %26, %100, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %101 = llvm.mul %30, %34 : i32
          %102 = llvm.add %96, %101 : i32
          %103 = llvm.add %102, %28 : i32
          %104 = llvm.getelementptr %36[%103] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %26, %104, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %105 = llvm.mul %32, %34 : i32
          %106 = llvm.add %96, %105 : i32
          %107 = llvm.add %106, %28 : i32
          %108 = llvm.getelementptr %36[%107] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %26, %108, %93 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %109 = llvm.mul %19, %34 : i32
          %110 = llvm.add %96, %109 : i32
          %111 = llvm.add %110, %28 : i32
          %112 = llvm.getelementptr %36[%111] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %26, %112, %95 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %113 = llvm.add %74, %60 : i32
          %114 = llvm.add %76, %61 : i32
          %115 = llvm.intr.masked.load %100, %89, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %116 = llvm.intr.masked.load %104, %91, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %117 = llvm.intr.masked.load %108, %93, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %118 = llvm.intr.masked.load %112, %95, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %119 = llvm.insertvalue %115, %15[0] : !llvm.array<4 x vector<8xf32>> 
          %120 = llvm.insertvalue %116, %119[1] : !llvm.array<4 x vector<8xf32>> 
          %121 = llvm.insertvalue %117, %120[2] : !llvm.array<4 x vector<8xf32>> 
          %122 = llvm.insertvalue %118, %121[3] : !llvm.array<4 x vector<8xf32>> 
          llvm.br ^bb6(%28, %122 : i32, !llvm.array<4 x vector<8xf32>>)
        ^bb6(%123: i32, %124: !llvm.array<4 x vector<8xf32>>):  // 2 preds: ^bb5, ^bb17
          %125 = llvm.icmp "slt" %123, %31 : i32
          llvm.cond_br %125, ^bb7, ^bb18
        ^bb7:  // pred: ^bb6
          %126 = llvm.insertelement %80, %5[%6 : i32] : vector<4xi32>
          %127 = llvm.shufflevector %126, %5 [0, 0, 0, 0] : vector<4xi32> 
          %128 = llvm.icmp "sgt" %127, %24 : vector<4xi32>
          llvm.br ^bb8(%28, %23 : i32, vector<4xf32>)
        ^bb8(%129: i32, %130: vector<4xf32>):  // 2 preds: ^bb7, ^bb11
          %131 = llvm.icmp "slt" %129, %33 : i32
          llvm.cond_br %131, ^bb9, ^bb12
        ^bb9:  // pred: ^bb8
          %132 = llvm.extractelement %128[%129 : i32] : vector<4xi1>
          llvm.cond_br %132, ^bb10, ^bb11(%130 : vector<4xf32>)
        ^bb10:  // pred: ^bb9
          %133 = llvm.add %113, %129 : i32
          %134 = llvm.mul %28, %11 overflow<nsw, nuw> : i32
          %135 = llvm.add %134, %134 overflow<nsw, nuw> : i32
          %136 = llvm.mul %72, %12 overflow<nsw, nuw> : i32
          %137 = llvm.add %135, %136 overflow<nsw, nuw> : i32
          %138 = llvm.mul %133, %31 overflow<nsw, nuw> : i32
          %139 = llvm.add %137, %138 overflow<nsw, nuw> : i32
          %140 = llvm.add %139, %123 overflow<nsw, nuw> : i32
          %141 = llvm.getelementptr inbounds|nuw %42[%140] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %142 = llvm.load %141 : !llvm.ptr -> f32
          %143 = llvm.insertelement %142, %130[%129 : i32] : vector<4xf32>
          llvm.br ^bb11(%143 : vector<4xf32>)
        ^bb11(%144: vector<4xf32>):  // 2 preds: ^bb9, ^bb10
          %145 = llvm.add %129, %30 : i32
          llvm.br ^bb8(%145, %144 : i32, vector<4xf32>)
        ^bb12:  // pred: ^bb8
          %146 = llvm.insertelement %83, %4[%6 : i32] : vector<8xi32>
          %147 = llvm.shufflevector %146, %4 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %148 = llvm.icmp "sgt" %147, %22 : vector<8xi32>
          llvm.br ^bb13(%28, %25 : i32, vector<8xf32>)
        ^bb13(%149: i32, %150: vector<8xf32>):  // 2 preds: ^bb12, ^bb16
          %151 = llvm.icmp "slt" %149, %34 : i32
          llvm.cond_br %151, ^bb14, ^bb17
        ^bb14:  // pred: ^bb13
          %152 = llvm.extractelement %148[%149 : i32] : vector<8xi1>
          llvm.cond_br %152, ^bb15, ^bb16(%150 : vector<8xf32>)
        ^bb15:  // pred: ^bb14
          %153 = llvm.add %114, %149 : i32
          %154 = llvm.mul %30, %11 overflow<nsw, nuw> : i32
          %155 = llvm.mul %28, %11 overflow<nsw, nuw> : i32
          %156 = llvm.add %154, %155 overflow<nsw, nuw> : i32
          %157 = llvm.mul %72, %12 overflow<nsw, nuw> : i32
          %158 = llvm.add %156, %157 overflow<nsw, nuw> : i32
          %159 = llvm.mul %153, %31 overflow<nsw, nuw> : i32
          %160 = llvm.add %158, %159 overflow<nsw, nuw> : i32
          %161 = llvm.add %160, %123 overflow<nsw, nuw> : i32
          %162 = llvm.getelementptr inbounds|nuw %42[%161] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %163 = llvm.load %162 : !llvm.ptr -> f32
          %164 = llvm.insertelement %163, %150[%149 : i32] : vector<8xf32>
          llvm.br ^bb16(%164 : vector<8xf32>)
        ^bb16(%165: vector<8xf32>):  // 2 preds: ^bb14, ^bb15
          %166 = llvm.add %149, %30 : i32
          llvm.br ^bb13(%166, %165 : i32, vector<8xf32>)
        ^bb17:  // pred: ^bb13
          %167 = llvm.extractelement %130[%3 : i64] : vector<4xf32>
          %168 = llvm.insertelement %167, %25[%6 : i32] : vector<8xf32>
          %169 = llvm.shufflevector %168, %25 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %170 = llvm.extractvalue %124[0] : !llvm.array<4 x vector<8xf32>> 
          %171 = llvm.intr.fmuladd(%169, %150, %170) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %172 = llvm.select %89, %171, %170 : vector<8xi1>, vector<8xf32>
          %173 = llvm.extractelement %130[%2 : i64] : vector<4xf32>
          %174 = llvm.insertelement %173, %25[%6 : i32] : vector<8xf32>
          %175 = llvm.shufflevector %174, %25 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %176 = llvm.extractvalue %124[1] : !llvm.array<4 x vector<8xf32>> 
          %177 = llvm.intr.fmuladd(%175, %150, %176) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %178 = llvm.select %91, %177, %176 : vector<8xi1>, vector<8xf32>
          %179 = llvm.extractelement %130[%1 : i64] : vector<4xf32>
          %180 = llvm.insertelement %179, %25[%6 : i32] : vector<8xf32>
          %181 = llvm.shufflevector %180, %25 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %182 = llvm.extractvalue %124[2] : !llvm.array<4 x vector<8xf32>> 
          %183 = llvm.intr.fmuladd(%181, %150, %182) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %184 = llvm.select %93, %183, %182 : vector<8xi1>, vector<8xf32>
          %185 = llvm.extractelement %130[%0 : i64] : vector<4xf32>
          %186 = llvm.insertelement %185, %25[%6 : i32] : vector<8xf32>
          %187 = llvm.shufflevector %186, %25 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %188 = llvm.extractvalue %124[3] : !llvm.array<4 x vector<8xf32>> 
          %189 = llvm.intr.fmuladd(%187, %150, %188) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %190 = llvm.select %95, %189, %188 : vector<8xi1>, vector<8xf32>
          %191 = llvm.insertvalue %172, %15[0] : !llvm.array<4 x vector<8xf32>> 
          %192 = llvm.insertvalue %178, %191[1] : !llvm.array<4 x vector<8xf32>> 
          %193 = llvm.insertvalue %184, %192[2] : !llvm.array<4 x vector<8xf32>> 
          %194 = llvm.insertvalue %190, %193[3] : !llvm.array<4 x vector<8xf32>> 
          %195 = llvm.add %123, %30 : i32
          llvm.br ^bb6(%195, %194 : i32, !llvm.array<4 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb18:  // pred: ^bb6
          %196 = llvm.extractvalue %124[0] : !llvm.array<4 x vector<8xf32>> 
          llvm.intr.masked.store %196, %100, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %197 = llvm.extractvalue %124[1] : !llvm.array<4 x vector<8xf32>> 
          llvm.intr.masked.store %197, %104, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %198 = llvm.extractvalue %124[2] : !llvm.array<4 x vector<8xf32>> 
          llvm.intr.masked.store %198, %108, %93 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %199 = llvm.extractvalue %124[3] : !llvm.array<4 x vector<8xf32>> 
          llvm.intr.masked.store %199, %112, %95 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %200 = llvm.intr.masked.load %100, %89, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %201 = llvm.intr.masked.load %104, %91, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %202 = llvm.intr.masked.load %108, %93, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %203 = llvm.intr.masked.load %112, %95, %25 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %204 = llvm.extractvalue %27[0] : !llvm.array<4 x vector<8xf32>> 
          %205 = llvm.fdiv %200, %204 : vector<8xf32>
          %206 = llvm.extractvalue %27[1] : !llvm.array<4 x vector<8xf32>> 
          %207 = llvm.fdiv %201, %206 : vector<8xf32>
          %208 = llvm.extractvalue %27[2] : !llvm.array<4 x vector<8xf32>> 
          %209 = llvm.fdiv %202, %208 : vector<8xf32>
          %210 = llvm.extractvalue %27[3] : !llvm.array<4 x vector<8xf32>> 
          %211 = llvm.fdiv %203, %210 : vector<8xf32>
          %212 = llvm.mul %72, %8 : i32
          %213 = llvm.mul %113, %21 : i32
          %214 = llvm.add %212, %213 : i32
          %215 = llvm.add %214, %114 : i32
          %216 = llvm.getelementptr %46[%215] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %205, %216, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %217 = llvm.add %113, %30 : i32
          %218 = llvm.mul %217, %21 : i32
          %219 = llvm.add %212, %218 : i32
          %220 = llvm.add %219, %114 : i32
          %221 = llvm.getelementptr %46[%220] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %207, %221, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %222 = llvm.add %113, %32 : i32
          %223 = llvm.mul %222, %21 : i32
          %224 = llvm.add %212, %223 : i32
          %225 = llvm.add %224, %114 : i32
          %226 = llvm.getelementptr %46[%225] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %209, %226, %93 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %227 = llvm.add %113, %19 : i32
          %228 = llvm.mul %227, %21 : i32
          %229 = llvm.add %212, %228 : i32
          %230 = llvm.add %229, %114 : i32
          %231 = llvm.getelementptr %46[%230] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %211, %231, %95 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %232 = llvm.add %76, %34 : i32
          llvm.br ^bb4(%232 : i32) {loop_annotation = #loop_annotation}
        ^bb19:  // pred: ^bb4
          %233 = llvm.add %74, %33 : i32
          llvm.br ^bb3(%233 : i32) {loop_annotation = #loop_annotation}
        ^bb20:  // pred: ^bb3
          %234 = llvm.add %72, %30 : i32
          llvm.br ^bb2(%234 : i32) {loop_annotation = #loop_annotation}
        ^bb21:  // 3 preds: ^bb0, ^bb1, ^bb2
          llvm.return %6 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_8 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.poison : vector<1xf32>
          %1 = llvm.mlir.constant(0 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.poison : vector<8xi32>
          %4 = llvm.mlir.constant(8 : i32) : i32
          %5 = llvm.mlir.constant(32 : i32) : i32
          %6 = llvm.mlir.constant(64 : index) : i32
          %7 = llvm.mlir.constant(true) : i1
          %8 = llvm.mlir.constant(289 : index) : i32
          %9 = llvm.mlir.constant(-1 : index) : i32
          %10 = llvm.mlir.constant(dense<127> : vector<8xi32>) : vector<8xi32>
          %11 = llvm.mlir.constant(dense<23> : vector<8xi32>) : vector<8xi32>
          %12 = llvm.mlir.constant(dense<1.270000e+02> : vector<8xf32>) : vector<8xf32>
          %13 = llvm.mlir.constant(dense<-1.270000e+02> : vector<8xf32>) : vector<8xf32>
          %14 = llvm.mlir.constant(dense<8.880000e+01> : vector<8xf32>) : vector<8xf32>
          %15 = llvm.mlir.constant(dense<-8.780000e+01> : vector<8xf32>) : vector<8xf32>
          %16 = llvm.mlir.constant(dense<0.166666657> : vector<8xf32>) : vector<8xf32>
          %17 = llvm.mlir.constant(dense<0.0416657962> : vector<8xf32>) : vector<8xf32>
          %18 = llvm.mlir.constant(dense<0.00833345205> : vector<8xf32>) : vector<8xf32>
          %19 = llvm.mlir.constant(dense<0.00139819994> : vector<8xf32>) : vector<8xf32>
          %20 = llvm.mlir.constant(dense<1.98756912E-4> : vector<8xf32>) : vector<8xf32>
          %21 = llvm.mlir.constant(dense<2.12194442E-4> : vector<8xf32>) : vector<8xf32>
          %22 = llvm.mlir.constant(dense<-0.693359375> : vector<8xf32>) : vector<8xf32>
          %23 = llvm.mlir.constant(dense<1.44269502> : vector<8xf32>) : vector<8xf32>
          %24 = llvm.mlir.constant(dense<1.000000e+00> : vector<8xf32>) : vector<8xf32>
          %25 = llvm.mlir.constant(dense<5.000000e-01> : vector<8xf32>) : vector<8xf32>
          %26 = llvm.mlir.poison : vector<8xf32>
          %27 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %28 = llvm.mlir.constant(dense<0.000000e+00> : vector<1xf32>) : vector<1xf32>
          %29 = llvm.mlir.constant(dense<0xFFC00000> : vector<1xf32>) : vector<1xf32>
          %30 = llvm.mlir.constant(8 : index) : i32
          %31 = llvm.mlir.constant(17 : index) : i32
          %32 = llvm.mlir.constant(0 : index) : i32
          %33 = llvm.mlir.constant(2368 : index) : i32
          %34 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.extractvalue %34[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %36 = llvm.load %35 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %7 ["align"(%36, %6 : !llvm.ptr, i32)] : i1
          %37 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %38 = llvm.extractvalue %37[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %39 = llvm.getelementptr %38[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %40 = llvm.load %39 : !llvm.ptr -> !llvm.ptr
          %41 = llvm.mul %33, %4 : i32
          %42 = llvm.udiv %41, %5 : i32
          %43 = llvm.getelementptr %40[%42] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %7 ["align"(%43, %6 : !llvm.ptr, i32)] : i1
          %44 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %45 = llvm.extractvalue %44[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %46 = llvm.sdiv %45, %31 : i32
          %47 = llvm.mul %46, %31 : i32
          %48 = llvm.icmp "ne" %45, %47 : i32
          %49 = llvm.icmp "slt" %45, %32 : i32
          %50 = llvm.and %48, %49 : i1
          %51 = llvm.add %46, %9 : i32
          %52 = llvm.select %50, %51, %46 : i1, i32
          %53 = llvm.srem %45, %31 : i32
          %54 = llvm.icmp "slt" %53, %32 : i32
          %55 = llvm.add %53, %31 overflow<nsw> : i32
          %56 = llvm.select %54, %55, %53 : i1, i32
          llvm.br ^bb1(%32, %29 : i32, vector<1xf32>)
        ^bb1(%57: i32, %58: vector<1xf32>):  // 2 preds: ^bb0, ^bb2
          %59 = llvm.icmp "slt" %57, %31 : i32
          llvm.cond_br %59, ^bb2, ^bb3(%32, %28 : i32, vector<1xf32>)
        ^bb2:  // pred: ^bb1
          %60 = llvm.sub %31, %57 : i32
          %61 = llvm.icmp "slt" %60, %30 : i32
          %62 = llvm.select %61, %60, %30 : i1, i32
          %63 = llvm.insertelement %62, %3[%2 : i32] : vector<8xi32>
          %64 = llvm.shufflevector %63, %3 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %65 = llvm.icmp "sgt" %64, %27 : vector<8xi32>
          %66 = llvm.mul %52, %8 : i32
          %67 = llvm.mul %56, %31 : i32
          %68 = llvm.add %66, %67 : i32
          %69 = llvm.add %68, %57 : i32
          %70 = llvm.getelementptr %36[%69] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %71 = llvm.intr.masked.load %70, %65, %26 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %72 = llvm.extractelement %58[%1 : i64] : vector<1xf32>
          %73 = "llvm.intr.vp.reduce.fmax"(%72, %71, %65, %4) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
          %74 = llvm.insertelement %73, %0[%2 : i32] : vector<1xf32>
          %75 = llvm.add %57, %30 : i32
          llvm.br ^bb1(%75, %74 : i32, vector<1xf32>) {loop_annotation = #loop_annotation}
        ^bb3(%76: i32, %77: vector<1xf32>):  // 2 preds: ^bb1, ^bb4
          %78 = llvm.icmp "slt" %76, %31 : i32
          llvm.cond_br %78, ^bb4, ^bb5(%32 : i32)
        ^bb4:  // pred: ^bb3
          %79 = llvm.sub %31, %76 : i32
          %80 = llvm.icmp "slt" %79, %30 : i32
          %81 = llvm.select %80, %79, %30 : i1, i32
          %82 = llvm.insertelement %81, %3[%2 : i32] : vector<8xi32>
          %83 = llvm.shufflevector %82, %3 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %84 = llvm.icmp "sgt" %83, %27 : vector<8xi32>
          %85 = llvm.mul %52, %8 : i32
          %86 = llvm.mul %56, %31 : i32
          %87 = llvm.add %85, %86 : i32
          %88 = llvm.add %87, %76 : i32
          %89 = llvm.getelementptr %36[%88] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %90 = llvm.intr.masked.load %89, %84, %26 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %91 = llvm.extractelement %58[%1 : i64] : vector<1xf32>
          %92 = llvm.insertelement %91, %26[%2 : i32] : vector<8xf32>
          %93 = llvm.shufflevector %92, %26 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %94 = llvm.fsub %90, %93 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %95 = llvm.fcmp "uge" %94, %15 : vector<8xf32>
          %96 = llvm.select %95, %94, %15 : vector<8xi1>, vector<8xf32>
          %97 = llvm.fcmp "ule" %96, %14 : vector<8xf32>
          %98 = llvm.select %97, %96, %14 : vector<8xi1>, vector<8xf32>
          %99 = llvm.intr.fma(%98, %23, %25) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %100 = llvm.intr.floor(%99) : (vector<8xf32>) -> vector<8xf32>
          %101 = llvm.fcmp "uge" %100, %13 : vector<8xf32>
          %102 = llvm.select %101, %100, %13 : vector<8xi1>, vector<8xf32>
          %103 = llvm.fcmp "ule" %102, %12 : vector<8xf32>
          %104 = llvm.select %103, %102, %12 : vector<8xi1>, vector<8xf32>
          %105 = llvm.intr.fma(%22, %104, %98) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %106 = llvm.intr.fma(%21, %104, %105) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %107 = llvm.intr.fma(%106, %20, %19) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %108 = llvm.intr.fma(%107, %106, %18) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %109 = llvm.intr.fma(%108, %106, %17) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %110 = llvm.intr.fma(%109, %106, %16) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %111 = llvm.intr.fma(%110, %106, %25) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %112 = llvm.fmul %106, %106 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %113 = llvm.intr.fma(%111, %112, %106) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %114 = llvm.fadd %113, %24 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %115 = llvm.fptosi %104 : vector<8xf32> to vector<8xi32>
          %116 = llvm.add %115, %10 : vector<8xi32>
          %117 = llvm.shl %116, %11 : vector<8xi32>
          %118 = llvm.bitcast %117 : vector<8xi32> to vector<8xf32>
          %119 = llvm.fmul %114, %118 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %120 = llvm.extractelement %77[%1 : i64] : vector<1xf32>
          %121 = "llvm.intr.vp.reduce.fadd"(%120, %119, %84, %4) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
          %122 = llvm.insertelement %121, %0[%2 : i32] : vector<1xf32>
          %123 = llvm.add %76, %30 : i32
          llvm.br ^bb3(%123, %122 : i32, vector<1xf32>) {loop_annotation = #loop_annotation}
        ^bb5(%124: i32):  // 2 preds: ^bb3, ^bb6
          %125 = llvm.icmp "slt" %124, %31 : i32
          llvm.cond_br %125, ^bb6, ^bb7
        ^bb6:  // pred: ^bb5
          %126 = llvm.sub %31, %124 : i32
          %127 = llvm.icmp "slt" %126, %30 : i32
          %128 = llvm.select %127, %126, %30 : i1, i32
          %129 = llvm.insertelement %128, %3[%2 : i32] : vector<8xi32>
          %130 = llvm.shufflevector %129, %3 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %131 = llvm.icmp "sgt" %130, %27 : vector<8xi32>
          %132 = llvm.mul %52, %8 : i32
          %133 = llvm.mul %56, %31 : i32
          %134 = llvm.add %132, %133 : i32
          %135 = llvm.add %134, %124 : i32
          %136 = llvm.getelementptr %36[%135] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %137 = llvm.intr.masked.load %136, %131, %26 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %138 = llvm.extractelement %58[%1 : i64] : vector<1xf32>
          %139 = llvm.insertelement %138, %26[%2 : i32] : vector<8xf32>
          %140 = llvm.shufflevector %139, %26 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %141 = llvm.fsub %137, %140 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %142 = llvm.fcmp "uge" %141, %15 : vector<8xf32>
          %143 = llvm.select %142, %141, %15 : vector<8xi1>, vector<8xf32>
          %144 = llvm.fcmp "ule" %143, %14 : vector<8xf32>
          %145 = llvm.select %144, %143, %14 : vector<8xi1>, vector<8xf32>
          %146 = llvm.intr.fma(%145, %23, %25) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %147 = llvm.intr.floor(%146) : (vector<8xf32>) -> vector<8xf32>
          %148 = llvm.fcmp "uge" %147, %13 : vector<8xf32>
          %149 = llvm.select %148, %147, %13 : vector<8xi1>, vector<8xf32>
          %150 = llvm.fcmp "ule" %149, %12 : vector<8xf32>
          %151 = llvm.select %150, %149, %12 : vector<8xi1>, vector<8xf32>
          %152 = llvm.intr.fma(%22, %151, %145) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %153 = llvm.intr.fma(%21, %151, %152) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %154 = llvm.intr.fma(%153, %20, %19) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %155 = llvm.intr.fma(%154, %153, %18) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %156 = llvm.intr.fma(%155, %153, %17) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %157 = llvm.intr.fma(%156, %153, %16) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %158 = llvm.intr.fma(%157, %153, %25) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %159 = llvm.fmul %153, %153 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %160 = llvm.intr.fma(%158, %159, %153) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %161 = llvm.fadd %160, %24 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %162 = llvm.fptosi %151 : vector<8xf32> to vector<8xi32>
          %163 = llvm.add %162, %10 : vector<8xi32>
          %164 = llvm.shl %163, %11 : vector<8xi32>
          %165 = llvm.bitcast %164 : vector<8xi32> to vector<8xf32>
          %166 = llvm.fmul %161, %165 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %167 = llvm.extractelement %77[%1 : i64] : vector<1xf32>
          %168 = llvm.insertelement %167, %26[%2 : i32] : vector<8xf32>
          %169 = llvm.shufflevector %168, %26 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %170 = llvm.fdiv %166, %169 : vector<8xf32>
          %171 = llvm.getelementptr %43[%135] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %170, %171, %131 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %172 = llvm.add %124, %30 : i32
          llvm.br ^bb5(%172 : i32) {loop_annotation = #loop_annotation}
        ^bb7:  // pred: ^bb5
          llvm.return %2 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_9 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_9_batch_matmul_2x17x16x17_f32 ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_9_batch_matmul_2x17x16x17_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(3 : i64) : i64
          %1 = llvm.mlir.constant(2 : i64) : i64
          %2 = llvm.mlir.constant(1 : i64) : i64
          %3 = llvm.mlir.constant(0 : i64) : i64
          %4 = llvm.mlir.constant(0 : i32) : i32
          %5 = llvm.mlir.poison : vector<4xi32>
          %6 = llvm.mlir.constant(289 : index) : i32
          %7 = llvm.mlir.constant(64 : index) : i32
          %8 = llvm.mlir.constant(true) : i1
          %9 = llvm.mlir.constant(544 : index) : i32
          %10 = llvm.mlir.constant(272 : index) : i32
          %11 = llvm.mlir.constant(8 : i32) : i32
          %12 = llvm.mlir.constant(32 : i32) : i32
          %13 = llvm.mlir.poison : !llvm.array<4 x vector<8xf32>>
          %14 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %15 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %16 = llvm.mlir.constant(3 : index) : i32
          %17 = llvm.mlir.constant(-16 : index) : i32
          %18 = llvm.mlir.poison : vector<4xf32>
          %19 = llvm.mlir.constant(dense<[0, 1, 2, 3]> : vector<4xi32>) : vector<4xi32>
          %20 = llvm.mlir.poison : vector<8xf32>
          %21 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %22 = llvm.mlir.constant(0 : index) : i32
          %23 = llvm.mlir.constant(2368 : index) : i32
          %24 = llvm.mlir.constant(6528 : index) : i32
          %25 = llvm.mlir.constant(1 : index) : i32
          %26 = llvm.mlir.constant(17 : index) : i32
          %27 = llvm.mlir.constant(16 : index) : i32
          %28 = llvm.mlir.constant(2 : index) : i32
          %29 = llvm.mlir.constant(4 : index) : i32
          %30 = llvm.mlir.constant(8 : index) : i32
          %31 = llvm.mlir.constant(32 : index) : i32
          %32 = llvm.alloca %31 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %33 = llvm.alloca %31 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %34 = llvm.alloca %31 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %35 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %36 = llvm.extractvalue %35[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %37 = llvm.load %36 : !llvm.ptr -> !llvm.ptr
          %38 = llvm.mul %24, %11 : i32
          %39 = llvm.udiv %38, %12 : i32
          %40 = llvm.getelementptr %37[%39] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %8 ["align"(%40, %7 : !llvm.ptr, i32)] : i1
          %41 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %42 = llvm.extractvalue %41[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %43 = llvm.load %42 : !llvm.ptr -> !llvm.ptr
          %44 = llvm.mul %23, %11 : i32
          %45 = llvm.udiv %44, %12 : i32
          %46 = llvm.getelementptr %43[%45] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %8 ["align"(%46, %7 : !llvm.ptr, i32)] : i1
          %47 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %48 = llvm.extractvalue %47[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %49 = llvm.getelementptr %48[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %50 = llvm.load %49 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %8 ["align"(%50, %7 : !llvm.ptr, i32)] : i1
          %51 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %52 = llvm.extractvalue %51[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %53 = llvm.mul %52, %27 overflow<nsw> : i32
          %54 = llvm.mul %52, %17 overflow<nsw> : i32
          %55 = llvm.add %54, %26 : i32
          %56 = llvm.icmp "slt" %55, %27 : i32
          %57 = llvm.select %56, %55, %27 : i1, i32
          %58 = llvm.icmp "sgt" %57, %22 : i32
          llvm.cond_br %58, ^bb1(%22 : i32), ^bb29
        ^bb1(%59: i32):  // 2 preds: ^bb0, ^bb28
          %60 = llvm.icmp "slt" %59, %28 : i32
          llvm.cond_br %60, ^bb2(%22 : i32), ^bb29
        ^bb2(%61: i32):  // 2 preds: ^bb1, ^bb27
          %62 = llvm.icmp "slt" %61, %57 : i32
          llvm.cond_br %62, ^bb3, ^bb28
        ^bb3:  // pred: ^bb2
          %63 = llvm.sub %57, %61 : i32
          %64 = llvm.icmp "slt" %63, %29 : i32
          %65 = llvm.select %64, %63, %29 : i1, i32
          %66 = llvm.icmp "sgt" %65, %22 : i32
          %67 = llvm.select %66, %15, %14 : i1, vector<8xi1>
          %68 = llvm.icmp "sgt" %65, %25 : i32
          %69 = llvm.select %68, %15, %14 : i1, vector<8xi1>
          %70 = llvm.icmp "sgt" %65, %28 : i32
          %71 = llvm.select %70, %15, %14 : i1, vector<8xi1>
          %72 = llvm.icmp "sgt" %65, %16 : i32
          %73 = llvm.select %72, %15, %14 : i1, vector<8xi1>
          %74 = llvm.mul %22, %31 : i32
          %75 = llvm.mul %22, %30 : i32
          %76 = llvm.add %74, %75 : i32
          %77 = llvm.add %76, %22 : i32
          %78 = llvm.getelementptr %34[%77] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %21, %78, %67 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %79 = llvm.mul %25, %30 : i32
          %80 = llvm.add %74, %79 : i32
          %81 = llvm.add %80, %22 : i32
          %82 = llvm.getelementptr %34[%81] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %21, %82, %69 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %83 = llvm.mul %28, %30 : i32
          %84 = llvm.add %74, %83 : i32
          %85 = llvm.add %84, %22 : i32
          %86 = llvm.getelementptr %34[%85] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %21, %86, %71 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %87 = llvm.mul %16, %30 : i32
          %88 = llvm.add %74, %87 : i32
          %89 = llvm.add %88, %22 : i32
          %90 = llvm.getelementptr %34[%89] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %21, %90, %73 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %91 = llvm.add %61, %53 : i32
          llvm.br ^bb4(%22 : i32)
        ^bb4(%92: i32):  // 2 preds: ^bb3, ^bb26
          %93 = llvm.icmp "slt" %92, %27 : i32
          llvm.cond_br %93, ^bb5, ^bb27
        ^bb5:  // pred: ^bb4
          %94 = llvm.intr.masked.load %78, %67, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %95 = llvm.intr.masked.load %82, %69, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %96 = llvm.intr.masked.load %86, %71, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %97 = llvm.intr.masked.load %90, %73, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %98 = llvm.insertvalue %94, %13[0] : !llvm.array<4 x vector<8xf32>> 
          %99 = llvm.insertvalue %95, %98[1] : !llvm.array<4 x vector<8xf32>> 
          %100 = llvm.insertvalue %96, %99[2] : !llvm.array<4 x vector<8xf32>> 
          %101 = llvm.insertvalue %97, %100[3] : !llvm.array<4 x vector<8xf32>> 
          llvm.br ^bb6(%22, %101 : i32, !llvm.array<4 x vector<8xf32>>)
        ^bb6(%102: i32, %103: !llvm.array<4 x vector<8xf32>>):  // 2 preds: ^bb5, ^bb12
          %104 = llvm.icmp "slt" %102, %26 : i32
          llvm.cond_br %104, ^bb7, ^bb13(%22 : i32)
        ^bb7:  // pred: ^bb6
          %105 = llvm.insertelement %65, %5[%4 : i32] : vector<4xi32>
          %106 = llvm.shufflevector %105, %5 [0, 0, 0, 0] : vector<4xi32> 
          %107 = llvm.icmp "sgt" %106, %19 : vector<4xi32>
          llvm.br ^bb8(%22, %18 : i32, vector<4xf32>)
        ^bb8(%108: i32, %109: vector<4xf32>):  // 2 preds: ^bb7, ^bb11
          %110 = llvm.icmp "slt" %108, %29 : i32
          llvm.cond_br %110, ^bb9, ^bb12
        ^bb9:  // pred: ^bb8
          %111 = llvm.extractelement %107[%108 : i32] : vector<4xi1>
          llvm.cond_br %111, ^bb10, ^bb11(%109 : vector<4xf32>)
        ^bb10:  // pred: ^bb9
          %112 = llvm.add %91, %108 : i32
          %113 = llvm.mul %59, %6 overflow<nsw, nuw> : i32
          %114 = llvm.mul %112, %26 overflow<nsw, nuw> : i32
          %115 = llvm.add %113, %114 overflow<nsw, nuw> : i32
          %116 = llvm.add %115, %102 overflow<nsw, nuw> : i32
          %117 = llvm.getelementptr inbounds|nuw %46[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %118 = llvm.load %117 : !llvm.ptr -> f32
          %119 = llvm.insertelement %118, %109[%108 : i32] : vector<4xf32>
          llvm.br ^bb11(%119 : vector<4xf32>)
        ^bb11(%120: vector<4xf32>):  // 2 preds: ^bb9, ^bb10
          %121 = llvm.add %108, %25 : i32
          llvm.br ^bb8(%121, %120 : i32, vector<4xf32>)
        ^bb12:  // pred: ^bb8
          %122 = llvm.mul %28, %9 : i32
          %123 = llvm.mul %22, %9 : i32
          %124 = llvm.add %122, %123 : i32
          %125 = llvm.mul %59, %10 : i32
          %126 = llvm.add %124, %125 : i32
          %127 = llvm.mul %102, %27 : i32
          %128 = llvm.add %126, %127 : i32
          %129 = llvm.add %128, %92 : i32
          %130 = llvm.getelementptr %40[%129] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %131 = llvm.load %130 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
          %132 = llvm.extractelement %109[%3 : i64] : vector<4xf32>
          %133 = llvm.insertelement %132, %20[%4 : i32] : vector<8xf32>
          %134 = llvm.shufflevector %133, %20 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %135 = llvm.extractvalue %103[0] : !llvm.array<4 x vector<8xf32>> 
          %136 = llvm.intr.fmuladd(%134, %131, %135) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %137 = llvm.select %67, %136, %135 : vector<8xi1>, vector<8xf32>
          %138 = llvm.extractelement %109[%2 : i64] : vector<4xf32>
          %139 = llvm.insertelement %138, %20[%4 : i32] : vector<8xf32>
          %140 = llvm.shufflevector %139, %20 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %141 = llvm.extractvalue %103[1] : !llvm.array<4 x vector<8xf32>> 
          %142 = llvm.intr.fmuladd(%140, %131, %141) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %143 = llvm.select %69, %142, %141 : vector<8xi1>, vector<8xf32>
          %144 = llvm.extractelement %109[%1 : i64] : vector<4xf32>
          %145 = llvm.insertelement %144, %20[%4 : i32] : vector<8xf32>
          %146 = llvm.shufflevector %145, %20 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %147 = llvm.extractvalue %103[2] : !llvm.array<4 x vector<8xf32>> 
          %148 = llvm.intr.fmuladd(%146, %131, %147) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %149 = llvm.select %71, %148, %147 : vector<8xi1>, vector<8xf32>
          %150 = llvm.extractelement %109[%0 : i64] : vector<4xf32>
          %151 = llvm.insertelement %150, %20[%4 : i32] : vector<8xf32>
          %152 = llvm.shufflevector %151, %20 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %153 = llvm.extractvalue %103[3] : !llvm.array<4 x vector<8xf32>> 
          %154 = llvm.intr.fmuladd(%152, %131, %153) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %155 = llvm.select %73, %154, %153 : vector<8xi1>, vector<8xf32>
          %156 = llvm.insertvalue %137, %13[0] : !llvm.array<4 x vector<8xf32>> 
          %157 = llvm.insertvalue %143, %156[1] : !llvm.array<4 x vector<8xf32>> 
          %158 = llvm.insertvalue %149, %157[2] : !llvm.array<4 x vector<8xf32>> 
          %159 = llvm.insertvalue %155, %158[3] : !llvm.array<4 x vector<8xf32>> 
          %160 = llvm.add %102, %25 : i32
          llvm.br ^bb6(%160, %159 : i32, !llvm.array<4 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb13(%161: i32):  // 2 preds: ^bb6, ^bb16
          %162 = llvm.icmp "slt" %161, %65 : i32
          llvm.cond_br %162, ^bb14(%22 : i32), ^bb17
        ^bb14(%163: i32):  // 2 preds: ^bb13, ^bb15
          %164 = llvm.icmp "slt" %163, %30 : i32
          llvm.cond_br %164, ^bb15, ^bb16
        ^bb15:  // pred: ^bb14
          %165 = llvm.mul %22, %31 overflow<nsw, nuw> : i32
          %166 = llvm.mul %161, %30 overflow<nsw, nuw> : i32
          %167 = llvm.add %165, %166 overflow<nsw, nuw> : i32
          %168 = llvm.add %167, %163 overflow<nsw, nuw> : i32
          %169 = llvm.getelementptr inbounds|nuw %34[%168] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %170 = llvm.load %169 : !llvm.ptr -> f32
          %171 = llvm.getelementptr inbounds|nuw %33[%168] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %170, %171 : f32, !llvm.ptr
          %172 = llvm.add %163, %25 : i32
          llvm.br ^bb14(%172 : i32)
        ^bb16:  // pred: ^bb14
          %173 = llvm.add %161, %25 : i32
          llvm.br ^bb13(%173 : i32)
        ^bb17:  // pred: ^bb13
          %174 = llvm.extractvalue %103[0] : !llvm.array<4 x vector<8xf32>> 
          %175 = llvm.getelementptr %33[%77] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %174, %175, %67 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %176 = llvm.extractvalue %103[1] : !llvm.array<4 x vector<8xf32>> 
          %177 = llvm.getelementptr %33[%81] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %176, %177, %69 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %178 = llvm.extractvalue %103[2] : !llvm.array<4 x vector<8xf32>> 
          %179 = llvm.getelementptr %33[%85] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %178, %179, %71 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %180 = llvm.extractvalue %103[3] : !llvm.array<4 x vector<8xf32>> 
          %181 = llvm.getelementptr %33[%89] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %180, %181, %73 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          llvm.br ^bb18(%22 : i32)
        ^bb18(%182: i32):  // 2 preds: ^bb17, ^bb21
          %183 = llvm.icmp "slt" %182, %65 : i32
          llvm.cond_br %183, ^bb19(%22 : i32), ^bb22(%22 : i32)
        ^bb19(%184: i32):  // 2 preds: ^bb18, ^bb20
          %185 = llvm.icmp "slt" %184, %30 : i32
          llvm.cond_br %185, ^bb20, ^bb21
        ^bb20:  // pred: ^bb19
          %186 = llvm.mul %22, %31 overflow<nsw, nuw> : i32
          %187 = llvm.mul %182, %30 overflow<nsw, nuw> : i32
          %188 = llvm.add %186, %187 overflow<nsw, nuw> : i32
          %189 = llvm.add %188, %184 overflow<nsw, nuw> : i32
          %190 = llvm.getelementptr inbounds|nuw %34[%189] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %191 = llvm.load %190 : !llvm.ptr -> f32
          %192 = llvm.getelementptr inbounds|nuw %32[%189] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %191, %192 : f32, !llvm.ptr
          %193 = llvm.add %184, %25 : i32
          llvm.br ^bb19(%193 : i32)
        ^bb21:  // pred: ^bb19
          %194 = llvm.add %182, %25 : i32
          llvm.br ^bb18(%194 : i32)
        ^bb22(%195: i32):  // 2 preds: ^bb18, ^bb25
          %196 = llvm.icmp "slt" %195, %65 : i32
          llvm.cond_br %196, ^bb23(%22 : i32), ^bb26
        ^bb23(%197: i32):  // 2 preds: ^bb22, ^bb24
          %198 = llvm.icmp "slt" %197, %30 : i32
          llvm.cond_br %198, ^bb24, ^bb25
        ^bb24:  // pred: ^bb23
          %199 = llvm.mul %22, %31 overflow<nsw, nuw> : i32
          %200 = llvm.mul %195, %30 overflow<nsw, nuw> : i32
          %201 = llvm.add %199, %200 overflow<nsw, nuw> : i32
          %202 = llvm.add %201, %197 overflow<nsw, nuw> : i32
          %203 = llvm.getelementptr inbounds|nuw %33[%202] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %204 = llvm.load %203 : !llvm.ptr -> f32
          %205 = llvm.getelementptr inbounds|nuw %32[%202] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %204, %205 : f32, !llvm.ptr
          %206 = llvm.add %197, %25 : i32
          llvm.br ^bb23(%206 : i32)
        ^bb25:  // pred: ^bb23
          %207 = llvm.add %195, %25 : i32
          llvm.br ^bb22(%207 : i32)
        ^bb26:  // pred: ^bb22
          %208 = llvm.getelementptr %32[%77] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %209 = llvm.intr.masked.load %208, %67, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %210 = llvm.getelementptr %32[%81] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %211 = llvm.intr.masked.load %210, %69, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %212 = llvm.getelementptr %32[%85] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %213 = llvm.intr.masked.load %212, %71, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %214 = llvm.getelementptr %32[%89] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %215 = llvm.intr.masked.load %214, %73, %20 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %216 = llvm.mul %91, %31 : i32
          %217 = llvm.mul %59, %27 : i32
          %218 = llvm.add %216, %217 : i32
          %219 = llvm.add %218, %92 : i32
          %220 = llvm.getelementptr %50[%219] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %209, %220, %67 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %221 = llvm.add %91, %25 : i32
          %222 = llvm.mul %221, %31 : i32
          %223 = llvm.add %222, %217 : i32
          %224 = llvm.add %223, %92 : i32
          %225 = llvm.getelementptr %50[%224] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %211, %225, %69 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %226 = llvm.add %91, %28 : i32
          %227 = llvm.mul %226, %31 : i32
          %228 = llvm.add %227, %217 : i32
          %229 = llvm.add %228, %92 : i32
          %230 = llvm.getelementptr %50[%229] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %213, %230, %71 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %231 = llvm.add %91, %16 : i32
          %232 = llvm.mul %231, %31 : i32
          %233 = llvm.add %232, %217 : i32
          %234 = llvm.add %233, %92 : i32
          %235 = llvm.getelementptr %50[%234] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %215, %235, %73 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %236 = llvm.add %92, %30 : i32
          llvm.br ^bb4(%236 : i32) {loop_annotation = #loop_annotation}
        ^bb27:  // pred: ^bb4
          %237 = llvm.add %61, %29 : i32
          llvm.br ^bb2(%237 : i32) {loop_annotation = #loop_annotation}
        ^bb28:  // pred: ^bb2
          %238 = llvm.add %59, %25 : i32
          llvm.br ^bb1(%238 : i32) {loop_annotation = #loop_annotation}
        ^bb29:  // 2 preds: ^bb0, ^bb1
          llvm.return %4 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_10 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_10_matmul_17x32x32_f32 ordinal(0) layout(#pipeline_layout4) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_10_matmul_17x32x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i64) : i64
          %1 = llvm.mlir.constant(6 : i64) : i64
          %2 = llvm.mlir.constant(5 : i64) : i64
          %3 = llvm.mlir.constant(4 : i64) : i64
          %4 = llvm.mlir.constant(3 : i64) : i64
          %5 = llvm.mlir.constant(2 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(7 : i32) : i32
          %9 = llvm.mlir.constant(6 : i32) : i32
          %10 = llvm.mlir.constant(5 : i32) : i32
          %11 = llvm.mlir.constant(4 : i32) : i32
          %12 = llvm.mlir.constant(3 : i32) : i32
          %13 = llvm.mlir.constant(2 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.poison : vector<8xi32>
          %17 = llvm.mlir.constant(8 : i32) : i32
          %18 = llvm.mlir.constant(32 : i32) : i32
          %19 = llvm.mlir.constant(true) : i1
          %20 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %21 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %22 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %23 = llvm.mlir.constant(-16 : index) : i32
          %24 = llvm.mlir.constant(17 : index) : i32
          %25 = llvm.mlir.constant(16 : index) : i32
          %26 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %27 = llvm.mlir.poison : vector<8xf32>
          %28 = llvm.mlir.constant(7 : index) : i32
          %29 = llvm.mlir.constant(6 : index) : i32
          %30 = llvm.mlir.constant(5 : index) : i32
          %31 = llvm.mlir.constant(4 : index) : i32
          %32 = llvm.mlir.constant(3 : index) : i32
          %33 = llvm.mlir.constant(2 : index) : i32
          %34 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %35 = llvm.mlir.constant(0 : index) : i32
          %36 = llvm.mlir.constant(32 : index) : i32
          %37 = llvm.mlir.constant(1 : index) : i32
          %38 = llvm.mlir.constant(8 : index) : i32
          %39 = llvm.mlir.constant(64 : index) : i32
          %40 = llvm.alloca %39 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %41 = llvm.alloca %39 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %42 = llvm.alloca %39 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %43 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %44 = llvm.extractvalue %43[9] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %45 = llvm.load %44 : !llvm.ptr -> i32
          %46 = llvm.extractvalue %43[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %47 = llvm.load %46 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%47, %39 : !llvm.ptr, i32)] : i1
          %48 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %49 = llvm.extractvalue %48[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %50 = llvm.getelementptr %49[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %51 = llvm.load %50 : !llvm.ptr -> !llvm.ptr
          %52 = llvm.mul %45, %17 : i32
          %53 = llvm.udiv %52, %18 : i32
          %54 = llvm.getelementptr %51[%53] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%54, %39 : !llvm.ptr, i32)] : i1
          %55 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %56 = llvm.extractvalue %55[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %57 = llvm.getelementptr %56[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %58 = llvm.load %57 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%58, %39 : !llvm.ptr, i32)] : i1
          %59 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %60 = llvm.extractvalue %59[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %61 = llvm.getelementptr %60[3] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %62 = llvm.load %61 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%62, %39 : !llvm.ptr, i32)] : i1
          %63 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %64 = llvm.extractvalue %63[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %65 = llvm.mul %64, %25 overflow<nsw> : i32
          %66 = llvm.mul %64, %23 overflow<nsw> : i32
          %67 = llvm.add %66, %24 : i32
          %68 = llvm.icmp "slt" %67, %25 : i32
          %69 = llvm.select %68, %67, %25 : i1, i32
          %70 = llvm.icmp "sgt" %69, %35 : i32
          llvm.cond_br %70, ^bb1(%35 : i32), ^bb27
        ^bb1(%71: i32):  // 2 preds: ^bb0, ^bb26
          %72 = llvm.icmp "slt" %71, %69 : i32
          llvm.cond_br %72, ^bb2, ^bb27
        ^bb2:  // pred: ^bb1
          %73 = llvm.sub %69, %71 : i32
          %74 = llvm.icmp "slt" %73, %38 : i32
          %75 = llvm.select %74, %73, %38 : i1, i32
          %76 = llvm.icmp "sgt" %75, %35 : i32
          %77 = llvm.select %76, %22, %21 : i1, vector<8xi1>
          %78 = llvm.icmp "sgt" %75, %37 : i32
          %79 = llvm.select %78, %22, %21 : i1, vector<8xi1>
          %80 = llvm.icmp "sgt" %75, %33 : i32
          %81 = llvm.select %80, %22, %21 : i1, vector<8xi1>
          %82 = llvm.icmp "sgt" %75, %32 : i32
          %83 = llvm.select %82, %22, %21 : i1, vector<8xi1>
          %84 = llvm.icmp "sgt" %75, %31 : i32
          %85 = llvm.select %84, %22, %21 : i1, vector<8xi1>
          %86 = llvm.icmp "sgt" %75, %30 : i32
          %87 = llvm.select %86, %22, %21 : i1, vector<8xi1>
          %88 = llvm.icmp "sgt" %75, %29 : i32
          %89 = llvm.select %88, %22, %21 : i1, vector<8xi1>
          %90 = llvm.icmp "sgt" %75, %28 : i32
          %91 = llvm.select %90, %22, %21 : i1, vector<8xi1>
          %92 = llvm.mul %35, %38 : i32
          %93 = llvm.add %92, %35 : i32
          %94 = llvm.getelementptr %42[%93] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %94, %77 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %95 = llvm.mul %37, %38 : i32
          %96 = llvm.add %95, %35 : i32
          %97 = llvm.getelementptr %42[%96] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %97, %79 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %98 = llvm.mul %33, %38 : i32
          %99 = llvm.add %98, %35 : i32
          %100 = llvm.getelementptr %42[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %100, %81 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %101 = llvm.mul %32, %38 : i32
          %102 = llvm.add %101, %35 : i32
          %103 = llvm.getelementptr %42[%102] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %103, %83 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %104 = llvm.mul %31, %38 : i32
          %105 = llvm.add %104, %35 : i32
          %106 = llvm.getelementptr %42[%105] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %106, %85 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %107 = llvm.mul %30, %38 : i32
          %108 = llvm.add %107, %35 : i32
          %109 = llvm.getelementptr %42[%108] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %109, %87 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %110 = llvm.mul %29, %38 : i32
          %111 = llvm.add %110, %35 : i32
          %112 = llvm.getelementptr %42[%111] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %112, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %113 = llvm.mul %28, %38 : i32
          %114 = llvm.add %113, %35 : i32
          %115 = llvm.getelementptr %42[%114] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %115, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %116 = llvm.add %71, %65 : i32
          llvm.br ^bb3(%35 : i32)
        ^bb3(%117: i32):  // 2 preds: ^bb2, ^bb25
          %118 = llvm.icmp "slt" %117, %36 : i32
          llvm.cond_br %118, ^bb4, ^bb26
        ^bb4:  // pred: ^bb3
          %119 = llvm.intr.masked.load %94, %77, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %120 = llvm.intr.masked.load %97, %79, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %121 = llvm.intr.masked.load %100, %81, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %122 = llvm.intr.masked.load %103, %83, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %123 = llvm.intr.masked.load %106, %85, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %124 = llvm.intr.masked.load %109, %87, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %125 = llvm.intr.masked.load %112, %89, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %126 = llvm.intr.masked.load %115, %91, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %127 = llvm.insertvalue %119, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %128 = llvm.insertvalue %120, %127[1] : !llvm.array<8 x vector<8xf32>> 
          %129 = llvm.insertvalue %121, %128[2] : !llvm.array<8 x vector<8xf32>> 
          %130 = llvm.insertvalue %122, %129[3] : !llvm.array<8 x vector<8xf32>> 
          %131 = llvm.insertvalue %123, %130[4] : !llvm.array<8 x vector<8xf32>> 
          %132 = llvm.insertvalue %124, %131[5] : !llvm.array<8 x vector<8xf32>> 
          %133 = llvm.insertvalue %125, %132[6] : !llvm.array<8 x vector<8xf32>> 
          %134 = llvm.insertvalue %126, %133[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%35, %134 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%135: i32, %136: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %137 = llvm.icmp "slt" %135, %36 : i32
          llvm.cond_br %137, ^bb6, ^bb12(%35 : i32)
        ^bb6:  // pred: ^bb5
          %138 = llvm.insertelement %75, %16[%15 : i32] : vector<8xi32>
          %139 = llvm.shufflevector %138, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %140 = llvm.icmp "sgt" %139, %26 : vector<8xi32>
          llvm.br ^bb7(%35, %27 : i32, vector<8xf32>)
        ^bb7(%141: i32, %142: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %143 = llvm.icmp "slt" %141, %38 : i32
          llvm.cond_br %143, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %144 = llvm.extractelement %140[%141 : i32] : vector<8xi1>
          llvm.cond_br %144, ^bb9, ^bb10(%142 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %145 = llvm.add %116, %141 : i32
          %146 = llvm.mul %145, %36 overflow<nsw, nuw> : i32
          %147 = llvm.add %146, %135 overflow<nsw, nuw> : i32
          %148 = llvm.getelementptr inbounds|nuw %47[%147] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %149 = llvm.load %148 : !llvm.ptr -> f32
          %150 = llvm.insertelement %149, %142[%141 : i32] : vector<8xf32>
          llvm.br ^bb10(%150 : vector<8xf32>)
        ^bb10(%151: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %152 = llvm.add %141, %37 : i32
          llvm.br ^bb7(%152, %151 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %153 = llvm.mul %117, %36 : i32
          %154 = llvm.add %153, %135 : i32
          %155 = llvm.getelementptr %54[%154] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %156 = llvm.load %155 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %157 = llvm.add %117, %37 : i32
          %158 = llvm.mul %157, %36 : i32
          %159 = llvm.add %158, %135 : i32
          %160 = llvm.getelementptr %54[%159] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %161 = llvm.load %160 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %162 = llvm.add %117, %33 : i32
          %163 = llvm.mul %162, %36 : i32
          %164 = llvm.add %163, %135 : i32
          %165 = llvm.getelementptr %54[%164] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %166 = llvm.load %165 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %167 = llvm.add %117, %32 : i32
          %168 = llvm.mul %167, %36 : i32
          %169 = llvm.add %168, %135 : i32
          %170 = llvm.getelementptr %54[%169] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %171 = llvm.load %170 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %172 = llvm.add %117, %31 : i32
          %173 = llvm.mul %172, %36 : i32
          %174 = llvm.add %173, %135 : i32
          %175 = llvm.getelementptr %54[%174] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %176 = llvm.load %175 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %177 = llvm.add %117, %30 : i32
          %178 = llvm.mul %177, %36 : i32
          %179 = llvm.add %178, %135 : i32
          %180 = llvm.getelementptr %54[%179] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %181 = llvm.load %180 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %182 = llvm.add %117, %29 : i32
          %183 = llvm.mul %182, %36 : i32
          %184 = llvm.add %183, %135 : i32
          %185 = llvm.getelementptr %54[%184] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %186 = llvm.load %185 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %187 = llvm.add %117, %28 : i32
          %188 = llvm.mul %187, %36 : i32
          %189 = llvm.add %188, %135 : i32
          %190 = llvm.getelementptr %54[%189] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %191 = llvm.load %190 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %192 = llvm.extractelement %156[%15 : i32] : vector<1xf32>
          %193 = llvm.extractelement %161[%15 : i32] : vector<1xf32>
          %194 = llvm.extractelement %166[%15 : i32] : vector<1xf32>
          %195 = llvm.extractelement %171[%15 : i32] : vector<1xf32>
          %196 = llvm.extractelement %176[%15 : i32] : vector<1xf32>
          %197 = llvm.extractelement %181[%15 : i32] : vector<1xf32>
          %198 = llvm.extractelement %186[%15 : i32] : vector<1xf32>
          %199 = llvm.extractelement %191[%15 : i32] : vector<1xf32>
          %200 = llvm.insertelement %192, %27[%15 : i32] : vector<8xf32>
          %201 = llvm.insertelement %193, %200[%14 : i32] : vector<8xf32>
          %202 = llvm.insertelement %194, %201[%13 : i32] : vector<8xf32>
          %203 = llvm.insertelement %195, %202[%12 : i32] : vector<8xf32>
          %204 = llvm.insertelement %196, %203[%11 : i32] : vector<8xf32>
          %205 = llvm.insertelement %197, %204[%10 : i32] : vector<8xf32>
          %206 = llvm.insertelement %198, %205[%9 : i32] : vector<8xf32>
          %207 = llvm.insertelement %199, %206[%8 : i32] : vector<8xf32>
          %208 = llvm.extractelement %142[%7 : i64] : vector<8xf32>
          %209 = llvm.insertelement %208, %27[%15 : i32] : vector<8xf32>
          %210 = llvm.shufflevector %209, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %211 = llvm.extractvalue %136[0] : !llvm.array<8 x vector<8xf32>> 
          %212 = llvm.intr.fmuladd(%210, %207, %211) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %213 = llvm.select %77, %212, %211 : vector<8xi1>, vector<8xf32>
          %214 = llvm.extractelement %142[%6 : i64] : vector<8xf32>
          %215 = llvm.insertelement %214, %27[%15 : i32] : vector<8xf32>
          %216 = llvm.shufflevector %215, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %217 = llvm.extractvalue %136[1] : !llvm.array<8 x vector<8xf32>> 
          %218 = llvm.intr.fmuladd(%216, %207, %217) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %219 = llvm.select %79, %218, %217 : vector<8xi1>, vector<8xf32>
          %220 = llvm.extractelement %142[%5 : i64] : vector<8xf32>
          %221 = llvm.insertelement %220, %27[%15 : i32] : vector<8xf32>
          %222 = llvm.shufflevector %221, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %223 = llvm.extractvalue %136[2] : !llvm.array<8 x vector<8xf32>> 
          %224 = llvm.intr.fmuladd(%222, %207, %223) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %225 = llvm.select %81, %224, %223 : vector<8xi1>, vector<8xf32>
          %226 = llvm.extractelement %142[%4 : i64] : vector<8xf32>
          %227 = llvm.insertelement %226, %27[%15 : i32] : vector<8xf32>
          %228 = llvm.shufflevector %227, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %229 = llvm.extractvalue %136[3] : !llvm.array<8 x vector<8xf32>> 
          %230 = llvm.intr.fmuladd(%228, %207, %229) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %231 = llvm.select %83, %230, %229 : vector<8xi1>, vector<8xf32>
          %232 = llvm.extractelement %142[%3 : i64] : vector<8xf32>
          %233 = llvm.insertelement %232, %27[%15 : i32] : vector<8xf32>
          %234 = llvm.shufflevector %233, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %235 = llvm.extractvalue %136[4] : !llvm.array<8 x vector<8xf32>> 
          %236 = llvm.intr.fmuladd(%234, %207, %235) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %237 = llvm.select %85, %236, %235 : vector<8xi1>, vector<8xf32>
          %238 = llvm.extractelement %142[%2 : i64] : vector<8xf32>
          %239 = llvm.insertelement %238, %27[%15 : i32] : vector<8xf32>
          %240 = llvm.shufflevector %239, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %241 = llvm.extractvalue %136[5] : !llvm.array<8 x vector<8xf32>> 
          %242 = llvm.intr.fmuladd(%240, %207, %241) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %243 = llvm.select %87, %242, %241 : vector<8xi1>, vector<8xf32>
          %244 = llvm.extractelement %142[%1 : i64] : vector<8xf32>
          %245 = llvm.insertelement %244, %27[%15 : i32] : vector<8xf32>
          %246 = llvm.shufflevector %245, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %247 = llvm.extractvalue %136[6] : !llvm.array<8 x vector<8xf32>> 
          %248 = llvm.intr.fmuladd(%246, %207, %247) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %249 = llvm.select %89, %248, %247 : vector<8xi1>, vector<8xf32>
          %250 = llvm.extractelement %142[%0 : i64] : vector<8xf32>
          %251 = llvm.insertelement %250, %27[%15 : i32] : vector<8xf32>
          %252 = llvm.shufflevector %251, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %253 = llvm.extractvalue %136[7] : !llvm.array<8 x vector<8xf32>> 
          %254 = llvm.intr.fmuladd(%252, %207, %253) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %255 = llvm.select %91, %254, %253 : vector<8xi1>, vector<8xf32>
          %256 = llvm.insertvalue %213, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %257 = llvm.insertvalue %219, %256[1] : !llvm.array<8 x vector<8xf32>> 
          %258 = llvm.insertvalue %225, %257[2] : !llvm.array<8 x vector<8xf32>> 
          %259 = llvm.insertvalue %231, %258[3] : !llvm.array<8 x vector<8xf32>> 
          %260 = llvm.insertvalue %237, %259[4] : !llvm.array<8 x vector<8xf32>> 
          %261 = llvm.insertvalue %243, %260[5] : !llvm.array<8 x vector<8xf32>> 
          %262 = llvm.insertvalue %249, %261[6] : !llvm.array<8 x vector<8xf32>> 
          %263 = llvm.insertvalue %255, %262[7] : !llvm.array<8 x vector<8xf32>> 
          %264 = llvm.add %135, %37 : i32
          llvm.br ^bb5(%264, %263 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12(%265: i32):  // 2 preds: ^bb5, ^bb15
          %266 = llvm.icmp "slt" %265, %75 : i32
          llvm.cond_br %266, ^bb13(%35 : i32), ^bb16
        ^bb13(%267: i32):  // 2 preds: ^bb12, ^bb14
          %268 = llvm.icmp "slt" %267, %38 : i32
          llvm.cond_br %268, ^bb14, ^bb15
        ^bb14:  // pred: ^bb13
          %269 = llvm.mul %265, %38 overflow<nsw, nuw> : i32
          %270 = llvm.add %269, %267 overflow<nsw, nuw> : i32
          %271 = llvm.getelementptr inbounds|nuw %42[%270] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %272 = llvm.load %271 : !llvm.ptr -> f32
          %273 = llvm.getelementptr inbounds|nuw %41[%270] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %272, %273 : f32, !llvm.ptr
          %274 = llvm.add %267, %37 : i32
          llvm.br ^bb13(%274 : i32)
        ^bb15:  // pred: ^bb13
          %275 = llvm.add %265, %37 : i32
          llvm.br ^bb12(%275 : i32)
        ^bb16:  // pred: ^bb12
          %276 = llvm.extractvalue %136[0] : !llvm.array<8 x vector<8xf32>> 
          %277 = llvm.getelementptr %41[%93] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %276, %277, %77 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %278 = llvm.extractvalue %136[1] : !llvm.array<8 x vector<8xf32>> 
          %279 = llvm.getelementptr %41[%96] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %278, %279, %79 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %280 = llvm.extractvalue %136[2] : !llvm.array<8 x vector<8xf32>> 
          %281 = llvm.getelementptr %41[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %280, %281, %81 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %282 = llvm.extractvalue %136[3] : !llvm.array<8 x vector<8xf32>> 
          %283 = llvm.getelementptr %41[%102] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %282, %283, %83 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %284 = llvm.extractvalue %136[4] : !llvm.array<8 x vector<8xf32>> 
          %285 = llvm.getelementptr %41[%105] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %284, %285, %85 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %286 = llvm.extractvalue %136[5] : !llvm.array<8 x vector<8xf32>> 
          %287 = llvm.getelementptr %41[%108] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %286, %287, %87 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %288 = llvm.extractvalue %136[6] : !llvm.array<8 x vector<8xf32>> 
          %289 = llvm.getelementptr %41[%111] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %288, %289, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %290 = llvm.extractvalue %136[7] : !llvm.array<8 x vector<8xf32>> 
          %291 = llvm.getelementptr %41[%114] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %290, %291, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          llvm.br ^bb17(%35 : i32)
        ^bb17(%292: i32):  // 2 preds: ^bb16, ^bb20
          %293 = llvm.icmp "slt" %292, %75 : i32
          llvm.cond_br %293, ^bb18(%35 : i32), ^bb21(%35 : i32)
        ^bb18(%294: i32):  // 2 preds: ^bb17, ^bb19
          %295 = llvm.icmp "slt" %294, %38 : i32
          llvm.cond_br %295, ^bb19, ^bb20
        ^bb19:  // pred: ^bb18
          %296 = llvm.mul %292, %38 overflow<nsw, nuw> : i32
          %297 = llvm.add %296, %294 overflow<nsw, nuw> : i32
          %298 = llvm.getelementptr inbounds|nuw %42[%297] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %299 = llvm.load %298 : !llvm.ptr -> f32
          %300 = llvm.getelementptr inbounds|nuw %40[%297] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %299, %300 : f32, !llvm.ptr
          %301 = llvm.add %294, %37 : i32
          llvm.br ^bb18(%301 : i32)
        ^bb20:  // pred: ^bb18
          %302 = llvm.add %292, %37 : i32
          llvm.br ^bb17(%302 : i32)
        ^bb21(%303: i32):  // 2 preds: ^bb17, ^bb24
          %304 = llvm.icmp "slt" %303, %75 : i32
          llvm.cond_br %304, ^bb22(%35 : i32), ^bb25
        ^bb22(%305: i32):  // 2 preds: ^bb21, ^bb23
          %306 = llvm.icmp "slt" %305, %38 : i32
          llvm.cond_br %306, ^bb23, ^bb24
        ^bb23:  // pred: ^bb22
          %307 = llvm.mul %303, %38 overflow<nsw, nuw> : i32
          %308 = llvm.add %307, %305 overflow<nsw, nuw> : i32
          %309 = llvm.getelementptr inbounds|nuw %41[%308] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %310 = llvm.load %309 : !llvm.ptr -> f32
          %311 = llvm.getelementptr inbounds|nuw %40[%308] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %310, %311 : f32, !llvm.ptr
          %312 = llvm.add %305, %37 : i32
          llvm.br ^bb22(%312 : i32)
        ^bb24:  // pred: ^bb22
          %313 = llvm.add %303, %37 : i32
          llvm.br ^bb21(%313 : i32)
        ^bb25:  // pred: ^bb21
          %314 = llvm.mul %116, %36 : i32
          %315 = llvm.add %314, %117 : i32
          %316 = llvm.getelementptr %58[%315] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %317 = llvm.intr.masked.load %316, %77, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %318 = llvm.add %116, %37 : i32
          %319 = llvm.mul %318, %36 : i32
          %320 = llvm.add %319, %117 : i32
          %321 = llvm.getelementptr %58[%320] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %322 = llvm.intr.masked.load %321, %79, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %323 = llvm.add %116, %33 : i32
          %324 = llvm.mul %323, %36 : i32
          %325 = llvm.add %324, %117 : i32
          %326 = llvm.getelementptr %58[%325] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %327 = llvm.intr.masked.load %326, %81, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %328 = llvm.add %116, %32 : i32
          %329 = llvm.mul %328, %36 : i32
          %330 = llvm.add %329, %117 : i32
          %331 = llvm.getelementptr %58[%330] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %332 = llvm.intr.masked.load %331, %83, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %333 = llvm.add %116, %31 : i32
          %334 = llvm.mul %333, %36 : i32
          %335 = llvm.add %334, %117 : i32
          %336 = llvm.getelementptr %58[%335] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %337 = llvm.intr.masked.load %336, %85, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %338 = llvm.add %116, %30 : i32
          %339 = llvm.mul %338, %36 : i32
          %340 = llvm.add %339, %117 : i32
          %341 = llvm.getelementptr %58[%340] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %342 = llvm.intr.masked.load %341, %87, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %343 = llvm.add %116, %29 : i32
          %344 = llvm.mul %343, %36 : i32
          %345 = llvm.add %344, %117 : i32
          %346 = llvm.getelementptr %58[%345] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %347 = llvm.intr.masked.load %346, %89, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %348 = llvm.add %116, %28 : i32
          %349 = llvm.mul %348, %36 : i32
          %350 = llvm.add %349, %117 : i32
          %351 = llvm.getelementptr %58[%350] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %352 = llvm.intr.masked.load %351, %91, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %353 = llvm.getelementptr %40[%93] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %354 = llvm.intr.masked.load %353, %77, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %355 = llvm.getelementptr %40[%96] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %356 = llvm.intr.masked.load %355, %79, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %357 = llvm.getelementptr %40[%99] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %358 = llvm.intr.masked.load %357, %81, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %359 = llvm.getelementptr %40[%102] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %360 = llvm.intr.masked.load %359, %83, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %361 = llvm.getelementptr %40[%105] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %362 = llvm.intr.masked.load %361, %85, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %363 = llvm.getelementptr %40[%108] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %364 = llvm.intr.masked.load %363, %87, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %365 = llvm.getelementptr %40[%111] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %366 = llvm.intr.masked.load %365, %89, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %367 = llvm.getelementptr %40[%114] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %368 = llvm.intr.masked.load %367, %91, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %369 = llvm.fadd %317, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %370 = llvm.fadd %322, %356 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %371 = llvm.fadd %327, %358 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %372 = llvm.fadd %332, %360 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %373 = llvm.fadd %337, %362 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %374 = llvm.fadd %342, %364 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %375 = llvm.fadd %347, %366 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %376 = llvm.fadd %352, %368 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %377 = llvm.getelementptr %62[%315] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %369, %377, %77 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %378 = llvm.getelementptr %62[%320] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %370, %378, %79 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %379 = llvm.getelementptr %62[%325] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %371, %379, %81 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %380 = llvm.getelementptr %62[%330] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %372, %380, %83 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %381 = llvm.getelementptr %62[%335] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %373, %381, %85 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %382 = llvm.getelementptr %62[%340] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %374, %382, %87 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %383 = llvm.getelementptr %62[%345] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %375, %383, %89 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %384 = llvm.getelementptr %62[%350] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %376, %384, %91 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %385 = llvm.add %117, %38 : i32
          llvm.br ^bb3(%385 : i32) {loop_annotation = #loop_annotation}
        ^bb26:  // pred: ^bb3
          %386 = llvm.add %71, %38 : i32
          llvm.br ^bb1(%386 : i32) {loop_annotation = #loop_annotation}
        ^bb27:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_13 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_13_matmul_17x64x32_f32 ordinal(0) layout(#pipeline_layout3) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_13_matmul_17x64x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i64) : i64
          %1 = llvm.mlir.constant(6 : i64) : i64
          %2 = llvm.mlir.constant(5 : i64) : i64
          %3 = llvm.mlir.constant(4 : i64) : i64
          %4 = llvm.mlir.constant(3 : i64) : i64
          %5 = llvm.mlir.constant(2 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(7 : i32) : i32
          %9 = llvm.mlir.constant(6 : i32) : i32
          %10 = llvm.mlir.constant(5 : i32) : i32
          %11 = llvm.mlir.constant(4 : i32) : i32
          %12 = llvm.mlir.constant(3 : i32) : i32
          %13 = llvm.mlir.constant(2 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.poison : vector<8xi32>
          %17 = llvm.mlir.constant(8 : i32) : i32
          %18 = llvm.mlir.constant(32 : i32) : i32
          %19 = llvm.mlir.constant(true) : i1
          %20 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %21 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %22 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %23 = llvm.mlir.constant(dense<1.19825836E-6> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %24 = llvm.mlir.constant(dense<1.18534706E-4> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %25 = llvm.mlir.constant(dense<0.00226843474> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %26 = llvm.mlir.constant(dense<0.00489352504> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %27 = llvm.mlir.constant(dense<-2.76076837E-16> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %28 = llvm.mlir.constant(dense<2.00018794E-13> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %29 = llvm.mlir.constant(dense<-8.60467184E-11> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %30 = llvm.mlir.constant(dense<5.12229725E-8> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %31 = llvm.mlir.constant(dense<1.48572235E-5> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %32 = llvm.mlir.constant(dense<6.37261954E-4> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %33 = llvm.mlir.constant(dense<0.00489352457> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %34 = llvm.mlir.constant(dense<4.000000e-04> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %35 = llvm.mlir.constant(dense<7.99881172> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %36 = llvm.mlir.constant(dense<-7.99881172> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %37 = llvm.mlir.constant(-16 : index) : i32
          %38 = llvm.mlir.constant(17 : index) : i32
          %39 = llvm.mlir.constant(16 : index) : i32
          %40 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %41 = llvm.mlir.poison : vector<8xf32>
          %42 = llvm.mlir.constant(7 : index) : i32
          %43 = llvm.mlir.constant(6 : index) : i32
          %44 = llvm.mlir.constant(5 : index) : i32
          %45 = llvm.mlir.constant(4 : index) : i32
          %46 = llvm.mlir.constant(3 : index) : i32
          %47 = llvm.mlir.constant(2 : index) : i32
          %48 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %49 = llvm.mlir.constant(0 : index) : i32
          %50 = llvm.mlir.constant(32 : index) : i32
          %51 = llvm.mlir.constant(1 : index) : i32
          %52 = llvm.mlir.constant(64 : index) : i32
          %53 = llvm.mlir.constant(8 : index) : i32
          %54 = llvm.mlir.constant(dense<4.471500e-02> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %55 = llvm.mlir.constant(dense<0.797884523> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %56 = llvm.mlir.constant(dense<1.000000e+00> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %57 = llvm.mlir.constant(dense<5.000000e-01> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %58 = llvm.alloca %52 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %59 = llvm.alloca %52 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %60 = llvm.alloca %52 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %61 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %62 = llvm.extractvalue %61[9] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %63 = llvm.load %62 : !llvm.ptr -> i32
          %64 = llvm.getelementptr %62[1] : (!llvm.ptr) -> !llvm.ptr, i32
          %65 = llvm.load %64 : !llvm.ptr -> i32
          %66 = llvm.extractvalue %61[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %67 = llvm.load %66 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%67, %52 : !llvm.ptr, i32)] : i1
          %68 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %69 = llvm.extractvalue %68[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %70 = llvm.getelementptr %69[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %71 = llvm.load %70 : !llvm.ptr -> !llvm.ptr
          %72 = llvm.mul %63, %17 : i32
          %73 = llvm.udiv %72, %18 : i32
          %74 = llvm.getelementptr %71[%73] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%74, %52 : !llvm.ptr, i32)] : i1
          %75 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %76 = llvm.extractvalue %75[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %77 = llvm.getelementptr %76[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %78 = llvm.load %77 : !llvm.ptr -> !llvm.ptr
          %79 = llvm.mul %65, %17 : i32
          %80 = llvm.udiv %79, %18 : i32
          %81 = llvm.getelementptr %78[%80] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%81, %52 : !llvm.ptr, i32)] : i1
          %82 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %83 = llvm.extractvalue %82[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %84 = llvm.getelementptr %83[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %85 = llvm.load %84 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%85, %52 : !llvm.ptr, i32)] : i1
          %86 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %87 = llvm.extractvalue %86[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %88 = llvm.mul %87, %39 overflow<nsw> : i32
          %89 = llvm.mul %87, %37 overflow<nsw> : i32
          %90 = llvm.add %89, %38 : i32
          %91 = llvm.icmp "slt" %90, %39 : i32
          %92 = llvm.select %91, %90, %39 : i1, i32
          %93 = llvm.icmp "sgt" %92, %49 : i32
          llvm.cond_br %93, ^bb1(%49 : i32), ^bb27
        ^bb1(%94: i32):  // 2 preds: ^bb0, ^bb26
          %95 = llvm.icmp "slt" %94, %92 : i32
          llvm.cond_br %95, ^bb2, ^bb27
        ^bb2:  // pred: ^bb1
          %96 = llvm.sub %92, %94 : i32
          %97 = llvm.icmp "slt" %96, %53 : i32
          %98 = llvm.select %97, %96, %53 : i1, i32
          %99 = llvm.icmp "sgt" %98, %49 : i32
          %100 = llvm.select %99, %22, %21 : i1, vector<8xi1>
          %101 = llvm.icmp "sgt" %98, %51 : i32
          %102 = llvm.select %101, %22, %21 : i1, vector<8xi1>
          %103 = llvm.icmp "sgt" %98, %47 : i32
          %104 = llvm.select %103, %22, %21 : i1, vector<8xi1>
          %105 = llvm.icmp "sgt" %98, %46 : i32
          %106 = llvm.select %105, %22, %21 : i1, vector<8xi1>
          %107 = llvm.icmp "sgt" %98, %45 : i32
          %108 = llvm.select %107, %22, %21 : i1, vector<8xi1>
          %109 = llvm.icmp "sgt" %98, %44 : i32
          %110 = llvm.select %109, %22, %21 : i1, vector<8xi1>
          %111 = llvm.icmp "sgt" %98, %43 : i32
          %112 = llvm.select %111, %22, %21 : i1, vector<8xi1>
          %113 = llvm.icmp "sgt" %98, %42 : i32
          %114 = llvm.select %113, %22, %21 : i1, vector<8xi1>
          %115 = llvm.mul %49, %53 : i32
          %116 = llvm.add %115, %49 : i32
          %117 = llvm.getelementptr %60[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %117, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %118 = llvm.mul %51, %53 : i32
          %119 = llvm.add %118, %49 : i32
          %120 = llvm.getelementptr %60[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %120, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %121 = llvm.mul %47, %53 : i32
          %122 = llvm.add %121, %49 : i32
          %123 = llvm.getelementptr %60[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %123, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %124 = llvm.mul %46, %53 : i32
          %125 = llvm.add %124, %49 : i32
          %126 = llvm.getelementptr %60[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %126, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %127 = llvm.mul %45, %53 : i32
          %128 = llvm.add %127, %49 : i32
          %129 = llvm.getelementptr %60[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %129, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %130 = llvm.mul %44, %53 : i32
          %131 = llvm.add %130, %49 : i32
          %132 = llvm.getelementptr %60[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %132, %110 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %133 = llvm.mul %43, %53 : i32
          %134 = llvm.add %133, %49 : i32
          %135 = llvm.getelementptr %60[%134] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %135, %112 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %136 = llvm.mul %42, %53 : i32
          %137 = llvm.add %136, %49 : i32
          %138 = llvm.getelementptr %60[%137] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %138, %114 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %139 = llvm.add %94, %88 : i32
          llvm.br ^bb3(%49 : i32)
        ^bb3(%140: i32):  // 2 preds: ^bb2, ^bb25
          %141 = llvm.icmp "slt" %140, %52 : i32
          llvm.cond_br %141, ^bb4, ^bb26
        ^bb4:  // pred: ^bb3
          %142 = llvm.intr.masked.load %117, %100, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %143 = llvm.intr.masked.load %120, %102, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %144 = llvm.intr.masked.load %123, %104, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %145 = llvm.intr.masked.load %126, %106, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %146 = llvm.intr.masked.load %129, %108, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %147 = llvm.intr.masked.load %132, %110, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %148 = llvm.intr.masked.load %135, %112, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %149 = llvm.intr.masked.load %138, %114, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %150 = llvm.insertvalue %142, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %151 = llvm.insertvalue %143, %150[1] : !llvm.array<8 x vector<8xf32>> 
          %152 = llvm.insertvalue %144, %151[2] : !llvm.array<8 x vector<8xf32>> 
          %153 = llvm.insertvalue %145, %152[3] : !llvm.array<8 x vector<8xf32>> 
          %154 = llvm.insertvalue %146, %153[4] : !llvm.array<8 x vector<8xf32>> 
          %155 = llvm.insertvalue %147, %154[5] : !llvm.array<8 x vector<8xf32>> 
          %156 = llvm.insertvalue %148, %155[6] : !llvm.array<8 x vector<8xf32>> 
          %157 = llvm.insertvalue %149, %156[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%49, %157 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%158: i32, %159: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %160 = llvm.icmp "slt" %158, %50 : i32
          llvm.cond_br %160, ^bb6, ^bb12(%49 : i32)
        ^bb6:  // pred: ^bb5
          %161 = llvm.insertelement %98, %16[%15 : i32] : vector<8xi32>
          %162 = llvm.shufflevector %161, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %163 = llvm.icmp "sgt" %162, %40 : vector<8xi32>
          llvm.br ^bb7(%49, %41 : i32, vector<8xf32>)
        ^bb7(%164: i32, %165: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %166 = llvm.icmp "slt" %164, %53 : i32
          llvm.cond_br %166, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %167 = llvm.extractelement %163[%164 : i32] : vector<8xi1>
          llvm.cond_br %167, ^bb9, ^bb10(%165 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %168 = llvm.add %139, %164 : i32
          %169 = llvm.mul %168, %50 overflow<nsw, nuw> : i32
          %170 = llvm.add %169, %158 overflow<nsw, nuw> : i32
          %171 = llvm.getelementptr inbounds|nuw %67[%170] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %172 = llvm.load %171 : !llvm.ptr -> f32
          %173 = llvm.insertelement %172, %165[%164 : i32] : vector<8xf32>
          llvm.br ^bb10(%173 : vector<8xf32>)
        ^bb10(%174: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %175 = llvm.add %164, %51 : i32
          llvm.br ^bb7(%175, %174 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %176 = llvm.mul %140, %50 : i32
          %177 = llvm.add %176, %158 : i32
          %178 = llvm.getelementptr %74[%177] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %179 = llvm.load %178 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %180 = llvm.add %140, %51 : i32
          %181 = llvm.mul %180, %50 : i32
          %182 = llvm.add %181, %158 : i32
          %183 = llvm.getelementptr %74[%182] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %184 = llvm.load %183 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %185 = llvm.add %140, %47 : i32
          %186 = llvm.mul %185, %50 : i32
          %187 = llvm.add %186, %158 : i32
          %188 = llvm.getelementptr %74[%187] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %189 = llvm.load %188 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %190 = llvm.add %140, %46 : i32
          %191 = llvm.mul %190, %50 : i32
          %192 = llvm.add %191, %158 : i32
          %193 = llvm.getelementptr %74[%192] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %194 = llvm.load %193 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %195 = llvm.add %140, %45 : i32
          %196 = llvm.mul %195, %50 : i32
          %197 = llvm.add %196, %158 : i32
          %198 = llvm.getelementptr %74[%197] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %199 = llvm.load %198 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %200 = llvm.add %140, %44 : i32
          %201 = llvm.mul %200, %50 : i32
          %202 = llvm.add %201, %158 : i32
          %203 = llvm.getelementptr %74[%202] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %204 = llvm.load %203 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %205 = llvm.add %140, %43 : i32
          %206 = llvm.mul %205, %50 : i32
          %207 = llvm.add %206, %158 : i32
          %208 = llvm.getelementptr %74[%207] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %209 = llvm.load %208 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %210 = llvm.add %140, %42 : i32
          %211 = llvm.mul %210, %50 : i32
          %212 = llvm.add %211, %158 : i32
          %213 = llvm.getelementptr %74[%212] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %214 = llvm.load %213 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %215 = llvm.extractelement %179[%15 : i32] : vector<1xf32>
          %216 = llvm.extractelement %184[%15 : i32] : vector<1xf32>
          %217 = llvm.extractelement %189[%15 : i32] : vector<1xf32>
          %218 = llvm.extractelement %194[%15 : i32] : vector<1xf32>
          %219 = llvm.extractelement %199[%15 : i32] : vector<1xf32>
          %220 = llvm.extractelement %204[%15 : i32] : vector<1xf32>
          %221 = llvm.extractelement %209[%15 : i32] : vector<1xf32>
          %222 = llvm.extractelement %214[%15 : i32] : vector<1xf32>
          %223 = llvm.insertelement %215, %41[%15 : i32] : vector<8xf32>
          %224 = llvm.insertelement %216, %223[%14 : i32] : vector<8xf32>
          %225 = llvm.insertelement %217, %224[%13 : i32] : vector<8xf32>
          %226 = llvm.insertelement %218, %225[%12 : i32] : vector<8xf32>
          %227 = llvm.insertelement %219, %226[%11 : i32] : vector<8xf32>
          %228 = llvm.insertelement %220, %227[%10 : i32] : vector<8xf32>
          %229 = llvm.insertelement %221, %228[%9 : i32] : vector<8xf32>
          %230 = llvm.insertelement %222, %229[%8 : i32] : vector<8xf32>
          %231 = llvm.extractelement %165[%7 : i64] : vector<8xf32>
          %232 = llvm.insertelement %231, %41[%15 : i32] : vector<8xf32>
          %233 = llvm.shufflevector %232, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %234 = llvm.extractvalue %159[0] : !llvm.array<8 x vector<8xf32>> 
          %235 = llvm.intr.fmuladd(%233, %230, %234) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %236 = llvm.select %100, %235, %234 : vector<8xi1>, vector<8xf32>
          %237 = llvm.extractelement %165[%6 : i64] : vector<8xf32>
          %238 = llvm.insertelement %237, %41[%15 : i32] : vector<8xf32>
          %239 = llvm.shufflevector %238, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %240 = llvm.extractvalue %159[1] : !llvm.array<8 x vector<8xf32>> 
          %241 = llvm.intr.fmuladd(%239, %230, %240) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %242 = llvm.select %102, %241, %240 : vector<8xi1>, vector<8xf32>
          %243 = llvm.extractelement %165[%5 : i64] : vector<8xf32>
          %244 = llvm.insertelement %243, %41[%15 : i32] : vector<8xf32>
          %245 = llvm.shufflevector %244, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %246 = llvm.extractvalue %159[2] : !llvm.array<8 x vector<8xf32>> 
          %247 = llvm.intr.fmuladd(%245, %230, %246) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %248 = llvm.select %104, %247, %246 : vector<8xi1>, vector<8xf32>
          %249 = llvm.extractelement %165[%4 : i64] : vector<8xf32>
          %250 = llvm.insertelement %249, %41[%15 : i32] : vector<8xf32>
          %251 = llvm.shufflevector %250, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %252 = llvm.extractvalue %159[3] : !llvm.array<8 x vector<8xf32>> 
          %253 = llvm.intr.fmuladd(%251, %230, %252) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %254 = llvm.select %106, %253, %252 : vector<8xi1>, vector<8xf32>
          %255 = llvm.extractelement %165[%3 : i64] : vector<8xf32>
          %256 = llvm.insertelement %255, %41[%15 : i32] : vector<8xf32>
          %257 = llvm.shufflevector %256, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %258 = llvm.extractvalue %159[4] : !llvm.array<8 x vector<8xf32>> 
          %259 = llvm.intr.fmuladd(%257, %230, %258) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %260 = llvm.select %108, %259, %258 : vector<8xi1>, vector<8xf32>
          %261 = llvm.extractelement %165[%2 : i64] : vector<8xf32>
          %262 = llvm.insertelement %261, %41[%15 : i32] : vector<8xf32>
          %263 = llvm.shufflevector %262, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %264 = llvm.extractvalue %159[5] : !llvm.array<8 x vector<8xf32>> 
          %265 = llvm.intr.fmuladd(%263, %230, %264) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %266 = llvm.select %110, %265, %264 : vector<8xi1>, vector<8xf32>
          %267 = llvm.extractelement %165[%1 : i64] : vector<8xf32>
          %268 = llvm.insertelement %267, %41[%15 : i32] : vector<8xf32>
          %269 = llvm.shufflevector %268, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %270 = llvm.extractvalue %159[6] : !llvm.array<8 x vector<8xf32>> 
          %271 = llvm.intr.fmuladd(%269, %230, %270) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %272 = llvm.select %112, %271, %270 : vector<8xi1>, vector<8xf32>
          %273 = llvm.extractelement %165[%0 : i64] : vector<8xf32>
          %274 = llvm.insertelement %273, %41[%15 : i32] : vector<8xf32>
          %275 = llvm.shufflevector %274, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %276 = llvm.extractvalue %159[7] : !llvm.array<8 x vector<8xf32>> 
          %277 = llvm.intr.fmuladd(%275, %230, %276) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %278 = llvm.select %114, %277, %276 : vector<8xi1>, vector<8xf32>
          %279 = llvm.insertvalue %236, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %280 = llvm.insertvalue %242, %279[1] : !llvm.array<8 x vector<8xf32>> 
          %281 = llvm.insertvalue %248, %280[2] : !llvm.array<8 x vector<8xf32>> 
          %282 = llvm.insertvalue %254, %281[3] : !llvm.array<8 x vector<8xf32>> 
          %283 = llvm.insertvalue %260, %282[4] : !llvm.array<8 x vector<8xf32>> 
          %284 = llvm.insertvalue %266, %283[5] : !llvm.array<8 x vector<8xf32>> 
          %285 = llvm.insertvalue %272, %284[6] : !llvm.array<8 x vector<8xf32>> 
          %286 = llvm.insertvalue %278, %285[7] : !llvm.array<8 x vector<8xf32>> 
          %287 = llvm.add %158, %51 : i32
          llvm.br ^bb5(%287, %286 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12(%288: i32):  // 2 preds: ^bb5, ^bb15
          %289 = llvm.icmp "slt" %288, %98 : i32
          llvm.cond_br %289, ^bb13(%49 : i32), ^bb16
        ^bb13(%290: i32):  // 2 preds: ^bb12, ^bb14
          %291 = llvm.icmp "slt" %290, %53 : i32
          llvm.cond_br %291, ^bb14, ^bb15
        ^bb14:  // pred: ^bb13
          %292 = llvm.mul %288, %53 overflow<nsw, nuw> : i32
          %293 = llvm.add %292, %290 overflow<nsw, nuw> : i32
          %294 = llvm.getelementptr inbounds|nuw %60[%293] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %295 = llvm.load %294 : !llvm.ptr -> f32
          %296 = llvm.getelementptr inbounds|nuw %59[%293] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %295, %296 : f32, !llvm.ptr
          %297 = llvm.add %290, %51 : i32
          llvm.br ^bb13(%297 : i32)
        ^bb15:  // pred: ^bb13
          %298 = llvm.add %288, %51 : i32
          llvm.br ^bb12(%298 : i32)
        ^bb16:  // pred: ^bb12
          %299 = llvm.extractvalue %159[0] : !llvm.array<8 x vector<8xf32>> 
          %300 = llvm.getelementptr %59[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %299, %300, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %301 = llvm.extractvalue %159[1] : !llvm.array<8 x vector<8xf32>> 
          %302 = llvm.getelementptr %59[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %301, %302, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %303 = llvm.extractvalue %159[2] : !llvm.array<8 x vector<8xf32>> 
          %304 = llvm.getelementptr %59[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %303, %304, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %305 = llvm.extractvalue %159[3] : !llvm.array<8 x vector<8xf32>> 
          %306 = llvm.getelementptr %59[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %305, %306, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %307 = llvm.extractvalue %159[4] : !llvm.array<8 x vector<8xf32>> 
          %308 = llvm.getelementptr %59[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %307, %308, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %309 = llvm.extractvalue %159[5] : !llvm.array<8 x vector<8xf32>> 
          %310 = llvm.getelementptr %59[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %309, %310, %110 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %311 = llvm.extractvalue %159[6] : !llvm.array<8 x vector<8xf32>> 
          %312 = llvm.getelementptr %59[%134] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %311, %312, %112 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %313 = llvm.extractvalue %159[7] : !llvm.array<8 x vector<8xf32>> 
          %314 = llvm.getelementptr %59[%137] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %313, %314, %114 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          llvm.br ^bb17(%49 : i32)
        ^bb17(%315: i32):  // 2 preds: ^bb16, ^bb20
          %316 = llvm.icmp "slt" %315, %98 : i32
          llvm.cond_br %316, ^bb18(%49 : i32), ^bb21(%49 : i32)
        ^bb18(%317: i32):  // 2 preds: ^bb17, ^bb19
          %318 = llvm.icmp "slt" %317, %53 : i32
          llvm.cond_br %318, ^bb19, ^bb20
        ^bb19:  // pred: ^bb18
          %319 = llvm.mul %315, %53 overflow<nsw, nuw> : i32
          %320 = llvm.add %319, %317 overflow<nsw, nuw> : i32
          %321 = llvm.getelementptr inbounds|nuw %60[%320] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %322 = llvm.load %321 : !llvm.ptr -> f32
          %323 = llvm.getelementptr inbounds|nuw %58[%320] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %322, %323 : f32, !llvm.ptr
          %324 = llvm.add %317, %51 : i32
          llvm.br ^bb18(%324 : i32)
        ^bb20:  // pred: ^bb18
          %325 = llvm.add %315, %51 : i32
          llvm.br ^bb17(%325 : i32)
        ^bb21(%326: i32):  // 2 preds: ^bb17, ^bb24
          %327 = llvm.icmp "slt" %326, %98 : i32
          llvm.cond_br %327, ^bb22(%49 : i32), ^bb25
        ^bb22(%328: i32):  // 2 preds: ^bb21, ^bb23
          %329 = llvm.icmp "slt" %328, %53 : i32
          llvm.cond_br %329, ^bb23, ^bb24
        ^bb23:  // pred: ^bb22
          %330 = llvm.mul %326, %53 overflow<nsw, nuw> : i32
          %331 = llvm.add %330, %328 overflow<nsw, nuw> : i32
          %332 = llvm.getelementptr inbounds|nuw %59[%331] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %333 = llvm.load %332 : !llvm.ptr -> f32
          %334 = llvm.getelementptr inbounds|nuw %58[%331] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %333, %334 : f32, !llvm.ptr
          %335 = llvm.add %328, %51 : i32
          llvm.br ^bb22(%335 : i32)
        ^bb24:  // pred: ^bb22
          %336 = llvm.add %326, %51 : i32
          llvm.br ^bb21(%336 : i32)
        ^bb25:  // pred: ^bb21
          %337 = llvm.getelementptr %58[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %338 = llvm.intr.masked.load %337, %100, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %339 = llvm.getelementptr %58[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %340 = llvm.intr.masked.load %339, %102, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %341 = llvm.getelementptr %58[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %342 = llvm.intr.masked.load %341, %104, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %343 = llvm.getelementptr %58[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %344 = llvm.intr.masked.load %343, %106, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %345 = llvm.getelementptr %58[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %346 = llvm.intr.masked.load %345, %108, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %347 = llvm.getelementptr %58[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %348 = llvm.intr.masked.load %347, %110, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %349 = llvm.getelementptr %58[%134] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %350 = llvm.intr.masked.load %349, %112, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %351 = llvm.getelementptr %58[%137] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %352 = llvm.intr.masked.load %351, %114, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %353 = llvm.getelementptr %81[%140] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %354 = llvm.load %353 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
          %355 = llvm.fadd %338, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %356 = llvm.fadd %340, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %357 = llvm.fadd %342, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %358 = llvm.fadd %344, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %359 = llvm.fadd %346, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %360 = llvm.fadd %348, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %361 = llvm.fadd %350, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %362 = llvm.fadd %352, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %363 = llvm.fmul %355, %355 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %364 = llvm.fmul %356, %356 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %365 = llvm.fmul %357, %357 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %366 = llvm.fmul %358, %358 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %367 = llvm.fmul %359, %359 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %368 = llvm.fmul %360, %360 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %369 = llvm.fmul %361, %361 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %370 = llvm.fmul %362, %362 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %371 = llvm.fmul %363, %355 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %372 = llvm.fmul %364, %356 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %373 = llvm.fmul %365, %357 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %374 = llvm.fmul %366, %358 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %375 = llvm.fmul %367, %359 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %376 = llvm.fmul %368, %360 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %377 = llvm.fmul %369, %361 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %378 = llvm.fmul %370, %362 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %379 = llvm.extractvalue %54[0] : !llvm.array<8 x vector<8xf32>> 
          %380 = llvm.fmul %371, %379 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %381 = llvm.extractvalue %54[1] : !llvm.array<8 x vector<8xf32>> 
          %382 = llvm.fmul %372, %381 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %383 = llvm.extractvalue %54[2] : !llvm.array<8 x vector<8xf32>> 
          %384 = llvm.fmul %373, %383 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %385 = llvm.extractvalue %54[3] : !llvm.array<8 x vector<8xf32>> 
          %386 = llvm.fmul %374, %385 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %387 = llvm.extractvalue %54[4] : !llvm.array<8 x vector<8xf32>> 
          %388 = llvm.fmul %375, %387 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %389 = llvm.extractvalue %54[5] : !llvm.array<8 x vector<8xf32>> 
          %390 = llvm.fmul %376, %389 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %391 = llvm.extractvalue %54[6] : !llvm.array<8 x vector<8xf32>> 
          %392 = llvm.fmul %377, %391 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %393 = llvm.extractvalue %54[7] : !llvm.array<8 x vector<8xf32>> 
          %394 = llvm.fmul %378, %393 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %395 = llvm.fadd %355, %380 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %396 = llvm.fadd %356, %382 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %397 = llvm.fadd %357, %384 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %398 = llvm.fadd %358, %386 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %399 = llvm.fadd %359, %388 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %400 = llvm.fadd %360, %390 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %401 = llvm.fadd %361, %392 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %402 = llvm.fadd %362, %394 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %403 = llvm.extractvalue %55[0] : !llvm.array<8 x vector<8xf32>> 
          %404 = llvm.fmul %395, %403 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %405 = llvm.extractvalue %55[1] : !llvm.array<8 x vector<8xf32>> 
          %406 = llvm.fmul %396, %405 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %407 = llvm.extractvalue %55[2] : !llvm.array<8 x vector<8xf32>> 
          %408 = llvm.fmul %397, %407 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %409 = llvm.extractvalue %55[3] : !llvm.array<8 x vector<8xf32>> 
          %410 = llvm.fmul %398, %409 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %411 = llvm.extractvalue %55[4] : !llvm.array<8 x vector<8xf32>> 
          %412 = llvm.fmul %399, %411 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %413 = llvm.extractvalue %55[5] : !llvm.array<8 x vector<8xf32>> 
          %414 = llvm.fmul %400, %413 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %415 = llvm.extractvalue %55[6] : !llvm.array<8 x vector<8xf32>> 
          %416 = llvm.fmul %401, %415 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %417 = llvm.extractvalue %55[7] : !llvm.array<8 x vector<8xf32>> 
          %418 = llvm.fmul %402, %417 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %419 = llvm.extractvalue %35[0] : !llvm.array<8 x vector<8xf32>> 
          %420 = llvm.fcmp "ult" %404, %419 : vector<8xf32>
          %421 = llvm.extractvalue %35[1] : !llvm.array<8 x vector<8xf32>> 
          %422 = llvm.fcmp "ult" %406, %421 : vector<8xf32>
          %423 = llvm.extractvalue %35[2] : !llvm.array<8 x vector<8xf32>> 
          %424 = llvm.fcmp "ult" %408, %423 : vector<8xf32>
          %425 = llvm.extractvalue %35[3] : !llvm.array<8 x vector<8xf32>> 
          %426 = llvm.fcmp "ult" %410, %425 : vector<8xf32>
          %427 = llvm.extractvalue %35[4] : !llvm.array<8 x vector<8xf32>> 
          %428 = llvm.fcmp "ult" %412, %427 : vector<8xf32>
          %429 = llvm.extractvalue %35[5] : !llvm.array<8 x vector<8xf32>> 
          %430 = llvm.fcmp "ult" %414, %429 : vector<8xf32>
          %431 = llvm.extractvalue %35[6] : !llvm.array<8 x vector<8xf32>> 
          %432 = llvm.fcmp "ult" %416, %431 : vector<8xf32>
          %433 = llvm.extractvalue %35[7] : !llvm.array<8 x vector<8xf32>> 
          %434 = llvm.fcmp "ult" %418, %433 : vector<8xf32>
          %435 = llvm.select %420, %404, %419 : vector<8xi1>, vector<8xf32>
          %436 = llvm.select %422, %406, %421 : vector<8xi1>, vector<8xf32>
          %437 = llvm.select %424, %408, %423 : vector<8xi1>, vector<8xf32>
          %438 = llvm.select %426, %410, %425 : vector<8xi1>, vector<8xf32>
          %439 = llvm.select %428, %412, %427 : vector<8xi1>, vector<8xf32>
          %440 = llvm.select %430, %414, %429 : vector<8xi1>, vector<8xf32>
          %441 = llvm.select %432, %416, %431 : vector<8xi1>, vector<8xf32>
          %442 = llvm.select %434, %418, %433 : vector<8xi1>, vector<8xf32>
          %443 = llvm.extractvalue %36[0] : !llvm.array<8 x vector<8xf32>> 
          %444 = llvm.fcmp "ugt" %435, %443 : vector<8xf32>
          %445 = llvm.extractvalue %36[1] : !llvm.array<8 x vector<8xf32>> 
          %446 = llvm.fcmp "ugt" %436, %445 : vector<8xf32>
          %447 = llvm.extractvalue %36[2] : !llvm.array<8 x vector<8xf32>> 
          %448 = llvm.fcmp "ugt" %437, %447 : vector<8xf32>
          %449 = llvm.extractvalue %36[3] : !llvm.array<8 x vector<8xf32>> 
          %450 = llvm.fcmp "ugt" %438, %449 : vector<8xf32>
          %451 = llvm.extractvalue %36[4] : !llvm.array<8 x vector<8xf32>> 
          %452 = llvm.fcmp "ugt" %439, %451 : vector<8xf32>
          %453 = llvm.extractvalue %36[5] : !llvm.array<8 x vector<8xf32>> 
          %454 = llvm.fcmp "ugt" %440, %453 : vector<8xf32>
          %455 = llvm.extractvalue %36[6] : !llvm.array<8 x vector<8xf32>> 
          %456 = llvm.fcmp "ugt" %441, %455 : vector<8xf32>
          %457 = llvm.extractvalue %36[7] : !llvm.array<8 x vector<8xf32>> 
          %458 = llvm.fcmp "ugt" %442, %457 : vector<8xf32>
          %459 = llvm.select %444, %435, %443 : vector<8xi1>, vector<8xf32>
          %460 = llvm.select %446, %436, %445 : vector<8xi1>, vector<8xf32>
          %461 = llvm.select %448, %437, %447 : vector<8xi1>, vector<8xf32>
          %462 = llvm.select %450, %438, %449 : vector<8xi1>, vector<8xf32>
          %463 = llvm.select %452, %439, %451 : vector<8xi1>, vector<8xf32>
          %464 = llvm.select %454, %440, %453 : vector<8xi1>, vector<8xf32>
          %465 = llvm.select %456, %441, %455 : vector<8xi1>, vector<8xf32>
          %466 = llvm.select %458, %442, %457 : vector<8xi1>, vector<8xf32>
          %467 = llvm.intr.fabs(%404) : (vector<8xf32>) -> vector<8xf32>
          %468 = llvm.intr.fabs(%406) : (vector<8xf32>) -> vector<8xf32>
          %469 = llvm.intr.fabs(%408) : (vector<8xf32>) -> vector<8xf32>
          %470 = llvm.intr.fabs(%410) : (vector<8xf32>) -> vector<8xf32>
          %471 = llvm.intr.fabs(%412) : (vector<8xf32>) -> vector<8xf32>
          %472 = llvm.intr.fabs(%414) : (vector<8xf32>) -> vector<8xf32>
          %473 = llvm.intr.fabs(%416) : (vector<8xf32>) -> vector<8xf32>
          %474 = llvm.intr.fabs(%418) : (vector<8xf32>) -> vector<8xf32>
          %475 = llvm.extractvalue %34[0] : !llvm.array<8 x vector<8xf32>> 
          %476 = llvm.fcmp "olt" %467, %475 : vector<8xf32>
          %477 = llvm.extractvalue %34[1] : !llvm.array<8 x vector<8xf32>> 
          %478 = llvm.fcmp "olt" %468, %477 : vector<8xf32>
          %479 = llvm.extractvalue %34[2] : !llvm.array<8 x vector<8xf32>> 
          %480 = llvm.fcmp "olt" %469, %479 : vector<8xf32>
          %481 = llvm.extractvalue %34[3] : !llvm.array<8 x vector<8xf32>> 
          %482 = llvm.fcmp "olt" %470, %481 : vector<8xf32>
          %483 = llvm.extractvalue %34[4] : !llvm.array<8 x vector<8xf32>> 
          %484 = llvm.fcmp "olt" %471, %483 : vector<8xf32>
          %485 = llvm.extractvalue %34[5] : !llvm.array<8 x vector<8xf32>> 
          %486 = llvm.fcmp "olt" %472, %485 : vector<8xf32>
          %487 = llvm.extractvalue %34[6] : !llvm.array<8 x vector<8xf32>> 
          %488 = llvm.fcmp "olt" %473, %487 : vector<8xf32>
          %489 = llvm.extractvalue %34[7] : !llvm.array<8 x vector<8xf32>> 
          %490 = llvm.fcmp "olt" %474, %489 : vector<8xf32>
          %491 = llvm.fmul %459, %459 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %492 = llvm.fmul %460, %460 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %493 = llvm.fmul %461, %461 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %494 = llvm.fmul %462, %462 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %495 = llvm.fmul %463, %463 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %496 = llvm.fmul %464, %464 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %497 = llvm.fmul %465, %465 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %498 = llvm.fmul %466, %466 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %499 = llvm.extractvalue %27[0] : !llvm.array<8 x vector<8xf32>> 
          %500 = llvm.extractvalue %28[0] : !llvm.array<8 x vector<8xf32>> 
          %501 = llvm.intr.fma(%491, %499, %500) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %502 = llvm.extractvalue %27[1] : !llvm.array<8 x vector<8xf32>> 
          %503 = llvm.extractvalue %28[1] : !llvm.array<8 x vector<8xf32>> 
          %504 = llvm.intr.fma(%492, %502, %503) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %505 = llvm.extractvalue %27[2] : !llvm.array<8 x vector<8xf32>> 
          %506 = llvm.extractvalue %28[2] : !llvm.array<8 x vector<8xf32>> 
          %507 = llvm.intr.fma(%493, %505, %506) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %508 = llvm.extractvalue %27[3] : !llvm.array<8 x vector<8xf32>> 
          %509 = llvm.extractvalue %28[3] : !llvm.array<8 x vector<8xf32>> 
          %510 = llvm.intr.fma(%494, %508, %509) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %511 = llvm.extractvalue %27[4] : !llvm.array<8 x vector<8xf32>> 
          %512 = llvm.extractvalue %28[4] : !llvm.array<8 x vector<8xf32>> 
          %513 = llvm.intr.fma(%495, %511, %512) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %514 = llvm.extractvalue %27[5] : !llvm.array<8 x vector<8xf32>> 
          %515 = llvm.extractvalue %28[5] : !llvm.array<8 x vector<8xf32>> 
          %516 = llvm.intr.fma(%496, %514, %515) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %517 = llvm.extractvalue %27[6] : !llvm.array<8 x vector<8xf32>> 
          %518 = llvm.extractvalue %28[6] : !llvm.array<8 x vector<8xf32>> 
          %519 = llvm.intr.fma(%497, %517, %518) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %520 = llvm.extractvalue %27[7] : !llvm.array<8 x vector<8xf32>> 
          %521 = llvm.extractvalue %28[7] : !llvm.array<8 x vector<8xf32>> 
          %522 = llvm.intr.fma(%498, %520, %521) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %523 = llvm.extractvalue %29[0] : !llvm.array<8 x vector<8xf32>> 
          %524 = llvm.intr.fma(%491, %501, %523) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %525 = llvm.extractvalue %29[1] : !llvm.array<8 x vector<8xf32>> 
          %526 = llvm.intr.fma(%492, %504, %525) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %527 = llvm.extractvalue %29[2] : !llvm.array<8 x vector<8xf32>> 
          %528 = llvm.intr.fma(%493, %507, %527) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %529 = llvm.extractvalue %29[3] : !llvm.array<8 x vector<8xf32>> 
          %530 = llvm.intr.fma(%494, %510, %529) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %531 = llvm.extractvalue %29[4] : !llvm.array<8 x vector<8xf32>> 
          %532 = llvm.intr.fma(%495, %513, %531) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %533 = llvm.extractvalue %29[5] : !llvm.array<8 x vector<8xf32>> 
          %534 = llvm.intr.fma(%496, %516, %533) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %535 = llvm.extractvalue %29[6] : !llvm.array<8 x vector<8xf32>> 
          %536 = llvm.intr.fma(%497, %519, %535) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %537 = llvm.extractvalue %29[7] : !llvm.array<8 x vector<8xf32>> 
          %538 = llvm.intr.fma(%498, %522, %537) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %539 = llvm.extractvalue %30[0] : !llvm.array<8 x vector<8xf32>> 
          %540 = llvm.intr.fma(%491, %524, %539) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %541 = llvm.extractvalue %30[1] : !llvm.array<8 x vector<8xf32>> 
          %542 = llvm.intr.fma(%492, %526, %541) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %543 = llvm.extractvalue %30[2] : !llvm.array<8 x vector<8xf32>> 
          %544 = llvm.intr.fma(%493, %528, %543) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %545 = llvm.extractvalue %30[3] : !llvm.array<8 x vector<8xf32>> 
          %546 = llvm.intr.fma(%494, %530, %545) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %547 = llvm.extractvalue %30[4] : !llvm.array<8 x vector<8xf32>> 
          %548 = llvm.intr.fma(%495, %532, %547) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %549 = llvm.extractvalue %30[5] : !llvm.array<8 x vector<8xf32>> 
          %550 = llvm.intr.fma(%496, %534, %549) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %551 = llvm.extractvalue %30[6] : !llvm.array<8 x vector<8xf32>> 
          %552 = llvm.intr.fma(%497, %536, %551) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %553 = llvm.extractvalue %30[7] : !llvm.array<8 x vector<8xf32>> 
          %554 = llvm.intr.fma(%498, %538, %553) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %555 = llvm.extractvalue %31[0] : !llvm.array<8 x vector<8xf32>> 
          %556 = llvm.intr.fma(%491, %540, %555) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %557 = llvm.extractvalue %31[1] : !llvm.array<8 x vector<8xf32>> 
          %558 = llvm.intr.fma(%492, %542, %557) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %559 = llvm.extractvalue %31[2] : !llvm.array<8 x vector<8xf32>> 
          %560 = llvm.intr.fma(%493, %544, %559) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %561 = llvm.extractvalue %31[3] : !llvm.array<8 x vector<8xf32>> 
          %562 = llvm.intr.fma(%494, %546, %561) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %563 = llvm.extractvalue %31[4] : !llvm.array<8 x vector<8xf32>> 
          %564 = llvm.intr.fma(%495, %548, %563) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %565 = llvm.extractvalue %31[5] : !llvm.array<8 x vector<8xf32>> 
          %566 = llvm.intr.fma(%496, %550, %565) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %567 = llvm.extractvalue %31[6] : !llvm.array<8 x vector<8xf32>> 
          %568 = llvm.intr.fma(%497, %552, %567) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %569 = llvm.extractvalue %31[7] : !llvm.array<8 x vector<8xf32>> 
          %570 = llvm.intr.fma(%498, %554, %569) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %571 = llvm.extractvalue %32[0] : !llvm.array<8 x vector<8xf32>> 
          %572 = llvm.intr.fma(%491, %556, %571) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %573 = llvm.extractvalue %32[1] : !llvm.array<8 x vector<8xf32>> 
          %574 = llvm.intr.fma(%492, %558, %573) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %575 = llvm.extractvalue %32[2] : !llvm.array<8 x vector<8xf32>> 
          %576 = llvm.intr.fma(%493, %560, %575) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %577 = llvm.extractvalue %32[3] : !llvm.array<8 x vector<8xf32>> 
          %578 = llvm.intr.fma(%494, %562, %577) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %579 = llvm.extractvalue %32[4] : !llvm.array<8 x vector<8xf32>> 
          %580 = llvm.intr.fma(%495, %564, %579) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %581 = llvm.extractvalue %32[5] : !llvm.array<8 x vector<8xf32>> 
          %582 = llvm.intr.fma(%496, %566, %581) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %583 = llvm.extractvalue %32[6] : !llvm.array<8 x vector<8xf32>> 
          %584 = llvm.intr.fma(%497, %568, %583) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %585 = llvm.extractvalue %32[7] : !llvm.array<8 x vector<8xf32>> 
          %586 = llvm.intr.fma(%498, %570, %585) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %587 = llvm.extractvalue %33[0] : !llvm.array<8 x vector<8xf32>> 
          %588 = llvm.intr.fma(%491, %572, %587) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %589 = llvm.extractvalue %33[1] : !llvm.array<8 x vector<8xf32>> 
          %590 = llvm.intr.fma(%492, %574, %589) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %591 = llvm.extractvalue %33[2] : !llvm.array<8 x vector<8xf32>> 
          %592 = llvm.intr.fma(%493, %576, %591) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %593 = llvm.extractvalue %33[3] : !llvm.array<8 x vector<8xf32>> 
          %594 = llvm.intr.fma(%494, %578, %593) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %595 = llvm.extractvalue %33[4] : !llvm.array<8 x vector<8xf32>> 
          %596 = llvm.intr.fma(%495, %580, %595) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %597 = llvm.extractvalue %33[5] : !llvm.array<8 x vector<8xf32>> 
          %598 = llvm.intr.fma(%496, %582, %597) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %599 = llvm.extractvalue %33[6] : !llvm.array<8 x vector<8xf32>> 
          %600 = llvm.intr.fma(%497, %584, %599) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %601 = llvm.extractvalue %33[7] : !llvm.array<8 x vector<8xf32>> 
          %602 = llvm.intr.fma(%498, %586, %601) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %603 = llvm.fmul %459, %588 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %604 = llvm.fmul %460, %590 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %605 = llvm.fmul %461, %592 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %606 = llvm.fmul %462, %594 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %607 = llvm.fmul %463, %596 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %608 = llvm.fmul %464, %598 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %609 = llvm.fmul %465, %600 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %610 = llvm.fmul %466, %602 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %611 = llvm.extractvalue %23[0] : !llvm.array<8 x vector<8xf32>> 
          %612 = llvm.extractvalue %24[0] : !llvm.array<8 x vector<8xf32>> 
          %613 = llvm.intr.fma(%491, %611, %612) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %614 = llvm.extractvalue %23[1] : !llvm.array<8 x vector<8xf32>> 
          %615 = llvm.extractvalue %24[1] : !llvm.array<8 x vector<8xf32>> 
          %616 = llvm.intr.fma(%492, %614, %615) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %617 = llvm.extractvalue %23[2] : !llvm.array<8 x vector<8xf32>> 
          %618 = llvm.extractvalue %24[2] : !llvm.array<8 x vector<8xf32>> 
          %619 = llvm.intr.fma(%493, %617, %618) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %620 = llvm.extractvalue %23[3] : !llvm.array<8 x vector<8xf32>> 
          %621 = llvm.extractvalue %24[3] : !llvm.array<8 x vector<8xf32>> 
          %622 = llvm.intr.fma(%494, %620, %621) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %623 = llvm.extractvalue %23[4] : !llvm.array<8 x vector<8xf32>> 
          %624 = llvm.extractvalue %24[4] : !llvm.array<8 x vector<8xf32>> 
          %625 = llvm.intr.fma(%495, %623, %624) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %626 = llvm.extractvalue %23[5] : !llvm.array<8 x vector<8xf32>> 
          %627 = llvm.extractvalue %24[5] : !llvm.array<8 x vector<8xf32>> 
          %628 = llvm.intr.fma(%496, %626, %627) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %629 = llvm.extractvalue %23[6] : !llvm.array<8 x vector<8xf32>> 
          %630 = llvm.extractvalue %24[6] : !llvm.array<8 x vector<8xf32>> 
          %631 = llvm.intr.fma(%497, %629, %630) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %632 = llvm.extractvalue %23[7] : !llvm.array<8 x vector<8xf32>> 
          %633 = llvm.extractvalue %24[7] : !llvm.array<8 x vector<8xf32>> 
          %634 = llvm.intr.fma(%498, %632, %633) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %635 = llvm.extractvalue %25[0] : !llvm.array<8 x vector<8xf32>> 
          %636 = llvm.intr.fma(%491, %613, %635) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %637 = llvm.extractvalue %25[1] : !llvm.array<8 x vector<8xf32>> 
          %638 = llvm.intr.fma(%492, %616, %637) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %639 = llvm.extractvalue %25[2] : !llvm.array<8 x vector<8xf32>> 
          %640 = llvm.intr.fma(%493, %619, %639) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %641 = llvm.extractvalue %25[3] : !llvm.array<8 x vector<8xf32>> 
          %642 = llvm.intr.fma(%494, %622, %641) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %643 = llvm.extractvalue %25[4] : !llvm.array<8 x vector<8xf32>> 
          %644 = llvm.intr.fma(%495, %625, %643) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %645 = llvm.extractvalue %25[5] : !llvm.array<8 x vector<8xf32>> 
          %646 = llvm.intr.fma(%496, %628, %645) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %647 = llvm.extractvalue %25[6] : !llvm.array<8 x vector<8xf32>> 
          %648 = llvm.intr.fma(%497, %631, %647) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %649 = llvm.extractvalue %25[7] : !llvm.array<8 x vector<8xf32>> 
          %650 = llvm.intr.fma(%498, %634, %649) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %651 = llvm.extractvalue %26[0] : !llvm.array<8 x vector<8xf32>> 
          %652 = llvm.intr.fma(%491, %636, %651) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %653 = llvm.extractvalue %26[1] : !llvm.array<8 x vector<8xf32>> 
          %654 = llvm.intr.fma(%492, %638, %653) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %655 = llvm.extractvalue %26[2] : !llvm.array<8 x vector<8xf32>> 
          %656 = llvm.intr.fma(%493, %640, %655) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %657 = llvm.extractvalue %26[3] : !llvm.array<8 x vector<8xf32>> 
          %658 = llvm.intr.fma(%494, %642, %657) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %659 = llvm.extractvalue %26[4] : !llvm.array<8 x vector<8xf32>> 
          %660 = llvm.intr.fma(%495, %644, %659) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %661 = llvm.extractvalue %26[5] : !llvm.array<8 x vector<8xf32>> 
          %662 = llvm.intr.fma(%496, %646, %661) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %663 = llvm.extractvalue %26[6] : !llvm.array<8 x vector<8xf32>> 
          %664 = llvm.intr.fma(%497, %648, %663) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %665 = llvm.extractvalue %26[7] : !llvm.array<8 x vector<8xf32>> 
          %666 = llvm.intr.fma(%498, %650, %665) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %667 = llvm.fdiv %603, %652 : vector<8xf32>
          %668 = llvm.fdiv %604, %654 : vector<8xf32>
          %669 = llvm.fdiv %605, %656 : vector<8xf32>
          %670 = llvm.fdiv %606, %658 : vector<8xf32>
          %671 = llvm.fdiv %607, %660 : vector<8xf32>
          %672 = llvm.fdiv %608, %662 : vector<8xf32>
          %673 = llvm.fdiv %609, %664 : vector<8xf32>
          %674 = llvm.fdiv %610, %666 : vector<8xf32>
          %675 = llvm.select %476, %459, %667 : vector<8xi1>, vector<8xf32>
          %676 = llvm.select %478, %460, %668 : vector<8xi1>, vector<8xf32>
          %677 = llvm.select %480, %461, %669 : vector<8xi1>, vector<8xf32>
          %678 = llvm.select %482, %462, %670 : vector<8xi1>, vector<8xf32>
          %679 = llvm.select %484, %463, %671 : vector<8xi1>, vector<8xf32>
          %680 = llvm.select %486, %464, %672 : vector<8xi1>, vector<8xf32>
          %681 = llvm.select %488, %465, %673 : vector<8xi1>, vector<8xf32>
          %682 = llvm.select %490, %466, %674 : vector<8xi1>, vector<8xf32>
          %683 = llvm.extractvalue %56[0] : !llvm.array<8 x vector<8xf32>> 
          %684 = llvm.fadd %675, %683 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %685 = llvm.extractvalue %56[1] : !llvm.array<8 x vector<8xf32>> 
          %686 = llvm.fadd %676, %685 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %687 = llvm.extractvalue %56[2] : !llvm.array<8 x vector<8xf32>> 
          %688 = llvm.fadd %677, %687 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %689 = llvm.extractvalue %56[3] : !llvm.array<8 x vector<8xf32>> 
          %690 = llvm.fadd %678, %689 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %691 = llvm.extractvalue %56[4] : !llvm.array<8 x vector<8xf32>> 
          %692 = llvm.fadd %679, %691 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %693 = llvm.extractvalue %56[5] : !llvm.array<8 x vector<8xf32>> 
          %694 = llvm.fadd %680, %693 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %695 = llvm.extractvalue %56[6] : !llvm.array<8 x vector<8xf32>> 
          %696 = llvm.fadd %681, %695 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %697 = llvm.extractvalue %56[7] : !llvm.array<8 x vector<8xf32>> 
          %698 = llvm.fadd %682, %697 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %699 = llvm.extractvalue %57[0] : !llvm.array<8 x vector<8xf32>> 
          %700 = llvm.fmul %355, %699 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %701 = llvm.extractvalue %57[1] : !llvm.array<8 x vector<8xf32>> 
          %702 = llvm.fmul %356, %701 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %703 = llvm.extractvalue %57[2] : !llvm.array<8 x vector<8xf32>> 
          %704 = llvm.fmul %357, %703 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %705 = llvm.extractvalue %57[3] : !llvm.array<8 x vector<8xf32>> 
          %706 = llvm.fmul %358, %705 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %707 = llvm.extractvalue %57[4] : !llvm.array<8 x vector<8xf32>> 
          %708 = llvm.fmul %359, %707 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %709 = llvm.extractvalue %57[5] : !llvm.array<8 x vector<8xf32>> 
          %710 = llvm.fmul %360, %709 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %711 = llvm.extractvalue %57[6] : !llvm.array<8 x vector<8xf32>> 
          %712 = llvm.fmul %361, %711 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %713 = llvm.extractvalue %57[7] : !llvm.array<8 x vector<8xf32>> 
          %714 = llvm.fmul %362, %713 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %715 = llvm.fmul %700, %684 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %716 = llvm.fmul %702, %686 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %717 = llvm.fmul %704, %688 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %718 = llvm.fmul %706, %690 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %719 = llvm.fmul %708, %692 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %720 = llvm.fmul %710, %694 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %721 = llvm.fmul %712, %696 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %722 = llvm.fmul %714, %698 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %723 = llvm.mul %139, %52 : i32
          %724 = llvm.add %723, %140 : i32
          %725 = llvm.getelementptr %85[%724] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %715, %725, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %726 = llvm.add %139, %51 : i32
          %727 = llvm.mul %726, %52 : i32
          %728 = llvm.add %727, %140 : i32
          %729 = llvm.getelementptr %85[%728] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %716, %729, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %730 = llvm.add %139, %47 : i32
          %731 = llvm.mul %730, %52 : i32
          %732 = llvm.add %731, %140 : i32
          %733 = llvm.getelementptr %85[%732] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %717, %733, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %734 = llvm.add %139, %46 : i32
          %735 = llvm.mul %734, %52 : i32
          %736 = llvm.add %735, %140 : i32
          %737 = llvm.getelementptr %85[%736] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %718, %737, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %738 = llvm.add %139, %45 : i32
          %739 = llvm.mul %738, %52 : i32
          %740 = llvm.add %739, %140 : i32
          %741 = llvm.getelementptr %85[%740] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %719, %741, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %742 = llvm.add %139, %44 : i32
          %743 = llvm.mul %742, %52 : i32
          %744 = llvm.add %743, %140 : i32
          %745 = llvm.getelementptr %85[%744] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %720, %745, %110 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %746 = llvm.add %139, %43 : i32
          %747 = llvm.mul %746, %52 : i32
          %748 = llvm.add %747, %140 : i32
          %749 = llvm.getelementptr %85[%748] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %721, %749, %112 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %750 = llvm.add %139, %42 : i32
          %751 = llvm.mul %750, %52 : i32
          %752 = llvm.add %751, %140 : i32
          %753 = llvm.getelementptr %85[%752] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %722, %753, %114 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %754 = llvm.add %140, %53 : i32
          llvm.br ^bb3(%754 : i32) {loop_annotation = #loop_annotation}
        ^bb26:  // pred: ^bb3
          %755 = llvm.add %94, %53 : i32
          llvm.br ^bb1(%755 : i32) {loop_annotation = #loop_annotation}
        ^bb27:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_14 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_14_matmul_17x32x64_f32 ordinal(0) layout(#pipeline_layout5) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_14_matmul_17x32x64_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i64) : i64
          %1 = llvm.mlir.constant(6 : i64) : i64
          %2 = llvm.mlir.constant(5 : i64) : i64
          %3 = llvm.mlir.constant(4 : i64) : i64
          %4 = llvm.mlir.constant(3 : i64) : i64
          %5 = llvm.mlir.constant(2 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(7 : i32) : i32
          %9 = llvm.mlir.constant(6 : i32) : i32
          %10 = llvm.mlir.constant(5 : i32) : i32
          %11 = llvm.mlir.constant(4 : i32) : i32
          %12 = llvm.mlir.constant(3 : i32) : i32
          %13 = llvm.mlir.constant(2 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.poison : vector<8xi32>
          %17 = llvm.mlir.constant(8 : i32) : i32
          %18 = llvm.mlir.constant(32 : i32) : i32
          %19 = llvm.mlir.constant(true) : i1
          %20 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %21 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %22 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %23 = llvm.mlir.constant(-16 : index) : i32
          %24 = llvm.mlir.constant(17 : index) : i32
          %25 = llvm.mlir.constant(16 : index) : i32
          %26 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %27 = llvm.mlir.poison : vector<8xf32>
          %28 = llvm.mlir.constant(7 : index) : i32
          %29 = llvm.mlir.constant(6 : index) : i32
          %30 = llvm.mlir.constant(5 : index) : i32
          %31 = llvm.mlir.constant(4 : index) : i32
          %32 = llvm.mlir.constant(3 : index) : i32
          %33 = llvm.mlir.constant(2 : index) : i32
          %34 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %35 = llvm.mlir.constant(2560 : index) : i32
          %36 = llvm.mlir.constant(36992 : index) : i32
          %37 = llvm.mlir.constant(0 : index) : i32
          %38 = llvm.mlir.constant(64 : index) : i32
          %39 = llvm.mlir.constant(1 : index) : i32
          %40 = llvm.mlir.constant(32 : index) : i32
          %41 = llvm.mlir.constant(8 : index) : i32
          %42 = llvm.alloca %38 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %43 = llvm.alloca %38 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %44 = llvm.alloca %38 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %45 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %46 = llvm.extractvalue %45[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %47 = llvm.load %46 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%47, %38 : !llvm.ptr, i32)] : i1
          %48 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %49 = llvm.extractvalue %48[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %50 = llvm.getelementptr %49[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %51 = llvm.load %50 : !llvm.ptr -> !llvm.ptr
          %52 = llvm.mul %36, %17 : i32
          %53 = llvm.udiv %52, %18 : i32
          %54 = llvm.getelementptr %51[%53] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%54, %38 : !llvm.ptr, i32)] : i1
          %55 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %56 = llvm.extractvalue %55[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %57 = llvm.getelementptr %56[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %58 = llvm.load %57 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%58, %38 : !llvm.ptr, i32)] : i1
          %59 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %60 = llvm.extractvalue %59[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %61 = llvm.getelementptr %60[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %62 = llvm.load %61 : !llvm.ptr -> !llvm.ptr
          %63 = llvm.mul %35, %17 : i32
          %64 = llvm.udiv %63, %18 : i32
          %65 = llvm.getelementptr %62[%64] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%65, %38 : !llvm.ptr, i32)] : i1
          %66 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %67 = llvm.extractvalue %66[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %68 = llvm.getelementptr %67[3] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %69 = llvm.load %68 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%69, %38 : !llvm.ptr, i32)] : i1
          %70 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %71 = llvm.extractvalue %70[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %72 = llvm.mul %71, %25 overflow<nsw> : i32
          %73 = llvm.mul %71, %23 overflow<nsw> : i32
          %74 = llvm.add %73, %24 : i32
          %75 = llvm.icmp "slt" %74, %25 : i32
          %76 = llvm.select %75, %74, %25 : i1, i32
          %77 = llvm.icmp "sgt" %76, %37 : i32
          llvm.cond_br %77, ^bb1(%37 : i32), ^bb27
        ^bb1(%78: i32):  // 2 preds: ^bb0, ^bb26
          %79 = llvm.icmp "slt" %78, %76 : i32
          llvm.cond_br %79, ^bb2, ^bb27
        ^bb2:  // pred: ^bb1
          %80 = llvm.sub %76, %78 : i32
          %81 = llvm.icmp "slt" %80, %41 : i32
          %82 = llvm.select %81, %80, %41 : i1, i32
          %83 = llvm.icmp "sgt" %82, %37 : i32
          %84 = llvm.select %83, %22, %21 : i1, vector<8xi1>
          %85 = llvm.icmp "sgt" %82, %39 : i32
          %86 = llvm.select %85, %22, %21 : i1, vector<8xi1>
          %87 = llvm.icmp "sgt" %82, %33 : i32
          %88 = llvm.select %87, %22, %21 : i1, vector<8xi1>
          %89 = llvm.icmp "sgt" %82, %32 : i32
          %90 = llvm.select %89, %22, %21 : i1, vector<8xi1>
          %91 = llvm.icmp "sgt" %82, %31 : i32
          %92 = llvm.select %91, %22, %21 : i1, vector<8xi1>
          %93 = llvm.icmp "sgt" %82, %30 : i32
          %94 = llvm.select %93, %22, %21 : i1, vector<8xi1>
          %95 = llvm.icmp "sgt" %82, %29 : i32
          %96 = llvm.select %95, %22, %21 : i1, vector<8xi1>
          %97 = llvm.icmp "sgt" %82, %28 : i32
          %98 = llvm.select %97, %22, %21 : i1, vector<8xi1>
          %99 = llvm.mul %37, %41 : i32
          %100 = llvm.add %99, %37 : i32
          %101 = llvm.getelementptr %44[%100] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %101, %84 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %102 = llvm.mul %39, %41 : i32
          %103 = llvm.add %102, %37 : i32
          %104 = llvm.getelementptr %44[%103] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %104, %86 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %105 = llvm.mul %33, %41 : i32
          %106 = llvm.add %105, %37 : i32
          %107 = llvm.getelementptr %44[%106] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %107, %88 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %108 = llvm.mul %32, %41 : i32
          %109 = llvm.add %108, %37 : i32
          %110 = llvm.getelementptr %44[%109] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %110, %90 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %111 = llvm.mul %31, %41 : i32
          %112 = llvm.add %111, %37 : i32
          %113 = llvm.getelementptr %44[%112] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %113, %92 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %114 = llvm.mul %30, %41 : i32
          %115 = llvm.add %114, %37 : i32
          %116 = llvm.getelementptr %44[%115] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %116, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %117 = llvm.mul %29, %41 : i32
          %118 = llvm.add %117, %37 : i32
          %119 = llvm.getelementptr %44[%118] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %119, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %120 = llvm.mul %28, %41 : i32
          %121 = llvm.add %120, %37 : i32
          %122 = llvm.getelementptr %44[%121] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %122, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %123 = llvm.add %78, %72 : i32
          llvm.br ^bb3(%37 : i32)
        ^bb3(%124: i32):  // 2 preds: ^bb2, ^bb25
          %125 = llvm.icmp "slt" %124, %40 : i32
          llvm.cond_br %125, ^bb4, ^bb26
        ^bb4:  // pred: ^bb3
          %126 = llvm.intr.masked.load %101, %84, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %127 = llvm.intr.masked.load %104, %86, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %128 = llvm.intr.masked.load %107, %88, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %129 = llvm.intr.masked.load %110, %90, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %130 = llvm.intr.masked.load %113, %92, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %131 = llvm.intr.masked.load %116, %94, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %132 = llvm.intr.masked.load %119, %96, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %133 = llvm.intr.masked.load %122, %98, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %134 = llvm.insertvalue %126, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %135 = llvm.insertvalue %127, %134[1] : !llvm.array<8 x vector<8xf32>> 
          %136 = llvm.insertvalue %128, %135[2] : !llvm.array<8 x vector<8xf32>> 
          %137 = llvm.insertvalue %129, %136[3] : !llvm.array<8 x vector<8xf32>> 
          %138 = llvm.insertvalue %130, %137[4] : !llvm.array<8 x vector<8xf32>> 
          %139 = llvm.insertvalue %131, %138[5] : !llvm.array<8 x vector<8xf32>> 
          %140 = llvm.insertvalue %132, %139[6] : !llvm.array<8 x vector<8xf32>> 
          %141 = llvm.insertvalue %133, %140[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%37, %141 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%142: i32, %143: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %144 = llvm.icmp "slt" %142, %38 : i32
          llvm.cond_br %144, ^bb6, ^bb12(%37 : i32)
        ^bb6:  // pred: ^bb5
          %145 = llvm.insertelement %82, %16[%15 : i32] : vector<8xi32>
          %146 = llvm.shufflevector %145, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %147 = llvm.icmp "sgt" %146, %26 : vector<8xi32>
          llvm.br ^bb7(%37, %27 : i32, vector<8xf32>)
        ^bb7(%148: i32, %149: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %150 = llvm.icmp "slt" %148, %41 : i32
          llvm.cond_br %150, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %151 = llvm.extractelement %147[%148 : i32] : vector<8xi1>
          llvm.cond_br %151, ^bb9, ^bb10(%149 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %152 = llvm.add %123, %148 : i32
          %153 = llvm.mul %152, %38 overflow<nsw, nuw> : i32
          %154 = llvm.add %153, %142 overflow<nsw, nuw> : i32
          %155 = llvm.getelementptr inbounds|nuw %47[%154] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %156 = llvm.load %155 : !llvm.ptr -> f32
          %157 = llvm.insertelement %156, %149[%148 : i32] : vector<8xf32>
          llvm.br ^bb10(%157 : vector<8xf32>)
        ^bb10(%158: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %159 = llvm.add %148, %39 : i32
          llvm.br ^bb7(%159, %158 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %160 = llvm.mul %124, %38 : i32
          %161 = llvm.add %160, %142 : i32
          %162 = llvm.getelementptr %54[%161] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %163 = llvm.load %162 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %164 = llvm.add %124, %39 : i32
          %165 = llvm.mul %164, %38 : i32
          %166 = llvm.add %165, %142 : i32
          %167 = llvm.getelementptr %54[%166] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %168 = llvm.load %167 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %169 = llvm.add %124, %33 : i32
          %170 = llvm.mul %169, %38 : i32
          %171 = llvm.add %170, %142 : i32
          %172 = llvm.getelementptr %54[%171] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %173 = llvm.load %172 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %174 = llvm.add %124, %32 : i32
          %175 = llvm.mul %174, %38 : i32
          %176 = llvm.add %175, %142 : i32
          %177 = llvm.getelementptr %54[%176] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %178 = llvm.load %177 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %179 = llvm.add %124, %31 : i32
          %180 = llvm.mul %179, %38 : i32
          %181 = llvm.add %180, %142 : i32
          %182 = llvm.getelementptr %54[%181] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %183 = llvm.load %182 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %184 = llvm.add %124, %30 : i32
          %185 = llvm.mul %184, %38 : i32
          %186 = llvm.add %185, %142 : i32
          %187 = llvm.getelementptr %54[%186] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %188 = llvm.load %187 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %189 = llvm.add %124, %29 : i32
          %190 = llvm.mul %189, %38 : i32
          %191 = llvm.add %190, %142 : i32
          %192 = llvm.getelementptr %54[%191] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %193 = llvm.load %192 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %194 = llvm.add %124, %28 : i32
          %195 = llvm.mul %194, %38 : i32
          %196 = llvm.add %195, %142 : i32
          %197 = llvm.getelementptr %54[%196] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %198 = llvm.load %197 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %199 = llvm.extractelement %163[%15 : i32] : vector<1xf32>
          %200 = llvm.extractelement %168[%15 : i32] : vector<1xf32>
          %201 = llvm.extractelement %173[%15 : i32] : vector<1xf32>
          %202 = llvm.extractelement %178[%15 : i32] : vector<1xf32>
          %203 = llvm.extractelement %183[%15 : i32] : vector<1xf32>
          %204 = llvm.extractelement %188[%15 : i32] : vector<1xf32>
          %205 = llvm.extractelement %193[%15 : i32] : vector<1xf32>
          %206 = llvm.extractelement %198[%15 : i32] : vector<1xf32>
          %207 = llvm.insertelement %199, %27[%15 : i32] : vector<8xf32>
          %208 = llvm.insertelement %200, %207[%14 : i32] : vector<8xf32>
          %209 = llvm.insertelement %201, %208[%13 : i32] : vector<8xf32>
          %210 = llvm.insertelement %202, %209[%12 : i32] : vector<8xf32>
          %211 = llvm.insertelement %203, %210[%11 : i32] : vector<8xf32>
          %212 = llvm.insertelement %204, %211[%10 : i32] : vector<8xf32>
          %213 = llvm.insertelement %205, %212[%9 : i32] : vector<8xf32>
          %214 = llvm.insertelement %206, %213[%8 : i32] : vector<8xf32>
          %215 = llvm.extractelement %149[%7 : i64] : vector<8xf32>
          %216 = llvm.insertelement %215, %27[%15 : i32] : vector<8xf32>
          %217 = llvm.shufflevector %216, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %218 = llvm.extractvalue %143[0] : !llvm.array<8 x vector<8xf32>> 
          %219 = llvm.intr.fmuladd(%217, %214, %218) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %220 = llvm.select %84, %219, %218 : vector<8xi1>, vector<8xf32>
          %221 = llvm.extractelement %149[%6 : i64] : vector<8xf32>
          %222 = llvm.insertelement %221, %27[%15 : i32] : vector<8xf32>
          %223 = llvm.shufflevector %222, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %224 = llvm.extractvalue %143[1] : !llvm.array<8 x vector<8xf32>> 
          %225 = llvm.intr.fmuladd(%223, %214, %224) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %226 = llvm.select %86, %225, %224 : vector<8xi1>, vector<8xf32>
          %227 = llvm.extractelement %149[%5 : i64] : vector<8xf32>
          %228 = llvm.insertelement %227, %27[%15 : i32] : vector<8xf32>
          %229 = llvm.shufflevector %228, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %230 = llvm.extractvalue %143[2] : !llvm.array<8 x vector<8xf32>> 
          %231 = llvm.intr.fmuladd(%229, %214, %230) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %232 = llvm.select %88, %231, %230 : vector<8xi1>, vector<8xf32>
          %233 = llvm.extractelement %149[%4 : i64] : vector<8xf32>
          %234 = llvm.insertelement %233, %27[%15 : i32] : vector<8xf32>
          %235 = llvm.shufflevector %234, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %236 = llvm.extractvalue %143[3] : !llvm.array<8 x vector<8xf32>> 
          %237 = llvm.intr.fmuladd(%235, %214, %236) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %238 = llvm.select %90, %237, %236 : vector<8xi1>, vector<8xf32>
          %239 = llvm.extractelement %149[%3 : i64] : vector<8xf32>
          %240 = llvm.insertelement %239, %27[%15 : i32] : vector<8xf32>
          %241 = llvm.shufflevector %240, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %242 = llvm.extractvalue %143[4] : !llvm.array<8 x vector<8xf32>> 
          %243 = llvm.intr.fmuladd(%241, %214, %242) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %244 = llvm.select %92, %243, %242 : vector<8xi1>, vector<8xf32>
          %245 = llvm.extractelement %149[%2 : i64] : vector<8xf32>
          %246 = llvm.insertelement %245, %27[%15 : i32] : vector<8xf32>
          %247 = llvm.shufflevector %246, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %248 = llvm.extractvalue %143[5] : !llvm.array<8 x vector<8xf32>> 
          %249 = llvm.intr.fmuladd(%247, %214, %248) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %250 = llvm.select %94, %249, %248 : vector<8xi1>, vector<8xf32>
          %251 = llvm.extractelement %149[%1 : i64] : vector<8xf32>
          %252 = llvm.insertelement %251, %27[%15 : i32] : vector<8xf32>
          %253 = llvm.shufflevector %252, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %254 = llvm.extractvalue %143[6] : !llvm.array<8 x vector<8xf32>> 
          %255 = llvm.intr.fmuladd(%253, %214, %254) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %256 = llvm.select %96, %255, %254 : vector<8xi1>, vector<8xf32>
          %257 = llvm.extractelement %149[%0 : i64] : vector<8xf32>
          %258 = llvm.insertelement %257, %27[%15 : i32] : vector<8xf32>
          %259 = llvm.shufflevector %258, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %260 = llvm.extractvalue %143[7] : !llvm.array<8 x vector<8xf32>> 
          %261 = llvm.intr.fmuladd(%259, %214, %260) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %262 = llvm.select %98, %261, %260 : vector<8xi1>, vector<8xf32>
          %263 = llvm.insertvalue %220, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %264 = llvm.insertvalue %226, %263[1] : !llvm.array<8 x vector<8xf32>> 
          %265 = llvm.insertvalue %232, %264[2] : !llvm.array<8 x vector<8xf32>> 
          %266 = llvm.insertvalue %238, %265[3] : !llvm.array<8 x vector<8xf32>> 
          %267 = llvm.insertvalue %244, %266[4] : !llvm.array<8 x vector<8xf32>> 
          %268 = llvm.insertvalue %250, %267[5] : !llvm.array<8 x vector<8xf32>> 
          %269 = llvm.insertvalue %256, %268[6] : !llvm.array<8 x vector<8xf32>> 
          %270 = llvm.insertvalue %262, %269[7] : !llvm.array<8 x vector<8xf32>> 
          %271 = llvm.add %142, %39 : i32
          llvm.br ^bb5(%271, %270 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12(%272: i32):  // 2 preds: ^bb5, ^bb15
          %273 = llvm.icmp "slt" %272, %82 : i32
          llvm.cond_br %273, ^bb13(%37 : i32), ^bb16
        ^bb13(%274: i32):  // 2 preds: ^bb12, ^bb14
          %275 = llvm.icmp "slt" %274, %41 : i32
          llvm.cond_br %275, ^bb14, ^bb15
        ^bb14:  // pred: ^bb13
          %276 = llvm.mul %272, %41 overflow<nsw, nuw> : i32
          %277 = llvm.add %276, %274 overflow<nsw, nuw> : i32
          %278 = llvm.getelementptr inbounds|nuw %44[%277] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %279 = llvm.load %278 : !llvm.ptr -> f32
          %280 = llvm.getelementptr inbounds|nuw %43[%277] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %279, %280 : f32, !llvm.ptr
          %281 = llvm.add %274, %39 : i32
          llvm.br ^bb13(%281 : i32)
        ^bb15:  // pred: ^bb13
          %282 = llvm.add %272, %39 : i32
          llvm.br ^bb12(%282 : i32)
        ^bb16:  // pred: ^bb12
          %283 = llvm.extractvalue %143[0] : !llvm.array<8 x vector<8xf32>> 
          %284 = llvm.getelementptr %43[%100] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %283, %284, %84 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %285 = llvm.extractvalue %143[1] : !llvm.array<8 x vector<8xf32>> 
          %286 = llvm.getelementptr %43[%103] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %285, %286, %86 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %287 = llvm.extractvalue %143[2] : !llvm.array<8 x vector<8xf32>> 
          %288 = llvm.getelementptr %43[%106] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %287, %288, %88 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %289 = llvm.extractvalue %143[3] : !llvm.array<8 x vector<8xf32>> 
          %290 = llvm.getelementptr %43[%109] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %289, %290, %90 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %291 = llvm.extractvalue %143[4] : !llvm.array<8 x vector<8xf32>> 
          %292 = llvm.getelementptr %43[%112] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %291, %292, %92 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %293 = llvm.extractvalue %143[5] : !llvm.array<8 x vector<8xf32>> 
          %294 = llvm.getelementptr %43[%115] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %293, %294, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %295 = llvm.extractvalue %143[6] : !llvm.array<8 x vector<8xf32>> 
          %296 = llvm.getelementptr %43[%118] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %295, %296, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %297 = llvm.extractvalue %143[7] : !llvm.array<8 x vector<8xf32>> 
          %298 = llvm.getelementptr %43[%121] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %297, %298, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          llvm.br ^bb17(%37 : i32)
        ^bb17(%299: i32):  // 2 preds: ^bb16, ^bb20
          %300 = llvm.icmp "slt" %299, %82 : i32
          llvm.cond_br %300, ^bb18(%37 : i32), ^bb21(%37 : i32)
        ^bb18(%301: i32):  // 2 preds: ^bb17, ^bb19
          %302 = llvm.icmp "slt" %301, %41 : i32
          llvm.cond_br %302, ^bb19, ^bb20
        ^bb19:  // pred: ^bb18
          %303 = llvm.mul %299, %41 overflow<nsw, nuw> : i32
          %304 = llvm.add %303, %301 overflow<nsw, nuw> : i32
          %305 = llvm.getelementptr inbounds|nuw %44[%304] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %306 = llvm.load %305 : !llvm.ptr -> f32
          %307 = llvm.getelementptr inbounds|nuw %42[%304] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %306, %307 : f32, !llvm.ptr
          %308 = llvm.add %301, %39 : i32
          llvm.br ^bb18(%308 : i32)
        ^bb20:  // pred: ^bb18
          %309 = llvm.add %299, %39 : i32
          llvm.br ^bb17(%309 : i32)
        ^bb21(%310: i32):  // 2 preds: ^bb17, ^bb24
          %311 = llvm.icmp "slt" %310, %82 : i32
          llvm.cond_br %311, ^bb22(%37 : i32), ^bb25
        ^bb22(%312: i32):  // 2 preds: ^bb21, ^bb23
          %313 = llvm.icmp "slt" %312, %41 : i32
          llvm.cond_br %313, ^bb23, ^bb24
        ^bb23:  // pred: ^bb22
          %314 = llvm.mul %310, %41 overflow<nsw, nuw> : i32
          %315 = llvm.add %314, %312 overflow<nsw, nuw> : i32
          %316 = llvm.getelementptr inbounds|nuw %43[%315] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %317 = llvm.load %316 : !llvm.ptr -> f32
          %318 = llvm.getelementptr inbounds|nuw %42[%315] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %317, %318 : f32, !llvm.ptr
          %319 = llvm.add %312, %39 : i32
          llvm.br ^bb22(%319 : i32)
        ^bb24:  // pred: ^bb22
          %320 = llvm.add %310, %39 : i32
          llvm.br ^bb21(%320 : i32)
        ^bb25:  // pred: ^bb21
          %321 = llvm.mul %123, %40 : i32
          %322 = llvm.add %321, %124 : i32
          %323 = llvm.getelementptr %58[%322] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %324 = llvm.intr.masked.load %323, %84, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %325 = llvm.add %123, %39 : i32
          %326 = llvm.mul %325, %40 : i32
          %327 = llvm.add %326, %124 : i32
          %328 = llvm.getelementptr %58[%327] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %329 = llvm.intr.masked.load %328, %86, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %330 = llvm.add %123, %33 : i32
          %331 = llvm.mul %330, %40 : i32
          %332 = llvm.add %331, %124 : i32
          %333 = llvm.getelementptr %58[%332] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %334 = llvm.intr.masked.load %333, %88, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %335 = llvm.add %123, %32 : i32
          %336 = llvm.mul %335, %40 : i32
          %337 = llvm.add %336, %124 : i32
          %338 = llvm.getelementptr %58[%337] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %339 = llvm.intr.masked.load %338, %90, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %340 = llvm.add %123, %31 : i32
          %341 = llvm.mul %340, %40 : i32
          %342 = llvm.add %341, %124 : i32
          %343 = llvm.getelementptr %58[%342] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %344 = llvm.intr.masked.load %343, %92, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %345 = llvm.add %123, %30 : i32
          %346 = llvm.mul %345, %40 : i32
          %347 = llvm.add %346, %124 : i32
          %348 = llvm.getelementptr %58[%347] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %349 = llvm.intr.masked.load %348, %94, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %350 = llvm.add %123, %29 : i32
          %351 = llvm.mul %350, %40 : i32
          %352 = llvm.add %351, %124 : i32
          %353 = llvm.getelementptr %58[%352] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %354 = llvm.intr.masked.load %353, %96, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %355 = llvm.add %123, %28 : i32
          %356 = llvm.mul %355, %40 : i32
          %357 = llvm.add %356, %124 : i32
          %358 = llvm.getelementptr %58[%357] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %359 = llvm.intr.masked.load %358, %98, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %360 = llvm.getelementptr %42[%100] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %361 = llvm.intr.masked.load %360, %84, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %362 = llvm.getelementptr %42[%103] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %363 = llvm.intr.masked.load %362, %86, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %364 = llvm.getelementptr %42[%106] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %365 = llvm.intr.masked.load %364, %88, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %366 = llvm.getelementptr %42[%109] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %367 = llvm.intr.masked.load %366, %90, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %368 = llvm.getelementptr %42[%112] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %369 = llvm.intr.masked.load %368, %92, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %370 = llvm.getelementptr %42[%115] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %371 = llvm.intr.masked.load %370, %94, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %372 = llvm.getelementptr %42[%118] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %373 = llvm.intr.masked.load %372, %96, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %374 = llvm.getelementptr %42[%121] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %375 = llvm.intr.masked.load %374, %98, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %376 = llvm.getelementptr %65[%124] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %377 = llvm.load %376 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
          %378 = llvm.fadd %361, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %379 = llvm.fadd %363, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %380 = llvm.fadd %365, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %381 = llvm.fadd %367, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %382 = llvm.fadd %369, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %383 = llvm.fadd %371, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %384 = llvm.fadd %373, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %385 = llvm.fadd %375, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %386 = llvm.fadd %324, %378 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %387 = llvm.fadd %329, %379 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %388 = llvm.fadd %334, %380 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %389 = llvm.fadd %339, %381 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %390 = llvm.fadd %344, %382 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %391 = llvm.fadd %349, %383 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %392 = llvm.fadd %354, %384 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %393 = llvm.fadd %359, %385 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %394 = llvm.getelementptr %69[%322] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %386, %394, %84 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %395 = llvm.getelementptr %69[%327] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %387, %395, %86 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %396 = llvm.getelementptr %69[%332] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %388, %396, %88 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %397 = llvm.getelementptr %69[%337] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %389, %397, %90 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %398 = llvm.getelementptr %69[%342] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %390, %398, %92 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %399 = llvm.getelementptr %69[%347] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %391, %399, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %400 = llvm.getelementptr %69[%352] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %392, %400, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %401 = llvm.getelementptr %69[%357] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %393, %401, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %402 = llvm.add %124, %41 : i32
          llvm.br ^bb3(%402 : i32) {loop_annotation = #loop_annotation}
        ^bb26:  // pred: ^bb3
          %403 = llvm.add %78, %41 : i32
          llvm.br ^bb1(%403 : i32) {loop_annotation = #loop_annotation}
        ^bb27:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_26 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_26_matmul_17x32x64_f32 ordinal(0) layout(#pipeline_layout1) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_26_matmul_17x32x64_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(7 : i64) : i64
          %1 = llvm.mlir.constant(6 : i64) : i64
          %2 = llvm.mlir.constant(5 : i64) : i64
          %3 = llvm.mlir.constant(4 : i64) : i64
          %4 = llvm.mlir.constant(3 : i64) : i64
          %5 = llvm.mlir.constant(2 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(7 : i32) : i32
          %9 = llvm.mlir.constant(6 : i32) : i32
          %10 = llvm.mlir.constant(5 : i32) : i32
          %11 = llvm.mlir.constant(4 : i32) : i32
          %12 = llvm.mlir.constant(3 : i32) : i32
          %13 = llvm.mlir.constant(2 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.poison : vector<8xi32>
          %17 = llvm.mlir.constant(8 : i32) : i32
          %18 = llvm.mlir.constant(32 : i32) : i32
          %19 = llvm.mlir.constant(true) : i1
          %20 = llvm.mlir.poison : !llvm.array<8 x vector<8xf32>>
          %21 = llvm.mlir.constant(dense<false> : vector<8xi1>) : vector<8xi1>
          %22 = llvm.mlir.constant(dense<true> : vector<8xi1>) : vector<8xi1>
          %23 = llvm.mlir.constant(-16 : index) : i32
          %24 = llvm.mlir.constant(17 : index) : i32
          %25 = llvm.mlir.constant(16 : index) : i32
          %26 = llvm.mlir.constant(dense_resource<__elided__> : vector<8xi32>) : vector<8xi32>
          %27 = llvm.mlir.poison : vector<8xf32>
          %28 = llvm.mlir.constant(7 : index) : i32
          %29 = llvm.mlir.constant(6 : index) : i32
          %30 = llvm.mlir.constant(5 : index) : i32
          %31 = llvm.mlir.constant(4 : index) : i32
          %32 = llvm.mlir.constant(3 : index) : i32
          %33 = llvm.mlir.constant(2 : index) : i32
          %34 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %35 = llvm.mlir.constant(8 : index) : i32
          %36 = llvm.mlir.constant(32 : index) : i32
          %37 = llvm.mlir.constant(1 : index) : i32
          %38 = llvm.mlir.constant(64 : index) : i32
          %39 = llvm.mlir.constant(0 : index) : i32
          %40 = llvm.mlir.constant(4224 : index) : i32
          %41 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %42 = llvm.extractvalue %41[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %43 = llvm.load %42 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%43, %38 : !llvm.ptr, i32)] : i1
          %44 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %45 = llvm.extractvalue %44[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %46 = llvm.getelementptr %45[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %47 = llvm.load %46 : !llvm.ptr -> !llvm.ptr
          %48 = llvm.mul %40, %17 : i32
          %49 = llvm.udiv %48, %18 : i32
          %50 = llvm.getelementptr %47[%49] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%50, %38 : !llvm.ptr, i32)] : i1
          %51 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %52 = llvm.extractvalue %51[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %53 = llvm.getelementptr %52[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %54 = llvm.load %53 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%54, %38 : !llvm.ptr, i32)] : i1
          %55 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %56 = llvm.extractvalue %55[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %57 = llvm.mul %56, %25 overflow<nsw> : i32
          %58 = llvm.mul %56, %23 overflow<nsw> : i32
          %59 = llvm.add %58, %24 : i32
          %60 = llvm.icmp "slt" %59, %25 : i32
          %61 = llvm.select %60, %59, %25 : i1, i32
          %62 = llvm.icmp "sgt" %61, %39 : i32
          llvm.cond_br %62, ^bb1(%39 : i32), ^bb14
        ^bb1(%63: i32):  // 2 preds: ^bb0, ^bb13
          %64 = llvm.icmp "slt" %63, %61 : i32
          llvm.cond_br %64, ^bb2, ^bb14
        ^bb2:  // pred: ^bb1
          %65 = llvm.sub %61, %63 : i32
          %66 = llvm.icmp "slt" %65, %35 : i32
          %67 = llvm.select %66, %65, %35 : i1, i32
          %68 = llvm.icmp "sgt" %67, %39 : i32
          %69 = llvm.select %68, %22, %21 : i1, vector<8xi1>
          %70 = llvm.icmp "sgt" %67, %37 : i32
          %71 = llvm.select %70, %22, %21 : i1, vector<8xi1>
          %72 = llvm.icmp "sgt" %67, %33 : i32
          %73 = llvm.select %72, %22, %21 : i1, vector<8xi1>
          %74 = llvm.icmp "sgt" %67, %32 : i32
          %75 = llvm.select %74, %22, %21 : i1, vector<8xi1>
          %76 = llvm.icmp "sgt" %67, %31 : i32
          %77 = llvm.select %76, %22, %21 : i1, vector<8xi1>
          %78 = llvm.icmp "sgt" %67, %30 : i32
          %79 = llvm.select %78, %22, %21 : i1, vector<8xi1>
          %80 = llvm.icmp "sgt" %67, %29 : i32
          %81 = llvm.select %80, %22, %21 : i1, vector<8xi1>
          %82 = llvm.icmp "sgt" %67, %28 : i32
          %83 = llvm.select %82, %22, %21 : i1, vector<8xi1>
          %84 = llvm.add %63, %57 : i32
          llvm.br ^bb3(%39 : i32)
        ^bb3(%85: i32):  // 2 preds: ^bb2, ^bb12
          %86 = llvm.icmp "slt" %85, %36 : i32
          llvm.cond_br %86, ^bb4, ^bb13
        ^bb4:  // pred: ^bb3
          %87 = llvm.mul %84, %36 : i32
          %88 = llvm.add %87, %85 : i32
          %89 = llvm.getelementptr %54[%88] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %89, %69 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %90 = llvm.add %84, %37 : i32
          %91 = llvm.mul %90, %36 : i32
          %92 = llvm.add %91, %85 : i32
          %93 = llvm.getelementptr %54[%92] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %93, %71 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %94 = llvm.add %84, %33 : i32
          %95 = llvm.mul %94, %36 : i32
          %96 = llvm.add %95, %85 : i32
          %97 = llvm.getelementptr %54[%96] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %97, %73 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %98 = llvm.add %84, %32 : i32
          %99 = llvm.mul %98, %36 : i32
          %100 = llvm.add %99, %85 : i32
          %101 = llvm.getelementptr %54[%100] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %101, %75 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %102 = llvm.add %84, %31 : i32
          %103 = llvm.mul %102, %36 : i32
          %104 = llvm.add %103, %85 : i32
          %105 = llvm.getelementptr %54[%104] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %105, %77 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %106 = llvm.add %84, %30 : i32
          %107 = llvm.mul %106, %36 : i32
          %108 = llvm.add %107, %85 : i32
          %109 = llvm.getelementptr %54[%108] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %109, %79 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %110 = llvm.add %84, %29 : i32
          %111 = llvm.mul %110, %36 : i32
          %112 = llvm.add %111, %85 : i32
          %113 = llvm.getelementptr %54[%112] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %113, %81 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %114 = llvm.add %84, %28 : i32
          %115 = llvm.mul %114, %36 : i32
          %116 = llvm.add %115, %85 : i32
          %117 = llvm.getelementptr %54[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %34, %117, %83 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %118 = llvm.intr.masked.load %89, %69, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %119 = llvm.intr.masked.load %93, %71, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %120 = llvm.intr.masked.load %97, %73, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %121 = llvm.intr.masked.load %101, %75, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %122 = llvm.intr.masked.load %105, %77, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %123 = llvm.intr.masked.load %109, %79, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %124 = llvm.intr.masked.load %113, %81, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %125 = llvm.intr.masked.load %117, %83, %27 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %126 = llvm.insertvalue %118, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %127 = llvm.insertvalue %119, %126[1] : !llvm.array<8 x vector<8xf32>> 
          %128 = llvm.insertvalue %120, %127[2] : !llvm.array<8 x vector<8xf32>> 
          %129 = llvm.insertvalue %121, %128[3] : !llvm.array<8 x vector<8xf32>> 
          %130 = llvm.insertvalue %122, %129[4] : !llvm.array<8 x vector<8xf32>> 
          %131 = llvm.insertvalue %123, %130[5] : !llvm.array<8 x vector<8xf32>> 
          %132 = llvm.insertvalue %124, %131[6] : !llvm.array<8 x vector<8xf32>> 
          %133 = llvm.insertvalue %125, %132[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%39, %133 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%134: i32, %135: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %136 = llvm.icmp "slt" %134, %38 : i32
          llvm.cond_br %136, ^bb6, ^bb12
        ^bb6:  // pred: ^bb5
          %137 = llvm.insertelement %67, %16[%15 : i32] : vector<8xi32>
          %138 = llvm.shufflevector %137, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %139 = llvm.icmp "sgt" %138, %26 : vector<8xi32>
          llvm.br ^bb7(%39, %27 : i32, vector<8xf32>)
        ^bb7(%140: i32, %141: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %142 = llvm.icmp "slt" %140, %35 : i32
          llvm.cond_br %142, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %143 = llvm.extractelement %139[%140 : i32] : vector<8xi1>
          llvm.cond_br %143, ^bb9, ^bb10(%141 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %144 = llvm.add %84, %140 : i32
          %145 = llvm.mul %144, %38 overflow<nsw, nuw> : i32
          %146 = llvm.add %145, %134 overflow<nsw, nuw> : i32
          %147 = llvm.getelementptr inbounds|nuw %43[%146] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %148 = llvm.load %147 : !llvm.ptr -> f32
          %149 = llvm.insertelement %148, %141[%140 : i32] : vector<8xf32>
          llvm.br ^bb10(%149 : vector<8xf32>)
        ^bb10(%150: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %151 = llvm.add %140, %37 : i32
          llvm.br ^bb7(%151, %150 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %152 = llvm.mul %85, %38 : i32
          %153 = llvm.add %152, %134 : i32
          %154 = llvm.getelementptr %50[%153] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %155 = llvm.load %154 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %156 = llvm.add %85, %37 : i32
          %157 = llvm.mul %156, %38 : i32
          %158 = llvm.add %157, %134 : i32
          %159 = llvm.getelementptr %50[%158] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %160 = llvm.load %159 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %161 = llvm.add %85, %33 : i32
          %162 = llvm.mul %161, %38 : i32
          %163 = llvm.add %162, %134 : i32
          %164 = llvm.getelementptr %50[%163] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %165 = llvm.load %164 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %166 = llvm.add %85, %32 : i32
          %167 = llvm.mul %166, %38 : i32
          %168 = llvm.add %167, %134 : i32
          %169 = llvm.getelementptr %50[%168] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %170 = llvm.load %169 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %171 = llvm.add %85, %31 : i32
          %172 = llvm.mul %171, %38 : i32
          %173 = llvm.add %172, %134 : i32
          %174 = llvm.getelementptr %50[%173] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %175 = llvm.load %174 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %176 = llvm.add %85, %30 : i32
          %177 = llvm.mul %176, %38 : i32
          %178 = llvm.add %177, %134 : i32
          %179 = llvm.getelementptr %50[%178] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %180 = llvm.load %179 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %181 = llvm.add %85, %29 : i32
          %182 = llvm.mul %181, %38 : i32
          %183 = llvm.add %182, %134 : i32
          %184 = llvm.getelementptr %50[%183] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %185 = llvm.load %184 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %186 = llvm.add %85, %28 : i32
          %187 = llvm.mul %186, %38 : i32
          %188 = llvm.add %187, %134 : i32
          %189 = llvm.getelementptr %50[%188] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %190 = llvm.load %189 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %191 = llvm.extractelement %155[%15 : i32] : vector<1xf32>
          %192 = llvm.extractelement %160[%15 : i32] : vector<1xf32>
          %193 = llvm.extractelement %165[%15 : i32] : vector<1xf32>
          %194 = llvm.extractelement %170[%15 : i32] : vector<1xf32>
          %195 = llvm.extractelement %175[%15 : i32] : vector<1xf32>
          %196 = llvm.extractelement %180[%15 : i32] : vector<1xf32>
          %197 = llvm.extractelement %185[%15 : i32] : vector<1xf32>
          %198 = llvm.extractelement %190[%15 : i32] : vector<1xf32>
          %199 = llvm.insertelement %191, %27[%15 : i32] : vector<8xf32>
          %200 = llvm.insertelement %192, %199[%14 : i32] : vector<8xf32>
          %201 = llvm.insertelement %193, %200[%13 : i32] : vector<8xf32>
          %202 = llvm.insertelement %194, %201[%12 : i32] : vector<8xf32>
          %203 = llvm.insertelement %195, %202[%11 : i32] : vector<8xf32>
          %204 = llvm.insertelement %196, %203[%10 : i32] : vector<8xf32>
          %205 = llvm.insertelement %197, %204[%9 : i32] : vector<8xf32>
          %206 = llvm.insertelement %198, %205[%8 : i32] : vector<8xf32>
          %207 = llvm.extractelement %141[%7 : i64] : vector<8xf32>
          %208 = llvm.insertelement %207, %27[%15 : i32] : vector<8xf32>
          %209 = llvm.shufflevector %208, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %210 = llvm.extractvalue %135[0] : !llvm.array<8 x vector<8xf32>> 
          %211 = llvm.intr.fmuladd(%209, %206, %210) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %212 = llvm.select %69, %211, %210 : vector<8xi1>, vector<8xf32>
          %213 = llvm.extractelement %141[%6 : i64] : vector<8xf32>
          %214 = llvm.insertelement %213, %27[%15 : i32] : vector<8xf32>
          %215 = llvm.shufflevector %214, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %216 = llvm.extractvalue %135[1] : !llvm.array<8 x vector<8xf32>> 
          %217 = llvm.intr.fmuladd(%215, %206, %216) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %218 = llvm.select %71, %217, %216 : vector<8xi1>, vector<8xf32>
          %219 = llvm.extractelement %141[%5 : i64] : vector<8xf32>
          %220 = llvm.insertelement %219, %27[%15 : i32] : vector<8xf32>
          %221 = llvm.shufflevector %220, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %222 = llvm.extractvalue %135[2] : !llvm.array<8 x vector<8xf32>> 
          %223 = llvm.intr.fmuladd(%221, %206, %222) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %224 = llvm.select %73, %223, %222 : vector<8xi1>, vector<8xf32>
          %225 = llvm.extractelement %141[%4 : i64] : vector<8xf32>
          %226 = llvm.insertelement %225, %27[%15 : i32] : vector<8xf32>
          %227 = llvm.shufflevector %226, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %228 = llvm.extractvalue %135[3] : !llvm.array<8 x vector<8xf32>> 
          %229 = llvm.intr.fmuladd(%227, %206, %228) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %230 = llvm.select %75, %229, %228 : vector<8xi1>, vector<8xf32>
          %231 = llvm.extractelement %141[%3 : i64] : vector<8xf32>
          %232 = llvm.insertelement %231, %27[%15 : i32] : vector<8xf32>
          %233 = llvm.shufflevector %232, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %234 = llvm.extractvalue %135[4] : !llvm.array<8 x vector<8xf32>> 
          %235 = llvm.intr.fmuladd(%233, %206, %234) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %236 = llvm.select %77, %235, %234 : vector<8xi1>, vector<8xf32>
          %237 = llvm.extractelement %141[%2 : i64] : vector<8xf32>
          %238 = llvm.insertelement %237, %27[%15 : i32] : vector<8xf32>
          %239 = llvm.shufflevector %238, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %240 = llvm.extractvalue %135[5] : !llvm.array<8 x vector<8xf32>> 
          %241 = llvm.intr.fmuladd(%239, %206, %240) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %242 = llvm.select %79, %241, %240 : vector<8xi1>, vector<8xf32>
          %243 = llvm.extractelement %141[%1 : i64] : vector<8xf32>
          %244 = llvm.insertelement %243, %27[%15 : i32] : vector<8xf32>
          %245 = llvm.shufflevector %244, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %246 = llvm.extractvalue %135[6] : !llvm.array<8 x vector<8xf32>> 
          %247 = llvm.intr.fmuladd(%245, %206, %246) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %248 = llvm.select %81, %247, %246 : vector<8xi1>, vector<8xf32>
          %249 = llvm.extractelement %141[%0 : i64] : vector<8xf32>
          %250 = llvm.insertelement %249, %27[%15 : i32] : vector<8xf32>
          %251 = llvm.shufflevector %250, %27 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %252 = llvm.extractvalue %135[7] : !llvm.array<8 x vector<8xf32>> 
          %253 = llvm.intr.fmuladd(%251, %206, %252) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %254 = llvm.select %83, %253, %252 : vector<8xi1>, vector<8xf32>
          %255 = llvm.insertvalue %212, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %256 = llvm.insertvalue %218, %255[1] : !llvm.array<8 x vector<8xf32>> 
          %257 = llvm.insertvalue %224, %256[2] : !llvm.array<8 x vector<8xf32>> 
          %258 = llvm.insertvalue %230, %257[3] : !llvm.array<8 x vector<8xf32>> 
          %259 = llvm.insertvalue %236, %258[4] : !llvm.array<8 x vector<8xf32>> 
          %260 = llvm.insertvalue %242, %259[5] : !llvm.array<8 x vector<8xf32>> 
          %261 = llvm.insertvalue %248, %260[6] : !llvm.array<8 x vector<8xf32>> 
          %262 = llvm.insertvalue %254, %261[7] : !llvm.array<8 x vector<8xf32>> 
          %263 = llvm.add %134, %37 : i32
          llvm.br ^bb5(%263, %262 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12:  // pred: ^bb5
          %264 = llvm.extractvalue %135[0] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %264, %89, %69 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %265 = llvm.extractvalue %135[1] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %265, %93, %71 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %266 = llvm.extractvalue %135[2] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %266, %97, %73 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %267 = llvm.extractvalue %135[3] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %267, %101, %75 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %268 = llvm.extractvalue %135[4] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %268, %105, %77 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %269 = llvm.extractvalue %135[5] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %269, %109, %79 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %270 = llvm.extractvalue %135[6] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %270, %113, %81 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %271 = llvm.extractvalue %135[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.intr.masked.store %271, %117, %83 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %272 = llvm.add %85, %35 : i32
          llvm.br ^bb3(%272 : i32) {loop_annotation = #loop_annotation}
        ^bb13:  // pred: ^bb3
          %273 = llvm.add %63, %35 : i32
          llvm.br ^bb1(%273 : i32) {loop_annotation = #loop_annotation}
        ^bb14:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  hal.executable private @main_dispatch_32 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_32_vecmat_10x32_f32 ordinal(0) layout(#pipeline_layout1) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_32_vecmat_10x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(0 : i32) : i32
          %1 = llvm.mlir.poison : vector<10xf32>
          %2 = llvm.mlir.constant(10 : index) : i32
          %3 = llvm.mlir.constant(8 : i32) : i32
          %4 = llvm.mlir.constant(32 : i32) : i32
          %5 = llvm.mlir.constant(64 : index) : i32
          %6 = llvm.mlir.constant(true) : i1
          %7 = llvm.mlir.constant(dense<0.000000e+00> : vector<10xf32>) : vector<10xf32>
          %8 = llvm.mlir.constant(1 : index) : i32
          %9 = llvm.mlir.constant(32 : index) : i32
          %10 = llvm.mlir.constant(0 : index) : i32
          %11 = llvm.mlir.constant(2944 : index) : i32
          %12 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %13 = llvm.extractvalue %12[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %14 = llvm.load %13 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%14, %5 : !llvm.ptr, i32)] : i1
          %15 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.extractvalue %15[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %17 = llvm.getelementptr %16[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.mul %11, %3 : i32
          %20 = llvm.udiv %19, %4 : i32
          %21 = llvm.getelementptr %18[%20] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %6 ["align"(%21, %5 : !llvm.ptr, i32)] : i1
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %24 = llvm.getelementptr %23[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%25, %5 : !llvm.ptr, i32)] : i1
          llvm.br ^bb1(%10, %7 : i32, vector<10xf32>)
        ^bb1(%26: i32, %27: vector<10xf32>):  // 2 preds: ^bb0, ^bb2
          %28 = llvm.icmp "slt" %26, %9 : i32
          llvm.cond_br %28, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %29 = llvm.mul %26, %2 : i32
          %30 = llvm.add %29, %10 : i32
          %31 = llvm.getelementptr %21[%30] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %32 = llvm.load %31 {alignment = 4 : i64} : !llvm.ptr -> vector<10xf32>
          %33 = llvm.getelementptr inbounds|nuw %14[%26] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %34 = llvm.load %33 : !llvm.ptr -> f32
          %35 = llvm.insertelement %34, %1[%0 : i32] : vector<10xf32>
          %36 = llvm.shufflevector %35, %1 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] : vector<10xf32> 
          %37 = llvm.intr.fmuladd(%32, %36, %27) : (vector<10xf32>, vector<10xf32>, vector<10xf32>) -> vector<10xf32>
          %38 = llvm.add %26, %8 : i32
          llvm.br ^bb1(%38, %37 : i32, vector<10xf32>) {loop_annotation = #loop_annotation}
        ^bb3:  // pred: ^bb1
          llvm.store %27, %25 {alignment = 4 : i64} : vector<10xf32>, !llvm.ptr
          llvm.return %0 : i32
        }
      }
    }
  }
  util.func private @__main_memoize_apply(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c12288 = arith.constant 12288 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c2) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c0] workgroups([%c1, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c12288], 
      (%c1 : index)[%c0, %c12288]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0 = util.global.load immutable @__main_memoize_result_0_device_0 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_0(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c1 = arith.constant 1 : index
    %c2048 = arith.constant 2048 : index
    %c94336 = arith.constant 94336 : index
    %c12288 = arith.constant 12288 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %__device_1_executable_0_main_dispatch_1 = util.global.load immutable @__device_1_executable_0_main_dispatch_1 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_0_main_dispatch_1 : !hal.executable)[%c0] workgroups([%c4, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c12288], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c2 : index)[%c0, %c2048]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.copy_buffer<%cmd : !hal.command_buffer> source(%c2 : index)[%c0] target(%c1 : index)[%c0] length(%c2048) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_0(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_1(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1 = util.global.load immutable @__main_memoize_result_0_device_1 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_2(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c3 = arith.constant 3 : index
    %c4352 = arith.constant 4352 : index
    %c2304 = arith.constant 2304 : index
    %c2176 = arith.constant 2176 : index
    %c2 = arith.constant 2 : index
    %c2048 = arith.constant 2048 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c17 = arith.constant 17 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c4) : !hal.command_buffer
    hal.command_buffer.copy_buffer<%cmd : !hal.command_buffer> source(%c1 : index)[%c0] target(%c0 : index)[%c128] length(%c2048) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c1] workgroups([%c1, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c2304], 
      (%c2 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c2] workgroups([%c17, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c4352], 
      (%c3 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c3] workgroups([%c17, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0_3 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : !hal.buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply_2(%__device_0, %c-1_i64, %__hoisted_tensor_32xf32_2) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0_3 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_4(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0_3 = util.global.load immutable @__main_memoize_result_0_device_0_3 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0_3 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_5(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c2176 = arith.constant 2176 : index
    %c1 = arith.constant 1 : index
    %c53376_i32 = arith.constant 53376 : i32
    %c13056 = arith.constant 13056 : index
    %c94336 = arith.constant 94336 : index
    %c4352 = arith.constant 4352 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c57472_i32 = arith.constant 57472 : i32
    %c2176_i32 = arith.constant 2176 : i32
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c34 = arith.constant 34 : index
    %__device_1_executable_1_main_dispatch_5 = util.global.load immutable @__device_1_executable_1_main_dispatch_5 : !hal.executable
    %__device_1_executable_2_main_dispatch_6 = util.global.load immutable @__device_1_executable_2_main_dispatch_6 : !hal.executable
    %__device_1_executable_3_main_dispatch_7 = util.global.load immutable @__device_1_executable_3_main_dispatch_7 : !hal.executable
    %__device_1_executable_4_main_dispatch_8 = util.global.load immutable @__device_1_executable_4_main_dispatch_8 : !hal.executable
    %__device_1_executable_5_main_dispatch_9 = util.global.load immutable @__device_1_executable_5_main_dispatch_9 : !hal.executable
    %__device_1_executable_6_main_dispatch_10 = util.global.load immutable @__device_1_executable_6_main_dispatch_10 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_1_main_dispatch_5 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c2176_i32, %c57472_i32]) bindings([
      (%c0 : index)[%c0, %c4352], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c2 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_2_main_dispatch_6 : !hal.executable)[%c0] workgroups([%c1, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c13056], 
      (%c2 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_3_main_dispatch_7 : !hal.executable)[%c0] workgroups([%c4, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c13056], 
      (%c2 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_4_main_dispatch_8 : !hal.executable)[%c0] workgroups([%c34, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c13056], 
      (%c2 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_5_main_dispatch_9 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c13056], 
      (%c2 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_6_main_dispatch_10 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c53376_i32]) bindings([
      (%c2 : index)[%c0, %c13056], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c0 : index)[%c0, %c4352], 
      (%c1 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1_6 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_5(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1_6 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_7(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1_6 = util.global.load immutable @__main_memoize_result_0_device_1_6 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1_6 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_8(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c1 = arith.constant 1 : index
    %c2176 = arith.constant 2176 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c17 = arith.constant 17 : index
    %c4 = arith.constant 4 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c2] workgroups([%c17, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c4] workgroups([%c17, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c2176], 
      (%c1 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0_9 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply_8(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0_9 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_10(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0_9 = util.global.load immutable @__main_memoize_result_0_device_0_9 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0_9 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_11(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c4352 = arith.constant 4352 : index
    %c94336 = arith.constant 94336 : index
    %c2176 = arith.constant 2176 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c2304_i32 = arith.constant 2304 : i32
    %c45184_i32 = arith.constant 45184 : i32
    %c4 = arith.constant 4 : index
    %__device_1_executable_7_main_dispatch_13 = util.global.load immutable @__device_1_executable_7_main_dispatch_13 : !hal.executable
    %__device_1_executable_8_main_dispatch_14 = util.global.load immutable @__device_1_executable_8_main_dispatch_14 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c4) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_7_main_dispatch_13 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c45184_i32, %c2304_i32]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c3 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_8_main_dispatch_14 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c4352], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c1 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1_12 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_11(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1_12 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_13(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1_12 = util.global.load immutable @__main_memoize_result_0_device_1_12 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1_12 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_14(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c1 = arith.constant 1 : index
    %c2176 = arith.constant 2176 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c17 = arith.constant 17 : index
    %c5 = arith.constant 5 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c2] workgroups([%c17, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c5] workgroups([%c17, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c2176], 
      (%c1 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0_15 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply_14(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0_15 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_16(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0_15 = util.global.load immutable @__main_memoize_result_0_device_0_15 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0_15 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_17(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c20608_i32 = arith.constant 20608 : i32
    %c13056 = arith.constant 13056 : index
    %c94336 = arith.constant 94336 : index
    %c2176 = arith.constant 2176 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c24704_i32 = arith.constant 24704 : i32
    %c0_i32 = arith.constant 0 : i32
    %c4 = arith.constant 4 : index
    %c34 = arith.constant 34 : index
    %__device_1_executable_1_main_dispatch_5 = util.global.load immutable @__device_1_executable_1_main_dispatch_5 : !hal.executable
    %__device_1_executable_2_main_dispatch_6 = util.global.load immutable @__device_1_executable_2_main_dispatch_6 : !hal.executable
    %__device_1_executable_3_main_dispatch_7 = util.global.load immutable @__device_1_executable_3_main_dispatch_7 : !hal.executable
    %__device_1_executable_4_main_dispatch_8 = util.global.load immutable @__device_1_executable_4_main_dispatch_8 : !hal.executable
    %__device_1_executable_5_main_dispatch_9 = util.global.load immutable @__device_1_executable_5_main_dispatch_9 : !hal.executable
    %__device_1_executable_6_main_dispatch_10 = util.global.load immutable @__device_1_executable_6_main_dispatch_10 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c4) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_1_main_dispatch_5 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c0_i32, %c24704_i32]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c3 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_2_main_dispatch_6 : !hal.executable)[%c0] workgroups([%c1, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c13056], 
      (%c3 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_3_main_dispatch_7 : !hal.executable)[%c0] workgroups([%c4, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c13056], 
      (%c3 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_4_main_dispatch_8 : !hal.executable)[%c0] workgroups([%c34, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c13056], 
      (%c3 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_5_main_dispatch_9 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c13056], 
      (%c3 : index)[%c0, %c13056]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_6_main_dispatch_10 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c20608_i32]) bindings([
      (%c3 : index)[%c0, %c13056], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c1 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1_18 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_17(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1_18 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_19(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1_18 = util.global.load immutable @__main_memoize_result_0_device_1_18 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1_18 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_20(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c1 = arith.constant 1 : index
    %c2176 = arith.constant 2176 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c17 = arith.constant 17 : index
    %c6 = arith.constant 6 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c2] workgroups([%c17, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%c2 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c6] workgroups([%c17, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c2176], 
      (%c1 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0_21 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply_20(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0_21 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_22(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0_21 = util.global.load immutable @__main_memoize_result_0_device_0_21 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0_21 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_23(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c1 = arith.constant 1 : index
    %c4352 = arith.constant 4352 : index
    %c94336 = arith.constant 94336 : index
    %c2176 = arith.constant 2176 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c2688_i32 = arith.constant 2688 : i32
    %c12416_i32 = arith.constant 12416 : i32
    %c3 = arith.constant 3 : index
    %__device_1_executable_7_main_dispatch_13 = util.global.load immutable @__device_1_executable_7_main_dispatch_13 : !hal.executable
    %__device_1_executable_9_main_dispatch_26 = util.global.load immutable @__device_1_executable_9_main_dispatch_26 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c3) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_7_main_dispatch_13 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c12416_i32, %c2688_i32]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c2 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_9_main_dispatch_26 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
      (%c2 : index)[%c0, %c4352], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c1 : index)[%c0, %c2176]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1_24 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_23(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1_24 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_25(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1_24 = util.global.load immutable @__main_memoize_result_0_device_1_24 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1_24 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_26(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c128 = arith.constant 128 : index
    %c2 = arith.constant 2 : index
    %c320 = arith.constant 320 : index
    %c2304 = arith.constant 2304 : index
    %c2176 = arith.constant 2176 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %c9 = arith.constant 9 : index
    %c10 = arith.constant 10 : index
    %c11 = arith.constant 11 : index
    %__device_0_executable_0_vit_linked = util.global.load immutable @__device_0_executable_0_vit_linked : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c4) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c7] workgroups([%c1, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%c1 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c2304], 
      (%c3 : index)[%c0, %c320]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c8] workgroups([%c1, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c320], 
      (%c3 : index)[%c0, %c320]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c9] workgroups([%c1, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c320], 
      (%c3 : index)[%c0, %c320]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c10] workgroups([%c1, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c320], 
      (%c3 : index)[%c0, %c320]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_vit_linked : !hal.executable)[%c11] workgroups([%c1, %c1, %c1]) bindings([
      (%c3 : index)[%c0, %c320], 
      (%c2 : index)[%c0, %c128]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_0_27 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : !hal.buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %0 = util.call @__main_memoize_apply_26(%__device_0, %c-1_i64, %__hoisted_tensor_32xf32_2) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_0_27 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_28(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_0 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_0_27 = util.global.load immutable @__main_memoize_result_0_device_0_27 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_0_27 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.func private @__main_memoize_apply_29(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c40 = arith.constant 40 : index
    %c94336 = arith.constant 94336 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %__device_1_executable_10_main_dispatch_32 = util.global.load immutable @__device_1_executable_10_main_dispatch_32 : !hal.executable
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c2) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_10_main_dispatch_32 : !hal.executable)[%c0] workgroups([%c1, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c128], 
      (%arg2 : !hal.buffer)[%c0, %c94336], 
      (%c1 : index)[%c0, %c40]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1_30 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply_29(%__device_1, %c-1_i64, %__hoisted_tensor_32xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1_30 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup_31(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
    %0 = util.null : !hal.command_buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
    %2 = scf.if %1 -> (!hal.command_buffer) {
      %__main_memoize_result_0_device_1_30 = util.global.load immutable @__main_memoize_result_0_device_1_30 : !hal.command_buffer
      scf.yield %__main_memoize_result_0_device_1_30 : !hal.command_buffer
    } else {
      scf.yield %0 : !hal.command_buffer
    }
    util.return %2 : !hal.command_buffer
  }
  util.global private @__allocator_select_device : !hal.device
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|MappingScoped|MappingAccessRandom|Mapping"> : i32
    %__device_1 = util.global.load @__device_1 : !hal.device
    %__device_0 = util.global.load @__device_0 : !hal.device
    %device, %queue_affinity = hal.allocator.select from([
      (%__device_0, %c-1_i64 : !hal.device, i64),
      (%__device_1, %c-1_i64 : !hal.device, i64)
    ]) type(%memory_type) usage(%buffer_usage) : !hal.device, i64
    util.global.store %device, @__allocator_select_device : !hal.device
    util.return
  }
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %c10 = arith.constant 10 : index
    %c-1_i32 = arith.constant -1 : i32
    %c0_i64 = arith.constant 0 : i64
    %0 = util.null : !hal.fence
    %c-1_i64 = arith.constant -1 : i64
    %c320 = arith.constant 320 : index
    %c13056 = arith.constant 13056 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c3 = arith.constant 3 : index
    %c12288 = arith.constant 12288 : index
    %c0 = arith.constant 0 : index
    %c2048 = arith.constant 2048 : index
    %c128 = arith.constant 128 : index
    %c2176 = arith.constant 2176 : index
    %c4352 = arith.constant 4352 : index
    %c40 = arith.constant 40 : index
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|MappingScoped|MappingAccessRandom|Mapping"> : i32
    %buffer_usage_0 = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage"> : i32
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
    %__device_0 = util.global.load immutable @__device_0 : !hal.device
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %__allocator_select_device = util.global.load immutable @__allocator_select_device : !hal.device
    %fence = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c2176}
    %fence_1 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.copy<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence) signal(%fence_1) source(%__hoisted_tensor_32xf32 : !hal.buffer)[%c128] target(%transient_buffer : !hal.buffer)[%c0] length(%c2176) flags("None")
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c1, %c32, %c32, %c3]) type(%element_type_f32) encoding(%dense_row_major)
    %buffer = hal.buffer_view.buffer<%arg0 : !hal.buffer_view> : !hal.buffer
    %allocator = hal.device.allocator<%__device_0 : !hal.device> : !hal.allocator
    hal.buffer.assert<%buffer : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c12288) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage")
    %fence_2 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_3 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence_2) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c12288}
    %1 = util.call @__main_memoize_lookup(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_4 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_2) signal(%fence_4) commands(%1) bindings([
      (%buffer : !hal.buffer)[%c0, %c12288], 
      (%transient_buffer_3 : !hal.buffer)[%c0, %c12288]
    ]) flags("None")
    %fence_5 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_6 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_4) signal(%fence_5) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c2048}
    %fence_7 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_8 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_4) signal(%fence_7) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c2048}
    %fence_9 = hal.fence.join at([%fence_5, %fence_7]) flags("None") -> !hal.fence
    %2 = util.call @__main_memoize_lookup_1(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_10 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_9) signal(%fence_10) commands(%2) bindings([
      (%transient_buffer_3 : !hal.buffer)[%c0, %c12288], 
      (%transient_buffer_6 : !hal.buffer)[%c0, %c2048], 
      (%transient_buffer_8 : !hal.buffer)[%c0, %c2048]
    ]) flags("None")
    %fence_11 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_10) signal(%fence_11) buffer(%transient_buffer_3 : !hal.buffer) flags("None")
    %fence_12 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_10) signal(%fence_12) buffer(%transient_buffer_8 : !hal.buffer) flags("None")
    %fence_13 = hal.fence.join at([%fence_1, %fence_11, %fence_12]) flags("None") -> !hal.fence
    %fence_14 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_15 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_13) signal(%fence_14) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c4352}
    %fence_16 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_17 = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_13) signal(%fence_16) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c2176}
    %fence_18 = hal.fence.join at([%fence_14, %fence_16]) flags("None") -> !hal.fence
    %3 = util.call @__main_memoize_lookup_4(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_19 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_18) signal(%fence_19) commands(%3) bindings([
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_6 : !hal.buffer)[%c0, %c2048], 
      (%transient_buffer_15 : !hal.buffer)[%c0, %c4352], 
      (%transient_buffer_17 : !hal.buffer)[%c0, %c2176]
    ]) flags("None")
    %fence_20 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_19) signal(%fence_20) buffer(%transient_buffer_6 : !hal.buffer) flags("None")
    %fence_21 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_19) signal(%fence_21) buffer(%transient_buffer_17 : !hal.buffer) flags("None")
    %fence_22 = hal.fence.join at([%fence_20, %fence_21]) flags("None") -> !hal.fence
    %fence_23 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_24 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_22) signal(%fence_23) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c13056}
    %4 = util.call @__main_memoize_lookup_7(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_25 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_23) signal(%fence_25) commands(%4) bindings([
      (%transient_buffer_15 : !hal.buffer)[%c0, %c4352], 
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_24 : !hal.buffer)[%c0, %c13056]
    ]) flags("None")
    %fence_26 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_25) signal(%fence_26) buffer(%transient_buffer_15 : !hal.buffer) flags("None")
    %fence_27 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_25) signal(%fence_27) buffer(%transient_buffer_24 : !hal.buffer) flags("None")
    %fence_28 = hal.fence.join at([%fence_26, %fence_27]) flags("None") -> !hal.fence
    %fence_29 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_30 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_28) signal(%fence_29) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c2176}
    %fence_31 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_32 = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_28) signal(%fence_31) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c2176}
    %fence_33 = hal.fence.join at([%fence_29, %fence_31]) flags("None") -> !hal.fence
    %5 = util.call @__main_memoize_lookup_10(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_34 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_33) signal(%fence_34) commands(%5) bindings([
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_32 : !hal.buffer)[%c0, %c2176]
    ]) flags("None")
    %fence_35 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_34) signal(%fence_35) buffer(%transient_buffer_32 : !hal.buffer) flags("None")
    %fence_36 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_37 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_35) signal(%fence_36) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c2176}
    %fence_38 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_39 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_35) signal(%fence_38) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c4352}
    %fence_40 = hal.fence.join at([%fence_36, %fence_38]) flags("None") -> !hal.fence
    %6 = util.call @__main_memoize_lookup_13(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_41 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_40) signal(%fence_41) commands(%6) bindings([
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_37 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_39 : !hal.buffer)[%c0, %c4352]
    ]) flags("None")
    %fence_42 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_41) signal(%fence_42) buffer(%transient_buffer_39 : !hal.buffer) flags("None")
    %fence_43 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_44 = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_42) signal(%fence_43) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c2176}
    %7 = util.call @__main_memoize_lookup_16(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_45 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_43) signal(%fence_45) commands(%7) bindings([
      (%transient_buffer_37 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_44 : !hal.buffer)[%c0, %c2176]
    ]) flags("None")
    %fence_46 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_45) signal(%fence_46) buffer(%transient_buffer_44 : !hal.buffer) flags("None")
    %fence_47 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_48 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_46) signal(%fence_47) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c13056}
    %8 = util.call @__main_memoize_lookup_19(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_49 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_47) signal(%fence_49) commands(%8) bindings([
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_37 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_48 : !hal.buffer)[%c0, %c13056]
    ]) flags("None")
    %fence_50 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_49) signal(%fence_50) buffer(%transient_buffer_37 : !hal.buffer) flags("None")
    %fence_51 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_49) signal(%fence_51) buffer(%transient_buffer_48 : !hal.buffer) flags("None")
    %fence_52 = hal.fence.join at([%fence_50, %fence_51]) flags("None") -> !hal.fence
    %fence_53 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_54 = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_52) signal(%fence_53) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c2176}
    %9 = util.call @__main_memoize_lookup_22(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_55 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_53) signal(%fence_55) commands(%9) bindings([
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_54 : !hal.buffer)[%c0, %c2176]
    ]) flags("None")
    %fence_56 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_55) signal(%fence_56) buffer(%transient_buffer_54 : !hal.buffer) flags("None")
    %fence_57 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_58 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_56) signal(%fence_57) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c2176}
    %fence_59 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_60 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_56) signal(%fence_59) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c4352}
    %fence_61 = hal.fence.join at([%fence_57, %fence_59]) flags("None") -> !hal.fence
    %10 = util.call @__main_memoize_lookup_25(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_62 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_61) signal(%fence_62) commands(%10) bindings([
      (%transient_buffer_30 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_58 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_60 : !hal.buffer)[%c0, %c4352]
    ]) flags("None")
    %fence_63 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_62) signal(%fence_63) buffer(%transient_buffer_30 : !hal.buffer) flags("None")
    %fence_64 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_62) signal(%fence_64) buffer(%transient_buffer_60 : !hal.buffer) flags("None")
    %fence_65 = hal.fence.join at([%fence_63, %fence_64]) flags("None") -> !hal.fence
    %fence_66 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    %transient_buffer_67 = hal.device.queue.alloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_65) signal(%fence_66) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c128}
    %fence_68 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_69 = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_65) signal(%fence_68) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c320}
    %fence_70 = hal.fence.join at([%fence_66, %fence_68]) flags("None") -> !hal.fence
    %11 = util.call @__main_memoize_lookup_28(%__device_0, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_71 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_70) signal(%fence_71) commands(%11) bindings([
      (%transient_buffer_58 : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer_67 : !hal.buffer)[%c0, %c128], 
      (%transient_buffer_69 : !hal.buffer)[%c0, %c320]
    ]) flags("None")
    %fence_72 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_71) signal(%fence_72) buffer(%transient_buffer : !hal.buffer) flags("None")
    %fence_73 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_71) signal(%fence_73) buffer(%transient_buffer_58 : !hal.buffer) flags("None")
    %fence_74 = hal.fence.join at([%fence_72, %fence_73]) flags("None") -> !hal.fence
    %fence_75 = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence_74) signal(%fence_75) buffer(%transient_buffer_69 : !hal.buffer) flags("None")
    %fence_76 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer_77 = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_75) signal(%fence_76) pool(%c0_i64) type(%memory_type) usage(%buffer_usage_0) flags("None") : !hal.buffer{%c40}
    %12 = util.call @__main_memoize_lookup_31(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_78 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence_76) signal(%fence_78) commands(%12) bindings([
      (%transient_buffer_67 : !hal.buffer)[%c0, %c128], 
      (%transient_buffer_77 : !hal.buffer)[%c0, %c40]
    ]) flags("None")
    %fence_79 = hal.fence.create device(%__allocator_select_device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.dealloca<%__allocator_select_device : !hal.device> affinity(%c-1_i64) wait(%fence_78) signal(%fence_79) buffer(%transient_buffer_67 : !hal.buffer) flags("None")
    %status = hal.fence.await until([%fence_79]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    %view = hal.buffer_view.create buffer(%transient_buffer_77 : !hal.buffer)[%c0, %c40] shape([%c1, %c10]) type(%element_type_f32) encoding(%dense_row_major) : !hal.buffer_view
    util.return %view : !hal.buffer_view
  }
}

{-#

#-}


