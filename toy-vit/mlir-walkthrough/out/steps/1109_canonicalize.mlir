util.func private @__main_memoize_lookup(%arg0: !hal.device, %arg1: i64) -> !hal.command_buffer {
  %0 = util.null : !hal.command_buffer
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %1 = util.cmp.eq %arg0, %__device_1 : !hal.device
  cf.cond_br %1, ^bb1, ^bb2(%0 : !hal.command_buffer)
^bb1:  // pred: ^bb0
  %__main_memoize_result_0_device_1 = util.global.load immutable @__main_memoize_result_0_device_1 : !hal.command_buffer
  cf.br ^bb2(%__main_memoize_result_0_device_1 : !hal.command_buffer)
^bb2(%2: !hal.command_buffer):  // 2 preds: ^bb0, ^bb1
  util.return %2 : !hal.command_buffer
}

