util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<64xf32>
  %1 = iree_tensor_ext.compute_barrier.start %0 : tensor<64xf32> -> tensor<64xf32>
  %2 = iree_tensor_ext.compute_barrier.end %1 : tensor<64xf32> -> tensor<64xf32>
  %3 = hal.tensor.export %2 "output0" : tensor<64xf32> -> !hal.buffer_view
  util.return %3 : !hal.buffer_view
}

