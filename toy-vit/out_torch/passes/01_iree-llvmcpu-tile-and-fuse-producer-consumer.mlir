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
  %5 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %6 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%4#0) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %7 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%4#1) flags(ReadOnly) : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %9 = iree_codegen.load_from_buffer %5 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> -> tensor<17x32xf32>
  %10 = iree_codegen.load_from_buffer %6 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64x32xf32>
  %11 = iree_codegen.load_from_buffer %7 : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64xf32>
  %12 = tensor.empty() : tensor<17x64xf32>
  %13 = scf.forall (%arg0) = (0) to (17) step (16) shared_outs(%arg1 = %12) -> (tensor<17x64xf32>) {
    %14 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %extracted_slice = tensor.extract_slice %arg1[%arg0, 0] [%14, 64] [1, 1] : tensor<17x64xf32> to tensor<?x64xf32>
    %15 = scf.forall (%arg2) = (0) to (%14) step (16) shared_outs(%arg3 = %extracted_slice) -> (tensor<?x64xf32>) {
      %16 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg2)[%14]
      %17 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%arg2, %arg0]
      %extracted_slice_5 = tensor.extract_slice %9[%17, 0] [%16, 32] [1, 1] : tensor<17x32xf32> to tensor<?x32xf32>
      %18 = tensor.empty(%16) : tensor<?x64xf32>
      %19 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_4 : f32) outs(%18 : tensor<?x64xf32>) -> tensor<?x64xf32>
      %20 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_5, %10 : tensor<?x32xf32>, tensor<64x32xf32>) outs(%19 : tensor<?x64xf32>) -> tensor<?x64xf32>
      %extracted_slice_6 = tensor.extract_slice %arg3[%arg2, 0] [%16, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %21 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%20, %11 : tensor<?x64xf32>, tensor<64xf32>) outs(%extracted_slice_6 : tensor<?x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
      ^bb0(%in: f32, %in_7: f32, %out: f32):
        %22 = arith.addf %in, %in_7 : f32
        %23 = math.powf %22, %cst_3 : f32
        %24 = arith.mulf %23, %cst_2 : f32
        %25 = arith.addf %22, %24 : f32
        %26 = arith.mulf %25, %cst_1 : f32
        %27 = math.tanh %26 : f32
        %28 = arith.addf %27, %cst_0 : f32
        %29 = arith.mulf %22, %cst : f32
        %30 = arith.mulf %29, %28 : f32
        linalg.yield %30 : f32
      } -> tensor<?x64xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %21 into %arg3[%arg2, 0] [%16, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      }
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %15 into %arg1[%arg0, 0] [%14, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %13, %8 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

