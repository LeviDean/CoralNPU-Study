#composite_of_8448b = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
module attributes {stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>, vm.toplevel} {
  vm.module public @module {
    vm.global.ref private @__device_0 : !vm.ref<!hal.device>
    vm.global.ref private @__device_1 : !vm.ref<!hal.device>
    vm.global.ref private @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
    vm.global.ref private @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
    vm.global.ref private @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
    vm.rodata private @_const {alignment = 64 : i64} #composite_of_8448b
    vm.rodata private @_utf8_hal_device_id_C6650FF277232B5A {alignment = 1 : i64} "hal.device.id"
    vm.rodata private @_utf8_local_1A8FF0278D7661D8 {alignment = 1 : i64} "local*"
    vm.rodata private @_utf8_hal_executable_format_E03EECB63A2AAF52 {alignment = 1 : i64} "hal.executable.format"
    vm.rodata private @_utf8_embedded_elf_x86_64_FF16E34B4A5F9C83 {alignment = 1 : i64} "embedded-elf-x86_64"
    vm.rodata private @_utf8_coralnpu_87A7D9FDC197986D {alignment = 1 : i64} "coralnpu"
    vm.rodata private @_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF {alignment = 1 : i64} "embedded-elf-riscv_32"
    vm.rodata private @main_dispatch_0_embedded_elf_riscv_32 {alignment = 16 : i64, mime_type = "application/x-elf"} dense_resource<__elided__> : vector<13796xi8>
    vm.initializer {
      %null = vm.const.ref.zero : !vm.buffer
      %c1 = vm.const.i32 1
      %null_0 = vm.const.ref.zero : !vm.ref<!hal.device>
      %c1_1 = vm.const.i64 1
      %c18 = vm.const.i32 18
      %c-1 = vm.const.i64 -1
      %c14 = vm.const.i32 14
      %c-1_2 = vm.const.i32 -1
      %zero = vm.const.i32.zero
      %zero_3 = vm.const.i64.zero
      %null_4 = vm.const.ref.zero : !vm.ref<!hal.fence>
      %c48 = vm.const.i32 48
      %c527363 = vm.const.i32 527363
      %c8448 = vm.const.i64 8448
      %_const = vm.const.ref.rodata @_const : !vm.buffer
      %0 = vm.call @hal.devices.count() {nosideeffects} : () -> i32
      %1 = vm.ext.i32.i64.s %0 : i32 -> i64
      vm.br ^bb1(%zero_3, %zero_3, %null_0 : i64, i64, !vm.ref<!hal.device>)
    ^bb1(%2: i64, %3: i64, %4: !vm.ref<!hal.device>):  // 2 preds: ^bb0, ^bb4
      %rnz = vm.cmp.nz.ref %4 : !vm.ref<!hal.device>
      %5 = vm.xor.i32 %rnz, %c1 : i32
      %slt = vm.cmp.lt.i64.s %2, %1 : i64
      %6 = vm.and.i32 %5, %slt : i32
      vm.cond_br %6, ^bb2, ^bb5
    ^bb2:  // pred: ^bb1
      %7 = vm.trunc.i64.i32 %2 : i64 -> i32
      %ref = vm.call @hal.devices.get(%7) {nosideeffects} : (i32) -> !vm.ref<!hal.device>
      %_utf8_hal_device_id_C6650FF277232B5A = vm.const.ref.rodata @_utf8_hal_device_id_C6650FF277232B5A : !vm.buffer
      %_utf8_local_1A8FF0278D7661D8 = vm.const.ref.rodata @_utf8_local_1A8FF0278D7661D8 : !vm.buffer
      %8:2 = vm.call @hal.device.query.i64(%ref, %_utf8_hal_device_id_C6650FF277232B5A, %_utf8_local_1A8FF0278D7661D8) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz = vm.cmp.nz.i64 %8#1 : i64
      %9 = vm.select.i32 %8#0, %nz, %zero : i32
      vm.cond_br %9, ^bb3, ^bb4(%zero : i32)
    ^bb3:  // pred: ^bb2
      %_utf8_hal_executable_format_E03EECB63A2AAF52 = vm.const.ref.rodata @_utf8_hal_executable_format_E03EECB63A2AAF52 : !vm.buffer
      %_utf8_embedded_elf_x86_64_FF16E34B4A5F9C83 = vm.const.ref.rodata @_utf8_embedded_elf_x86_64_FF16E34B4A5F9C83 : !vm.buffer
      %10:2 = vm.call @hal.device.query.i64(%ref, %_utf8_hal_executable_format_E03EECB63A2AAF52, %_utf8_embedded_elf_x86_64_FF16E34B4A5F9C83) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_5 = vm.cmp.nz.i64 %10#1 : i64
      %11 = vm.select.i32 %10#0, %nz_5, %zero : i32
      vm.br ^bb4(%11 : i32)
    ^bb4(%12: i32):  // 2 preds: ^bb2, ^bb3
      %eq = vm.cmp.eq.i64 %3, %zero_3 : i64
      %13 = vm.select.i64 %12, %c1_1, %zero_3 : i64
      %14 = vm.add.i64 %3, %13 : i64
      %15 = vm.and.i32 %12, %eq : i32
      %ref_6 = vm.select.ref %15, %ref, %null_0 : !vm.ref<!hal.device>
      %16 = vm.add.i64 %2, %c1_1 : i64
      vm.br ^bb1(%16, %14, %ref_6 : i64, i64, !vm.ref<!hal.device>)
    ^bb5:  // pred: ^bb1
      vm.cond_br %5, ^bb6, ^bb7
    ^bb6:  // pred: ^bb5
      vm.fail %c18, "HAL device `__device_0` not found or unavailable: #hal.device.target<\22local\22, [#hal.executable.target<\22llvm-cpu\22, \22embedded-elf-x86_64\22, {cpu = \22westmere\22, cpu_features = \22+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu\22, data_layout = \22e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128\22, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = \22x86_64-unknown-unknown-eabi-elf\22}>]>"
    ^bb7:  // pred: ^bb5
      vm.global.store.ref %4, @__device_0 : !vm.ref<!hal.device>
      vm.br ^bb8(%zero_3, %zero_3, %null_0 : i64, i64, !vm.ref<!hal.device>)
    ^bb8(%17: i64, %18: i64, %19: !vm.ref<!hal.device>):  // 2 preds: ^bb7, ^bb11
      %rnz_7 = vm.cmp.nz.ref %19 : !vm.ref<!hal.device>
      %20 = vm.xor.i32 %rnz_7, %c1 : i32
      %slt_8 = vm.cmp.lt.i64.s %17, %1 : i64
      %21 = vm.and.i32 %20, %slt_8 : i32
      vm.cond_br %21, ^bb9, ^bb12
    ^bb9:  // pred: ^bb8
      %22 = vm.trunc.i64.i32 %17 : i64 -> i32
      %ref_9 = vm.call @hal.devices.get(%22) {nosideeffects} : (i32) -> !vm.ref<!hal.device>
      %_utf8_hal_device_id_C6650FF277232B5A_10 = vm.const.ref.rodata @_utf8_hal_device_id_C6650FF277232B5A : !vm.buffer
      %_utf8_coralnpu_87A7D9FDC197986D = vm.const.ref.rodata @_utf8_coralnpu_87A7D9FDC197986D : !vm.buffer
      %23:2 = vm.call @hal.device.query.i64(%ref_9, %_utf8_hal_device_id_C6650FF277232B5A_10, %_utf8_coralnpu_87A7D9FDC197986D) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_11 = vm.cmp.nz.i64 %23#1 : i64
      %24 = vm.select.i32 %23#0, %nz_11, %zero : i32
      vm.cond_br %24, ^bb10, ^bb11(%zero : i32)
    ^bb10:  // pred: ^bb9
      %_utf8_hal_executable_format_E03EECB63A2AAF52_12 = vm.const.ref.rodata @_utf8_hal_executable_format_E03EECB63A2AAF52 : !vm.buffer
      %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF = vm.const.ref.rodata @_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF : !vm.buffer
      %25:2 = vm.call @hal.device.query.i64(%ref_9, %_utf8_hal_executable_format_E03EECB63A2AAF52_12, %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_13 = vm.cmp.nz.i64 %25#1 : i64
      %26 = vm.select.i32 %25#0, %nz_13, %zero : i32
      vm.br ^bb11(%26 : i32)
    ^bb11(%27: i32):  // 2 preds: ^bb9, ^bb10
      %eq_14 = vm.cmp.eq.i64 %18, %zero_3 : i64
      %28 = vm.select.i64 %27, %c1_1, %zero_3 : i64
      %29 = vm.add.i64 %18, %28 : i64
      %30 = vm.and.i32 %27, %eq_14 : i32
      %ref_15 = vm.select.ref %30, %ref_9, %null_0 : !vm.ref<!hal.device>
      %31 = vm.add.i64 %17, %c1_1 : i64
      vm.br ^bb8(%31, %29, %ref_15 : i64, i64, !vm.ref<!hal.device>)
    ^bb12:  // pred: ^bb8
      vm.cond_br %20, ^bb13, ^bb14
    ^bb13:  // pred: ^bb12
      vm.fail %c18, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
    ^bb14:  // pred: ^bb12
      %_utf8_hal_executable_format_E03EECB63A2AAF52_16 = vm.const.ref.rodata @_utf8_hal_executable_format_E03EECB63A2AAF52 : !vm.buffer
      %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF_17 = vm.const.ref.rodata @_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF : !vm.buffer
      %32:2 = vm.call @hal.device.query.i64(%19, %_utf8_hal_executable_format_E03EECB63A2AAF52_16, %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF_17) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_18 = vm.cmp.nz.i64 %32#1 : i64
      %33 = vm.select.i32 %32#0, %nz_18, %zero : i32
      %34 = vm.select.i64 %33, %zero_3, %c-1 : i64
      %eq_19 = vm.cmp.eq.i64 %34, %zero_3 : i64
      vm.global.store.ref %19, @__device_1 : !vm.ref<!hal.device>
      vm.cond_br %eq_19, ^bb15, ^bb16
    ^bb15:  // pred: ^bb14
      %main_dispatch_0_embedded_elf_riscv_32 = vm.const.ref.rodata @main_dispatch_0_embedded_elf_riscv_32 : !vm.buffer
      %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF_20 = vm.const.ref.rodata @_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF : !vm.buffer
      %ref_21 = vm.call @hal.executable.create(%19, %c-1, %_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF_20, %main_dispatch_0_embedded_elf_riscv_32, %null) {nosideeffects} : (!vm.ref<!hal.device>, i64, !vm.buffer, !vm.buffer, !vm.buffer) -> !vm.ref<!hal.executable>
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %ref_22 = vm.call @hal.device.allocator(%__device_1) {nosideeffects} : (!vm.ref<!hal.device>) -> !vm.ref<!hal.allocator>
      %ref_23 = vm.call @hal.allocator.import(%ref_22, %c1, %c-1, %c48, %c527363, %_const, %zero_3, %c8448) : (!vm.ref<!hal.allocator>, i32, i64, i32, i32, !vm.buffer, i64, i64) -> !vm.ref<!hal.buffer>
      %rnz_24 = vm.cmp.nz.ref %ref_23 : !vm.ref<!hal.buffer>
      vm.global.store.ref %ref_21, @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
      vm.cond_br %rnz_24, ^bb18(%null_4, %ref_23 : !vm.ref<!hal.fence>, !vm.ref<!hal.buffer>), ^bb17
    ^bb16:  // pred: ^bb14
      vm.fail %c14, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
    ^bb17:  // pred: ^bb15
      %ref_25 = vm.call @hal.allocator.allocate(%ref_22, %c-1, %c48, %c527363, %c8448) : (!vm.ref<!hal.allocator>, i64, i32, i32, i64) -> !vm.ref<!hal.buffer>
      %ref_26 = vm.call @hal.ex.file.from_memory(%__device_1, %c-1, %c1, %_const, %zero_3, %c8448, %zero) : (!vm.ref<!hal.device>, i64, i32, !vm.buffer, i64, i64, i32) -> !vm.ref<!hal.file>
      %ref_27 = vm.call @hal.fence.create(%__device_1, %zero_3) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      vm.call @hal.device.queue.read(%__device_1, %c-1, %null_4, %ref_27, %ref_26, %zero_3, %ref_25, %zero_3, %c8448, %zero_3) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, !vm.ref<!hal.file>, i64, !vm.ref<!hal.buffer>, i64, i64, i64) -> ()
      vm.br ^bb18(%ref_27, %ref_25 : !vm.ref<!hal.fence>, !vm.ref<!hal.buffer>)
    ^bb18(%35: !vm.ref<!hal.fence>, %36: !vm.ref<!hal.buffer>):  // 2 preds: ^bb15, ^bb17
      %37 = vm.call.variadic @hal.fence.await(%c-1_2, %zero_3, [%35]) : (i32, i64, !vm.ref<!hal.fence> ...) -> i32
      vm.cond_br %37, ^bb20, ^bb19
    ^bb19:  // pred: ^bb18
      vm.global.store.ref %36, @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
      %ref_28 = vm.call @__main_memoize_apply() : () -> !vm.ref<!hal.command_buffer>
      vm.global.store.ref %ref_28, @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
      vm.return
    ^bb20:  // pred: ^bb18
      vm.fail %37, "failed to wait on timepoint"
    }
    vm.func private @__main_memoize_apply() -> !vm.ref<!hal.command_buffer> attributes {inlining_policy = #util.inline.never} {
      %c13 = vm.const.i32 13
      %c28 = vm.const.i32 28
      %null = vm.const.ref.zero : !vm.ref<!hal.buffer>
      %c1 = vm.const.i32 1
      %c2 = vm.const.i32 2
      %c3 = vm.const.i32 3
      %zero = vm.const.i32.zero
      %c4352 = vm.const.i64 4352
      %c8448 = vm.const.i64 8448
      %c2176 = vm.const.i64 2176
      %zero_0 = vm.const.i64.zero
      %c-1 = vm.const.i64 -1
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %__hoisted_tensor_64xf32 = vm.global.load.ref immutable @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
      %__device_1_executable_0_main_dispatch_0 = vm.global.load.ref immutable @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
      %ref = vm.call @hal.command_buffer.create(%__device_1, %zero, %c3, %c-1, %c2) : (!vm.ref<!hal.device>, i32, i32, i64, i32) -> !vm.ref<!hal.command_buffer>
      vm.call.variadic @hal.command_buffer.dispatch(%ref, %__device_1_executable_0_main_dispatch_0, %zero, %c2, %c1, %c1, %zero_0, [], [(%zero, %zero, %null, %zero_0, %c2176), (%zero, %zero, %__hoisted_tensor_64xf32, %zero_0, %c8448), (%zero, %c1, %null, %zero_0, %c4352)]) : (!vm.ref<!hal.command_buffer>, !vm.ref<!hal.executable>, i32, i32, i32, i32, i64, i32 ..., tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
      vm.call @hal.command_buffer.execution_barrier(%ref, %c28, %c13, %zero_0) : (!vm.ref<!hal.command_buffer>, i32, i32, i64) -> ()
      vm.call @hal.command_buffer.finalize(%ref) : (!vm.ref<!hal.command_buffer>) -> ()
      vm.return %ref : !vm.ref<!hal.command_buffer>
    }
    vm.import private @hal.ex.file.from_memory(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %access : i32, %buffer : !vm.buffer, %offset : i64, %length : i64, %flags : i32) -> !vm.ref<!hal.file>
    vm.import private @hal.allocator.allocate(%allocator : !vm.ref<!hal.allocator>, %queue_affinity : i64, %memory_types : i32, %buffer_usage : i32, %allocation_size : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.allocator.import(%allocator : !vm.ref<!hal.allocator>, %try : i32, %queue_affinity : i64, %memory_types : i32, %buffer_usage : i32, %source : !vm.buffer, %offset : i64, %length : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.buffer.assert(%buffer : !vm.ref<!hal.buffer>, %message : !vm.buffer, %allocator : !vm.ref<!hal.allocator>, %minimum_length : i64, %memory_types : i32, %buffer_usage : i32)
    vm.import private @hal.buffer_view.create(%buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %source_length : i64, %element_type : i32, %encoding_type : i32, %shape : i64 ...) -> !vm.ref<!hal.buffer_view> attributes {nosideeffects}
    vm.import private @hal.buffer_view.assert(%buffer_view : !vm.ref<!hal.buffer_view>, %message : !vm.buffer, %element_type : i32, %encoding_type : i32, %shape : i64 ...)
    vm.import private @hal.buffer_view.buffer(%buffer_view : !vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer> attributes {nosideeffects}
    vm.import private @hal.command_buffer.create(%device : !vm.ref<!hal.device>, %modes : i32, %command_categories : i32, %queue_affinity : i64, %binding_capacity : i32) -> !vm.ref<!hal.command_buffer> attributes {minimum_version = 6 : i32}
    vm.import private @hal.command_buffer.finalize(%command_buffer : !vm.ref<!hal.command_buffer>)
    vm.import private @hal.command_buffer.execution_barrier(%command_buffer : !vm.ref<!hal.command_buffer>, %source_stage_mask : i32, %target_stage_mask : i32, %flags : i64)
    vm.import private @hal.command_buffer.dispatch(%command_buffer : !vm.ref<!hal.command_buffer>, %executable : !vm.ref<!hal.executable>, %entry_point : i32, %workgroup_x : i32, %workgroup_y : i32, %workgroup_z : i32, %flags : i64, %constants : i32 ..., %bindings : tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
    vm.import private @hal.device.allocator(%device : !vm.ref<!hal.device>) -> !vm.ref<!hal.allocator> attributes {nosideeffects}
    vm.import private @hal.device.query.i64(%device : !vm.ref<!hal.device>, %category : !vm.buffer, %key : !vm.buffer) -> (i32, i64) attributes {nosideeffects}
    vm.import private @hal.device.queue.alloca(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %pool : i64, %memory_types : i32, %buffer_usage : i32, %allocation_size : i64, %flags : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.device.queue.read(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %source_file : !vm.ref<!hal.file>, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.device.queue.execute.indirect(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %command_buffer : !vm.ref<!hal.command_buffer>, %flags : i64, %binding_table : tuple<!vm.ref<!hal.buffer>, i64, i64> ...)
    vm.import private @hal.devices.count() -> i32 attributes {nosideeffects}
    vm.import private @hal.devices.get(%index : i32) -> !vm.ref<!hal.device> attributes {nosideeffects}
    vm.import private @hal.executable.create(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %executable_format : !vm.buffer, %executable_data : !vm.buffer, %constants : !vm.buffer) -> !vm.ref<!hal.executable> attributes {nosideeffects}
    vm.import private @hal.fence.create(%device : !vm.ref<!hal.device>, %flags : i64) -> !vm.ref<!hal.fence>
    vm.import private @hal.fence.await(%timeout_millis : i32, %flags : i64, %fences : !vm.ref<!hal.fence> ...) -> i32 attributes {vm.yield}
    vm.rodata private @_utf8_input0_DCE99660CEB3F6B {alignment = 1 : i64} "input0"
    vm.rodata private @_utf8_tensor_FC1814BC4A58F22A {alignment = 1 : i64} "tensor"
    vm.func private @main(%arg0: !vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer_view> attributes {iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
      %c16 = vm.const.i32 16
      %c1 = vm.const.i32 1
      %c553648160 = vm.const.i32 553648160
      %c3075 = vm.const.i32 3075
      %c48 = vm.const.i32 48
      %zero = vm.const.i64.zero
      %c4352 = vm.const.i64 4352
      %c2176 = vm.const.i64 2176
      %c32 = vm.const.i64 32
      %c17 = vm.const.i64 17
      %c-1 = vm.const.i64 -1
      %null = vm.const.ref.zero : !vm.ref<!hal.fence>
      %c-1_0 = vm.const.i32 -1
      %c64 = vm.const.i64 64
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %__main_memoize_result_0_device_1 = vm.global.load.ref immutable @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
      %_utf8_input0_DCE99660CEB3F6B = vm.const.ref.rodata @_utf8_input0_DCE99660CEB3F6B : !vm.buffer
      vm.call.variadic @hal.buffer_view.assert(%arg0, %_utf8_input0_DCE99660CEB3F6B, %c553648160, %c1, [%c17, %c32]) : (!vm.ref<!hal.buffer_view>, !vm.buffer, i32, i32, i64 ...)
      %ref = vm.call @hal.buffer_view.buffer(%arg0) {nosideeffects} : (!vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer>
      %ref_1 = vm.call @hal.device.allocator(%__device_1) {nosideeffects} : (!vm.ref<!hal.device>) -> !vm.ref<!hal.allocator>
      %_utf8_tensor_FC1814BC4A58F22A = vm.const.ref.rodata @_utf8_tensor_FC1814BC4A58F22A : !vm.buffer
      vm.call @hal.buffer.assert(%ref, %_utf8_tensor_FC1814BC4A58F22A, %ref_1, %c2176, %c16, %c3075) : (!vm.ref<!hal.buffer>, !vm.buffer, !vm.ref<!hal.allocator>, i64, i32, i32) -> ()
      %ref_2 = vm.call @hal.fence.create(%__device_1, %zero) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      %ref_3 = vm.call @hal.device.queue.alloca(%__device_1, %c-1, %null, %ref_2, %zero, %c48, %c3075, %c4352, %zero) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, i64, i32, i32, i64, i64) -> !vm.ref<!hal.buffer>
      %ref_4 = vm.call @hal.fence.create(%__device_1, %zero) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      vm.call.variadic @hal.device.queue.execute.indirect(%__device_1, %c-1, %ref_2, %ref_4, %__main_memoize_result_0_device_1, %zero, [(%ref, %zero, %c2176), (%ref_3, %zero, %c4352)]) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, !vm.ref<!hal.command_buffer>, i64, tuple<!vm.ref<!hal.buffer>, i64, i64> ...)
      %0 = vm.call.variadic @hal.fence.await(%c-1_0, %zero, [%ref_4]) : (i32, i64, !vm.ref<!hal.fence> ...) -> i32
      vm.cond_br %0, ^bb2, ^bb1
    ^bb1:  // pred: ^bb0
      %ref_5 = vm.call.variadic @hal.buffer_view.create(%ref_3, %zero, %c4352, %c553648160, %c1, [%c17, %c64]) {nosideeffects} : (!vm.ref<!hal.buffer>, i64, i64, i32, i32, i64 ...) -> !vm.ref<!hal.buffer_view>
      vm.return %ref_5 : !vm.ref<!hal.buffer_view>
    ^bb2:  // pred: ^bb0
      vm.fail %0, "failed to wait on timepoint"
    }
    vm.export @main attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}}
  }
}

{-#

#-}


