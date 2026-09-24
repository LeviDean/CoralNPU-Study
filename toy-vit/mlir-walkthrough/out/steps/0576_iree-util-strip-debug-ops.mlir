flow.executable private @main_dispatch_0 {
  flow.executable.export public @main_dispatch_0_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
    %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
    flow.return %x, %y, %z : index, index, index
  } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
  builtin.module {
    func.func @main_dispatch_0_matmul_17x64x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant 3.000000e+00 : f32
      %cst_1 = arith.constant 4.471500e-02 : f32
      %cst_2 = arith.constant 0.797884523 : f32
      %cst_3 = arith.constant 1.000000e+00 : f32
      %cst_4 = arith.constant 5.000000e-01 : f32
      %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
      %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
      %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
      %3 = tensor.empty() : tensor<17x64xf32>
      %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %5 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
      ^bb0(%in: f32, %in_5: f32, %out: f32):
        %7 = arith.addf %in, %in_5 : f32
        %8 = math.powf %7, %cst_0 : f32
        %9 = arith.mulf %8, %cst_1 : f32
        %10 = arith.addf %7, %9 : f32
        %11 = arith.mulf %10, %cst_2 : f32
        %12 = math.tanh %11 : f32
        %13 = arith.addf %12, %cst_3 : f32
        %14 = arith.mulf %7, %cst_4 : f32
        %15 = arith.mulf %14, %13 : f32
        linalg.yield %15 : f32
      } -> tensor<17x64xf32>
      iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
      return
    }
  }
}

