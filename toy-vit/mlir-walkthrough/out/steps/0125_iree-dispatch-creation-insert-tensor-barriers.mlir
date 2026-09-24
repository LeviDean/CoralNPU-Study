util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<64xf32>
  %1 = iree_tensor_ext.compute_barrier.start %0 : tensor<64xf32> -> tensor<64xf32>
  %2 = tensor.empty() : tensor<64xf32>
  %3 = tensor.empty() : tensor<f32>
  %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<f32>) -> tensor<f32>
  %5 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%4 : tensor<f32>) outs(%2 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<64xf32>
  %6 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%5, %1 : tensor<64xf32>, tensor<64xf32>) outs(%2 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_0: f32, %out: f32):
    %9 = arith.mulf %in, %in_0 : f32
    linalg.yield %9 : f32
  } -> tensor<64xf32>
  %7 = iree_tensor_ext.compute_barrier.end %6 : tensor<64xf32> -> tensor<64xf32>
  %8 = hal.tensor.export %7 "output0" : tensor<64xf32> -> !hal.buffer_view
  util.return %8 : !hal.buffer_view
}

