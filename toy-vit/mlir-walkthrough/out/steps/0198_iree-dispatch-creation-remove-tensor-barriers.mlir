util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<64xf32>
  %1 = hal.tensor.export %0 "output0" : tensor<64xf32> -> !hal.buffer_view
  util.return %1 : !hal.buffer_view
}

