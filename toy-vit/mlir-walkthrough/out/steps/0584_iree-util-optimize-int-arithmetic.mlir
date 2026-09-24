util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : tensor<64x32xf32>
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
  %1 = flow.dispatch @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%0, %__constant_tensor_64x32xf32, %__hoisted_tensor_64xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
  %2 = hal.tensor.export %1 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %2 : !hal.buffer_view
}

