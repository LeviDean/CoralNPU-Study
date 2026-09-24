func.func @main_dispatch_0_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant 3.000000e+00 : f32
  %cst_1 = arith.constant 4.471500e-02 : f32
  %cst_2 = arith.constant 0.797884523 : f32
  %cst_3 = arith.constant 1.000000e+00 : f32
  %cst_4 = arith.constant 5.000000e-01 : f32
  %c0 = arith.constant 0 : index
  %c256 = arith.constant 256 : index
  %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : memref<64xf32, #hal.descriptor_type<storage_buffer>>
  %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %4 = iree_codegen.load_from_buffer %0 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> -> tensor<17x32xf32>
  %5 = iree_codegen.load_from_buffer %1 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64x32xf32>
  %6 = iree_codegen.load_from_buffer %2 : memref<64xf32, #hal.descriptor_type<storage_buffer>> -> tensor<64xf32>
  %7 = tensor.empty() : tensor<17x64xf32>
  %8 = scf.forall (%arg0) = (0) to (17) step (16) shared_outs(%arg1 = %7) -> (tensor<17x64xf32>) {
    %9 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %extracted_slice = tensor.extract_slice %arg1[%arg0, 0] [%9, 64] [1, 1] : tensor<17x64xf32> to tensor<?x64xf32>
    %10 = scf.forall (%arg2) = (0) to (%9) step (16) shared_outs(%arg3 = %extracted_slice) -> (tensor<?x64xf32>) {
      %11 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg2)[%9]
      %12 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%arg2, %arg0]
      %extracted_slice_5 = tensor.extract_slice %4[%12, 0] [%11, 32] [1, 1] : tensor<17x32xf32> to tensor<?x32xf32>
      %13 = tensor.empty(%11) : tensor<?x64xf32>
      %14 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%13 : tensor<?x64xf32>) -> tensor<?x64xf32>
      %15 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_5, %5 : tensor<?x32xf32>, tensor<64x32xf32>) outs(%14 : tensor<?x64xf32>) -> tensor<?x64xf32>
      %extracted_slice_6 = tensor.extract_slice %arg3[%arg2, 0] [%11, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %16 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %6 : tensor<?x64xf32>, tensor<64xf32>) outs(%extracted_slice_6 : tensor<?x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
      ^bb0(%in: f32, %in_7: f32, %out: f32):
        %17 = arith.addf %in, %in_7 : f32
        %18 = math.powf %17, %cst_0 : f32
        %19 = arith.mulf %18, %cst_1 : f32
        %20 = arith.addf %17, %19 : f32
        %21 = arith.mulf %20, %cst_2 : f32
        %22 = math.tanh %21 : f32
        %23 = arith.addf %22, %cst_3 : f32
        %24 = arith.mulf %17, %cst_4 : f32
        %25 = arith.mulf %24, %23 : f32
        linalg.yield %25 : f32
      } -> tensor<?x64xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %16 into %arg3[%arg2, 0] [%11, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      }
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %10 into %arg1[%arg0, 0] [%9, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %8, %3 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

