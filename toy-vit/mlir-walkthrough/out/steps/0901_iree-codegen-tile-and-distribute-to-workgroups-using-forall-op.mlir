func.func @main_dispatch_0_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant 3.000000e+00 : f32
  %cst_1 = arith.constant 4.471500e-02 : f32
  %cst_2 = arith.constant 0.797884523 : f32
  %cst_3 = arith.constant 1.000000e+00 : f32
  %cst_4 = arith.constant 5.000000e-01 : f32
  %c0 = arith.constant 0 : index
  %c256 = arith.constant 256 : index
  %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
  %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>
  %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>
  %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
  %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
  %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
  %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
  %7 = tensor.empty() : tensor<17x64xf32>
  %8 = scf.forall (%arg0) = (0) to (17) step (16) shared_outs(%arg1 = %7) -> (tensor<17x64xf32>) {
    %9 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %extracted_slice = tensor.extract_slice %4[%arg0, 0] [%9, 32] [1, 1] : tensor<17x32xf32> to tensor<?x32xf32>
    %10 = tensor.empty(%9) : tensor<?x64xf32>
    %11 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%10 : tensor<?x64xf32>) -> tensor<?x64xf32>
    %12 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice, %5 : tensor<?x32xf32>, tensor<64x32xf32>) outs(%11 : tensor<?x64xf32>) -> tensor<?x64xf32>
    %extracted_slice_5 = tensor.extract_slice %arg1[%arg0, 0] [%9, 64] [1, 1] : tensor<17x64xf32> to tensor<?x64xf32>
    %13 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%12, %6 : tensor<?x64xf32>, tensor<64xf32>) outs(%extracted_slice_5 : tensor<?x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_6: f32, %out: f32):
      %14 = arith.addf %in, %in_6 : f32
      %15 = math.powf %14, %cst_0 : f32
      %16 = arith.mulf %15, %cst_1 : f32
      %17 = arith.addf %14, %16 : f32
      %18 = arith.mulf %17, %cst_2 : f32
      %19 = math.tanh %18 : f32
      %20 = arith.addf %19, %cst_3 : f32
      %21 = arith.mulf %14, %cst_4 : f32
      %22 = arith.mulf %21, %20 : f32
      linalg.yield %22 : f32
    } -> tensor<?x64xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %13 into %arg1[%arg0, 0] [%9, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_tensor_ext.dispatch.tensor.store %8, %3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
  return
}

