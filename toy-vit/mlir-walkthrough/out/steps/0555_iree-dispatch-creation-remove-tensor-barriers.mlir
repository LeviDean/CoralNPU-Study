util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %cst = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
  %1 = flow.dispatch.region -> (tensor<17x64xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %3 = tensor.empty() : tensor<17x64xf32>
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 0.797884523 : f32
    %cst_3 = arith.constant 4.471500e-02 : f32
    %cst_4 = arith.constant 3.000000e+00 : f32
    %cst_5 = arith.constant 0.000000e+00 : f32
    %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_5 : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %5 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %cst : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %__hoisted_tensor_64xf32 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_6: f32, %out: f32):
      %7 = arith.addf %in, %in_6 : f32
      %8 = math.powf %7, %cst_4 : f32
      %9 = arith.mulf %8, %cst_3 : f32
      %10 = arith.addf %7, %9 : f32
      %11 = arith.mulf %10, %cst_2 : f32
      %12 = math.tanh %11 : f32
      %13 = arith.addf %12, %cst_1 : f32
      %14 = arith.mulf %7, %cst_0 : f32
      %15 = arith.mulf %14, %13 : f32
      linalg.yield %15 : f32
    } -> tensor<17x64xf32>
    flow.return %6 : tensor<17x64xf32>
  }
  %2 = hal.tensor.export %1 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %2 : !hal.buffer_view
}

