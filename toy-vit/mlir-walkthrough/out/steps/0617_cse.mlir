util.initializer {
  %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %0 = stream.resource.size %cst : !stream.resource<constant>
  util.global.store %cst, @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global.store %0, @__constant_tensor_64x32xf32__size : index
  util.return
}

