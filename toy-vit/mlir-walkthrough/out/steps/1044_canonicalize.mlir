util.initializer {
  %__device_1 = util.global.load @__device_1 : !hal.device
  %ok, %value = hal.device.query<%__device_1 : !hal.device> key("hal.executable.format" :: "embedded-elf-riscv_32") : i1, i1 = false
  util.global.store %ok, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32_ok : i1
  util.global.store %value, @__device_1_query_0_hal_executable_format_embedded_elf_riscv_32 : i1
  util.return
}

