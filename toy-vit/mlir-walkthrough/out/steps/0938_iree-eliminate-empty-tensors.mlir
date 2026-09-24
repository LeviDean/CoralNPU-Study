func.func @main_dispatch_0_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
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
  %c256 = arith.constant 256 : index
  %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : memref<64xf32, #hal.descriptor_type<storage_buffer>>
  %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %5 = iree_codegen.load_from_buffer %1 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> -> tensor<17x32xf32>
  %6 = iree_codegen.load_from_buffer %2 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<64x32xf32>
  %7 = iree_codegen.load_from_buffer %3 : memref<64xf32, #hal.descriptor_type<storage_buffer>> -> tensor<64xf32>
  %8 = iree_codegen.load_from_buffer %4 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> -> tensor<17x64xf32>
  %9 = tensor.empty() : tensor<17x64xf32>
  %10 = scf.forall (%arg0) = (0) to (17) step (16) shared_outs(%arg1 = %8) -> (tensor<17x64xf32>) {
    %11 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %extracted_slice = tensor.extract_slice %arg1[%arg0, 0] [%11, 64] [1, 1] : tensor<17x64xf32> to tensor<?x64xf32>
    %12 = scf.for %arg2 = %c0 to %11 step %c16 iter_args(%arg3 = %extracted_slice) -> (tensor<?x64xf32>) {
      %13 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg2)[%11]
      %extracted_slice_5 = tensor.extract_slice %arg3[%arg2, 0] [%13, 64] [1, 1] : tensor<?x64xf32> to tensor<?x64xf32>
      %14 = scf.for %arg4 = %c0 to %13 step %c8 iter_args(%arg5 = %extracted_slice_5) -> (tensor<?x64xf32>) {
        %15 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg4)[%13]
        %16 = tensor.empty(%15) : tensor<?x8xf32>
        %17 = vector.create_mask %15, %c8 : vector<8x8xi1>
        %18 = vector.transfer_write %cst_4, %16[%c0, %c0], %17 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
        %19 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg4, %arg2, %arg0]
        %20 = vector.create_mask %15, %c1 : vector<8x1xi1>
        %21 = vector.create_mask %15, %c8, %c1 : vector<8x8x1xi1>
        %22 = scf.for %arg6 = %c0 to %c64 step %c8 iter_args(%arg7 = %arg5) -> (tensor<?x64xf32>) {
          %extracted_slice_6 = tensor.extract_slice %arg7[%arg4, %arg6] [%15, 8] [1, 1] : tensor<?x64xf32> to tensor<?x8xf32>
          %extracted_slice_7 = tensor.extract_slice %18[0, 0] [%15, 8] [1, 1] : tensor<?x8xf32> to tensor<?x8xf32>
          %23 = vector.transfer_read %extracted_slice_7[%c0, %c0], %0, %17 {in_bounds = [true, true]} : tensor<?x8xf32>, vector<8x8xf32>
          %24 = scf.for %arg8 = %c0 to %c32 step %c1 iter_args(%arg9 = %23) -> (vector<8x8xf32>) {
            %extracted_slice_10 = tensor.extract_slice %5[%19, %arg8] [%15, 1] [1, 1] : tensor<17x32xf32> to tensor<?x1xf32>
            %39 = vector.transfer_read %extracted_slice_10[%c0, %c0], %0, %20 {in_bounds = [true, true]} : tensor<?x1xf32>, vector<8x1xf32>
            %40 = vector.transfer_read %6[%arg6, %arg8], %0 {in_bounds = [true, true]} : tensor<64x32xf32>, vector<8x1xf32>
            %41 = vector.mask %21 { vector.contract {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %39, %40, %arg9 : vector<8x1xf32>, vector<8x1xf32> into vector<8x8xf32> } : vector<8x8x1xi1> -> vector<8x8xf32>
            scf.yield %41 : vector<8x8xf32>
          }
          %25 = vector.transfer_write %24, %extracted_slice_7[%c0, %c0], %17 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
          %inserted_slice_8 = tensor.insert_slice %25 into %18[0, 0] [%15, 8] [1, 1] : tensor<?x8xf32> into tensor<?x8xf32>
          %26 = vector.transfer_read %inserted_slice_8[%c0, %c0], %0, %17 {in_bounds = [true, true]} : tensor<?x8xf32>, vector<8x8xf32>
          %27 = vector.transfer_read %7[%arg6], %0 {in_bounds = [true]} : tensor<64xf32>, vector<8xf32>
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
          %38 = vector.transfer_write %37, %extracted_slice_6[%c0, %c0], %17 {in_bounds = [true, true]} : vector<8x8xf32>, tensor<?x8xf32>
          %inserted_slice_9 = tensor.insert_slice %38 into %arg7[%arg4, %arg6] [%15, 8] [1, 1] : tensor<?x8xf32> into tensor<?x64xf32>
          scf.yield %inserted_slice_9 : tensor<?x64xf32>
        }
        scf.yield %22 : tensor<?x64xf32>
      }
      %inserted_slice = tensor.insert_slice %14 into %arg3[%arg2, 0] [%13, 64] [1, 1] : tensor<?x64xf32> into tensor<?x64xf32>
      scf.yield %inserted_slice : tensor<?x64xf32>
    }
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %12 into %arg1[%arg0, 0] [%11, 64] [1, 1] : tensor<?x64xf32> into tensor<17x64xf32>
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  iree_codegen.store_to_buffer %10, %4 : tensor<17x64xf32> into memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  return
}

