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
      %extracted_slice_5 = tensor.extract_slice %arg3[%arg2, 0] [%11, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %12 = scf.forall (%arg4, %arg5) = (0, 0) to (%11, 64) step (8, 8) shared_outs(%arg6 = %extracted_slice_5) -> (tensor<?x64xf32>) {
        %13 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg4)[%11]
        %14 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg4, %arg2, %arg0]
        %extracted_slice_6 = tensor.extract_slice %4[%14, 0] [%13, 32] [1, 1] : tensor<17x32xf32> to tensor<?x32xf32>
        %extracted_slice_7 = tensor.extract_slice %5[%arg5, 0] [8, 32] [1, 1] : tensor<64x32xf32> to tensor<8x32xf32>
        %15 = tensor.empty(%13) : tensor<?x8xf32>
        %16 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%15 : tensor<?x8xf32>) -> tensor<?x8xf32>
        %17 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_6, %extracted_slice_7 : tensor<?x32xf32>, tensor<8x32xf32>) outs(%16 : tensor<?x8xf32>) -> tensor<?x8xf32>
        %extracted_slice_8 = tensor.extract_slice %6[%arg5] [8] [1] : tensor<64xf32> to tensor<8xf32>
        %extracted_slice_9 = tensor.extract_slice %arg6[%arg4, %arg5] [%13, 8] [1, 1] : tensor<?x64xf32> to tensor<?x8xf32>
        %18 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%17, %extracted_slice_8 : tensor<?x8xf32>, tensor<8xf32>) outs(%extracted_slice_9 : tensor<?x8xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_10: f32, %out: f32):
          %19 = arith.addf %in, %in_10 : f32
          %20 = math.powf %19, %cst_0 : f32
          %21 = arith.mulf %20, %cst_1 : f32
          %22 = arith.addf %19, %21 : f32
          %23 = arith.mulf %22, %cst_2 : f32
          %24 = math.tanh %23 : f32
          %25 = arith.addf %24, %cst_3 : f32
          %26 = arith.mulf %19, %cst_4 : f32
          %27 = arith.mulf %26, %25 : f32
          linalg.yield %27 : f32
        } -> tensor<?x8xf32>
        scf.forall.in_parallel {
          tensor.parallel_insert_slice %18 into %arg6[%arg4, %arg5] [%13, 8] [1, 1] : tensor<?x8xf32> into tensor<?x64xf32>
        }
      }
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %12 into %arg3[%arg2, 0] [%11, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      }
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %10 into %arg1[%arg0, 0] [%9, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %8, %3 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

