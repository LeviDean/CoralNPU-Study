util.func private @_jit_eval(%arg0: tensor<64xf32>) -> tensor<64xf32> attributes {hal.abi.convention = #hal.abi.convention<synchronous>} {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = tensor.empty() : tensor<64xf32>
  %1 = tensor.empty() : tensor<f32>
  %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<f32>) -> tensor<f32>
  %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%2 : tensor<f32>) outs(%0 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<64xf32>
  %4 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%3, %arg0 : tensor<64xf32>, tensor<64xf32>) outs(%0 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_0: f32, %out: f32):
    %5 = arith.mulf %in, %in_0 : f32
    linalg.yield %5 : f32
  } -> tensor<64xf32>
  util.return %4 : tensor<64xf32>
}

