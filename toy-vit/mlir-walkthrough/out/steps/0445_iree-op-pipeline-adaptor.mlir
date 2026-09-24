module attributes {iree.consteval, iree.fixedpoint.iteration = 0 : index} {
  util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
}

