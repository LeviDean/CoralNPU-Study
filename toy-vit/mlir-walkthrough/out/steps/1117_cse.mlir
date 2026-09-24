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
  cf.cond_br %6, ^bb2(%1, %2 : index, index), ^bb5
^bb2(%7: index, %8: index):  // pred: ^bb1
  %device_n = hal.devices.get %7 : !hal.device
  %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "coralnpu") : i1, i1 = false
  cf.cond_br %value, ^bb3, ^bb4(%false : i1)
^bb3:  // pred: ^bb2
  %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  cf.br ^bb4(%value_1 : i1)
^bb4(%9: i1):  // 2 preds: ^bb2, ^bb3
  %10 = arith.cmpi eq, %8, %c0 : index
  %11 = arith.select %9, %c1, %c0 : index
  %12 = arith.addi %8, %11 : index
  %13 = arith.andi %9, %10 : i1
  %14 = arith.select %13, %device_n, %0 : !hal.device
  %15 = arith.addi %7, %c1 : index
  cf.br ^bb1(%15, %12, %14 : index, index, !hal.device)
^bb5:  // pred: ^bb1
  cf.cond_br %4, ^bb6, ^bb7
^bb6:  // pred: ^bb5
  util.status.check_ok %c18_i32, "HAL device `__device_1` not found or unavailable: #hal.device.target<\22coralnpu\22, [#hal.executable.target<\22coralnpu\22, \22embedded-elf-riscv_32\22, {cpu = \22\22, cpu_features = \22+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma\22, data_layout = \22e-m:e-p:32:32-i64:64-n32-S128\22, debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = \22ilp32\22, target_triple = \22riscv32-unknown-unknown-eabi-elf\22}>]>"
  cf.br ^bb7
^bb7:  // 2 preds: ^bb5, ^bb6
  util.global.store %3, @__device_1 : !hal.device
  util.return
}

