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
    vm.initializer {
      %c48 = vm.const.i32 48
      %c527363 = vm.const.i32 527363
      %c8448 = vm.const.i64 8448
      %buffer = vm.rodata.inline {alignment = 64 : i64} : !vm.buffer = #composite_of_8448b
      %null = vm.const.ref.zero : !vm.ref<!hal.fence>
      %zero = vm.const.i64.zero
      %zero_0 = vm.const.i32.zero
      %c-1 = vm.const.i32 -1
      %null_1 = vm.const.ref.zero : !vm.ref<!hal.executable>
      %c14 = vm.const.i32 14
      %c-1_2 = vm.const.i64 -1
      %c-1_3 = vm.const.i64 -1
      %c18 = vm.const.i32 18
      %zero_4 = vm.const.i32.zero
      %zero_5 = vm.const.i64.zero
      %c1 = vm.const.i64 1
      %null_6 = vm.const.ref.zero : !vm.ref<!hal.device>
      %0 = vm.call @hal.devices.count() {nosideeffects} : () -> i32
      %1 = vm.ext.i32.i64.s %0 : i32 -> i64
      vm.br ^bb1(%zero_5, %zero_5, %null_6 : i64, i64, !vm.ref<!hal.device>)
    ^bb1(%2: i64, %3: i64, %4: !vm.ref<!hal.device>):  // 2 preds: ^bb0, ^bb4
      %req = vm.cmp.eq.ref %4, %null_6 : !vm.ref<!hal.device>
      %slt = vm.cmp.lt.i64.s %2, %1 : i64
      %5 = vm.and.i32 %req, %slt : i32
      vm.cond_br %5, ^bb2, ^bb5
    ^bb2:  // pred: ^bb1
      %6 = vm.trunc.i64.i32 %2 : i64 -> i32
      %ref = vm.call @hal.devices.get(%6) {nosideeffects} : (i32) -> !vm.ref<!hal.device>
      %buffer_7 = vm.rodata.inline "_utf8_hal_device_id_C6650FF277232B5A" {alignment = 1 : i64} : !vm.buffer = "hal.device.id"
      %buffer_8 = vm.rodata.inline "_utf8_local_1A8FF0278D7661D8" {alignment = 1 : i64} : !vm.buffer = "local*"
      %7:2 = vm.call @hal.device.query.i64(%ref, %buffer_7, %buffer_8) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz = vm.cmp.nz.i64 %7#1 : i64
      %zero_9 = vm.const.i32.zero
      %8 = vm.select.i32 %7#0, %nz, %zero_9 : i32
      %c1_10 = vm.const.i32 1
      vm.cond_br %8, ^bb3, ^bb4(%zero_4 : i32)
    ^bb3:  // pred: ^bb2
      %buffer_11 = vm.rodata.inline "_utf8_hal_executable_format_E03EECB63A2AAF52" {alignment = 1 : i64} : !vm.buffer = "hal.executable.format"
      %buffer_12 = vm.rodata.inline "_utf8_embedded_elf_x86_64_FF16E34B4A5F9C83" {alignment = 1 : i64} : !vm.buffer = "embedded-elf-x86_64"
      %9:2 = vm.call @hal.device.query.i64(%ref, %buffer_11, %buffer_12) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_13 = vm.cmp.nz.i64 %9#1 : i64
      %zero_14 = vm.const.i32.zero
      %10 = vm.select.i32 %9#0, %nz_13, %zero_14 : i32
      %c1_15 = vm.const.i32 1
      vm.br ^bb4(%10 : i32)
    ^bb4(%11: i32):  // 2 preds: ^bb2, ^bb3
      %eq = vm.cmp.eq.i64 %3, %zero_5 : i64
      %12 = vm.select.i64 %11, %c1, %zero_5 : i64
      %13 = vm.add.i64 %3, %12 : i64
      %14 = vm.and.i32 %11, %eq : i32
      %ref_16 = vm.select.ref %14, %ref, %null_6 : !vm.ref<!hal.device>
      %15 = vm.add.i64 %2, %c1 : i64
      vm.br ^bb1(%15, %13, %ref_16 : i64, i64, !vm.ref<!hal.device>)
    ^bb5:  // pred: ^bb1
      vm.cond_br %req, ^bb6, ^bb7
    ^bb6:  // pred: ^bb5
      vm.cond_fail %c18, "HAL device `__device_0` not found or unavailable: #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]>"
      vm.br ^bb7
    ^bb7:  // 2 preds: ^bb5, ^bb6
      vm.global.store.ref %4, @__device_0 : !vm.ref<!hal.device>
      vm.br ^bb8(%zero_5, %zero_5, %null_6 : i64, i64, !vm.ref<!hal.device>)
    ^bb8(%16: i64, %17: i64, %18: !vm.ref<!hal.device>):  // 2 preds: ^bb7, ^bb11
      %req_17 = vm.cmp.eq.ref %18, %null_6 : !vm.ref<!hal.device>
      %slt_18 = vm.cmp.lt.i64.s %16, %1 : i64
      %19 = vm.and.i32 %req_17, %slt_18 : i32
      vm.cond_br %19, ^bb9, ^bb12
    ^bb9:  // pred: ^bb8
      %20 = vm.trunc.i64.i32 %16 : i64 -> i32
      %ref_19 = vm.call @hal.devices.get(%20) {nosideeffects} : (i32) -> !vm.ref<!hal.device>
      %buffer_20 = vm.rodata.inline "_utf8_hal_device_id_C6650FF277232B5A" {alignment = 1 : i64} : !vm.buffer = "hal.device.id"
      %buffer_21 = vm.rodata.inline "_utf8_coralnpu_87A7D9FDC197986D" {alignment = 1 : i64} : !vm.buffer = "coralnpu"
      %21:2 = vm.call @hal.device.query.i64(%ref_19, %buffer_20, %buffer_21) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_22 = vm.cmp.nz.i64 %21#1 : i64
      %zero_23 = vm.const.i32.zero
      %22 = vm.select.i32 %21#0, %nz_22, %zero_23 : i32
      %c1_24 = vm.const.i32 1
      vm.cond_br %22, ^bb10, ^bb11(%zero_4 : i32)
    ^bb10:  // pred: ^bb9
      %buffer_25 = vm.rodata.inline "_utf8_hal_executable_format_E03EECB63A2AAF52" {alignment = 1 : i64} : !vm.buffer = "hal.executable.format"
      %buffer_26 = vm.rodata.inline "_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF" {alignment = 1 : i64} : !vm.buffer = "embedded-elf-riscv_32"
      %23:2 = vm.call @hal.device.query.i64(%ref_19, %buffer_25, %buffer_26) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_27 = vm.cmp.nz.i64 %23#1 : i64
      %zero_28 = vm.const.i32.zero
      %24 = vm.select.i32 %23#0, %nz_27, %zero_28 : i32
      %c1_29 = vm.const.i32 1
      vm.br ^bb11(%24 : i32)
    ^bb11(%25: i32):  // 2 preds: ^bb9, ^bb10
      %eq_30 = vm.cmp.eq.i64 %17, %zero_5 : i64
      %26 = vm.select.i64 %25, %c1, %zero_5 : i64
      %27 = vm.add.i64 %17, %26 : i64
      %28 = vm.and.i32 %25, %eq_30 : i32
      %ref_31 = vm.select.ref %28, %ref_19, %null_6 : !vm.ref<!hal.device>
      %29 = vm.add.i64 %16, %c1 : i64
      vm.br ^bb8(%29, %27, %ref_31 : i64, i64, !vm.ref<!hal.device>)
    ^bb12:  // pred: ^bb8
      vm.cond_br %req_17, ^bb13, ^bb14
    ^bb13:  // pred: ^bb12
      vm.cond_fail %c18, "HAL device `__device_1` not found or unavailable: #hal.device.target<"coralnpu", [#hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>]>"
      vm.br ^bb14
    ^bb14:  // 2 preds: ^bb12, ^bb13
      %buffer_32 = vm.rodata.inline "_utf8_hal_executable_format_E03EECB63A2AAF52" {alignment = 1 : i64} : !vm.buffer = "hal.executable.format"
      %buffer_33 = vm.rodata.inline "_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF" {alignment = 1 : i64} : !vm.buffer = "embedded-elf-riscv_32"
      %30:2 = vm.call @hal.device.query.i64(%18, %buffer_32, %buffer_33) {nosideeffects} : (!vm.ref<!hal.device>, !vm.buffer, !vm.buffer) -> (i32, i64)
      %nz_34 = vm.cmp.nz.i64 %30#1 : i64
      %zero_35 = vm.const.i32.zero
      %31 = vm.select.i32 %30#0, %nz_34, %zero_35 : i32
      %c1_36 = vm.const.i32 1
      %32 = vm.select.i64 %31, %zero_5, %c-1_2 : i64
      %eq_37 = vm.cmp.eq.i64 %32, %zero_5 : i64
      vm.global.store.ref %18, @__device_1 : !vm.ref<!hal.device>
      vm.cond_br %eq_37, ^bb15, ^bb16
    ^bb15:  // pred: ^bb14
      %buffer_38 = vm.rodata.inline "main_dispatch_0_embedded_elf_riscv_32" {alignment = 16 : i64, mime_type = "application/x-elf"} : !vm.buffer = dense_resource<__elided__> : vector<13796xi8>
      %buffer_39 = vm.rodata.inline "_utf8_embedded_elf_riscv_32_62D3CDC92A038ADF" {alignment = 1 : i64} : !vm.buffer = "embedded-elf-riscv_32"
      %null_40 = vm.const.ref.zero : !vm.buffer
      %ref_41 = vm.call @hal.executable.create(%18, %c-1_3, %buffer_39, %buffer_38, %null_40) {nosideeffects} : (!vm.ref<!hal.device>, i64, !vm.buffer, !vm.buffer, !vm.buffer) -> !vm.ref<!hal.executable>
      vm.br ^bb17(%ref_41 : !vm.ref<!hal.executable>)
    ^bb16:  // pred: ^bb14
      vm.cond_fail %c14, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
      vm.br ^bb17(%null_1 : !vm.ref<!hal.executable>)
    ^bb17(%33: !vm.ref<!hal.executable>):  // 2 preds: ^bb15, ^bb16
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %ref_42 = vm.call @hal.device.allocator(%__device_1) {nosideeffects} : (!vm.ref<!hal.device>) -> !vm.ref<!hal.allocator>
      %c1_43 = vm.const.i32 1
      %ref_44 = vm.call @hal.allocator.import(%ref_42, %c1_43, %c-1_3, %c48, %c527363, %buffer, %zero_5, %c8448) : (!vm.ref<!hal.allocator>, i32, i64, i32, i32, !vm.buffer, i64, i64) -> !vm.ref<!hal.buffer>
      %rnz = vm.cmp.nz.ref %ref_44 : !vm.ref<!hal.buffer>
      vm.global.store.ref %33, @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
      vm.cond_br %rnz, ^bb19(%null, %ref_44 : !vm.ref<!hal.fence>, !vm.ref<!hal.buffer>), ^bb18
    ^bb18:  // pred: ^bb17
      %ref_45 = vm.call @hal.allocator.allocate(%ref_42, %c-1_3, %c48, %c527363, %c8448) : (!vm.ref<!hal.allocator>, i64, i32, i32, i64) -> !vm.ref<!hal.buffer>
      %c1_46 = vm.const.i32 1
      %ref_47 = vm.call @hal.ex.file.from_memory(%__device_1, %c-1_3, %c1_46, %buffer, %zero_5, %c8448, %zero_0) : (!vm.ref<!hal.device>, i64, i32, !vm.buffer, i64, i64, i32) -> !vm.ref<!hal.file>
      %zero_48 = vm.const.i64.zero
      %ref_49 = vm.call @hal.fence.create(%__device_1, %zero_48) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      %zero_50 = vm.const.i64.zero
      vm.call @hal.device.queue.read(%__device_1, %c-1_3, %null, %ref_49, %ref_47, %zero, %ref_45, %zero_5, %c8448, %zero_50) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, !vm.ref<!hal.file>, i64, !vm.ref<!hal.buffer>, i64, i64, i64) -> ()
      vm.br ^bb19(%ref_49, %ref_45 : !vm.ref<!hal.fence>, !vm.ref<!hal.buffer>)
    ^bb19(%34: !vm.ref<!hal.fence>, %35: !vm.ref<!hal.buffer>):  // 2 preds: ^bb17, ^bb18
      %zero_51 = vm.const.i64.zero
      %36 = vm.call.variadic @hal.fence.await(%c-1, %zero_51, [%34]) : (i32, i64, !vm.ref<!hal.fence> ...) -> i32
      vm.cond_fail %36, "failed to wait on timepoint"
      vm.global.store.ref %35, @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
      %ref_52 = vm.call @__main_memoize_apply() : () -> !vm.ref<!hal.command_buffer>
      vm.global.store.ref %ref_52, @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
      vm.return
    }
    vm.func private @__main_memoize_apply() -> !vm.ref<!hal.command_buffer> attributes {inlining_policy = #util.inline.never} {
      %c4352 = vm.const.i64 4352
      %c8448 = vm.const.i64 8448
      %c2176 = vm.const.i64 2176
      %c1 = vm.const.i64 1
      %zero = vm.const.i64.zero
      %c2 = vm.const.i64 2
      %c-1 = vm.const.i64 -1
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %__hoisted_tensor_64xf32 = vm.global.load.ref immutable @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
      %__device_1_executable_0_main_dispatch_0 = vm.global.load.ref immutable @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
      %zero_0 = vm.const.i32.zero
      %c3 = vm.const.i32 3
      %c2_1 = vm.const.i32 2
      %ref = vm.call @hal.command_buffer.create(%__device_1, %zero_0, %c3, %c-1, %c2_1) : (!vm.ref<!hal.device>, i32, i32, i64, i32) -> !vm.ref<!hal.command_buffer>
      %zero_2 = vm.const.i32.zero
      %zero_3 = vm.const.i32.zero
      %c2_4 = vm.const.i32 2
      %c1_5 = vm.const.i32 1
      %c1_6 = vm.const.i32 1
      %zero_7 = vm.const.i64 0
      %zero_8 = vm.const.i32.zero
      %null = vm.const.ref.zero : !vm.ref<!hal.buffer>
      %zero_9 = vm.const.i32.zero
      %c1_10 = vm.const.i32 1
      %null_11 = vm.const.ref.zero : !vm.ref<!hal.buffer>
      vm.call.variadic @hal.command_buffer.dispatch(%ref, %__device_1_executable_0_main_dispatch_0, %zero_3, %c2_4, %c1_5, %c1_6, %zero_7, [], [(%zero_2, %zero_8, %null, %zero, %c2176), (%zero_2, %zero_9, %__hoisted_tensor_64xf32, %zero, %c8448), (%zero_2, %c1_10, %null_11, %zero, %c4352)]) : (!vm.ref<!hal.command_buffer>, !vm.ref<!hal.executable>, i32, i32, i32, i32, i64, i32 ..., tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
      %c28 = vm.const.i32 28
      %c13 = vm.const.i32 13
      %zero_12 = vm.const.i64.zero
      vm.call @hal.command_buffer.execution_barrier(%ref, %c28, %c13, %zero_12) : (!vm.ref<!hal.command_buffer>, i32, i32, i64) -> ()
      vm.call @hal.command_buffer.finalize(%ref) : (!vm.ref<!hal.command_buffer>) -> ()
      vm.return %ref : !vm.ref<!hal.command_buffer>
    }
    vm.import private @hal.ex.file.from_memory(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %access : i32, %buffer : !vm.buffer, %offset : i64, %length : i64, %flags : i32) -> !vm.ref<!hal.file>
    vm.import private @hal.allocator.select(%memory_types : i32, %buffer_usage : i32, %flags : i64, %from : tuple<!vm.ref<!hal.device>, i64> ...) -> (!vm.ref<!hal.device>, i64) attributes {nosideeffects}
    vm.import private @hal.allocator.allocate(%allocator : !vm.ref<!hal.allocator>, %queue_affinity : i64, %memory_types : i32, %buffer_usage : i32, %allocation_size : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.allocator.import(%allocator : !vm.ref<!hal.allocator>, %try : i32, %queue_affinity : i64, %memory_types : i32, %buffer_usage : i32, %source : !vm.buffer, %offset : i64, %length : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.buffer.assert(%buffer : !vm.ref<!hal.buffer>, %message : !vm.buffer, %allocator : !vm.ref<!hal.allocator>, %minimum_length : i64, %memory_types : i32, %buffer_usage : i32)
    vm.import private @hal.buffer.allocation.preserve(%buffer : !vm.ref<!hal.buffer>)
    vm.import private @hal.buffer.allocation.discard(%buffer : !vm.ref<!hal.buffer>) -> i32
    vm.import private @hal.buffer.allocation.is_terminal(%buffer : !vm.ref<!hal.buffer>) -> i32
    vm.import private @hal.buffer.subspan(%source_buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %length : i64) -> !vm.ref<!hal.buffer> attributes {nosideeffects}
    vm.import private @hal.buffer.length(%buffer : !vm.ref<!hal.buffer>) -> i64 attributes {nosideeffects}
    vm.import private @hal.buffer.load(%source_buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %length : i32) -> i32
    vm.import private @hal.buffer.store(%value : i32, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i32)
    vm.import private @hal.buffer_view.create(%buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %source_length : i64, %element_type : i32, %encoding_type : i32, %shape : i64 ...) -> !vm.ref<!hal.buffer_view> attributes {nosideeffects}
    vm.import private @hal.buffer_view.assert(%buffer_view : !vm.ref<!hal.buffer_view>, %message : !vm.buffer, %element_type : i32, %encoding_type : i32, %shape : i64 ...)
    vm.import private @hal.buffer_view.buffer(%buffer_view : !vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer> attributes {nosideeffects}
    vm.import private @hal.buffer_view.element_type(%buffer_view : !vm.ref<!hal.buffer_view>) -> i32 attributes {nosideeffects}
    vm.import private @hal.buffer_view.encoding_type(%buffer_view : !vm.ref<!hal.buffer_view>) -> i32 attributes {nosideeffects}
    vm.import private @hal.buffer_view.rank(%buffer_view : !vm.ref<!hal.buffer_view>) -> i32 attributes {nosideeffects}
    vm.import private @hal.buffer_view.dim(%buffer_view : !vm.ref<!hal.buffer_view>, %index : i32) -> i64 attributes {nosideeffects}
    vm.import private @hal.buffer_view.trace(%key : !vm.buffer, %operands : !vm.ref<!hal.buffer_view> ...)
    vm.import private @hal.channel.create(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %flags : i64, %id : !vm.buffer, %group : !vm.buffer, %rank : i32, %count : i32) -> !vm.ref<!hal.channel> attributes {nosideeffects}
    vm.import private @hal.channel.split(%channel : !vm.ref<!hal.channel>, %color : i32, %key : i32, %flags : i64) -> !vm.ref<!hal.channel> attributes {nosideeffects}
    vm.import private @hal.channel.rank_and_count(%channel : !vm.ref<!hal.channel>) -> (i32, i32) attributes {nosideeffects}
    vm.import private @hal.command_buffer.create(%device : !vm.ref<!hal.device>, %modes : i32, %command_categories : i32, %queue_affinity : i64, %binding_capacity : i32) -> !vm.ref<!hal.command_buffer> attributes {minimum_version = 6 : i32}
    vm.import private @hal.command_buffer.finalize(%command_buffer : !vm.ref<!hal.command_buffer>)
    vm.import private @hal.command_buffer.begin_debug_group(%command_buffer : !vm.ref<!hal.command_buffer>, %label : !vm.buffer)
    vm.import private @hal.command_buffer.end_debug_group(%command_buffer : !vm.ref<!hal.command_buffer>)
    vm.import private @hal.command_buffer.execution_barrier(%command_buffer : !vm.ref<!hal.command_buffer>, %source_stage_mask : i32, %target_stage_mask : i32, %flags : i64)
    vm.import private @hal.command_buffer.advise_buffer(%command_buffer : !vm.ref<!hal.command_buffer>, %buffer : !vm.ref<!hal.buffer>, %flags : i64, %arg0 : i64, %arg1 : i64, %buffer_slot : i32)
    vm.import private @hal.command_buffer.fill_buffer(%command_buffer : !vm.ref<!hal.command_buffer>, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %target_buffer_slot : i32, %pattern : i64, %pattern_length : i32, %flags : i64)
    vm.import private @hal.command_buffer.update_buffer(%command_buffer : !vm.ref<!hal.command_buffer>, %source_buffer : !vm.buffer, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %target_buffer_slot : i32, %flags : i64)
    vm.import private @hal.command_buffer.copy_buffer(%command_buffer : !vm.ref<!hal.command_buffer>, %source_buffer_slot : i32, %target_buffer_slot : i32, %source_buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.command_buffer.collective(%command_buffer : !vm.ref<!hal.command_buffer>, %channel : !vm.ref<!hal.channel>, %op : i32, %param : i32, %send_buffer_slot : i32, %recv_buffer_slot : i32, %send_buffer : !vm.ref<!hal.buffer>, %recv_buffer : !vm.ref<!hal.buffer>, %send_offset : i64, %send_length : i64, %recv_offset : i64, %recv_length : i64, %element_count : i64)
    vm.import private @hal.command_buffer.dispatch(%command_buffer : !vm.ref<!hal.command_buffer>, %executable : !vm.ref<!hal.executable>, %entry_point : i32, %workgroup_x : i32, %workgroup_y : i32, %workgroup_z : i32, %flags : i64, %constants : i32 ..., %bindings : tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
    vm.import private @hal.command_buffer.dispatch.indirect(%command_buffer : !vm.ref<!hal.command_buffer>, %executable : !vm.ref<!hal.executable>, %entry_point : i32, %workgroups_buffer_slot : i32, %workgroups_buffer : !vm.ref<!hal.buffer>, %workgroups_offset : i64, %flags : i64, %constants : i32 ..., %bindings : tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
    vm.import private @hal.device.allocator(%device : !vm.ref<!hal.device>) -> !vm.ref<!hal.allocator> attributes {nosideeffects}
    vm.import private @hal.device.query.i64(%device : !vm.ref<!hal.device>, %category : !vm.buffer, %key : !vm.buffer) -> (i32, i64) attributes {nosideeffects}
    vm.import private @hal.device.queue.alloca(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %pool : i64, %memory_types : i32, %buffer_usage : i32, %allocation_size : i64, %flags : i64) -> !vm.ref<!hal.buffer>
    vm.import private @hal.device.queue.dealloca(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %buffer : !vm.ref<!hal.buffer>, %flags : i64)
    vm.import private @hal.device.queue.fill(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %pattern : i64, %pattern_length : i32, %flags : i64)
    vm.import private @hal.device.queue.update(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %source_buffer : !vm.buffer, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.device.queue.copy(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %source_buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.device.queue.read(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %source_file : !vm.ref<!hal.file>, %source_offset : i64, %target_buffer : !vm.ref<!hal.buffer>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.device.queue.write(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %source_buffer : !vm.ref<!hal.buffer>, %source_offset : i64, %target_file : !vm.ref<!hal.file>, %target_offset : i64, %length : i64, %flags : i64)
    vm.import private @hal.device.queue.barrier(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %flags : i64)
    vm.import private @hal.device.queue.execute(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %command_buffer : !vm.ref<!hal.command_buffer>, %flags : i64)
    vm.import private @hal.device.queue.execute.indirect(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %wait_fence : !vm.ref<!hal.fence>, %signal_fence : !vm.ref<!hal.fence>, %command_buffer : !vm.ref<!hal.command_buffer>, %flags : i64, %binding_table : tuple<!vm.ref<!hal.buffer>, i64, i64> ...)
    vm.import private @hal.device.queue.flush(%device : !vm.ref<!hal.device>, %queue_affinity : i64)
    vm.import private @hal.devices.count() -> i32 attributes {nosideeffects}
    vm.import private @hal.devices.get(%index : i32) -> !vm.ref<!hal.device> attributes {nosideeffects}
    vm.import private @hal.executable.create(%device : !vm.ref<!hal.device>, %queue_affinity : i64, %executable_format : !vm.buffer, %executable_data : !vm.buffer, %constants : !vm.buffer) -> !vm.ref<!hal.executable> attributes {nosideeffects}
    vm.import private @hal.fence.create(%device : !vm.ref<!hal.device>, %flags : i64) -> !vm.ref<!hal.fence>
    vm.import private @hal.fence.join(%flags : i64, %fences : !vm.ref<!hal.fence> ...) -> !vm.ref<!hal.fence> attributes {nosideeffects}
    vm.import private @hal.fence.query(%fence : !vm.ref<!hal.fence>) -> i32
    vm.import private @hal.fence.signal(%fence : !vm.ref<!hal.fence>)
    vm.import private @hal.fence.fail(%fence : !vm.ref<!hal.fence>, %status : i32)
    vm.import private @hal.fence.await(%timeout_millis : i32, %flags : i64, %fences : !vm.ref<!hal.fence> ...) -> i32 attributes {vm.yield}
    vm.func private @main(%arg0: !vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer_view> attributes {iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
      %c3075 = vm.const.i32 3075
      %c48 = vm.const.i32 48
      %zero = vm.const.i64.zero
      %c4352 = vm.const.i64 4352
      %c2176 = vm.const.i64 2176
      %c32 = vm.const.i64 32
      %c17 = vm.const.i64 17
      %c-1 = vm.const.i64 -1
      %null = vm.const.ref.zero : !vm.ref<!hal.fence>
      %zero_0 = vm.const.i64.zero
      %c-1_1 = vm.const.i32 -1
      %c64 = vm.const.i64 64
      %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
      %__main_memoize_result_0_device_1 = vm.global.load.ref immutable @__main_memoize_result_0_device_1 : !vm.ref<!hal.command_buffer>
      %c553648160 = vm.const.i32 553648160
      %c1 = vm.const.i32 1
      %buffer = vm.rodata.inline "_utf8_input0_DCE99660CEB3F6B" {alignment = 1 : i64} : !vm.buffer = "input0"
      vm.call.variadic @hal.buffer_view.assert(%arg0, %buffer, %c553648160, %c1, [%c17, %c32]) : (!vm.ref<!hal.buffer_view>, !vm.buffer, i32, i32, i64 ...)
      %ref = vm.call @hal.buffer_view.buffer(%arg0) {nosideeffects} : (!vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer>
      %ref_2 = vm.call @hal.device.allocator(%__device_1) {nosideeffects} : (!vm.ref<!hal.device>) -> !vm.ref<!hal.allocator>
      %buffer_3 = vm.rodata.inline "_utf8_tensor_FC1814BC4A58F22A" {alignment = 1 : i64} : !vm.buffer = "tensor"
      %c16 = vm.const.i32 16
      %c3075_4 = vm.const.i32 3075
      vm.call @hal.buffer.assert(%ref, %buffer_3, %ref_2, %c2176, %c16, %c3075_4) : (!vm.ref<!hal.buffer>, !vm.buffer, !vm.ref<!hal.allocator>, i64, i32, i32) -> ()
      %zero_5 = vm.const.i64.zero
      %ref_6 = vm.call @hal.fence.create(%__device_1, %zero_5) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      %zero_7 = vm.const.i64.zero
      %ref_8 = vm.call @hal.device.queue.alloca(%__device_1, %c-1, %null, %ref_6, %zero_0, %c48, %c3075, %c4352, %zero_7) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, i64, i32, i32, i64, i64) -> !vm.ref<!hal.buffer>
      %zero_9 = vm.const.i64.zero
      %ref_10 = vm.call @hal.fence.create(%__device_1, %zero_9) : (!vm.ref<!hal.device>, i64) -> !vm.ref<!hal.fence>
      %zero_11 = vm.const.i64 0
      vm.call.variadic @hal.device.queue.execute.indirect(%__device_1, %c-1, %ref_6, %ref_10, %__main_memoize_result_0_device_1, %zero_11, [(%ref, %zero, %c2176), (%ref_8, %zero, %c4352)]) : (!vm.ref<!hal.device>, i64, !vm.ref<!hal.fence>, !vm.ref<!hal.fence>, !vm.ref<!hal.command_buffer>, i64, tuple<!vm.ref<!hal.buffer>, i64, i64> ...)
      %zero_12 = vm.const.i64.zero
      %0 = vm.call.variadic @hal.fence.await(%c-1_1, %zero_12, [%ref_10]) : (i32, i64, !vm.ref<!hal.fence> ...) -> i32
      vm.cond_fail %0, "failed to wait on timepoint"
      %ref_13 = vm.call.variadic @hal.buffer_view.create(%ref_8, %zero, %c4352, %c553648160, %c1, [%c17, %c64]) {nosideeffects} : (!vm.ref<!hal.buffer>, i64, i64, i32, i32, i64 ...) -> !vm.ref<!hal.buffer_view>
      vm.return %ref_13 : !vm.ref<!hal.buffer_view>
    }
    vm.export @main attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}}
  }
}

{-#

#-}


