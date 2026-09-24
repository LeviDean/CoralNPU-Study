func.func @main_dispatch_13_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %cst = arith.constant dense<5.000000e-01> : vector<8x8xf32>
  %cst_0 = arith.constant dense<1.000000e+00> : vector<8x8xf32>
  %cst_1 = arith.constant dense<0.797884523> : vector<8x8xf32>
  %cst_2 = arith.constant dense<4.471500e-02> : vector<8x8xf32>
  %cst_3 = arith.constant dense<3.000000e+00> : vector<8x8xf32>
  %cst_4 = arith.constant dense<0.000000e+00> : vector<8x8xf32>
  %0 = ub.poison : f32
  %c8 = arith.constant 8 : index
  %c64 = arith.constant 64 : index
  %c16 = arith.constant 16 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c0 = arith.constant 0 : index
  %1 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
  %2 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
  %3 = arith.index_castui %1 : i32 to index
  %4 = arith.index_castui %2 : i32 to index
  %5:2 = util.assume.int 
      %3[<umin = 45184, umax = 45184, udiv = 45184>, <umin = 12416, umax = 12416, udiv = 12416>], 
      %4[<umin = 2304, umax = 2304, udiv = 2304>, <umin = 2688, umax = 2688, udiv = 2688>]
    : index, index
  %6 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %7 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#0) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#1) flags(ReadOnly) : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %9 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %10 = iree_codegen.load_from_buffer %6 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> -> tensor<17x32xf32>
  %11 = iree_codegen.load_from_buffer %7 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64x32xf32>
  %12 = iree_codegen.load_from_buffer %8 : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64xf32>
  %13 = tensor.empty() : tensor<17x64xf32>
  %14 = scf.forall (%arg0) = (0) to (17) step (16) shared_outs(%arg1 = %13) -> (tensor<17x64xf32>) {
    %15 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %extracted_slice = tensor.extract_slice %arg1[%arg0, 0] [%15, 64] [1, 1] : tensor<17x64xf32> to tensor<?x64xf32>
    %16 = scf.for %arg2 = %c0 to %15 step %c16 iter_args(%arg3 = %extracted_slice) -> (tensor<?x64xf32>) {
      %17 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg2)[%15]
      %extracted_slice_5 = tensor.extract_slice %arg3[%arg2, 0] [%17, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %18 = scf.for %arg4 = %c0 to %17 step %c8 iter_args(%arg5 = %extracted_slice_5) -> (tensor<?x64xf32>) {
        %19 = scf.for %arg6 = %c0 to %c64 step %c8 iter_args(%arg7 = %arg5) -> (tensor<?x64xf32>) {
          %20 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg4)[%17]
          %21 = tensor.empty(%20) : tensor<?x8xf32>
          %22 = vector.create_mask %20, %c8 : vector<8x8xi1>
          %23 = vector.transfer_write %cst_4, %21[%c0, %c0], %22 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
          %24 = scf.for %arg8 = %c0 to %c32 step %c1 iter_args(%arg9 = %23) -> (tensor<?x8xf32>) {
            %39 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg4, %arg2, %arg0]
            %extracted_slice_9 = tensor.extract_slice %10[%39, %arg8] [%20, 1] [1, 1] : tensor<17x32xf32> to tensor<?x1xf32>
            %extracted_slice_10 = tensor.extract_slice %11[%arg6, %arg8] [8, 1] [1, 1] : tensor<64x32xf32> to tensor<8x1xf32>
            %extracted_slice_11 = tensor.extract_slice %arg9[0, 0] [%20, 8] [1, 1] : tensor<?x8xf32> to tensor<?x8xf32>
            %40 = vector.create_mask %20, %c1 : vector<8x1xi1>
            %41 = vector.transfer_read %extracted_slice_9[%c0, %c0], %0, %40 {in_bounds = [true, true]} : tensor<?x1xf32>, vector<8x1xf32>
            %42 = vector.transfer_read %extracted_slice_10[%c0, %c0], %0 {in_bounds = [true, true]} : tensor<8x1xf32>, vector<8x1xf32>
            %43 = vector.create_mask %20, %c8 : vector<8x8xi1>
            %44 = vector.transfer_read %extracted_slice_11[%c0, %c0], %0, %43 {in_bounds = [true, true]} : tensor<?x8xf32>, vector<8x8xf32>
            %45 = vector.create_mask %20, %c8, %c1 : vector<8x8x1xi1>
            %46 = vector.mask %45 { vector.contract {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %41, %42, %44 : vector<8x1xf32>, vector<8x1xf32> into vector<8x8xf32> } : vector<8x8x1xi1> -> vector<8x8xf32>
            %47 = vector.transfer_write %46, %extracted_slice_11[%c0, %c0], %43 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
            %inserted_slice_12 = tensor.insert_slice %47 into %arg9[0, 0] [%20, 8] [1, 1] : tensor<?x8xf32> into tensor<?x8xf32>
            scf.yield %inserted_slice_12 : tensor<?x8xf32>
          }
          %extracted_slice_6 = tensor.extract_slice %12[%arg6] [8] [1] : tensor<64xf32> to tensor<8xf32>
          %extracted_slice_7 = tensor.extract_slice %arg7[%arg4, %arg6] [%20, 8] [1, 1] : tensor<?x64xf32> to tensor<?x8xf32>
          %dim = tensor.dim %24, %c0 : tensor<?x8xf32>
          %25 = vector.create_mask %dim, %c8 : vector<8x8xi1>
          %26 = vector.transfer_read %24[%c0, %c0], %0, %25 {in_bounds = [true, true]} : tensor<?x8xf32>, vector<8x8xf32>
          %27 = vector.transfer_read %extracted_slice_6[%c0], %0 {in_bounds = [true]} : tensor<8xf32>, vector<8xf32>
          %28 = vector.broadcast %27 : vector<8xf32> to vector<8x8xf32>
          %29 = arith.addf %26, %28 : vector<8x8xf32>
          %30 = math.powf %29, %cst_3 : vector<8x8xf32>
          %31 = arith.mulf %30, %cst_2 : vector<8x8xf32>
          %32 = arith.addf %29, %31 : vector<8x8xf32>
          %33 = arith.mulf %32, %cst_1 : vector<8x8xf32>
          %34 = math.tanh %33 : vector<8x8xf32>
          %35 = arith.addf %34, %cst_0 : vector<8x8xf32>
          %36 = arith.mulf %29, %cst : vector<8x8xf32>
          %37 = arith.mulf %36, %35 : vector<8x8xf32>
          %38 = vector.transfer_write %37, %extracted_slice_7[%c0, %c0], %25 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
          %inserted_slice_8 = tensor.insert_slice %38 into %arg7[%arg4, %arg6] [%20, 8] [1, 1] : tensor<?x8xf32> into tensor<?x64xf32>
          scf.yield %inserted_slice_8 : tensor<?x64xf32>
        }
        scf.yield %19 : tensor<?x64xf32>
      }
      %inserted_slice = tensor.insert_slice %18 into %arg3[%arg2, 0] [%17, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      scf.yield %inserted_slice : tensor<?x64xf32>
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %16 into %arg1[%arg0, 0] [%15, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %14, %9 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

