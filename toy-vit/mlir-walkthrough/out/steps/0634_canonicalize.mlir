util.initializer {
  %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<64xf32>
  %0 = stream.resource.size %cst : !stream.resource<constant>
  util.global.store %cst, @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.global.store %0, @__hoisted_tensor_64xf32__size : index
  %cst_0 = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %1 = stream.resource.size %cst_0 : !stream.resource<constant>
  util.global.store %cst_0, @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global.store %1, @__constant_tensor_64x32xf32__size : index
  util.return
}

