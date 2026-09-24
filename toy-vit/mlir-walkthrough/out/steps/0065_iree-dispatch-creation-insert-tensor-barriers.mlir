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
  %1 = iree_tensor_ext.compute_barrier.start %0 : tensor<17x32xf32> -> tensor<17x32xf32>
  %2 = tensor.empty() : tensor<32x64xf32>
  %3 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<64x32xf32>) outs(%2 : tensor<32x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<32x64xf32>
  %4 = tensor.empty() : tensor<17x64xf32>
  %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_1 : f32) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %6 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%1, %3 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%5 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %7 = tensor.empty() : tensor<1xf32>
  %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_4 : f32) outs(%7 : tensor<1xf32>) -> tensor<1xf32>
  %collapsed = tensor.collapse_shape %8 [] : tensor<1xf32> into tensor<f32>
  %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed : tensor<f32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%6, %9 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %11 = tensor.empty() : tensor<64xf32>
  %12 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%collapsed : tensor<f32>) outs(%11 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<64xf32>
  %13 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%12, %cst_0 : tensor<64xf32>, tensor<64xf32>) outs(%11 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<64xf32>
  %14 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%13 : tensor<64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%10, %14 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.addf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %16 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_5 : f32) outs(%7 : tensor<1xf32>) -> tensor<1xf32>
  %collapsed_7 = tensor.collapse_shape %16 [] : tensor<1xf32> into tensor<f32>
  %17 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_7 : tensor<f32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %18 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %17 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %19 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_6 : f32) outs(%7 : tensor<1xf32>) -> tensor<1xf32>
  %collapsed_8 = tensor.collapse_shape %19 [] : tensor<1xf32> into tensor<f32>
  %20 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_8 : tensor<f32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %21 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %20 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = math.powf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %22 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_2 : f32) outs(%7 : tensor<1xf32>) -> tensor<1xf32>
  %collapsed_9 = tensor.collapse_shape %22 [] : tensor<1xf32> into tensor<f32>
  %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_9 : tensor<f32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %24 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%21, %23 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %25 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %24 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.addf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %26 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_3 : f32) outs(%7 : tensor<1xf32>) -> tensor<1xf32>
  %collapsed_10 = tensor.collapse_shape %26 [] : tensor<1xf32> into tensor<f32>
  %27 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_10 : tensor<f32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %28 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%25, %27 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %29 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%28 : tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %34 = math.tanh %in : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %30 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%29, %9 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.addf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %31 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%18, %30 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%4 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_11: f32, %out: f32):
    %34 = arith.mulf %in, %in_11 : f32
    linalg.yield %34 : f32
  } -> tensor<17x64xf32>
  %32 = iree_tensor_ext.compute_barrier.end %31 : tensor<17x64xf32> -> tensor<17x64xf32>
  %33 = hal.tensor.export %32 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %33 : !hal.buffer_view
}

