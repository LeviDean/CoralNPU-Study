util.initializer {
  %c8192 = arith.constant 8192 : index
  %c256 = arith.constant 256 : index
  %cst = stream.async.constant on(#hal.device.affinity<@__device_1>) : !stream.resource<constant>{%c256} = dense_resource<__elided__> : tensor<64xf32>
  %cst_0 = stream.async.constant on(#hal.device.affinity<@__device_1>) : !stream.resource<constant>{%c8192} = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  util.global.store %cst_0, @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global.store %cst, @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.return
}

