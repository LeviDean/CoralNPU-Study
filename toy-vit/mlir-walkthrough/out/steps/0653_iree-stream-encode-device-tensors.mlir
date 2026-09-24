stream.executable private @main_dispatch_0 {
  stream.executable.export public @main_dispatch_0_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
    %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
    stream.return %x, %y, %z : index, index, index
  } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
  builtin.module {
    func.func @main_dispatch_0_matmul_17x64x32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding) {
      %cst = arith.constant 5.000000e-01 : f32
      %cst_0 = arith.constant 1.000000e+00 : f32
      %cst_1 = arith.constant 0.797884523 : f32
      %cst_2 = arith.constant 4.471500e-02 : f32
      %cst_3 = arith.constant 3.000000e+00 : f32
      %cst_4 = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
      %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>
      %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>
      %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
      %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
      %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
      %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
      %7 = tensor.empty() : tensor<17x64xf32>
      %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_4 : f32) outs(%7 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %9 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %5 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%8 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%9, %6 : tensor<17x64xf32>, tensor<64xf32>) outs(%7 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
      ^bb0(%in: f32, %in_5: f32, %out: f32):
        %11 = arith.addf %in, %in_5 : f32
        %12 = math.powf %11, %cst_3 : f32
        %13 = arith.mulf %12, %cst_2 : f32
        %14 = arith.addf %11, %13 : f32
        %15 = arith.mulf %14, %cst_1 : f32
        %16 = math.tanh %15 : f32
        %17 = arith.addf %16, %cst_0 : f32
        %18 = arith.mulf %11, %cst : f32
        %19 = arith.mulf %18, %17 : f32
        linalg.yield %19 : f32
      } -> tensor<17x64xf32>
      iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
      return
    }
  }
}

