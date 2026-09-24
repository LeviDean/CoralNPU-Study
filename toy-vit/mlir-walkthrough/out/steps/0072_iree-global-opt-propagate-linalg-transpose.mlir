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
  %2 = tensor.empty() : tensor<17x64xf32>
  %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_1 : f32) outs(%2 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %4 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%1, %cst : tensor<17x32xf32>, tensor<64x32xf32>) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %5 = tensor.empty() : tensor<f32>
  %6 = linalg.fill ins(%cst_4 : f32) outs(%5 : tensor<f32>) -> tensor<f32>
  %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%6 : tensor<f32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4, %7 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %9 = tensor.empty() : tensor<64xf32>
  %10 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%6 : tensor<f32>) outs(%9 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<64xf32>
  %11 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%10, %cst_0 : tensor<64xf32>, tensor<64xf32>) outs(%9 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<64xf32>
  %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%11 : tensor<64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %13 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8, %12 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.addf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %14 = linalg.fill ins(%cst_5 : f32) outs(%5 : tensor<f32>) -> tensor<f32>
  %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%14 : tensor<f32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %16 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%13, %15 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %17 = linalg.fill ins(%cst_6 : f32) outs(%5 : tensor<f32>) -> tensor<f32>
  %18 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%17 : tensor<f32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %19 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%13, %18 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = math.powf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %20 = linalg.fill ins(%cst_2 : f32) outs(%5 : tensor<f32>) -> tensor<f32>
  %21 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%20 : tensor<f32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %22 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%19, %21 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%13, %22 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.addf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %24 = linalg.fill ins(%cst_3 : f32) outs(%5 : tensor<f32>) -> tensor<f32>
  %25 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%24 : tensor<f32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x64xf32>
  %26 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%23, %25 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %27 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%26 : tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %32 = math.tanh %in : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %28 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%27, %7 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.addf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %29 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%16, %28 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%2 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_7: f32, %out: f32):
    %32 = arith.mulf %in, %in_7 : f32
    linalg.yield %32 : f32
  } -> tensor<17x64xf32>
  %30 = iree_tensor_ext.compute_barrier.end %29 : tensor<17x64xf32> -> tensor<17x64xf32>
  %31 = hal.tensor.export %30 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %31 : !hal.buffer_view
}

