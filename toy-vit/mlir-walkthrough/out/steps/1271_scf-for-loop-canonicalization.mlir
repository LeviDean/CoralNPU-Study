util.initializer {
  %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
  %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
  %c8448 = arith.constant 8448 : index
  %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
  %0 = util.null : !hal.fence
  %c0_i64 = arith.constant 0 : i64
  %c0_i32 = arith.constant 0 : i32
  %c-1_i32 = arith.constant -1 : i32
  %1 = util.null : !hal.executable
  %c14_i32 = arith.constant 14 : i32
  %c-1 = arith.constant -1 : index
  %c-1_i64 = arith.constant -1 : i64
  %c18_i32 = arith.constant 18 : i32
  %false = arith.constant false
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %2 = util.null : !hal.device
  %device_count = hal.devices.count : index
  cf.br ^bb1(%c0, %c0, %2 : index, index, !hal.device)
^bb1(%3: index, %4: index, %5: !hal.device):  // 2 preds: ^bb0, ^bb4
  %6 = util.cmp.eq %5, %2 : !hal.device
  %7 = arith.cmpi slt, %3, %device_count : index
  %8 = arith.andi %6, %7 : i1
  cf.cond_br %8, ^bb2, ^bb5
^bb2:  // pred: ^bb1
  %device_n = hal.devices.get %3 : !hal.device
  %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "local*") : i1, i1 = false
  cf.cond_br %value, ^bb3, ^bb4(%false : i1)
^bb3:  // pred: ^bb2
  %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
  cf.br ^bb4(%value_1 : i1)
^bb4(%9: i1):  // 2 preds: ^bb2, ^bb3
  %10 = arith.cmpi eq, %4, %c0 : index
  %11 = arith.select %9, %c1, %c0 : index
  %12 = arith.addi %4, %11 : index
  %13 = arith.andi %9, %10 : i1
  %14 = arith.select %13, %device_n, %2 : !hal.device
  %15 = arith.addi %3, %c1 : index
  cf.br ^bb1(%15, %12, %14 : index, index, !hal.device)
^bb5:  // pred: ^bb1
  cf.cond_br %6, ^bb6, ^bb7
^bb6:  // pred: ^bb5
  util.status.check_ok %c18_i32, "HAL device `__device_0` not found or unavailable: #hal.device.target<\22local\22, [#hal.executable.target<\22llvm-cpu\22, \22embedded-elf-x86_64\22, {cpu = \22westmere\22, cpu_features = \22+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu\22, data_layout = \22e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128\22, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = \22x86_64-unknown-unknown-eabi-elf\22}>]>"
  cf.br ^bb7
^bb7:  // 2 preds: ^bb5, ^bb6
  util.global.store %5, @__device_0 : !hal.device
  cf.br ^bb8
^bb8:  // pred: ^bb7
  %device_count_2 = hal.devices.count : index
  cf.br ^bb9(%c0, %c0, %2 : index, index, !hal.device)
^bb9(%16: index, %17: index, %18: !hal.device):  // 2 preds: ^bb8, ^bb12
  %19 = util.cmp.eq %18, %2 : !hal.device
  %20 = arith.cmpi slt, %16, %device_count_2 : index
  %21 = arith.andi %19, %20 : i1
  cf.cond_br %21, ^bb10, ^bb13
^bb10:  // pred: ^bb9
  %device_n_3 = hal.devices.get %16 : !hal.device
  %ok_4, %value_5 = hal.device.query<%device_n_3 : !hal.device> key("hal.device.id" :: "coralnpu") : i1, i1 = false
  cf.cond_br %value_5, ^bb11, ^bb12(%false : i1)
^bb11:  // pred: ^bb10
  %ok_6, %value_7 = hal.device.query<%device_n_3 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  cf.br ^bb12(%value_7 : i1)
^bb12(%22: i1):  // 2 preds: ^bb10, ^bb11
  %23 = arith.cmpi eq, %17, %c0 : index
  %24 = arith.select %22, %c1, %c0 : index
  %25 = arith.addi %17, %24 : index
  %26 = arith.andi %22, %23 : i1
  %27 = arith.select %26, %device_n_3, %2 : !hal.device
  %28 = arith.addi %16, %c1 : index
  cf.br ^bb9(%28, %25, %27 : index, index, !hal.device)
^bb13:  // pred: ^bb9
  cf.cond_br %19, ^bb14, ^bb15
^bb14:  // pred: ^bb13
  util.status.check_ok %c18_i32, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
  cf.br ^bb15
^bb15:  // 2 preds: ^bb13, ^bb14
  util.global.store %18, @__device_1 : !hal.device
  cf.br ^bb16
^bb16:  // pred: ^bb15
  %__device_1 = util.global.load @__device_1 : !hal.device
  %ok_8, %value_9 = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  util.global.store %value_9, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 = util.global.load @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  %__device_1_10 = util.global.load @__device_1 : !hal.device
  %29 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
  %30 = arith.cmpi eq, %29, %c0 : index
  cf.cond_br %30, ^bb17, ^bb18
^bb17:  // pred: ^bb16
  %executable = hal.executable.create device(%__device_1_10 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_0::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb19(%executable : !hal.executable)
^bb18:  // pred: ^bb16
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb19(%1 : !hal.executable)
^bb19(%31: !hal.executable):  // 2 preds: ^bb17, ^bb18
  util.global.store %31, @__device_1_executable_0_main_dispatch_0 : !hal.executable
  cf.br ^bb20
^bb20:  // pred: ^bb19
  %__device_1_11 = util.global.load immutable @__device_1 : !hal.device
  %allocator = hal.device.allocator<%__device_1_11 : !hal.device> : !hal.allocator
  %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c8448] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
  cf.cond_br %did_import, ^bb22(%0, %mapped : !hal.fence, !hal.buffer), ^bb21
^bb21:  // pred: ^bb20
  %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c8448}
  %memory_file = hal.ex.file.from_memory device(%__device_1_11 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst : !util.buffer)[%c0 for %c8448] flags(%c0_i32) : !hal.file
  %fence = hal.fence.create device(%__device_1_11 : !hal.device) flags("None") : !hal.fence
  hal.device.queue.read<%__device_1_11 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) source(%memory_file : !hal.file)[%c0_i64] target(%buffer : !hal.buffer)[%c0] length(%c8448) flags("None")
  cf.br ^bb22(%fence, %buffer : !hal.fence, !hal.buffer)
^bb22(%32: !hal.fence, %33: !hal.buffer):  // 2 preds: ^bb20, ^bb21
  %status = hal.fence.await until([%32]) timeout_millis(%c-1_i32) flags("None") : i32
  util.status.check_ok %status, "failed to wait on timepoint"
  util.global.store %33, @__hoisted_tensor_64xf32 : !hal.buffer
  cf.br ^bb23
^bb23:  // pred: ^bb22
  %34 = util.call @__main_memoize_apply() : () -> !hal.command_buffer
  util.global.store %34, @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.return
}

