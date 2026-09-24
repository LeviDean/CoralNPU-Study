util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<64xf32>
  %1 = util.call @_jit_eval(%0) : (tensor<64xf32>) -> tensor<64xf32>
  %2 = hal.tensor.export %1 "output0" : tensor<64xf32> -> !hal.buffer_view
  util.return %2 : !hal.buffer_view
}

