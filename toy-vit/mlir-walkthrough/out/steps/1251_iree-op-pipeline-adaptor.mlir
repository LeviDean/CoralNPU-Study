#composite_of_8448b = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
module attributes {iree.fixedpoint.iteration = 3 : index, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 : !hal.device
  util.initializer {
    %c18_i32 = arith.constant 18 : i32
    %false = arith.constant false
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = util.null : !hal.device
    %device_count = hal.devices.count : index
    cf.br ^bb1(%c0, %c0, %0 : index, index, !hal.device)
  ^bb1(%1: index, %2: index, %3: !hal.device):  // 2 preds: ^bb0, ^bb4
    %4 = util.cmp.eq %3, %0 : !hal.device
    %5 = arith.cmpi slt, %1, %device_count : index
    %6 = arith.andi %4, %5 : i1
    cf.cond_br %6, ^bb2, ^bb5
  ^bb2:  // pred: ^bb1
    %device_n = hal.devices.get %1 : !hal.device
    %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "local*") : i1, i1 = false
    cf.cond_br %value, ^bb3, ^bb4(%false : i1)
  ^bb3:  // pred: ^bb2
    %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false
    cf.br ^bb4(%value_1 : i1)
  ^bb4(%7: i1):  // 2 preds: ^bb2, ^bb3
    %8 = arith.cmpi eq, %2, %c0 : index
    %9 = arith.select %7, %c1, %c0 : index
    %10 = arith.addi %2, %9 : index
    %11 = arith.andi %7, %8 : i1
    %12 = arith.select %11, %device_n, %0 : !hal.device
    %13 = arith.addi %1, %c1 : index
    cf.br ^bb1(%13, %10, %12 : index, index, !hal.device)
  ^bb5:  // pred: ^bb1
    cf.cond_br %4, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    util.status.check_ok %c18_i32, "HAL device `__device_0` not found or unavailable: #hal.device.target<\22local\22, [#hal.executable.target<\22llvm-cpu\22, \22embedded-elf-x86_64\22, {cpu = \22westmere\22, cpu_features = \22+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu\22, data_layout = \22e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128\22, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = \22x86_64-unknown-unknown-eabi-elf\22}>]>"
    cf.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    util.global.store %3, @__device_0 : !hal.device
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
    cf.br ^bb1(%c0, %c0, %0 : index, index, !hal.device)
  ^bb1(%1: index, %2: index, %3: !hal.device):  // 2 preds: ^bb0, ^bb4
    %4 = util.cmp.eq %3, %0 : !hal.device
    %5 = arith.cmpi slt, %1, %device_count : index
    %6 = arith.andi %4, %5 : i1
    cf.cond_br %6, ^bb2, ^bb5
  ^bb2:  // pred: ^bb1
    %device_n = hal.devices.get %1 : !hal.device
    %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "coralnpu") : i1, i1 = false
    cf.cond_br %value, ^bb3, ^bb4(%false : i1)
  ^bb3:  // pred: ^bb2
    %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
    cf.br ^bb4(%value_1 : i1)
  ^bb4(%7: i1):  // 2 preds: ^bb2, ^bb3
    %8 = arith.cmpi eq, %2, %c0 : index
    %9 = arith.select %7, %c1, %c0 : index
    %10 = arith.addi %2, %9 : index
    %11 = arith.andi %7, %8 : i1
    %12 = arith.select %11, %device_n, %0 : !hal.device
    %13 = arith.addi %1, %c1 : index
    cf.br ^bb1(%13, %10, %12 : index, index, !hal.device)
  ^bb5:  // pred: ^bb1
    cf.cond_br %4, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    util.status.check_ok %c18_i32, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
    cf.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    util.global.store %3, @__device_1 : !hal.device
    util.return
  }
  util.global private @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  util.initializer {
    %__device_1 = util.global.load @__device_1 : !hal.device
    %ok, %value = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
    util.global.store %value, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
    util.return
  }
  util.global private @__device_1_executable_0_main_dispatch_0 : !hal.executable
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
    cf.cond_br %2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_0::@embedded_elf_riscv_32) : !hal.executable
    cf.br ^bb3(%executable : !hal.executable)
  ^bb2:  // pred: ^bb0
    util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
    cf.br ^bb3(%0 : !hal.executable)
  ^bb3(%3: !hal.executable):  // 2 preds: ^bb1, ^bb2
    util.global.store %3, @__device_1_executable_0_main_dispatch_0 : !hal.executable
    util.return
  }
  util.global private @__hoisted_tensor_64xf32 : !hal.buffer
  util.initializer {
    %c-1_i32 = arith.constant -1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c-1_i64 = arith.constant -1 : i64
    %c0 = arith.constant 0 : index
    %c0_i64 = arith.constant 0 : i64
    %0 = util.null : !hal.fence
    %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #composite_of_8448b
    %c8448 = arith.constant 8448 : index
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
    %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c8448] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
    cf.cond_br %did_import, ^bb2(%0, %mapped : !hal.fence, !hal.buffer), ^bb1
  ^bb1:  // pred: ^bb0
    %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c8448}
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
    hal.executable.binary public @embedded_elf_riscv_32 attributes {data = dense_resource<__elided__> : vector<13796xi8>, format = "embedded-elf-riscv_32", mime_type = "application/x-elf"}
  }
  util.func private @__main_memoize_apply() -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c-1_i64 = arith.constant -1 : i64
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2176 = arith.constant 2176 : index
    %c8448 = arith.constant 8448 : index
    %c4352 = arith.constant 4352 : index
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !hal.buffer
    %__device_1_executable_0_main_dispatch_0 = util.global.load immutable @__device_1_executable_0_main_dispatch_0 : !hal.executable
    %cmd = hal.command_buffer.create device(%__device_1 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%c-1_i64) bindings(%c2) : !hal.command_buffer
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_0_main_dispatch_0 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c2176], 
      (%__hoisted_tensor_64xf32 : !hal.buffer)[%c0, %c8448], 
      (%c1 : index)[%c0, %c4352]
    ]) flags("None")
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    util.return %cmd : !hal.command_buffer
  }
  util.global private @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.initializer {
    %0 = util.call @__main_memoize_apply() : () -> !hal.command_buffer
    util.global.store %0, @__main_memoize_result_0_device_1 : !hal.command_buffer
    util.return
  }
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %c64 = arith.constant 64 : index
    %c-1_i32 = arith.constant -1 : i32
    %c0_i64 = arith.constant 0 : i64
    %0 = util.null : !hal.fence
    %c-1_i64 = arith.constant -1 : i64
    %c17 = arith.constant 17 : index
    %c32 = arith.constant 32 : index
    %c2176 = arith.constant 2176 : index
    %c4352 = arith.constant 4352 : index
    %c0 = arith.constant 0 : index
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage"> : i32
    %__device_1 = util.global.load immutable @__device_1 : !hal.device
    %__main_memoize_result_0_device_1 = util.global.load immutable @__main_memoize_result_0_device_1 : !hal.command_buffer
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
    %buffer = hal.buffer_view.buffer<%arg0 : !hal.buffer_view> : !hal.buffer
    %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
    hal.buffer.assert<%buffer : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c2176) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage")
    %fence = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    %transient_buffer = hal.device.queue.alloca<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c4352}
    %fence_0 = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute.indirect<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%fence) signal(%fence_0) commands(%__main_memoize_result_0_device_1) bindings([
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


