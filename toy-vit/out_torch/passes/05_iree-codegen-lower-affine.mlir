util.initializer {
  %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|MappingScoped|MappingAccessRandom|Mapping"> : i32
  %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
  %buffer_usage_0 = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
  %c2304 = arith.constant 2304 : index
  %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<2304xi8, [
    dense_resource<__elided__> : tensor<32xf32>,
    dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>,
]>
  %0 = util.null : !hal.fence
  %c0_i64 = arith.constant 0 : i64
  %buffer_cst_1 = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<94336xi8, [
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
  %c94336 = arith.constant 94336 : index
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
  %ok_2, %value_3 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
  cf.br ^bb4(%value_3 : i1)
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
  %__device_0 = util.global.load @__device_0 : !hal.device
  %ok_4, %value_5 = hal.device.query<%__device_0 : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
  util.global.store %value_5, @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1
  %__device_0_query_0_hal_executable_format_embedded_elf_x86_64 = util.global.load @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1
  %__device_0_6 = util.global.load @__device_0 : !hal.device
  %16 = arith.select %__device_0_query_0_hal_executable_format_embedded_elf_x86_64, %c0, %c-1 : index
  %17 = arith.cmpi eq, %16, %c0 : index
  cf.cond_br %17, ^bb9, ^bb10
^bb9:  // pred: ^bb8
  %executable = hal.executable.create device(%__device_0_6 : !hal.device) affinity(%c-1_i64) target(@vit_linked::@embedded_elf_x86_64) : !hal.executable
  cf.br ^bb11(%executable : !hal.executable)
^bb10:  // pred: ^bb8
  util.status.check_ok %c14_i32, "HAL device `__device_0` does not support any variant of executable `vit_linked`; available formats: [embedded-elf-x86_64]"
  cf.br ^bb11(%1 : !hal.executable)
^bb11(%18: !hal.executable):  // 2 preds: ^bb9, ^bb10
  util.global.store %18, @__device_0_executable_0_vit_linked : !hal.executable
  cf.br ^bb12
^bb12:  // pred: ^bb11
  %device_count_7 = hal.devices.count : index
  cf.br ^bb13(%c0, %c0, %2 : index, index, !hal.device)
^bb13(%19: index, %20: index, %21: !hal.device):  // 2 preds: ^bb12, ^bb16
  %22 = util.cmp.eq %21, %2 : !hal.device
  %23 = arith.cmpi slt, %19, %device_count_7 : index
  %24 = arith.andi %22, %23 : i1
  cf.cond_br %24, ^bb14, ^bb17
^bb14:  // pred: ^bb13
  %device_n_8 = hal.devices.get %19 : !hal.device
  %ok_9, %value_10 = hal.device.query<%device_n_8 : !hal.device> key("hal.device.id" :: "coralnpu") : i1, i1 = false
  cf.cond_br %value_10, ^bb15, ^bb16(%false : i1)
^bb15:  // pred: ^bb14
  %ok_11, %value_12 = hal.device.query<%device_n_8 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  cf.br ^bb16(%value_12 : i1)
^bb16(%25: i1):  // 2 preds: ^bb14, ^bb15
  %26 = arith.cmpi eq, %20, %c0 : index
  %27 = arith.select %25, %c1, %c0 : index
  %28 = arith.addi %20, %27 : index
  %29 = arith.andi %25, %26 : i1
  %30 = arith.select %29, %device_n_8, %2 : !hal.device
  %31 = arith.addi %19, %c1 : index
  cf.br ^bb13(%31, %28, %30 : index, index, !hal.device)
^bb17:  // pred: ^bb13
  cf.cond_br %22, ^bb18, ^bb19
^bb18:  // pred: ^bb17
  util.status.check_ok %c18_i32, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
  cf.br ^bb19
^bb19:  // 2 preds: ^bb17, ^bb18
  util.global.store %21, @__device_1 : !hal.device
  cf.br ^bb20
^bb20:  // pred: ^bb19
  %__device_1 = util.global.load @__device_1 : !hal.device
  %ok_13, %value_14 = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  util.global.store %value_14, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 = util.global.load @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  %__device_1_15 = util.global.load @__device_1 : !hal.device
  %32 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
  %33 = arith.cmpi eq, %32, %c0 : index
  cf.cond_br %33, ^bb21, ^bb22
^bb21:  // pred: ^bb20
  %executable_16 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_1::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb23(%executable_16 : !hal.executable)
^bb22:  // pred: ^bb20
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_1`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb23(%1 : !hal.executable)
^bb23(%34: !hal.executable):  // 2 preds: ^bb21, ^bb22
  cf.cond_br %33, ^bb24, ^bb25
^bb24:  // pred: ^bb23
  %executable_17 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_5::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb26(%executable_17 : !hal.executable)
^bb25:  // pred: ^bb23
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_5`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb26(%1 : !hal.executable)
^bb26(%35: !hal.executable):  // 2 preds: ^bb24, ^bb25
  cf.cond_br %33, ^bb27, ^bb28
^bb27:  // pred: ^bb26
  %executable_18 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_6::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb29(%executable_18 : !hal.executable)
^bb28:  // pred: ^bb26
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_6`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb29(%1 : !hal.executable)
^bb29(%36: !hal.executable):  // 2 preds: ^bb27, ^bb28
  cf.cond_br %33, ^bb30, ^bb31
^bb30:  // pred: ^bb29
  %executable_19 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_7::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb32(%executable_19 : !hal.executable)
^bb31:  // pred: ^bb29
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_7`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb32(%1 : !hal.executable)
^bb32(%37: !hal.executable):  // 2 preds: ^bb30, ^bb31
  cf.cond_br %33, ^bb33, ^bb34
^bb33:  // pred: ^bb32
  %executable_20 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_8::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb35(%executable_20 : !hal.executable)
^bb34:  // pred: ^bb32
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_8`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb35(%1 : !hal.executable)
^bb35(%38: !hal.executable):  // 2 preds: ^bb33, ^bb34
  cf.cond_br %33, ^bb36, ^bb37
^bb36:  // pred: ^bb35
  %executable_21 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_9::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb38(%executable_21 : !hal.executable)
^bb37:  // pred: ^bb35
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_9`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb38(%1 : !hal.executable)
^bb38(%39: !hal.executable):  // 2 preds: ^bb36, ^bb37
  cf.cond_br %33, ^bb39, ^bb40
^bb39:  // pred: ^bb38
  %executable_22 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_10::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb41(%executable_22 : !hal.executable)
^bb40:  // pred: ^bb38
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_10`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb41(%1 : !hal.executable)
^bb41(%40: !hal.executable):  // 2 preds: ^bb39, ^bb40
  cf.cond_br %33, ^bb42, ^bb43
^bb42:  // pred: ^bb41
  %executable_23 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_13::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb44(%executable_23 : !hal.executable)
^bb43:  // pred: ^bb41
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_13`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb44(%1 : !hal.executable)
^bb44(%41: !hal.executable):  // 2 preds: ^bb42, ^bb43
  cf.cond_br %33, ^bb45, ^bb46
^bb45:  // pred: ^bb44
  %executable_24 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_14::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb47(%executable_24 : !hal.executable)
^bb46:  // pred: ^bb44
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_14`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb47(%1 : !hal.executable)
^bb47(%42: !hal.executable):  // 2 preds: ^bb45, ^bb46
  cf.cond_br %33, ^bb48, ^bb49
^bb48:  // pred: ^bb47
  %executable_25 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_26::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb50(%executable_25 : !hal.executable)
^bb49:  // pred: ^bb47
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_26`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb50(%1 : !hal.executable)
^bb50(%43: !hal.executable):  // 2 preds: ^bb48, ^bb49
  cf.cond_br %33, ^bb51, ^bb52
^bb51:  // pred: ^bb50
  %executable_26 = hal.executable.create device(%__device_1_15 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_32::@embedded_elf_riscv_32) : !hal.executable
  cf.br ^bb53(%executable_26 : !hal.executable)
^bb52:  // pred: ^bb50
  util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_32`; available formats: [embedded-elf-riscv_32]"
  cf.br ^bb53(%1 : !hal.executable)
^bb53(%44: !hal.executable):  // 2 preds: ^bb51, ^bb52
  util.global.store %34, @__device_1_executable_0_main_dispatch_1 : !hal.executable
  util.global.store %44, @__device_1_executable_10_main_dispatch_32 : !hal.executable
  util.global.store %35, @__device_1_executable_1_main_dispatch_5 : !hal.executable
  util.global.store %36, @__device_1_executable_2_main_dispatch_6 : !hal.executable
  util.global.store %37, @__device_1_executable_3_main_dispatch_7 : !hal.executable
  util.global.store %38, @__device_1_executable_4_main_dispatch_8 : !hal.executable
  util.global.store %39, @__device_1_executable_5_main_dispatch_9 : !hal.executable
  util.global.store %40, @__device_1_executable_6_main_dispatch_10 : !hal.executable
  util.global.store %41, @__device_1_executable_7_main_dispatch_13 : !hal.executable
  util.global.store %42, @__device_1_executable_8_main_dispatch_14 : !hal.executable
  util.global.store %43, @__device_1_executable_9_main_dispatch_26 : !hal.executable
  cf.br ^bb54
^bb54:  // pred: ^bb53
  %__device_0_27 = util.global.load immutable @__device_0 : !hal.device
  %allocator = hal.device.allocator<%__device_0_27 : !hal.device> : !hal.allocator
  %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c2304] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage_0) : i1, !hal.buffer
  cf.cond_br %did_import, ^bb56(%0, %mapped : !hal.fence, !hal.buffer), ^bb55
^bb55:  // pred: ^bb54
  %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage_0) : !hal.buffer{%c2304}
  %memory_file = hal.ex.file.from_memory device(%__device_0_27 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst : !util.buffer)[%c0 for %c2304] flags(%c0_i32) : !hal.file
  %fence = hal.fence.create device(%__device_0_27 : !hal.device) flags("None") : !hal.fence
  hal.device.queue.read<%__device_0_27 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) source(%memory_file : !hal.file)[%c0_i64] target(%buffer : !hal.buffer)[%c0] length(%c2304) flags("None")
  cf.br ^bb56(%fence, %buffer : !hal.fence, !hal.buffer)
^bb56(%45: !hal.fence, %46: !hal.buffer):  // 2 preds: ^bb54, ^bb55
  %__device_1_28 = util.global.load immutable @__device_1 : !hal.device
  %allocator_29 = hal.device.allocator<%__device_1_28 : !hal.device> : !hal.allocator
  %did_import_30, %mapped_31 = hal.allocator.import<%allocator_29 : !hal.allocator> source(%buffer_cst_1 : !util.buffer)[%c0, %c94336] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage_0) : i1, !hal.buffer
  cf.cond_br %did_import_30, ^bb58(%0, %mapped_31 : !hal.fence, !hal.buffer), ^bb57
^bb57:  // pred: ^bb56
  %buffer_32 = hal.allocator.allocate<%allocator_29 : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage_0) : !hal.buffer{%c94336}
  %memory_file_33 = hal.ex.file.from_memory device(%__device_1_28 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst_1 : !util.buffer)[%c0 for %c94336] flags(%c0_i32) : !hal.file
  %fence_34 = hal.fence.create device(%__device_1_28 : !hal.device) flags("None") : !hal.fence
  hal.device.queue.read<%__device_1_28 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence_34) source(%memory_file_33 : !hal.file)[%c0_i64] target(%buffer_32 : !hal.buffer)[%c0] length(%c94336) flags("None")
  cf.br ^bb58(%fence_34, %buffer_32 : !hal.fence, !hal.buffer)
^bb58(%47: !hal.fence, %48: !hal.buffer):  // 2 preds: ^bb56, ^bb57
  %status = hal.fence.await until([%45]) timeout_millis(%c-1_i32) flags("None") : i32
  util.status.check_ok %status, "failed to wait on timepoint"
  %status_35 = hal.fence.await until([%47]) timeout_millis(%c-1_i32) flags("None") : i32
  util.status.check_ok %status_35, "failed to wait on timepoint"
  util.global.store %48, @__hoisted_tensor_32xf32 : !hal.buffer
  util.global.store %46, @__hoisted_tensor_32xf32_2 : !hal.buffer
  cf.br ^bb59
^bb59:  // pred: ^bb58
  %49 = util.call @__main_memoize_apply() : () -> !hal.command_buffer
  util.global.store %49, @__main_memoize_result_0_device_0 : !hal.command_buffer
  %50 = util.call @__main_memoize_apply_0() : () -> !hal.command_buffer
  util.global.store %50, @__main_memoize_result_0_device_1 : !hal.command_buffer
  %51 = util.call @__main_memoize_apply_2() : () -> !hal.command_buffer
  util.global.store %51, @__main_memoize_result_0_device_0_3 : !hal.command_buffer
  %52 = util.call @__main_memoize_apply_5() : () -> !hal.command_buffer
  util.global.store %52, @__main_memoize_result_0_device_1_6 : !hal.command_buffer
  %53 = util.call @__main_memoize_apply_8() : () -> !hal.command_buffer
  util.global.store %53, @__main_memoize_result_0_device_0_9 : !hal.command_buffer
  %54 = util.call @__main_memoize_apply_11() : () -> !hal.command_buffer
  util.global.store %54, @__main_memoize_result_0_device_1_12 : !hal.command_buffer
  %55 = util.call @__main_memoize_apply_14() : () -> !hal.command_buffer
  util.global.store %55, @__main_memoize_result_0_device_0_15 : !hal.command_buffer
  %56 = util.call @__main_memoize_apply_17() : () -> !hal.command_buffer
  util.global.store %56, @__main_memoize_result_0_device_1_18 : !hal.command_buffer
  %57 = util.call @__main_memoize_apply_20() : () -> !hal.command_buffer
  util.global.store %57, @__main_memoize_result_0_device_0_21 : !hal.command_buffer
  %58 = util.call @__main_memoize_apply_23() : () -> !hal.command_buffer
  util.global.store %58, @__main_memoize_result_0_device_1_24 : !hal.command_buffer
  %59 = util.call @__main_memoize_apply_26() : () -> !hal.command_buffer
  util.global.store %59, @__main_memoize_result_0_device_0_27 : !hal.command_buffer
  %60 = util.call @__main_memoize_apply_29() : () -> !hal.command_buffer
  util.global.store %60, @__main_memoize_result_0_device_1_30 : !hal.command_buffer
  %__device_1_36 = util.global.load @__device_1 : !hal.device
  %__device_0_37 = util.global.load @__device_0 : !hal.device
  %device, %queue_affinity = hal.allocator.select from([
    (%__device_0_37, %c-1_i64 : !hal.device, i64),
    (%__device_1_36, %c-1_i64 : !hal.device, i64)
  ]) type(%memory_type) usage(%buffer_usage) : !hal.device, i64
  util.global.store %device, @__allocator_select_device : !hal.device
  util.return
}

