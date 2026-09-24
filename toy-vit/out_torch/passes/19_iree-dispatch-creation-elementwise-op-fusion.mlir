util.func public @jit_eval_0(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_0(%input0: tensor<1x1x32xf32>) -> (%output0: tensor<1x17x32xf32>)"}} {
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x1x32xf32>
  %1 = tensor.empty() : tensor<1x17x32xf32>
  %collapsed = tensor.collapse_shape %0 [[0, 1, 2]] : tensor<1x1x32xf32> into tensor<32xf32>
  %2 = iree_tensor_ext.compute_barrier.start %collapsed : tensor<32xf32> -> tensor<32xf32>
  %inserted_slice = tensor.insert_slice %2 into %1[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<32xf32> into tensor<1x17x32xf32>
  %3 = iree_tensor_ext.compute_barrier.end %inserted_slice : tensor<1x17x32xf32> -> tensor<1x17x32xf32>
  %4 = hal.tensor.export %3 "output0" : tensor<1x17x32xf32> -> !hal.buffer_view
  util.return %4 : !hal.buffer_view
}

