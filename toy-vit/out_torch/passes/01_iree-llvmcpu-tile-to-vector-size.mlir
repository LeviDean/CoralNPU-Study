func.func @main_dispatch_13_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %c8 = arith.constant 8 : index
  %c64 = arith.constant 64 : index
  %c16 = arith.constant 16 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
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
    %15 = scf.for %arg2 = %c0 to %14 step %c16 iter_args(%arg3 = %extracted_slice) -> (tensor<?x64xf32>) {
      %16 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg2)[%14]
      %extracted_slice_5 = tensor.extract_slice %arg3[%arg2, 0] [%16, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %17 = scf.for %arg4 = %c0 to %16 step %c8 iter_args(%arg5 = %extracted_slice_5) -> (tensor<?x64xf32>) {
        %18 = scf.for %arg6 = %c0 to %c64 step %c8 iter_args(%arg7 = %arg5) -> (tensor<?x64xf32>) {
          %19 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg4)[%16]
          %20 = tensor.empty(%19) : tensor<?x8xf32>
          %21 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_4 : f32) outs(%20 : tensor<?x8xf32>) -> tensor<?x8xf32>
          %22 = scf.for %arg8 = %c0 to %c32 step %c1 iter_args(%arg9 = %21) -> (tensor<?x8xf32>) {
            %24 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg4, %arg2, %arg0]
            %extracted_slice_9 = tensor.extract_slice %9[%24, %arg8] [%19, 1] [1, 1] : tensor<17x32xf32> to tensor<?x1xf32>
            %extracted_slice_10 = tensor.extract_slice %10[%arg6, %arg8] [8, 1] [1, 1] : tensor<64x32xf32> to tensor<8x1xf32>
            %extracted_slice_11 = tensor.extract_slice %arg9[0, 0] [%19, 8] [1, 1] : tensor<?x8xf32> to tensor<?x8xf32>
            %25 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {lowering_config = #iree_cpu.lowering_config<cache_parallel = [16, 0, 0], cache_reduction = [0, 0, 0], distribution = [16, 0, 0], vector_common_parallel = [8, 8, 0], vector_reduction = [0, 0, 1]>, stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_9, %extracted_slice_10 : tensor<?x1xf32>, tensor<8x1xf32>) outs(%extracted_slice_11 : tensor<?x8xf32>) -> tensor<?x8xf32>
            %inserted_slice_12 = tensor.insert_slice %25 into %arg9[0, 0] [%19, 8] [1, 1] : tensor<?x8xf32> into tensor<?x8xf32>
            scf.yield %inserted_slice_12 : tensor<?x8xf32>
          }
          %extracted_slice_6 = tensor.extract_slice %11[%arg6] [8] [1] : tensor<64xf32> to tensor<8xf32>
          %extracted_slice_7 = tensor.extract_slice %arg7[%arg4, %arg6] [%19, 8] [1, 1] : tensor<?x64xf32> to tensor<?x8xf32>
          %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%22, %extracted_slice_6 : tensor<?x8xf32>, tensor<8xf32>) outs(%extracted_slice_7 : tensor<?x8xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
          ^bb0(%in: f32, %in_9: f32, %out: f32):
            %24 = arith.addf %in, %in_9 : f32
            %25 = math.powf %24, %cst_3 : f32
            %26 = arith.mulf %25, %cst_2 : f32
            %27 = arith.addf %24, %26 : f32
            %28 = arith.mulf %27, %cst_1 : f32
            %29 = math.tanh %28 : f32
            %30 = arith.addf %29, %cst_0 : f32
            %31 = arith.mulf %24, %cst : f32
            %32 = arith.mulf %31, %30 : f32
            linalg.yield %32 : f32
          } -> tensor<?x8xf32>
          %inserted_slice_8 = tensor.insert_slice %23 into %arg7[%arg4, %arg6] [%19, 8] [1, 1] : tensor<?x8xf32> into tensor<?x64xf32>
          scf.yield %inserted_slice_8 : tensor<?x64xf32>
        }
        scf.yield %18 : tensor<?x64xf32>
      }
      %inserted_slice = tensor.insert_slice %17 into %arg3[%arg2, 0] [%16, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      scf.yield %inserted_slice : tensor<?x64xf32>
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %15 into %arg1[%arg0, 0] [%14, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %13, %8 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

