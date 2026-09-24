#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1) -> ()>
#map4 = affine_map<(d0) -> ()>
#map5 = affine_map<(d0, d1) -> (d1)>
module {
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
    %1 = util.call @_main(%0) : (tensor<17x32xf32>) -> tensor<17x64xf32>
    %2 = hal.tensor.export %1 "output0" : tensor<17x64xf32> -> !hal.buffer_view
    util.return %2 : !hal.buffer_view
  }
  util.func private @_main(%arg0: tensor<17x32xf32>) -> tensor<17x64xf32> attributes {hal.abi.convention = #hal.abi.convention<synchronous>} {
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 0.797884523 : f32
    %cst_3 = arith.constant 4.471500e-02 : f32
    %cst_4 = arith.constant 0.000000e+00 : f32
    %cst_5 = arith.constant dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>
    %cst_6 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %0 = tensor.empty() : tensor<32x64xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_6 : tensor<64x32xf32>) outs(%0 : tensor<32x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %2 = tensor.empty() : tensor<17x64xf32>
    %3 = linalg.fill ins(%cst_4 : f32) outs(%2 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %4 = linalg.matmul ins(%arg0, %1 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %5 = tensor.empty() : tensor<1xf32>
    %6 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%5 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_1 : f32
    } -> tensor<1xf32>
    %collapsed = tensor.collapse_shape %6 [] : tensor<1xf32> into tensor<f32>
    %7 = tensor.empty() : tensor<17x64xf32>
    %8 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed : tensor<f32>) outs(%7 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %9 = tensor.empty() : tensor<17x64xf32>
    %10 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%4, %8 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%9 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %11 = tensor.empty() : tensor<64xf32>
    %12 = linalg.generic {indexing_maps = [#map4, #map2], iterator_types = ["parallel"]} ins(%collapsed : tensor<f32>) outs(%11 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64xf32>
    %13 = tensor.empty() : tensor<64xf32>
    %14 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel"]} ins(%12, %cst_5 : tensor<64xf32>, tensor<64xf32>) outs(%13 : tensor<64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<64xf32>
    %15 = tensor.empty() : tensor<17x64xf32>
    %16 = linalg.generic {indexing_maps = [#map5, #map1], iterator_types = ["parallel", "parallel"]} ins(%14 : tensor<64xf32>) outs(%15 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %17 = tensor.empty() : tensor<17x64xf32>
    %18 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%10, %16 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%17 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.addf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %19 = tensor.empty() : tensor<1xf32>
    %20 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%19 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_0 : f32
    } -> tensor<1xf32>
    %collapsed_7 = tensor.collapse_shape %20 [] : tensor<1xf32> into tensor<f32>
    %21 = tensor.empty() : tensor<17x64xf32>
    %22 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_7 : tensor<f32>) outs(%21 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %23 = tensor.empty() : tensor<17x64xf32>
    %24 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%18, %22 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%23 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %25 = tensor.empty() : tensor<1xf32>
    %26 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%25 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<1xf32>
    %collapsed_8 = tensor.collapse_shape %26 [] : tensor<1xf32> into tensor<f32>
    %27 = tensor.empty() : tensor<17x64xf32>
    %28 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_8 : tensor<f32>) outs(%27 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %29 = tensor.empty() : tensor<17x64xf32>
    %30 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%18, %28 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%29 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = math.powf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %31 = tensor.empty() : tensor<1xf32>
    %32 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%31 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_3 : f32
    } -> tensor<1xf32>
    %collapsed_9 = tensor.collapse_shape %32 [] : tensor<1xf32> into tensor<f32>
    %33 = tensor.empty() : tensor<17x64xf32>
    %34 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_9 : tensor<f32>) outs(%33 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %35 = tensor.empty() : tensor<17x64xf32>
    %36 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%30, %34 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%35 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %37 = tensor.empty() : tensor<17x64xf32>
    %38 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%18, %36 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%37 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.addf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %39 = tensor.empty() : tensor<1xf32>
    %40 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%39 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_2 : f32
    } -> tensor<1xf32>
    %collapsed_10 = tensor.collapse_shape %40 [] : tensor<1xf32> into tensor<f32>
    %41 = tensor.empty() : tensor<17x64xf32>
    %42 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_10 : tensor<f32>) outs(%41 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %43 = tensor.empty() : tensor<17x64xf32>
    %44 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%38, %42 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%43 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %45 = tensor.empty() : tensor<17x64xf32>
    %46 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%44 : tensor<17x64xf32>) outs(%45 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %55 = math.tanh %in : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %47 = tensor.empty() : tensor<1xf32>
    %48 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%47 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_1 : f32
    } -> tensor<1xf32>
    %collapsed_11 = tensor.collapse_shape %48 [] : tensor<1xf32> into tensor<f32>
    %49 = tensor.empty() : tensor<17x64xf32>
    %50 = linalg.generic {indexing_maps = [#map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%collapsed_11 : tensor<f32>) outs(%49 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %51 = tensor.empty() : tensor<17x64xf32>
    %52 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%46, %50 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%51 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.addf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    %53 = tensor.empty() : tensor<17x64xf32>
    %54 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%24, %52 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%53 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_12: f32, %out: f32):
      %55 = arith.mulf %in, %in_12 : f32
      linalg.yield %55 : f32
    } -> tensor<17x64xf32>
    util.return %54 : tensor<17x64xf32>
  }
}

{-#

#-}


