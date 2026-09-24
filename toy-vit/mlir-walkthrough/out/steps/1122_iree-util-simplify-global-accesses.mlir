util.initializer {
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !hal.buffer
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %c-1_i64 = arith.constant -1 : i64
  %0 = util.call @__main_memoize_apply(%__device_1, %c-1_i64, %__hoisted_tensor_64xf32) : (!hal.device, i64, !hal.buffer) -> !hal.command_buffer
  util.global.store %0, @__main_memoize_result_0_device_1 : !hal.command_buffer
  util.return
}

