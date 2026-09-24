util.func private @__main_memoize_lookup() -> !hal.command_buffer {
  %__main_memoize_result_0_device_1 = util.global.load immutable @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.return %__main_memoize_result_0_device_1 : !hal.command_buffer
}

