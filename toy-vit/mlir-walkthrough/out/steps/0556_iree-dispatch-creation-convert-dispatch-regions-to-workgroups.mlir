util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %cst = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
  %1 = flow.dispatch.workgroups(%0, %cst, %__hoisted_tensor_64xf32) : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32> attributes {stream.affinity = #hal.device.affinity<@__device_1>} =
      (%arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg4: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
    %3 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
    %4 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
    %5 = iree_tensor_ext.dispatch.tensor.load %arg3, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
    %6 = tensor.empty() : tensor<17x64xf32>
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 0.797884523 : f32
    %cst_3 = arith.constant 4.471500e-02 : f32
    %cst_4 = arith.constant 3.000000e+00 : f32
    %cst_5 = arith.constant 0.000000e+00 : f32
    %7 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_5 : f32) outs(%6 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %8 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%7 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8, %5 : tensor<17x64xf32>, tensor<64xf32>) outs(%6 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_6: f32, %out: f32):
      %10 = arith.addf %in, %in_6 : f32
      %11 = math.powf %10, %cst_4 : f32
      %12 = arith.mulf %11, %cst_3 : f32
      %13 = arith.addf %10, %12 : f32
      %14 = arith.mulf %13, %cst_2 : f32
      %15 = math.tanh %14 : f32
      %16 = arith.addf %15, %cst_1 : f32
      %17 = arith.mulf %10, %cst_0 : f32
      %18 = arith.mulf %17, %16 : f32
      linalg.yield %18 : f32
    } -> tensor<17x64xf32>
    iree_tensor_ext.dispatch.tensor.store %9, %arg4, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
    flow.return
  }
  %2 = hal.tensor.export %1 "output0" : tensor<17x64xf32> -> !hal.buffer_view
  util.return %2 : !hal.buffer_view
}

