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
      %7 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
      %subview_10 = memref.subview %subview[0, 0] [%7, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      scf.for %arg1 = %c0 to %7 step %c8 {
        %8 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg1)[%7]
        %subview_11 = memref.subview %alloca_6[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        %9 = vector.create_mask %8, %c8 : vector<8x8xi1>
        vector.transfer_write %cst, %subview_11[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
        %10 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%arg1, %arg0]
        scf.for %arg2 = %c0 to %c64 step %c8 {
          %subview_12 = memref.subview %subview_10[%arg1, %arg2] [%8, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %11 = vector.transfer_read %subview_11[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %12 = scf.for %arg3 = %c0 to %c32 step %c1 iter_args(%arg4 = %11) -> (vector<8x8xf32>) {
            %subview_15 = memref.subview %assume_align[%10, %arg3] [%8, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %25 = vector.create_mask %8 : vector<8xi1>
            %subview_16 = memref.subview %subview_15[0, 0] [%8, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
            %26 = vector.transfer_read %subview_16[%c0], %0, %25 {in_bounds = [true]} : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
            %27 = vector.transfer_read %assume_align_7[%arg2, %arg3], %0 {in_bounds = [true, true]} : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %28 = vector.create_mask %c1, %8, %c8 : vector<1x8x8xi1>
            %29 = vector.shape_cast %27 : vector<8x1xf32> to vector<8xf32>
            %30 = vector.extract %26[0] : f32 from vector<8xf32>
            %31 = vector.broadcast %30 : f32 to vector<8xf32>
            %32 = vector.extract %arg4[0] : vector<8xf32> from vector<8x8xf32>
            %33 = vector.extract %28[0, 0] : vector<8xi1> from vector<1x8x8xi1>
            %34 = vector.fma %31, %29, %32 : vector<8xf32>
            %35 = arith.select %33, %34, %32 : vector<8xi1>, vector<8xf32>
            %36 = vector.extract %26[1] : f32 from vector<8xf32>
            %37 = vector.broadcast %36 : f32 to vector<8xf32>
            %38 = vector.extract %arg4[1] : vector<8xf32> from vector<8x8xf32>
            %39 = vector.extract %28[0, 1] : vector<8xi1> from vector<1x8x8xi1>
            %40 = vector.fma %37, %29, %38 : vector<8xf32>
            %41 = arith.select %39, %40, %38 : vector<8xi1>, vector<8xf32>
            %42 = vector.extract %26[2] : f32 from vector<8xf32>
            %43 = vector.broadcast %42 : f32 to vector<8xf32>
            %44 = vector.extract %arg4[2] : vector<8xf32> from vector<8x8xf32>
            %45 = vector.extract %28[0, 2] : vector<8xi1> from vector<1x8x8xi1>
            %46 = vector.fma %43, %29, %44 : vector<8xf32>
            %47 = arith.select %45, %46, %44 : vector<8xi1>, vector<8xf32>
            %48 = vector.extract %26[3] : f32 from vector<8xf32>
            %49 = vector.broadcast %48 : f32 to vector<8xf32>
            %50 = vector.extract %arg4[3] : vector<8xf32> from vector<8x8xf32>
            %51 = vector.extract %28[0, 3] : vector<8xi1> from vector<1x8x8xi1>
            %52 = vector.fma %49, %29, %50 : vector<8xf32>
            %53 = arith.select %51, %52, %50 : vector<8xi1>, vector<8xf32>
            %54 = vector.extract %26[4] : f32 from vector<8xf32>
            %55 = vector.broadcast %54 : f32 to vector<8xf32>
            %56 = vector.extract %arg4[4] : vector<8xf32> from vector<8x8xf32>
            %57 = vector.extract %28[0, 4] : vector<8xi1> from vector<1x8x8xi1>
            %58 = vector.fma %55, %29, %56 : vector<8xf32>
            %59 = arith.select %57, %58, %56 : vector<8xi1>, vector<8xf32>
            %60 = vector.extract %26[5] : f32 from vector<8xf32>
            %61 = vector.broadcast %60 : f32 to vector<8xf32>
            %62 = vector.extract %arg4[5] : vector<8xf32> from vector<8x8xf32>
            %63 = vector.extract %28[0, 5] : vector<8xi1> from vector<1x8x8xi1>
            %64 = vector.fma %61, %29, %62 : vector<8xf32>
            %65 = arith.select %63, %64, %62 : vector<8xi1>, vector<8xf32>
            %66 = vector.extract %26[6] : f32 from vector<8xf32>
            %67 = vector.broadcast %66 : f32 to vector<8xf32>
            %68 = vector.extract %arg4[6] : vector<8xf32> from vector<8x8xf32>
            %69 = vector.extract %28[0, 6] : vector<8xi1> from vector<1x8x8xi1>
            %70 = vector.fma %67, %29, %68 : vector<8xf32>
            %71 = arith.select %69, %70, %68 : vector<8xi1>, vector<8xf32>
            %72 = vector.extract %26[7] : f32 from vector<8xf32>
            %73 = vector.broadcast %72 : f32 to vector<8xf32>
            %74 = vector.extract %arg4[7] : vector<8xf32> from vector<8x8xf32>
            %75 = vector.extract %28[0, 7] : vector<8xi1> from vector<1x8x8xi1>
            %76 = vector.fma %73, %29, %74 : vector<8xf32>
            %77 = arith.select %75, %76, %74 : vector<8xi1>, vector<8xf32>
            %78:8 = vector.to_elements %35 : vector<8xf32>
            %79:8 = vector.to_elements %41 : vector<8xf32>
            %80:8 = vector.to_elements %47 : vector<8xf32>
            %81:8 = vector.to_elements %53 : vector<8xf32>
            %82:8 = vector.to_elements %59 : vector<8xf32>
            %83:8 = vector.to_elements %65 : vector<8xf32>
            %84:8 = vector.to_elements %71 : vector<8xf32>
            %85:8 = vector.to_elements %77 : vector<8xf32>
            %86 = vector.from_elements %78#0, %78#1, %78#2, %78#3, %78#4, %78#5, %78#6, %78#7, %79#0, %79#1, %79#2, %79#3, %79#4, %79#5, %79#6, %79#7, %80#0, %80#1, %80#2, %80#3, %80#4, %80#5, %80#6, %80#7, %81#0, %81#1, %81#2, %81#3, %81#4, %81#5, %81#6, %81#7, %82#0, %82#1, %82#2, %82#3, %82#4, %82#5, %82#6, %82#7, %83#0, %83#1, %83#2, %83#3, %83#4, %83#5, %83#6, %83#7, %84#0, %84#1, %84#2, %84#3, %84#4, %84#5, %84#6, %84#7, %85#0, %85#1, %85#2, %85#3, %85#4, %85#5, %85#6, %85#7 : vector<8x8xf32>
            scf.yield %86 : vector<8x8xf32>
          }
          %subview_13 = memref.subview %alloca_5[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          vector.transfer_write %12, %subview_13[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
          %subview_14 = memref.subview %alloca[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %13 = vector.transfer_read %subview_14[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %14 = vector.transfer_read %assume_align_8[%arg2], %0 {in_bounds = [true]} : memref<64xf32, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
          %15 = vector.broadcast %14 : vector<8xf32> to vector<8x8xf32>
          %16 = arith.addf %13, %15 : vector<8x8xf32>
          %17 = math.powf %16, %cst_0 : vector<8x8xf32>
          %18 = arith.mulf %17, %cst_1 : vector<8x8xf32>
          %19 = arith.addf %16, %18 : vector<8x8xf32>
          %20 = arith.mulf %19, %cst_2 : vector<8x8xf32>
          %21 = math.tanh %20 : vector<8x8xf32>
          %22 = arith.addf %21, %cst_3 : vector<8x8xf32>
          %23 = arith.mulf %16, %cst_4 : vector<8x8xf32>
          %24 = arith.mulf %23, %22 : vector<8x8xf32>
          vector.transfer_write %24, %subview_12[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        }
      }
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  return
}

