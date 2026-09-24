util.func private @__main_memoize_lookup() -> !hal.command_buffer {
  %0 = util.null : !hal.command_buffer
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %__main_memoize_result_0_device_1 = util.global.load immutable @__main_memoize_result_0_device_1 : !hal.command_buffer
  %1 = util.cmp.eq %__device_1, %__device_1 : !hal.device
  %2 = arith.select %1, %__main_memoize_result_0_device_1, %0 : !hal.command_buffer
  util.return %2 : !hal.command_buffer
}

