util.initializer {
  %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 = util.global.load @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  %__device_1 = util.global.load @__device_1 : !hal.device
  %0 = util.null : !hal.executable
  %c14_i32 = arith.constant 14 : i32
  %c0 = arith.constant 0 : index
  %c-1 = arith.constant -1 : index
  %c-1_i64 = arith.constant -1 : i64
  %1 = arith.select %__device_1_query_0_hal_executable_format_embedded_elf_riscv_32, %c0, %c-1 : index
  %2 = scf.index_switch %1 -> !hal.executable 
  case 0 {
    %executable = hal.executable.create device(%__device_1 : !hal.device) affinity(%c-1_i64) target(@main_dispatch_0::@embedded_elf_riscv_32) : !hal.executable
    scf.yield %executable : !hal.executable
  }
  default {
    util.status.check_ok %c14_i32, "HAL device `__device_1` does not support any variant of executable `main_dispatch_0`; available formats: [embedded-elf-riscv_32]"
    scf.yield %0 : !hal.executable
  }
  util.global.store %2, @__device_1_executable_0_main_dispatch_0 : !hal.executable
  util.return
}

