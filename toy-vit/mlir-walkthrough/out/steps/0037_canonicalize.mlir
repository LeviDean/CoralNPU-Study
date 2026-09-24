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
  %2 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<64x32xf32>) outs(%1 : tensor<32x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<32x64xf32>
  %3 = tensor.empty() : tensor<17x64xf32>
  %4 = linalg.fill ins(%cst_1 : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %5 = linalg.matmul ins(%0, %2 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %6 = tensor.empty() : tensor<1xf32>
  %7 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%6 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_4 : f32
  } -> tensor<1xf32>
  %collapsed = tensor.collapse_shape %7 [] : tensor<1xf32> into tensor<f32>
  %8 = tensor.empty() : tensor<17x64xf32>
  %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed : tensor<f32>) outs(%8 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %10 = tensor.empty() : tensor<17x64xf32>
  %11 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %9 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%10 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %12 = tensor.empty() : tensor<64xf32>
  %13 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%collapsed : tensor<f32>) outs(%12 : tensor<64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<64xf32>
  %14 = tensor.empty() : tensor<64xf32>
  %15 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%13, %cst_0 : tensor<64xf32>, tensor<64xf32>) outs(%14 : tensor<64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<64xf32>
  %16 = tensor.empty() : tensor<17x64xf32>
  %17 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15 : tensor<64xf32>) outs(%16 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %18 = tensor.empty() : tensor<17x64xf32>
  %19 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%11, %17 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%18 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.addf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %20 = tensor.empty() : tensor<1xf32>
  %21 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%20 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_5 : f32
  } -> tensor<1xf32>
  %collapsed_7 = tensor.collapse_shape %21 [] : tensor<1xf32> into tensor<f32>
  %22 = tensor.empty() : tensor<17x64xf32>
  %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_7 : tensor<f32>) outs(%22 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %24 = tensor.empty() : tensor<17x64xf32>
  %25 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%19, %23 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%24 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %26 = tensor.empty() : tensor<1xf32>
  %27 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%26 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_6 : f32
  } -> tensor<1xf32>
  %collapsed_8 = tensor.collapse_shape %27 [] : tensor<1xf32> into tensor<f32>
  %28 = tensor.empty() : tensor<17x64xf32>
  %29 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_8 : tensor<f32>) outs(%28 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %30 = tensor.empty() : tensor<17x64xf32>
  %31 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%19, %29 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%30 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = math.powf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %32 = tensor.empty() : tensor<1xf32>
  %33 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%32 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_2 : f32
  } -> tensor<1xf32>
  %collapsed_9 = tensor.collapse_shape %33 [] : tensor<1xf32> into tensor<f32>
  %34 = tensor.empty() : tensor<17x64xf32>
  %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_9 : tensor<f32>) outs(%34 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %36 = tensor.empty() : tensor<17x64xf32>
  %37 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%36 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %38 = tensor.empty() : tensor<17x64xf32>
  %39 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%19, %37 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%38 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.addf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %40 = tensor.empty() : tensor<1xf32>
  %41 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%40 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_3 : f32
  } -> tensor<1xf32>
  %collapsed_10 = tensor.collapse_shape %41 [] : tensor<1xf32> into tensor<f32>
  %42 = tensor.empty() : tensor<17x64xf32>
  %43 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_10 : tensor<f32>) outs(%42 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %44 = tensor.empty() : tensor<17x64xf32>
  %45 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%39, %43 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%44 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %46 = tensor.empty() : tensor<17x64xf32>
  %47 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%45 : tensor<17x64xf32>) outs(%46 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    %57 = math.tanh %in : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %48 = tensor.empty() : tensor<1xf32>
  %49 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%48 : tensor<1xf32>) {
  ^bb0(%out: f32):
    linalg.yield %cst_4 : f32
  } -> tensor<1xf32>
  %collapsed_11 = tensor.collapse_shape %49 [] : tensor<1xf32> into tensor<f32>
  %50 = tensor.empty() : tensor<17x64xf32>
  %51 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_11 : tensor<f32>) outs(%50 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %52 = tensor.empty() : tensor<17x64xf32>
  %53 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%47, %51 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%52 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.addf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %54 = tensor.empty() : tensor<17x64xf32>
  %55 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%25, %53 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%54 : tensor<17x64xf32>) {
  ^bb0(%in: f32, %in_12: f32, %out: f32):
    %57 = arith.mulf %in, %in_12 : f32
    linalg.yield %57 : f32
  } -> tensor<17x64xf32>
  %56 = hal.tensor.export %55 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %56 : !hal.buffer_view
}

