module {
  func.func @main_dispatch_13_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 0.797884523 : f32
    %cst_2 = arith.constant 4.471500e-02 : f32
    %cst_3 = arith.constant 3.000000e+00 : f32
    %cst_4 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
    %1 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
    %2 = arith.index_castui %0 : i32 to index
    %3 = arith.index_castui %1 : i32 to index
    %4:2 = util.assume.int 
        %2[<umin = 45184, umax = 45184, udiv = 45184>, <umin = 12416, umax = 12416, udiv = 12416>], 
        %3[<umin = 2304, umax = 2304, udiv = 2304>, <umin = 2688, umax = 2688, udiv = 2688>]
      : index, index
    %5 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
    %6 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%4#0) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>
    %7 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%4#1) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>
    %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
    %9 = iree_tensor_ext.dispatch.tensor.load %5, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
    %10 = iree_tensor_ext.dispatch.tensor.load %6, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
    %11 = iree_tensor_ext.dispatch.tensor.load %7, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
    %12 = tensor.empty() : tensor<17x64xf32>
    %13 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_4 : f32) outs(%12 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %14 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%9, %10 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%13 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%14, %11 : tensor<17x64xf32>, tensor<64xf32>) outs(%12 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_5: f32, %out: f32):
      %16 = arith.addf %in, %in_5 : f32
      %17 = math.powf %16, %cst_3 : f32
      %18 = arith.mulf %17, %cst_2 : f32
      %19 = arith.addf %16, %18 : f32
      %20 = arith.mulf %19, %cst_1 : f32
      %21 = math.tanh %20 : f32
      %22 = arith.addf %21, %cst_0 : f32
      %23 = arith.mulf %16, %cst : f32
      %24 = arith.mulf %23, %22 : f32
      linalg.yield %24 : f32
    } -> tensor<17x64xf32>
    iree_tensor_ext.dispatch.tensor.store %15, %8, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
    return
  }
}

