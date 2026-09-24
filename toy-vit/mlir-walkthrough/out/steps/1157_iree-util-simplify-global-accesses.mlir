util.initializer {
  %0 = util.call @__main_memoize_apply() : () -> !hal.command_buffer
  util.global.store %0, @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.return
}

