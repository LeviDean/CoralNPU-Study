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
  vm.cond_br %37, ^bb20(%37 : i32), ^bb19
^bb19:  // pred: ^bb18
  vm.global.store.ref %36, @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
  %ref_28 = vm.call @__main_memoize_apply() : () -> !vm.ref<!hal.command_buffer>
  vm.global.store.ref %ref_28, @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
  vm.return
^bb20(%38: i32):  // pred: ^bb18
  vm.fail %38, "failed to wait on timepoint"
}

