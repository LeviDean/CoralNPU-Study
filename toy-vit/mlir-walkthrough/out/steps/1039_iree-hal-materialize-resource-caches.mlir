#composite_of_8448b = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
#loop_unroll = #llvm.loop_unroll<disable = true>
#pipeline_layout = #hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>
#device_target_coralnpu = #hal.device.target<"coralnpu", [#executable_target_embedded_elf_riscv_32]> : !hal.device
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_x86_64]> : !hal.device
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
module attributes {stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #device_target_local
  util.global private @__device_1 = #device_target_coralnpu
  util.global private @__device_1_executable_0_main_dispatch_0 : !hal.executable
  util.initializer {
    %__device_1 = util.global.load @__device_1 : !hal.device
    %c-1_i64 = arith.constant -1 : i64
    %ok, %value = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
    %c-1 = arith.constant -1 : index
    %c0 = arith.constant 0 : index
    %0 = arith.select %value, %c0, %c-1 : index
    %1 = scf.index_switch %0 -> !hal.executable 
    case 0 {
      %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_0::@embedded_elf_riscv_32) : !hal.executable
      scf.yield %executable : !hal.executable
    }
    default {
      %c14_i32 = arith.constant 14 : i32
      util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
      %2 = util.null : !hal.executable
      scf.yield %2 : !hal.executable
    }
    util.global.store %1, @__device_1_executable_0_main_dispatch_0 : !hal.executable
    util.return
  }
  util.global private @__hoisted_tensor_64xf32 : !hal.buffer
  util.initializer {
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
    %c8448 = arith.constant 8448 : index
    %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #composite_of_8448b
    %0 = util.null : !hal.fence
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %c-1_i64 = arith.constant -1 : i64
    %c0_i32 = arith.constant 0 : i32
    %c-1_i32 = arith.constant -1 : i32
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
    %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c8448] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
    cf.cond_br %did_import, ^bb2(%0, %mapped : !hal.fence, !hal.buffer), ^bb1
  ^bb1:  // pred: ^bb0
    %memory_types, %buffer_usage_0 = hal.allocator.resolve_memory_properties for(#hal.device.affinity<@__device_1>) lifetime(constant) : i32, i32
    %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_types) usage(%buffer_usage_0) : !hal.buffer{%c8448}
    %memory_file = hal.ex.file.from_memory device(%__device_1 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst : !util.buffer)[%c0 for %c8448] flags(%c0_i32) : !hal.file
    %fence = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.read<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) source(%memory_file : !hal.file)[%c0_i64] target(%buffer : !hal.buffer)[%c0] length(%c8448) flags("None")
    cf.br ^bb2(%fence, %buffer : !hal.fence, !hal.buffer)
  ^bb2(%1: !hal.fence, %2: !hal.buffer):  // 2 preds: ^bb0, ^bb1
    %status = hal.fence.await until([%1]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    util.global.store %2, @__hoisted_tensor_64xf32 : !hal.buffer
    util.return
  }
  hal.executable private @main_dispatch_0 {
    hal.executable.variant public @embedded_elf_riscv_32 target(#executable_target_embedded_elf_riscv_32) {
      hal.executable.export public @main_dispatch_0_matmul_17x64x32_f32 ordinal(0) layout(#pipeline_layout) attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p:32:32-i64:64-n32-S128", llvm.target_triple = "riscv32-unknown-unknown-eabi-elf"} {
        llvm.func @main_dispatch_0_matmul_17x64x32_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
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
          %40 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
          %41 = llvm.mlir.poison : vector<8xf32>
          %42 = llvm.mlir.constant(7 : index) : i32
          %43 = llvm.mlir.constant(6 : index) : i32
          %44 = llvm.mlir.constant(5 : index) : i32
          %45 = llvm.mlir.constant(4 : index) : i32
          %46 = llvm.mlir.constant(3 : index) : i32
          %47 = llvm.mlir.constant(2 : index) : i32
          %48 = llvm.mlir.constant(dense<0.000000e+00> : vector<8xf32>) : vector<8xf32>
          %49 = llvm.mlir.constant(256 : index) : i32
          %50 = llvm.mlir.constant(0 : index) : i32
          %51 = llvm.mlir.constant(32 : index) : i32
          %52 = llvm.mlir.constant(1 : index) : i32
          %53 = llvm.mlir.constant(64 : index) : i32
          %54 = llvm.mlir.constant(8 : index) : i32
          %55 = llvm.mlir.constant(dense<4.471500e-02> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %56 = llvm.mlir.constant(dense<0.797884523> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %57 = llvm.mlir.constant(dense<1.000000e+00> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %58 = llvm.mlir.constant(dense<5.000000e-01> : vector<8x8xf32>) : !llvm.array<8 x vector<8xf32>>
          %59 = llvm.alloca %53 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %60 = llvm.alloca %53 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %61 = llvm.alloca %53 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %62 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %63 = llvm.extractvalue %62[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %64 = llvm.load %63 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%64, %53 : !llvm.ptr, i32)] : i1
          %65 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %66 = llvm.extractvalue %65[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %67 = llvm.getelementptr %66[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %68 = llvm.load %67 : !llvm.ptr -> !llvm.ptr
          %69 = llvm.mul %49, %17 : i32
          %70 = llvm.udiv %69, %18 : i32
          %71 = llvm.getelementptr %68[%70] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.assume %19 ["align"(%71, %53 : !llvm.ptr, i32)] : i1
          %72 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %73 = llvm.extractvalue %72[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %74 = llvm.getelementptr %73[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %75 = llvm.load %74 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%75, %53 : !llvm.ptr, i32)] : i1
          %76 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %77 = llvm.extractvalue %76[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)> 
          %78 = llvm.getelementptr %77[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %79 = llvm.load %78 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %19 ["align"(%79, %53 : !llvm.ptr, i32)] : i1
          %80 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %81 = llvm.extractvalue %80[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)> 
          %82 = llvm.mul %81, %39 overflow<nsw> : i32
          %83 = llvm.mul %81, %37 overflow<nsw> : i32
          %84 = llvm.add %83, %38 : i32
          %85 = llvm.icmp "slt" %84, %39 : i32
          %86 = llvm.select %85, %84, %39 : i1, i32
          %87 = llvm.icmp "sgt" %86, %50 : i32
          llvm.cond_br %87, ^bb1(%50 : i32), ^bb27
        ^bb1(%88: i32):  // 2 preds: ^bb0, ^bb26
          %89 = llvm.icmp "slt" %88, %86 : i32
          llvm.cond_br %89, ^bb2, ^bb27
        ^bb2:  // pred: ^bb1
          %90 = llvm.sub %86, %88 : i32
          %91 = llvm.icmp "slt" %90, %54 : i32
          %92 = llvm.select %91, %90, %54 : i1, i32
          %93 = llvm.icmp "sgt" %92, %50 : i32
          %94 = llvm.select %93, %22, %21 : i1, vector<8xi1>
          %95 = llvm.icmp "sgt" %92, %52 : i32
          %96 = llvm.select %95, %22, %21 : i1, vector<8xi1>
          %97 = llvm.icmp "sgt" %92, %47 : i32
          %98 = llvm.select %97, %22, %21 : i1, vector<8xi1>
          %99 = llvm.icmp "sgt" %92, %46 : i32
          %100 = llvm.select %99, %22, %21 : i1, vector<8xi1>
          %101 = llvm.icmp "sgt" %92, %45 : i32
          %102 = llvm.select %101, %22, %21 : i1, vector<8xi1>
          %103 = llvm.icmp "sgt" %92, %44 : i32
          %104 = llvm.select %103, %22, %21 : i1, vector<8xi1>
          %105 = llvm.icmp "sgt" %92, %43 : i32
          %106 = llvm.select %105, %22, %21 : i1, vector<8xi1>
          %107 = llvm.icmp "sgt" %92, %42 : i32
          %108 = llvm.select %107, %22, %21 : i1, vector<8xi1>
          %109 = llvm.mul %50, %54 : i32
          %110 = llvm.add %109, %50 : i32
          %111 = llvm.getelementptr %61[%110] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %111, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %112 = llvm.mul %52, %54 : i32
          %113 = llvm.add %112, %50 : i32
          %114 = llvm.getelementptr %61[%113] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %114, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %115 = llvm.mul %47, %54 : i32
          %116 = llvm.add %115, %50 : i32
          %117 = llvm.getelementptr %61[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %117, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %118 = llvm.mul %46, %54 : i32
          %119 = llvm.add %118, %50 : i32
          %120 = llvm.getelementptr %61[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %120, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %121 = llvm.mul %45, %54 : i32
          %122 = llvm.add %121, %50 : i32
          %123 = llvm.getelementptr %61[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %123, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %124 = llvm.mul %44, %54 : i32
          %125 = llvm.add %124, %50 : i32
          %126 = llvm.getelementptr %61[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %126, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %127 = llvm.mul %43, %54 : i32
          %128 = llvm.add %127, %50 : i32
          %129 = llvm.getelementptr %61[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %129, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %130 = llvm.mul %42, %54 : i32
          %131 = llvm.add %130, %50 : i32
          %132 = llvm.getelementptr %61[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %48, %132, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %133 = llvm.add %88, %82 : i32
          llvm.br ^bb3(%50 : i32)
        ^bb3(%134: i32):  // 2 preds: ^bb2, ^bb25
          %135 = llvm.icmp "slt" %134, %53 : i32
          llvm.cond_br %135, ^bb4, ^bb26
        ^bb4:  // pred: ^bb3
          %136 = llvm.intr.masked.load %111, %94, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %137 = llvm.intr.masked.load %114, %96, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %138 = llvm.intr.masked.load %117, %98, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %139 = llvm.intr.masked.load %120, %100, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %140 = llvm.intr.masked.load %123, %102, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %141 = llvm.intr.masked.load %126, %104, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %142 = llvm.intr.masked.load %129, %106, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %143 = llvm.intr.masked.load %132, %108, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %144 = llvm.insertvalue %136, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %145 = llvm.insertvalue %137, %144[1] : !llvm.array<8 x vector<8xf32>> 
          %146 = llvm.insertvalue %138, %145[2] : !llvm.array<8 x vector<8xf32>> 
          %147 = llvm.insertvalue %139, %146[3] : !llvm.array<8 x vector<8xf32>> 
          %148 = llvm.insertvalue %140, %147[4] : !llvm.array<8 x vector<8xf32>> 
          %149 = llvm.insertvalue %141, %148[5] : !llvm.array<8 x vector<8xf32>> 
          %150 = llvm.insertvalue %142, %149[6] : !llvm.array<8 x vector<8xf32>> 
          %151 = llvm.insertvalue %143, %150[7] : !llvm.array<8 x vector<8xf32>> 
          llvm.br ^bb5(%50, %151 : i32, !llvm.array<8 x vector<8xf32>>)
        ^bb5(%152: i32, %153: !llvm.array<8 x vector<8xf32>>):  // 2 preds: ^bb4, ^bb11
          %154 = llvm.icmp "slt" %152, %51 : i32
          llvm.cond_br %154, ^bb6, ^bb12(%50 : i32)
        ^bb6:  // pred: ^bb5
          %155 = llvm.insertelement %92, %16[%15 : i32] : vector<8xi32>
          %156 = llvm.shufflevector %155, %16 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xi32> 
          %157 = llvm.icmp "sgt" %156, %40 : vector<8xi32>
          llvm.br ^bb7(%50, %41 : i32, vector<8xf32>)
        ^bb7(%158: i32, %159: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
          %160 = llvm.icmp "slt" %158, %54 : i32
          llvm.cond_br %160, ^bb8, ^bb11
        ^bb8:  // pred: ^bb7
          %161 = llvm.extractelement %157[%158 : i32] : vector<8xi1>
          llvm.cond_br %161, ^bb9, ^bb10(%159 : vector<8xf32>)
        ^bb9:  // pred: ^bb8
          %162 = llvm.add %133, %158 : i32
          %163 = llvm.mul %162, %51 overflow<nsw, nuw> : i32
          %164 = llvm.add %163, %152 overflow<nsw, nuw> : i32
          %165 = llvm.getelementptr inbounds|nuw %64[%164] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %166 = llvm.load %165 : !llvm.ptr -> f32
          %167 = llvm.insertelement %166, %159[%158 : i32] : vector<8xf32>
          llvm.br ^bb10(%167 : vector<8xf32>)
        ^bb10(%168: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
          %169 = llvm.add %158, %52 : i32
          llvm.br ^bb7(%169, %168 : i32, vector<8xf32>)
        ^bb11:  // pred: ^bb7
          %170 = llvm.mul %134, %51 : i32
          %171 = llvm.add %170, %152 : i32
          %172 = llvm.getelementptr %71[%171] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %173 = llvm.load %172 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %174 = llvm.add %134, %52 : i32
          %175 = llvm.mul %174, %51 : i32
          %176 = llvm.add %175, %152 : i32
          %177 = llvm.getelementptr %71[%176] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %178 = llvm.load %177 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %179 = llvm.add %134, %47 : i32
          %180 = llvm.mul %179, %51 : i32
          %181 = llvm.add %180, %152 : i32
          %182 = llvm.getelementptr %71[%181] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %183 = llvm.load %182 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %184 = llvm.add %134, %46 : i32
          %185 = llvm.mul %184, %51 : i32
          %186 = llvm.add %185, %152 : i32
          %187 = llvm.getelementptr %71[%186] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %188 = llvm.load %187 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %189 = llvm.add %134, %45 : i32
          %190 = llvm.mul %189, %51 : i32
          %191 = llvm.add %190, %152 : i32
          %192 = llvm.getelementptr %71[%191] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %193 = llvm.load %192 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %194 = llvm.add %134, %44 : i32
          %195 = llvm.mul %194, %51 : i32
          %196 = llvm.add %195, %152 : i32
          %197 = llvm.getelementptr %71[%196] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %198 = llvm.load %197 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %199 = llvm.add %134, %43 : i32
          %200 = llvm.mul %199, %51 : i32
          %201 = llvm.add %200, %152 : i32
          %202 = llvm.getelementptr %71[%201] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %203 = llvm.load %202 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %204 = llvm.add %134, %42 : i32
          %205 = llvm.mul %204, %51 : i32
          %206 = llvm.add %205, %152 : i32
          %207 = llvm.getelementptr %71[%206] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %208 = llvm.load %207 {alignment = 4 : i64} : !llvm.ptr -> vector<1xf32>
          %209 = llvm.extractelement %173[%15 : i32] : vector<1xf32>
          %210 = llvm.extractelement %178[%15 : i32] : vector<1xf32>
          %211 = llvm.extractelement %183[%15 : i32] : vector<1xf32>
          %212 = llvm.extractelement %188[%15 : i32] : vector<1xf32>
          %213 = llvm.extractelement %193[%15 : i32] : vector<1xf32>
          %214 = llvm.extractelement %198[%15 : i32] : vector<1xf32>
          %215 = llvm.extractelement %203[%15 : i32] : vector<1xf32>
          %216 = llvm.extractelement %208[%15 : i32] : vector<1xf32>
          %217 = llvm.insertelement %209, %41[%15 : i32] : vector<8xf32>
          %218 = llvm.insertelement %210, %217[%14 : i32] : vector<8xf32>
          %219 = llvm.insertelement %211, %218[%13 : i32] : vector<8xf32>
          %220 = llvm.insertelement %212, %219[%12 : i32] : vector<8xf32>
          %221 = llvm.insertelement %213, %220[%11 : i32] : vector<8xf32>
          %222 = llvm.insertelement %214, %221[%10 : i32] : vector<8xf32>
          %223 = llvm.insertelement %215, %222[%9 : i32] : vector<8xf32>
          %224 = llvm.insertelement %216, %223[%8 : i32] : vector<8xf32>
          %225 = llvm.extractelement %159[%7 : i64] : vector<8xf32>
          %226 = llvm.insertelement %225, %41[%15 : i32] : vector<8xf32>
          %227 = llvm.shufflevector %226, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %228 = llvm.extractvalue %153[0] : !llvm.array<8 x vector<8xf32>> 
          %229 = llvm.intr.fmuladd(%227, %224, %228) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %230 = llvm.select %94, %229, %228 : vector<8xi1>, vector<8xf32>
          %231 = llvm.extractelement %159[%6 : i64] : vector<8xf32>
          %232 = llvm.insertelement %231, %41[%15 : i32] : vector<8xf32>
          %233 = llvm.shufflevector %232, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %234 = llvm.extractvalue %153[1] : !llvm.array<8 x vector<8xf32>> 
          %235 = llvm.intr.fmuladd(%233, %224, %234) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %236 = llvm.select %96, %235, %234 : vector<8xi1>, vector<8xf32>
          %237 = llvm.extractelement %159[%5 : i64] : vector<8xf32>
          %238 = llvm.insertelement %237, %41[%15 : i32] : vector<8xf32>
          %239 = llvm.shufflevector %238, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %240 = llvm.extractvalue %153[2] : !llvm.array<8 x vector<8xf32>> 
          %241 = llvm.intr.fmuladd(%239, %224, %240) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %242 = llvm.select %98, %241, %240 : vector<8xi1>, vector<8xf32>
          %243 = llvm.extractelement %159[%4 : i64] : vector<8xf32>
          %244 = llvm.insertelement %243, %41[%15 : i32] : vector<8xf32>
          %245 = llvm.shufflevector %244, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %246 = llvm.extractvalue %153[3] : !llvm.array<8 x vector<8xf32>> 
          %247 = llvm.intr.fmuladd(%245, %224, %246) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %248 = llvm.select %100, %247, %246 : vector<8xi1>, vector<8xf32>
          %249 = llvm.extractelement %159[%3 : i64] : vector<8xf32>
          %250 = llvm.insertelement %249, %41[%15 : i32] : vector<8xf32>
          %251 = llvm.shufflevector %250, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %252 = llvm.extractvalue %153[4] : !llvm.array<8 x vector<8xf32>> 
          %253 = llvm.intr.fmuladd(%251, %224, %252) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %254 = llvm.select %102, %253, %252 : vector<8xi1>, vector<8xf32>
          %255 = llvm.extractelement %159[%2 : i64] : vector<8xf32>
          %256 = llvm.insertelement %255, %41[%15 : i32] : vector<8xf32>
          %257 = llvm.shufflevector %256, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %258 = llvm.extractvalue %153[5] : !llvm.array<8 x vector<8xf32>> 
          %259 = llvm.intr.fmuladd(%257, %224, %258) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %260 = llvm.select %104, %259, %258 : vector<8xi1>, vector<8xf32>
          %261 = llvm.extractelement %159[%1 : i64] : vector<8xf32>
          %262 = llvm.insertelement %261, %41[%15 : i32] : vector<8xf32>
          %263 = llvm.shufflevector %262, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %264 = llvm.extractvalue %153[6] : !llvm.array<8 x vector<8xf32>> 
          %265 = llvm.intr.fmuladd(%263, %224, %264) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %266 = llvm.select %106, %265, %264 : vector<8xi1>, vector<8xf32>
          %267 = llvm.extractelement %159[%0 : i64] : vector<8xf32>
          %268 = llvm.insertelement %267, %41[%15 : i32] : vector<8xf32>
          %269 = llvm.shufflevector %268, %41 [0, 0, 0, 0, 0, 0, 0, 0] : vector<8xf32> 
          %270 = llvm.extractvalue %153[7] : !llvm.array<8 x vector<8xf32>> 
          %271 = llvm.intr.fmuladd(%269, %224, %270) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %272 = llvm.select %108, %271, %270 : vector<8xi1>, vector<8xf32>
          %273 = llvm.insertvalue %230, %20[0] : !llvm.array<8 x vector<8xf32>> 
          %274 = llvm.insertvalue %236, %273[1] : !llvm.array<8 x vector<8xf32>> 
          %275 = llvm.insertvalue %242, %274[2] : !llvm.array<8 x vector<8xf32>> 
          %276 = llvm.insertvalue %248, %275[3] : !llvm.array<8 x vector<8xf32>> 
          %277 = llvm.insertvalue %254, %276[4] : !llvm.array<8 x vector<8xf32>> 
          %278 = llvm.insertvalue %260, %277[5] : !llvm.array<8 x vector<8xf32>> 
          %279 = llvm.insertvalue %266, %278[6] : !llvm.array<8 x vector<8xf32>> 
          %280 = llvm.insertvalue %272, %279[7] : !llvm.array<8 x vector<8xf32>> 
          %281 = llvm.add %152, %52 : i32
          llvm.br ^bb5(%281, %280 : i32, !llvm.array<8 x vector<8xf32>>) {loop_annotation = #loop_annotation}
        ^bb12(%282: i32):  // 2 preds: ^bb5, ^bb15
          %283 = llvm.icmp "slt" %282, %92 : i32
          llvm.cond_br %283, ^bb13(%50 : i32), ^bb16
        ^bb13(%284: i32):  // 2 preds: ^bb12, ^bb14
          %285 = llvm.icmp "slt" %284, %54 : i32
          llvm.cond_br %285, ^bb14, ^bb15
        ^bb14:  // pred: ^bb13
          %286 = llvm.mul %282, %54 overflow<nsw, nuw> : i32
          %287 = llvm.add %286, %284 overflow<nsw, nuw> : i32
          %288 = llvm.getelementptr inbounds|nuw %61[%287] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %289 = llvm.load %288 : !llvm.ptr -> f32
          %290 = llvm.getelementptr inbounds|nuw %60[%287] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %289, %290 : f32, !llvm.ptr
          %291 = llvm.add %284, %52 : i32
          llvm.br ^bb13(%291 : i32)
        ^bb15:  // pred: ^bb13
          %292 = llvm.add %282, %52 : i32
          llvm.br ^bb12(%292 : i32)
        ^bb16:  // pred: ^bb12
          %293 = llvm.extractvalue %153[0] : !llvm.array<8 x vector<8xf32>> 
          %294 = llvm.getelementptr %60[%110] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %293, %294, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %295 = llvm.extractvalue %153[1] : !llvm.array<8 x vector<8xf32>> 
          %296 = llvm.getelementptr %60[%113] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %295, %296, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %297 = llvm.extractvalue %153[2] : !llvm.array<8 x vector<8xf32>> 
          %298 = llvm.getelementptr %60[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %297, %298, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %299 = llvm.extractvalue %153[3] : !llvm.array<8 x vector<8xf32>> 
          %300 = llvm.getelementptr %60[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %299, %300, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %301 = llvm.extractvalue %153[4] : !llvm.array<8 x vector<8xf32>> 
          %302 = llvm.getelementptr %60[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %301, %302, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %303 = llvm.extractvalue %153[5] : !llvm.array<8 x vector<8xf32>> 
          %304 = llvm.getelementptr %60[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %303, %304, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %305 = llvm.extractvalue %153[6] : !llvm.array<8 x vector<8xf32>> 
          %306 = llvm.getelementptr %60[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %305, %306, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %307 = llvm.extractvalue %153[7] : !llvm.array<8 x vector<8xf32>> 
          %308 = llvm.getelementptr %60[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %307, %308, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          llvm.br ^bb17(%50 : i32)
        ^bb17(%309: i32):  // 2 preds: ^bb16, ^bb20
          %310 = llvm.icmp "slt" %309, %92 : i32
          llvm.cond_br %310, ^bb18(%50 : i32), ^bb21(%50 : i32)
        ^bb18(%311: i32):  // 2 preds: ^bb17, ^bb19
          %312 = llvm.icmp "slt" %311, %54 : i32
          llvm.cond_br %312, ^bb19, ^bb20
        ^bb19:  // pred: ^bb18
          %313 = llvm.mul %309, %54 overflow<nsw, nuw> : i32
          %314 = llvm.add %313, %311 overflow<nsw, nuw> : i32
          %315 = llvm.getelementptr inbounds|nuw %61[%314] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %316 = llvm.load %315 : !llvm.ptr -> f32
          %317 = llvm.getelementptr inbounds|nuw %59[%314] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %316, %317 : f32, !llvm.ptr
          %318 = llvm.add %311, %52 : i32
          llvm.br ^bb18(%318 : i32)
        ^bb20:  // pred: ^bb18
          %319 = llvm.add %309, %52 : i32
          llvm.br ^bb17(%319 : i32)
        ^bb21(%320: i32):  // 2 preds: ^bb17, ^bb24
          %321 = llvm.icmp "slt" %320, %92 : i32
          llvm.cond_br %321, ^bb22(%50 : i32), ^bb25
        ^bb22(%322: i32):  // 2 preds: ^bb21, ^bb23
          %323 = llvm.icmp "slt" %322, %54 : i32
          llvm.cond_br %323, ^bb23, ^bb24
        ^bb23:  // pred: ^bb22
          %324 = llvm.mul %320, %54 overflow<nsw, nuw> : i32
          %325 = llvm.add %324, %322 overflow<nsw, nuw> : i32
          %326 = llvm.getelementptr inbounds|nuw %60[%325] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %327 = llvm.load %326 : !llvm.ptr -> f32
          %328 = llvm.getelementptr inbounds|nuw %59[%325] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.store %327, %328 : f32, !llvm.ptr
          %329 = llvm.add %322, %52 : i32
          llvm.br ^bb22(%329 : i32)
        ^bb24:  // pred: ^bb22
          %330 = llvm.add %320, %52 : i32
          llvm.br ^bb21(%330 : i32)
        ^bb25:  // pred: ^bb21
          %331 = llvm.getelementptr %59[%110] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %332 = llvm.intr.masked.load %331, %94, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %333 = llvm.getelementptr %59[%113] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %334 = llvm.intr.masked.load %333, %96, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %335 = llvm.getelementptr %59[%116] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %336 = llvm.intr.masked.load %335, %98, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %337 = llvm.getelementptr %59[%119] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %338 = llvm.intr.masked.load %337, %100, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %339 = llvm.getelementptr %59[%122] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %340 = llvm.intr.masked.load %339, %102, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %341 = llvm.getelementptr %59[%125] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %342 = llvm.intr.masked.load %341, %104, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %343 = llvm.getelementptr %59[%128] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %344 = llvm.intr.masked.load %343, %106, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %345 = llvm.getelementptr %59[%131] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %346 = llvm.intr.masked.load %345, %108, %41 {alignment = 4 : i32} : (!llvm.ptr, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
          %347 = llvm.getelementptr %75[%134] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          %348 = llvm.load %347 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
          %349 = llvm.fadd %332, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %350 = llvm.fadd %334, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %351 = llvm.fadd %336, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %352 = llvm.fadd %338, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %353 = llvm.fadd %340, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %354 = llvm.fadd %342, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %355 = llvm.fadd %344, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %356 = llvm.fadd %346, %348 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %357 = llvm.fmul %349, %349 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %358 = llvm.fmul %350, %350 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %359 = llvm.fmul %351, %351 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %360 = llvm.fmul %352, %352 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %361 = llvm.fmul %353, %353 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %362 = llvm.fmul %354, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %363 = llvm.fmul %355, %355 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %364 = llvm.fmul %356, %356 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %365 = llvm.fmul %357, %349 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %366 = llvm.fmul %358, %350 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %367 = llvm.fmul %359, %351 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %368 = llvm.fmul %360, %352 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %369 = llvm.fmul %361, %353 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %370 = llvm.fmul %362, %354 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %371 = llvm.fmul %363, %355 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %372 = llvm.fmul %364, %356 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %373 = llvm.extractvalue %55[0] : !llvm.array<8 x vector<8xf32>> 
          %374 = llvm.fmul %365, %373 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %375 = llvm.extractvalue %55[1] : !llvm.array<8 x vector<8xf32>> 
          %376 = llvm.fmul %366, %375 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %377 = llvm.extractvalue %55[2] : !llvm.array<8 x vector<8xf32>> 
          %378 = llvm.fmul %367, %377 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %379 = llvm.extractvalue %55[3] : !llvm.array<8 x vector<8xf32>> 
          %380 = llvm.fmul %368, %379 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %381 = llvm.extractvalue %55[4] : !llvm.array<8 x vector<8xf32>> 
          %382 = llvm.fmul %369, %381 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %383 = llvm.extractvalue %55[5] : !llvm.array<8 x vector<8xf32>> 
          %384 = llvm.fmul %370, %383 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %385 = llvm.extractvalue %55[6] : !llvm.array<8 x vector<8xf32>> 
          %386 = llvm.fmul %371, %385 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %387 = llvm.extractvalue %55[7] : !llvm.array<8 x vector<8xf32>> 
          %388 = llvm.fmul %372, %387 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %389 = llvm.fadd %349, %374 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %390 = llvm.fadd %350, %376 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %391 = llvm.fadd %351, %378 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %392 = llvm.fadd %352, %380 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %393 = llvm.fadd %353, %382 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %394 = llvm.fadd %354, %384 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %395 = llvm.fadd %355, %386 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %396 = llvm.fadd %356, %388 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %397 = llvm.extractvalue %56[0] : !llvm.array<8 x vector<8xf32>> 
          %398 = llvm.fmul %389, %397 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %399 = llvm.extractvalue %56[1] : !llvm.array<8 x vector<8xf32>> 
          %400 = llvm.fmul %390, %399 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %401 = llvm.extractvalue %56[2] : !llvm.array<8 x vector<8xf32>> 
          %402 = llvm.fmul %391, %401 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %403 = llvm.extractvalue %56[3] : !llvm.array<8 x vector<8xf32>> 
          %404 = llvm.fmul %392, %403 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %405 = llvm.extractvalue %56[4] : !llvm.array<8 x vector<8xf32>> 
          %406 = llvm.fmul %393, %405 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %407 = llvm.extractvalue %56[5] : !llvm.array<8 x vector<8xf32>> 
          %408 = llvm.fmul %394, %407 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %409 = llvm.extractvalue %56[6] : !llvm.array<8 x vector<8xf32>> 
          %410 = llvm.fmul %395, %409 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %411 = llvm.extractvalue %56[7] : !llvm.array<8 x vector<8xf32>> 
          %412 = llvm.fmul %396, %411 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %413 = llvm.extractvalue %35[0] : !llvm.array<8 x vector<8xf32>> 
          %414 = llvm.fcmp "ult" %398, %413 : vector<8xf32>
          %415 = llvm.extractvalue %35[1] : !llvm.array<8 x vector<8xf32>> 
          %416 = llvm.fcmp "ult" %400, %415 : vector<8xf32>
          %417 = llvm.extractvalue %35[2] : !llvm.array<8 x vector<8xf32>> 
          %418 = llvm.fcmp "ult" %402, %417 : vector<8xf32>
          %419 = llvm.extractvalue %35[3] : !llvm.array<8 x vector<8xf32>> 
          %420 = llvm.fcmp "ult" %404, %419 : vector<8xf32>
          %421 = llvm.extractvalue %35[4] : !llvm.array<8 x vector<8xf32>> 
          %422 = llvm.fcmp "ult" %406, %421 : vector<8xf32>
          %423 = llvm.extractvalue %35[5] : !llvm.array<8 x vector<8xf32>> 
          %424 = llvm.fcmp "ult" %408, %423 : vector<8xf32>
          %425 = llvm.extractvalue %35[6] : !llvm.array<8 x vector<8xf32>> 
          %426 = llvm.fcmp "ult" %410, %425 : vector<8xf32>
          %427 = llvm.extractvalue %35[7] : !llvm.array<8 x vector<8xf32>> 
          %428 = llvm.fcmp "ult" %412, %427 : vector<8xf32>
          %429 = llvm.select %414, %398, %413 : vector<8xi1>, vector<8xf32>
          %430 = llvm.select %416, %400, %415 : vector<8xi1>, vector<8xf32>
          %431 = llvm.select %418, %402, %417 : vector<8xi1>, vector<8xf32>
          %432 = llvm.select %420, %404, %419 : vector<8xi1>, vector<8xf32>
          %433 = llvm.select %422, %406, %421 : vector<8xi1>, vector<8xf32>
          %434 = llvm.select %424, %408, %423 : vector<8xi1>, vector<8xf32>
          %435 = llvm.select %426, %410, %425 : vector<8xi1>, vector<8xf32>
          %436 = llvm.select %428, %412, %427 : vector<8xi1>, vector<8xf32>
          %437 = llvm.extractvalue %36[0] : !llvm.array<8 x vector<8xf32>> 
          %438 = llvm.fcmp "ugt" %429, %437 : vector<8xf32>
          %439 = llvm.extractvalue %36[1] : !llvm.array<8 x vector<8xf32>> 
          %440 = llvm.fcmp "ugt" %430, %439 : vector<8xf32>
          %441 = llvm.extractvalue %36[2] : !llvm.array<8 x vector<8xf32>> 
          %442 = llvm.fcmp "ugt" %431, %441 : vector<8xf32>
          %443 = llvm.extractvalue %36[3] : !llvm.array<8 x vector<8xf32>> 
          %444 = llvm.fcmp "ugt" %432, %443 : vector<8xf32>
          %445 = llvm.extractvalue %36[4] : !llvm.array<8 x vector<8xf32>> 
          %446 = llvm.fcmp "ugt" %433, %445 : vector<8xf32>
          %447 = llvm.extractvalue %36[5] : !llvm.array<8 x vector<8xf32>> 
          %448 = llvm.fcmp "ugt" %434, %447 : vector<8xf32>
          %449 = llvm.extractvalue %36[6] : !llvm.array<8 x vector<8xf32>> 
          %450 = llvm.fcmp "ugt" %435, %449 : vector<8xf32>
          %451 = llvm.extractvalue %36[7] : !llvm.array<8 x vector<8xf32>> 
          %452 = llvm.fcmp "ugt" %436, %451 : vector<8xf32>
          %453 = llvm.select %438, %429, %437 : vector<8xi1>, vector<8xf32>
          %454 = llvm.select %440, %430, %439 : vector<8xi1>, vector<8xf32>
          %455 = llvm.select %442, %431, %441 : vector<8xi1>, vector<8xf32>
          %456 = llvm.select %444, %432, %443 : vector<8xi1>, vector<8xf32>
          %457 = llvm.select %446, %433, %445 : vector<8xi1>, vector<8xf32>
          %458 = llvm.select %448, %434, %447 : vector<8xi1>, vector<8xf32>
          %459 = llvm.select %450, %435, %449 : vector<8xi1>, vector<8xf32>
          %460 = llvm.select %452, %436, %451 : vector<8xi1>, vector<8xf32>
          %461 = llvm.intr.fabs(%398) : (vector<8xf32>) -> vector<8xf32>
          %462 = llvm.intr.fabs(%400) : (vector<8xf32>) -> vector<8xf32>
          %463 = llvm.intr.fabs(%402) : (vector<8xf32>) -> vector<8xf32>
          %464 = llvm.intr.fabs(%404) : (vector<8xf32>) -> vector<8xf32>
          %465 = llvm.intr.fabs(%406) : (vector<8xf32>) -> vector<8xf32>
          %466 = llvm.intr.fabs(%408) : (vector<8xf32>) -> vector<8xf32>
          %467 = llvm.intr.fabs(%410) : (vector<8xf32>) -> vector<8xf32>
          %468 = llvm.intr.fabs(%412) : (vector<8xf32>) -> vector<8xf32>
          %469 = llvm.extractvalue %34[0] : !llvm.array<8 x vector<8xf32>> 
          %470 = llvm.fcmp "olt" %461, %469 : vector<8xf32>
          %471 = llvm.extractvalue %34[1] : !llvm.array<8 x vector<8xf32>> 
          %472 = llvm.fcmp "olt" %462, %471 : vector<8xf32>
          %473 = llvm.extractvalue %34[2] : !llvm.array<8 x vector<8xf32>> 
          %474 = llvm.fcmp "olt" %463, %473 : vector<8xf32>
          %475 = llvm.extractvalue %34[3] : !llvm.array<8 x vector<8xf32>> 
          %476 = llvm.fcmp "olt" %464, %475 : vector<8xf32>
          %477 = llvm.extractvalue %34[4] : !llvm.array<8 x vector<8xf32>> 
          %478 = llvm.fcmp "olt" %465, %477 : vector<8xf32>
          %479 = llvm.extractvalue %34[5] : !llvm.array<8 x vector<8xf32>> 
          %480 = llvm.fcmp "olt" %466, %479 : vector<8xf32>
          %481 = llvm.extractvalue %34[6] : !llvm.array<8 x vector<8xf32>> 
          %482 = llvm.fcmp "olt" %467, %481 : vector<8xf32>
          %483 = llvm.extractvalue %34[7] : !llvm.array<8 x vector<8xf32>> 
          %484 = llvm.fcmp "olt" %468, %483 : vector<8xf32>
          %485 = llvm.fmul %453, %453 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %486 = llvm.fmul %454, %454 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %487 = llvm.fmul %455, %455 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %488 = llvm.fmul %456, %456 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %489 = llvm.fmul %457, %457 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %490 = llvm.fmul %458, %458 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %491 = llvm.fmul %459, %459 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %492 = llvm.fmul %460, %460 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %493 = llvm.extractvalue %27[0] : !llvm.array<8 x vector<8xf32>> 
          %494 = llvm.extractvalue %28[0] : !llvm.array<8 x vector<8xf32>> 
          %495 = llvm.intr.fma(%485, %493, %494) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %496 = llvm.extractvalue %27[1] : !llvm.array<8 x vector<8xf32>> 
          %497 = llvm.extractvalue %28[1] : !llvm.array<8 x vector<8xf32>> 
          %498 = llvm.intr.fma(%486, %496, %497) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %499 = llvm.extractvalue %27[2] : !llvm.array<8 x vector<8xf32>> 
          %500 = llvm.extractvalue %28[2] : !llvm.array<8 x vector<8xf32>> 
          %501 = llvm.intr.fma(%487, %499, %500) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %502 = llvm.extractvalue %27[3] : !llvm.array<8 x vector<8xf32>> 
          %503 = llvm.extractvalue %28[3] : !llvm.array<8 x vector<8xf32>> 
          %504 = llvm.intr.fma(%488, %502, %503) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %505 = llvm.extractvalue %27[4] : !llvm.array<8 x vector<8xf32>> 
          %506 = llvm.extractvalue %28[4] : !llvm.array<8 x vector<8xf32>> 
          %507 = llvm.intr.fma(%489, %505, %506) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %508 = llvm.extractvalue %27[5] : !llvm.array<8 x vector<8xf32>> 
          %509 = llvm.extractvalue %28[5] : !llvm.array<8 x vector<8xf32>> 
          %510 = llvm.intr.fma(%490, %508, %509) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %511 = llvm.extractvalue %27[6] : !llvm.array<8 x vector<8xf32>> 
          %512 = llvm.extractvalue %28[6] : !llvm.array<8 x vector<8xf32>> 
          %513 = llvm.intr.fma(%491, %511, %512) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %514 = llvm.extractvalue %27[7] : !llvm.array<8 x vector<8xf32>> 
          %515 = llvm.extractvalue %28[7] : !llvm.array<8 x vector<8xf32>> 
          %516 = llvm.intr.fma(%492, %514, %515) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %517 = llvm.extractvalue %29[0] : !llvm.array<8 x vector<8xf32>> 
          %518 = llvm.intr.fma(%485, %495, %517) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %519 = llvm.extractvalue %29[1] : !llvm.array<8 x vector<8xf32>> 
          %520 = llvm.intr.fma(%486, %498, %519) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %521 = llvm.extractvalue %29[2] : !llvm.array<8 x vector<8xf32>> 
          %522 = llvm.intr.fma(%487, %501, %521) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %523 = llvm.extractvalue %29[3] : !llvm.array<8 x vector<8xf32>> 
          %524 = llvm.intr.fma(%488, %504, %523) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %525 = llvm.extractvalue %29[4] : !llvm.array<8 x vector<8xf32>> 
          %526 = llvm.intr.fma(%489, %507, %525) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %527 = llvm.extractvalue %29[5] : !llvm.array<8 x vector<8xf32>> 
          %528 = llvm.intr.fma(%490, %510, %527) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %529 = llvm.extractvalue %29[6] : !llvm.array<8 x vector<8xf32>> 
          %530 = llvm.intr.fma(%491, %513, %529) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %531 = llvm.extractvalue %29[7] : !llvm.array<8 x vector<8xf32>> 
          %532 = llvm.intr.fma(%492, %516, %531) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %533 = llvm.extractvalue %30[0] : !llvm.array<8 x vector<8xf32>> 
          %534 = llvm.intr.fma(%485, %518, %533) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %535 = llvm.extractvalue %30[1] : !llvm.array<8 x vector<8xf32>> 
          %536 = llvm.intr.fma(%486, %520, %535) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %537 = llvm.extractvalue %30[2] : !llvm.array<8 x vector<8xf32>> 
          %538 = llvm.intr.fma(%487, %522, %537) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %539 = llvm.extractvalue %30[3] : !llvm.array<8 x vector<8xf32>> 
          %540 = llvm.intr.fma(%488, %524, %539) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %541 = llvm.extractvalue %30[4] : !llvm.array<8 x vector<8xf32>> 
          %542 = llvm.intr.fma(%489, %526, %541) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %543 = llvm.extractvalue %30[5] : !llvm.array<8 x vector<8xf32>> 
          %544 = llvm.intr.fma(%490, %528, %543) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %545 = llvm.extractvalue %30[6] : !llvm.array<8 x vector<8xf32>> 
          %546 = llvm.intr.fma(%491, %530, %545) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %547 = llvm.extractvalue %30[7] : !llvm.array<8 x vector<8xf32>> 
          %548 = llvm.intr.fma(%492, %532, %547) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %549 = llvm.extractvalue %31[0] : !llvm.array<8 x vector<8xf32>> 
          %550 = llvm.intr.fma(%485, %534, %549) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %551 = llvm.extractvalue %31[1] : !llvm.array<8 x vector<8xf32>> 
          %552 = llvm.intr.fma(%486, %536, %551) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %553 = llvm.extractvalue %31[2] : !llvm.array<8 x vector<8xf32>> 
          %554 = llvm.intr.fma(%487, %538, %553) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %555 = llvm.extractvalue %31[3] : !llvm.array<8 x vector<8xf32>> 
          %556 = llvm.intr.fma(%488, %540, %555) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %557 = llvm.extractvalue %31[4] : !llvm.array<8 x vector<8xf32>> 
          %558 = llvm.intr.fma(%489, %542, %557) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %559 = llvm.extractvalue %31[5] : !llvm.array<8 x vector<8xf32>> 
          %560 = llvm.intr.fma(%490, %544, %559) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %561 = llvm.extractvalue %31[6] : !llvm.array<8 x vector<8xf32>> 
          %562 = llvm.intr.fma(%491, %546, %561) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %563 = llvm.extractvalue %31[7] : !llvm.array<8 x vector<8xf32>> 
          %564 = llvm.intr.fma(%492, %548, %563) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %565 = llvm.extractvalue %32[0] : !llvm.array<8 x vector<8xf32>> 
          %566 = llvm.intr.fma(%485, %550, %565) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %567 = llvm.extractvalue %32[1] : !llvm.array<8 x vector<8xf32>> 
          %568 = llvm.intr.fma(%486, %552, %567) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %569 = llvm.extractvalue %32[2] : !llvm.array<8 x vector<8xf32>> 
          %570 = llvm.intr.fma(%487, %554, %569) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %571 = llvm.extractvalue %32[3] : !llvm.array<8 x vector<8xf32>> 
          %572 = llvm.intr.fma(%488, %556, %571) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %573 = llvm.extractvalue %32[4] : !llvm.array<8 x vector<8xf32>> 
          %574 = llvm.intr.fma(%489, %558, %573) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %575 = llvm.extractvalue %32[5] : !llvm.array<8 x vector<8xf32>> 
          %576 = llvm.intr.fma(%490, %560, %575) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %577 = llvm.extractvalue %32[6] : !llvm.array<8 x vector<8xf32>> 
          %578 = llvm.intr.fma(%491, %562, %577) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %579 = llvm.extractvalue %32[7] : !llvm.array<8 x vector<8xf32>> 
          %580 = llvm.intr.fma(%492, %564, %579) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %581 = llvm.extractvalue %33[0] : !llvm.array<8 x vector<8xf32>> 
          %582 = llvm.intr.fma(%485, %566, %581) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %583 = llvm.extractvalue %33[1] : !llvm.array<8 x vector<8xf32>> 
          %584 = llvm.intr.fma(%486, %568, %583) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %585 = llvm.extractvalue %33[2] : !llvm.array<8 x vector<8xf32>> 
          %586 = llvm.intr.fma(%487, %570, %585) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %587 = llvm.extractvalue %33[3] : !llvm.array<8 x vector<8xf32>> 
          %588 = llvm.intr.fma(%488, %572, %587) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %589 = llvm.extractvalue %33[4] : !llvm.array<8 x vector<8xf32>> 
          %590 = llvm.intr.fma(%489, %574, %589) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %591 = llvm.extractvalue %33[5] : !llvm.array<8 x vector<8xf32>> 
          %592 = llvm.intr.fma(%490, %576, %591) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %593 = llvm.extractvalue %33[6] : !llvm.array<8 x vector<8xf32>> 
          %594 = llvm.intr.fma(%491, %578, %593) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %595 = llvm.extractvalue %33[7] : !llvm.array<8 x vector<8xf32>> 
          %596 = llvm.intr.fma(%492, %580, %595) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %597 = llvm.fmul %453, %582 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %598 = llvm.fmul %454, %584 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %599 = llvm.fmul %455, %586 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %600 = llvm.fmul %456, %588 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %601 = llvm.fmul %457, %590 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %602 = llvm.fmul %458, %592 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %603 = llvm.fmul %459, %594 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %604 = llvm.fmul %460, %596 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %605 = llvm.extractvalue %23[0] : !llvm.array<8 x vector<8xf32>> 
          %606 = llvm.extractvalue %24[0] : !llvm.array<8 x vector<8xf32>> 
          %607 = llvm.intr.fma(%485, %605, %606) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %608 = llvm.extractvalue %23[1] : !llvm.array<8 x vector<8xf32>> 
          %609 = llvm.extractvalue %24[1] : !llvm.array<8 x vector<8xf32>> 
          %610 = llvm.intr.fma(%486, %608, %609) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %611 = llvm.extractvalue %23[2] : !llvm.array<8 x vector<8xf32>> 
          %612 = llvm.extractvalue %24[2] : !llvm.array<8 x vector<8xf32>> 
          %613 = llvm.intr.fma(%487, %611, %612) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %614 = llvm.extractvalue %23[3] : !llvm.array<8 x vector<8xf32>> 
          %615 = llvm.extractvalue %24[3] : !llvm.array<8 x vector<8xf32>> 
          %616 = llvm.intr.fma(%488, %614, %615) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %617 = llvm.extractvalue %23[4] : !llvm.array<8 x vector<8xf32>> 
          %618 = llvm.extractvalue %24[4] : !llvm.array<8 x vector<8xf32>> 
          %619 = llvm.intr.fma(%489, %617, %618) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %620 = llvm.extractvalue %23[5] : !llvm.array<8 x vector<8xf32>> 
          %621 = llvm.extractvalue %24[5] : !llvm.array<8 x vector<8xf32>> 
          %622 = llvm.intr.fma(%490, %620, %621) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %623 = llvm.extractvalue %23[6] : !llvm.array<8 x vector<8xf32>> 
          %624 = llvm.extractvalue %24[6] : !llvm.array<8 x vector<8xf32>> 
          %625 = llvm.intr.fma(%491, %623, %624) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %626 = llvm.extractvalue %23[7] : !llvm.array<8 x vector<8xf32>> 
          %627 = llvm.extractvalue %24[7] : !llvm.array<8 x vector<8xf32>> 
          %628 = llvm.intr.fma(%492, %626, %627) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %629 = llvm.extractvalue %25[0] : !llvm.array<8 x vector<8xf32>> 
          %630 = llvm.intr.fma(%485, %607, %629) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %631 = llvm.extractvalue %25[1] : !llvm.array<8 x vector<8xf32>> 
          %632 = llvm.intr.fma(%486, %610, %631) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %633 = llvm.extractvalue %25[2] : !llvm.array<8 x vector<8xf32>> 
          %634 = llvm.intr.fma(%487, %613, %633) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %635 = llvm.extractvalue %25[3] : !llvm.array<8 x vector<8xf32>> 
          %636 = llvm.intr.fma(%488, %616, %635) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %637 = llvm.extractvalue %25[4] : !llvm.array<8 x vector<8xf32>> 
          %638 = llvm.intr.fma(%489, %619, %637) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %639 = llvm.extractvalue %25[5] : !llvm.array<8 x vector<8xf32>> 
          %640 = llvm.intr.fma(%490, %622, %639) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %641 = llvm.extractvalue %25[6] : !llvm.array<8 x vector<8xf32>> 
          %642 = llvm.intr.fma(%491, %625, %641) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %643 = llvm.extractvalue %25[7] : !llvm.array<8 x vector<8xf32>> 
          %644 = llvm.intr.fma(%492, %628, %643) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %645 = llvm.extractvalue %26[0] : !llvm.array<8 x vector<8xf32>> 
          %646 = llvm.intr.fma(%485, %630, %645) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %647 = llvm.extractvalue %26[1] : !llvm.array<8 x vector<8xf32>> 
          %648 = llvm.intr.fma(%486, %632, %647) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %649 = llvm.extractvalue %26[2] : !llvm.array<8 x vector<8xf32>> 
          %650 = llvm.intr.fma(%487, %634, %649) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %651 = llvm.extractvalue %26[3] : !llvm.array<8 x vector<8xf32>> 
          %652 = llvm.intr.fma(%488, %636, %651) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %653 = llvm.extractvalue %26[4] : !llvm.array<8 x vector<8xf32>> 
          %654 = llvm.intr.fma(%489, %638, %653) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %655 = llvm.extractvalue %26[5] : !llvm.array<8 x vector<8xf32>> 
          %656 = llvm.intr.fma(%490, %640, %655) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %657 = llvm.extractvalue %26[6] : !llvm.array<8 x vector<8xf32>> 
          %658 = llvm.intr.fma(%491, %642, %657) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %659 = llvm.extractvalue %26[7] : !llvm.array<8 x vector<8xf32>> 
          %660 = llvm.intr.fma(%492, %644, %659) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
          %661 = llvm.fdiv %597, %646 : vector<8xf32>
          %662 = llvm.fdiv %598, %648 : vector<8xf32>
          %663 = llvm.fdiv %599, %650 : vector<8xf32>
          %664 = llvm.fdiv %600, %652 : vector<8xf32>
          %665 = llvm.fdiv %601, %654 : vector<8xf32>
          %666 = llvm.fdiv %602, %656 : vector<8xf32>
          %667 = llvm.fdiv %603, %658 : vector<8xf32>
          %668 = llvm.fdiv %604, %660 : vector<8xf32>
          %669 = llvm.select %470, %453, %661 : vector<8xi1>, vector<8xf32>
          %670 = llvm.select %472, %454, %662 : vector<8xi1>, vector<8xf32>
          %671 = llvm.select %474, %455, %663 : vector<8xi1>, vector<8xf32>
          %672 = llvm.select %476, %456, %664 : vector<8xi1>, vector<8xf32>
          %673 = llvm.select %478, %457, %665 : vector<8xi1>, vector<8xf32>
          %674 = llvm.select %480, %458, %666 : vector<8xi1>, vector<8xf32>
          %675 = llvm.select %482, %459, %667 : vector<8xi1>, vector<8xf32>
          %676 = llvm.select %484, %460, %668 : vector<8xi1>, vector<8xf32>
          %677 = llvm.extractvalue %57[0] : !llvm.array<8 x vector<8xf32>> 
          %678 = llvm.fadd %669, %677 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %679 = llvm.extractvalue %57[1] : !llvm.array<8 x vector<8xf32>> 
          %680 = llvm.fadd %670, %679 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %681 = llvm.extractvalue %57[2] : !llvm.array<8 x vector<8xf32>> 
          %682 = llvm.fadd %671, %681 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %683 = llvm.extractvalue %57[3] : !llvm.array<8 x vector<8xf32>> 
          %684 = llvm.fadd %672, %683 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %685 = llvm.extractvalue %57[4] : !llvm.array<8 x vector<8xf32>> 
          %686 = llvm.fadd %673, %685 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %687 = llvm.extractvalue %57[5] : !llvm.array<8 x vector<8xf32>> 
          %688 = llvm.fadd %674, %687 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %689 = llvm.extractvalue %57[6] : !llvm.array<8 x vector<8xf32>> 
          %690 = llvm.fadd %675, %689 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %691 = llvm.extractvalue %57[7] : !llvm.array<8 x vector<8xf32>> 
          %692 = llvm.fadd %676, %691 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %693 = llvm.extractvalue %58[0] : !llvm.array<8 x vector<8xf32>> 
          %694 = llvm.fmul %349, %693 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %695 = llvm.extractvalue %58[1] : !llvm.array<8 x vector<8xf32>> 
          %696 = llvm.fmul %350, %695 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %697 = llvm.extractvalue %58[2] : !llvm.array<8 x vector<8xf32>> 
          %698 = llvm.fmul %351, %697 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %699 = llvm.extractvalue %58[3] : !llvm.array<8 x vector<8xf32>> 
          %700 = llvm.fmul %352, %699 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %701 = llvm.extractvalue %58[4] : !llvm.array<8 x vector<8xf32>> 
          %702 = llvm.fmul %353, %701 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %703 = llvm.extractvalue %58[5] : !llvm.array<8 x vector<8xf32>> 
          %704 = llvm.fmul %354, %703 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %705 = llvm.extractvalue %58[6] : !llvm.array<8 x vector<8xf32>> 
          %706 = llvm.fmul %355, %705 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %707 = llvm.extractvalue %58[7] : !llvm.array<8 x vector<8xf32>> 
          %708 = llvm.fmul %356, %707 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %709 = llvm.fmul %694, %678 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %710 = llvm.fmul %696, %680 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %711 = llvm.fmul %698, %682 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %712 = llvm.fmul %700, %684 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %713 = llvm.fmul %702, %686 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %714 = llvm.fmul %704, %688 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %715 = llvm.fmul %706, %690 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %716 = llvm.fmul %708, %692 {fastmathFlags = #llvm.fastmath<contract>} : vector<8xf32>
          %717 = llvm.mul %133, %53 : i32
          %718 = llvm.add %717, %134 : i32
          %719 = llvm.getelementptr %79[%718] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %709, %719, %94 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %720 = llvm.add %133, %52 : i32
          %721 = llvm.mul %720, %53 : i32
          %722 = llvm.add %721, %134 : i32
          %723 = llvm.getelementptr %79[%722] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %710, %723, %96 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %724 = llvm.add %133, %47 : i32
          %725 = llvm.mul %724, %53 : i32
          %726 = llvm.add %725, %134 : i32
          %727 = llvm.getelementptr %79[%726] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %711, %727, %98 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %728 = llvm.add %133, %46 : i32
          %729 = llvm.mul %728, %53 : i32
          %730 = llvm.add %729, %134 : i32
          %731 = llvm.getelementptr %79[%730] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %712, %731, %100 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %732 = llvm.add %133, %45 : i32
          %733 = llvm.mul %732, %53 : i32
          %734 = llvm.add %733, %134 : i32
          %735 = llvm.getelementptr %79[%734] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %713, %735, %102 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %736 = llvm.add %133, %44 : i32
          %737 = llvm.mul %736, %53 : i32
          %738 = llvm.add %737, %134 : i32
          %739 = llvm.getelementptr %79[%738] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %714, %739, %104 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %740 = llvm.add %133, %43 : i32
          %741 = llvm.mul %740, %53 : i32
          %742 = llvm.add %741, %134 : i32
          %743 = llvm.getelementptr %79[%742] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %715, %743, %106 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %744 = llvm.add %133, %42 : i32
          %745 = llvm.mul %744, %53 : i32
          %746 = llvm.add %745, %134 : i32
          %747 = llvm.getelementptr %79[%746] : (!llvm.ptr, i32) -> !llvm.ptr, f32
          llvm.intr.masked.store %716, %747, %108 {alignment = 4 : i32} : vector<8xf32>, vector<8xi1> into !llvm.ptr
          %748 = llvm.add %134, %54 : i32
          llvm.br ^bb3(%748 : i32) {loop_annotation = #loop_annotation}
        ^bb26:  // pred: ^bb3
          %749 = llvm.add %88, %54 : i32
          llvm.br ^bb1(%749 : i32) {loop_annotation = #loop_annotation}
        ^bb27:  // 2 preds: ^bb0, ^bb1
          llvm.return %15 : i32
        }
      }
    }
  }
  util.func private @__main_memoize_apply(%arg0: !hal.device, %arg1: i64, %arg2: !hal.buffer) -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2176 = arith.constant 2176 : index
    %c8448 = arith.constant 8448 : index
    %c4352 = arith.constant 4352 : index
    %cmd = hal.command_buffer.create device(%arg0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%arg1) bindings(%c2) : !hal.command_buffer
    %__device_1_executable_0_main_dispatch_0 = util.global.load @__device_1_executable_0_main_dispatch_0 : !hal.executable
    %c0_0 = arith.constant 0 : index
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_0_main_dispatch_0 : !hal.executable)[%c0_0] workgroups([%c2, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%arg2 : !hal.buffer)[%c0, %c8448], 
      (%c1 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !hal.buffer
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %0 = util.call @__main_memoize_apply(%__device_1, %c-1_i64, %__hoisted_tensor_64xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1 : !hal.command_buffer
    util.return
  }
  util.func private @__main_memoize_lookup(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
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
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %c0 = arith.constant 0 : index
    %c4352 = arith.constant 4352 : index
    %c2176 = arith.constant 2176 : index
    %c32 = arith.constant 32 : index
    %c17 = arith.constant 17 : index
    %c-1_i64 = arith.constant -1 : i64
    %0 = util.null : !hal.fence
    %c0_i64 = arith.constant 0 : i64
    %c-1_i32 = arith.constant -1 : i32
    %c64 = arith.constant 64 : index
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
    %buffer = hal.buffer_view.buffer<%arg0 : !hal.buffer_view> : !hal.buffer
    %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
    hal.buffer.assert<%buffer : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c2176) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage")
    %memory_types, %buffer_usage = hal.allocator.resolve_memory_properties for(#hal.device.affinity<@__device_1>) lifetime(external) : i32, i32
    %fence = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) pool(%c0_i64) type(%memory_types) usage(%buffer_usage) flags("None") : !hal.buffer{%c4352}
    %1 = util.call @__main_memoize_lookup(%__device_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
    %fence_0 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence) signal(%fence_0) commands(%1) bindings([
      (%buffer : !hal.buffer)[%c0, %c2176], 
      (%transient_buffer : !hal.buffer)[%c0, %c4352]
    ]) flags("None")
    %status = hal.fence.await until([%fence_0]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    %view = hal.buffer_view.create buffer(%transient_buffer : !hal.buffer)[%c0, %c4352] shape([%c17, %c64]) type(%element_type_f32) encoding(%dense_row_major) : !hal.buffer_view
    util.return %view : !hal.buffer_view
  }
}

{-#

#-}


