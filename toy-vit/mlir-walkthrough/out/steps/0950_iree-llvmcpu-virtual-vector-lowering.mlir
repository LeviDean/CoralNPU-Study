func.func @main_dispatch_0_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c8 = arith.constant 8 : index
  %0 = ub.poison : f32
  %cst = arith.constant dense<0.000000e+00> : vector<8x8xf32>
  %cst_0 = arith.constant dense<3.000000e+00> : vector<8x8xf32>
  %cst_1 = arith.constant dense<4.471500e-02> : vector<8x8xf32>
  %cst_2 = arith.constant dense<0.797884523> : vector<8x8xf32>
  %cst_3 = arith.constant dense<1.000000e+00> : vector<8x8xf32>
  %cst_4 = arith.constant dense<5.000000e-01> : vector<8x8xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %alloca_5 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %alloca_6 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %assume_align = memref.assume_alignment %1, 64 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %assume_align_7 = memref.assume_alignment %2, 64 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : memref<64xf32, #hal.descriptor_type<storage_buffer>>
  %assume_align_8 = memref.assume_alignment %3, 64 : memref<64xf32, #hal.descriptor_type<storage_buffer>>
  %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %assume_align_9 = memref.assume_alignment %4, 64 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  scf.forall (%arg0) = (0) to (17) step (16) {
    %5 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %subview = memref.subview %assume_align_9[%arg0, 0] [%5, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
    %6 = arith.cmpi sgt, %5, %c0 : index
    scf.if %6 {
      %7 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%c0)[%5]
      %subview_10 = memref.subview %subview[%c0, 0] [%7, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      scf.for %arg1 = %c0 to %7 step %c8 {
        %8 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg1)[%7]
        %subview_11 = memref.subview %alloca_6[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        %9 = vector.create_mask %8, %c8 : vector<8x8xi1>
        vector.transfer_write %cst, %subview_11[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
        %10 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg1, %c0, %arg0]
        %11 = vector.create_mask %8, %c8, %c1 : vector<8x8x1xi1>
        scf.for %arg2 = %c0 to %c64 step %c8 {
          %subview_12 = memref.subview %subview_10[%arg1, %arg2] [%8, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %12 = vector.transfer_read %subview_11[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %13 = scf.for %arg3 = %c0 to %c32 step %c1 iter_args(%arg4 = %12) -> (vector<8x8xf32>) {
            %subview_15 = memref.subview %assume_align[%10, %arg3] [%8, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %26 = vector.create_mask %8 : vector<8xi1>
            %subview_16 = memref.subview %subview_15[0, 0] [%8, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
            %27 = vector.transfer_read %subview_16[%c0], %0, %26 {in_bounds = [true]} : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
            %28 = vector.transfer_read %assume_align_7[%arg2, %arg3], %0 {in_bounds = [true, true]} : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %29 = vector.transpose %28, [1, 0] : vector<8x1xf32> to vector<1x8xf32>
            %30 = vector.transpose %11, [2, 0, 1] : vector<8x8x1xi1> to vector<1x8x8xi1>
            %31 = vector.extract %29[0] : vector<8xf32> from vector<1x8xf32>
            %32 = vector.extract %27[0] : f32 from vector<8xf32>
            %33 = vector.broadcast %32 : f32 to vector<8xf32>
            %34 = vector.extract %arg4[0] : vector<8xf32> from vector<8x8xf32>
            %35 = vector.extract %30[0, 0] : vector<8xi1> from vector<1x8x8xi1>
            %36 = vector.fma %33, %31, %34 : vector<8xf32>
            %37 = arith.select %35, %36, %34 : vector<8xi1>, vector<8xf32>
            %38 = vector.insert %37, %cst [0] : vector<8xf32> into vector<8x8xf32>
            %39 = vector.extract %27[1] : f32 from vector<8xf32>
            %40 = vector.broadcast %39 : f32 to vector<8xf32>
            %41 = vector.extract %arg4[1] : vector<8xf32> from vector<8x8xf32>
            %42 = vector.extract %30[0, 1] : vector<8xi1> from vector<1x8x8xi1>
            %43 = vector.fma %40, %31, %41 : vector<8xf32>
            %44 = arith.select %42, %43, %41 : vector<8xi1>, vector<8xf32>
            %45 = vector.insert %44, %38 [1] : vector<8xf32> into vector<8x8xf32>
            %46 = vector.extract %27[2] : f32 from vector<8xf32>
            %47 = vector.broadcast %46 : f32 to vector<8xf32>
            %48 = vector.extract %arg4[2] : vector<8xf32> from vector<8x8xf32>
            %49 = vector.extract %30[0, 2] : vector<8xi1> from vector<1x8x8xi1>
            %50 = vector.fma %47, %31, %48 : vector<8xf32>
            %51 = arith.select %49, %50, %48 : vector<8xi1>, vector<8xf32>
            %52 = vector.insert %51, %45 [2] : vector<8xf32> into vector<8x8xf32>
            %53 = vector.extract %27[3] : f32 from vector<8xf32>
            %54 = vector.broadcast %53 : f32 to vector<8xf32>
            %55 = vector.extract %arg4[3] : vector<8xf32> from vector<8x8xf32>
            %56 = vector.extract %30[0, 3] : vector<8xi1> from vector<1x8x8xi1>
            %57 = vector.fma %54, %31, %55 : vector<8xf32>
            %58 = arith.select %56, %57, %55 : vector<8xi1>, vector<8xf32>
            %59 = vector.insert %58, %52 [3] : vector<8xf32> into vector<8x8xf32>
            %60 = vector.extract %27[4] : f32 from vector<8xf32>
            %61 = vector.broadcast %60 : f32 to vector<8xf32>
            %62 = vector.extract %arg4[4] : vector<8xf32> from vector<8x8xf32>
            %63 = vector.extract %30[0, 4] : vector<8xi1> from vector<1x8x8xi1>
            %64 = vector.fma %61, %31, %62 : vector<8xf32>
            %65 = arith.select %63, %64, %62 : vector<8xi1>, vector<8xf32>
            %66 = vector.insert %65, %59 [4] : vector<8xf32> into vector<8x8xf32>
            %67 = vector.extract %27[5] : f32 from vector<8xf32>
            %68 = vector.broadcast %67 : f32 to vector<8xf32>
            %69 = vector.extract %arg4[5] : vector<8xf32> from vector<8x8xf32>
            %70 = vector.extract %30[0, 5] : vector<8xi1> from vector<1x8x8xi1>
            %71 = vector.fma %68, %31, %69 : vector<8xf32>
            %72 = arith.select %70, %71, %69 : vector<8xi1>, vector<8xf32>
            %73 = vector.insert %72, %66 [5] : vector<8xf32> into vector<8x8xf32>
            %74 = vector.extract %27[6] : f32 from vector<8xf32>
            %75 = vector.broadcast %74 : f32 to vector<8xf32>
            %76 = vector.extract %arg4[6] : vector<8xf32> from vector<8x8xf32>
            %77 = vector.extract %30[0, 6] : vector<8xi1> from vector<1x8x8xi1>
            %78 = vector.fma %75, %31, %76 : vector<8xf32>
            %79 = arith.select %77, %78, %76 : vector<8xi1>, vector<8xf32>
            %80 = vector.insert %79, %73 [6] : vector<8xf32> into vector<8x8xf32>
            %81 = vector.extract %27[7] : f32 from vector<8xf32>
            %82 = vector.broadcast %81 : f32 to vector<8xf32>
            %83 = vector.extract %arg4[7] : vector<8xf32> from vector<8x8xf32>
            %84 = vector.extract %30[0, 7] : vector<8xi1> from vector<1x8x8xi1>
            %85 = vector.fma %82, %31, %83 : vector<8xf32>
            %86 = arith.select %84, %85, %83 : vector<8xi1>, vector<8xf32>
            %87 = vector.insert %86, %80 [7] : vector<8xf32> into vector<8x8xf32>
            scf.yield %87 : vector<8x8xf32>
          }
          %subview_13 = memref.subview %alloca_5[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          vector.transfer_write %13, %subview_13[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
          %subview_14 = memref.subview %alloca[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %14 = vector.transfer_read %subview_14[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %15 = vector.transfer_read %assume_align_8[%arg2], %0 {in_bounds = [true]} : memref<64xf32, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
          %16 = vector.broadcast %15 : vector<8xf32> to vector<8x8xf32>
          %17 = arith.addf %14, %16 : vector<8x8xf32>
          %18 = math.powf %17, %cst_0 : vector<8x8xf32>
          %19 = arith.mulf %18, %cst_1 : vector<8x8xf32>
          %20 = arith.addf %17, %19 : vector<8x8xf32>
          %21 = arith.mulf %20, %cst_2 : vector<8x8xf32>
          %22 = math.tanh %21 : vector<8x8xf32>
          %23 = arith.addf %22, %cst_3 : vector<8x8xf32>
          %24 = arith.mulf %17, %cst_4 : vector<8x8xf32>
          %25 = arith.mulf %24, %23 : vector<8x8xf32>
          vector.transfer_write %25, %subview_12[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        }
      }
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  return
}

