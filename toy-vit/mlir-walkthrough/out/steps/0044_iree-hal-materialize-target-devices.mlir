#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1) -> ()>
#map4 = affine_map<(d0) -> ()>
#map5 = affine_map<(d0, d1) -> (d1)>
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.alias<"local"> : !hal.device
  util.global private @__device_1 = #hal.device.alias<"coralnpu"> : !hal.device
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %cst = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %cst_0 = arith.constant dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %cst_2 = arith.constant 4.471500e-02 : f32
    %cst_3 = arith.constant 0.797884523 : f32
    %cst_4 = arith.constant 1.000000e+00 : f32
    %cst_5 = arith.constant 5.000000e-01 : f32
    %cst_6 = arith.constant 3.000000e+00 : f32
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
    %1 = tensor.empty() : tensor<32x64xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<64x32xf32>) outs(%1 : tensor<32x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %3 = tensor.empty() : tensor<17x64xf32>
    %4 = linalg.fill ins(%cst_1 : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %5 = linalg.matmul ins(%0, %2 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %6 = tensor.empty() : tensor<1xf32>
    %7 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_4 : f32
    } -> tensor<1xf32>
    %collapsed = tensor.collapse_shape %7 [] : tensor<1xf32> into tensor<f32>
    %8 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed : tensor<f32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %9 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%5, %8 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %10 = tensor.empty() : tensor<64xf32>
    %11 = linalg.generic {indexing_maps = [#map4, #map2], iterator_types = ["parallel"]} ins(%collapsed : tensor<f32>) outs(%10 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64xf32>
    %12 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel"]} ins(%11, %cst_0 : tensor<64xf32>, tensor<64xf32>) outs(%10 : tensor<64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<64xf32>
    %13 = linalg.generic {indexing_maps = [#map5, #map1], iterator_types = ["parallel", "parallel"]} ins(%12 : tensor<64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %14 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%9, %13 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.addf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %15 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_5 : f32
    } -> tensor<1xf32>
    %collapsed_7 = tensor.collapse_shape %15 [] : tensor<1xf32> into tensor<f32>
    %16 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_7 : tensor<f32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %17 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%14, %16 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %18 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_6 : f32
    } -> tensor<1xf32>
    %collapsed_8 = tensor.collapse_shape %18 [] : tensor<1xf32> into tensor<f32>
    %19 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_8 : tensor<f32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %20 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%14, %19 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = math.powf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %21 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_2 : f32
    } -> tensor<1xf32>
    %collapsed_9 = tensor.collapse_shape %21 [] : tensor<1xf32> into tensor<f32>
    %22 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_9 : tensor<f32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %23 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%20, %22 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %24 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%14, %23 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.addf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %25 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_3 : f32
    } -> tensor<1xf32>
    %collapsed_10 = tensor.collapse_shape %25 [] : tensor<1xf32> into tensor<f32>
    %26 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_10 : tensor<f32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %27 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%24, %26 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %28 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%27 : tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %32 = math.tanh %in : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %29 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%28, %8 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.addf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %30 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%17, %29 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%3 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_11: f32, %out: f32):
      %32 = arith.mulf %in, %in_11 : f32
      linalg.yield %32 : f32
    } -> tensor<17x64xf32>
    %31 = hal.tensor.export %30 "output0" : tensor<17x64xf32> -> !hal.buffer_view
    util.return %31 : !hal.buffer_view
  }
}

{-#

#-}


