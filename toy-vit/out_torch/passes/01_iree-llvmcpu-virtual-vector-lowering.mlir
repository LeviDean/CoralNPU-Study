func.func @main_dispatch_13_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
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
  %1 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(0) : i32
  %2 = hal.interface.constant.load layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) ordinal(1) : i32
  %3 = arith.index_castui %1 : i32 to index
  %4 = arith.index_castui %2 : i32 to index
  %5:2 = util.assume.int 
      %3[<umin = 45184, umax = 45184, udiv = 45184>, <umin = 12416, umax = 12416, udiv = 12416>], 
      %4[<umin = 2304, umax = 2304, udiv = 2304>, <umin = 2688, umax = 2688, udiv = 2688>]
    : index, index
  %6 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %assume_align = memref.assume_alignment %6, 64 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
  %7 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#0) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %assume_align_7 = memref.assume_alignment %7, 64 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#1) flags(ReadOnly) : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %assume_align_8 = memref.assume_alignment %8, 64 : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %9 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  %assume_align_9 = memref.assume_alignment %9, 64 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  scf.forall (%arg0) = (0) to (17) step (16) {
    %10 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %subview = memref.subview %assume_align_9[%arg0, 0] [%10, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
    %11 = arith.cmpi sgt, %10, %c0 : index
    scf.if %11 {
      %12 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%c0)[%10]
      %subview_10 = memref.subview %subview[%c0, 0] [%12, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      scf.for %arg1 = %c0 to %12 step %c8 {
        %13 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg1)[%12]
        %subview_11 = memref.subview %alloca_6[0, 0] [%13, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        %14 = vector.create_mask %13, %c8 : vector<8x8xi1>
        vector.transfer_write %cst, %subview_11[%c0, %c0], %14 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
        %15 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg1, %c0, %arg0]
        %16 = vector.create_mask %13, %c8, %c1 : vector<8x8x1xi1>
        scf.for %arg2 = %c0 to %c64 step %c8 {
          %subview_12 = memref.subview %subview_10[%arg1, %arg2] [%13, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %17 = vector.transfer_read %subview_11[%c0, %c0], %0, %14 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %18 = scf.for %arg3 = %c0 to %c32 step %c1 iter_args(%arg4 = %17) -> (vector<8x8xf32>) {
            %subview_15 = memref.subview %assume_align[%15, %arg3] [%13, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %31 = vector.create_mask %13 : vector<8xi1>
            %subview_16 = memref.subview %subview_15[0, 0] [%13, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
            %32 = vector.transfer_read %subview_16[%c0], %0, %31 {in_bounds = [true]} : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
            %33 = vector.transfer_read %assume_align_7[%arg2, %arg3], %0 {in_bounds = [true, true]} : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %34 = vector.transpose %33, [1, 0] : vector<8x1xf32> to vector<1x8xf32>
            %35 = vector.transpose %16, [2, 0, 1] : vector<8x8x1xi1> to vector<1x8x8xi1>
            %36 = vector.extract %34[0] : vector<8xf32> from vector<1x8xf32>
            %37 = vector.extract %32[0] : f32 from vector<8xf32>
            %38 = vector.broadcast %37 : f32 to vector<8xf32>
            %39 = vector.extract %arg4[0] : vector<8xf32> from vector<8x8xf32>
            %40 = vector.extract %35[0, 0] : vector<8xi1> from vector<1x8x8xi1>
            %41 = vector.fma %38, %36, %39 : vector<8xf32>
            %42 = arith.select %40, %41, %39 : vector<8xi1>, vector<8xf32>
            %43 = vector.insert %42, %cst [0] : vector<8xf32> into vector<8x8xf32>
            %44 = vector.extract %32[1] : f32 from vector<8xf32>
            %45 = vector.broadcast %44 : f32 to vector<8xf32>
            %46 = vector.extract %arg4[1] : vector<8xf32> from vector<8x8xf32>
            %47 = vector.extract %35[0, 1] : vector<8xi1> from vector<1x8x8xi1>
            %48 = vector.fma %45, %36, %46 : vector<8xf32>
            %49 = arith.select %47, %48, %46 : vector<8xi1>, vector<8xf32>
            %50 = vector.insert %49, %43 [1] : vector<8xf32> into vector<8x8xf32>
            %51 = vector.extract %32[2] : f32 from vector<8xf32>
            %52 = vector.broadcast %51 : f32 to vector<8xf32>
            %53 = vector.extract %arg4[2] : vector<8xf32> from vector<8x8xf32>
            %54 = vector.extract %35[0, 2] : vector<8xi1> from vector<1x8x8xi1>
            %55 = vector.fma %52, %36, %53 : vector<8xf32>
            %56 = arith.select %54, %55, %53 : vector<8xi1>, vector<8xf32>
            %57 = vector.insert %56, %50 [2] : vector<8xf32> into vector<8x8xf32>
            %58 = vector.extract %32[3] : f32 from vector<8xf32>
            %59 = vector.broadcast %58 : f32 to vector<8xf32>
            %60 = vector.extract %arg4[3] : vector<8xf32> from vector<8x8xf32>
            %61 = vector.extract %35[0, 3] : vector<8xi1> from vector<1x8x8xi1>
            %62 = vector.fma %59, %36, %60 : vector<8xf32>
            %63 = arith.select %61, %62, %60 : vector<8xi1>, vector<8xf32>
            %64 = vector.insert %63, %57 [3] : vector<8xf32> into vector<8x8xf32>
            %65 = vector.extract %32[4] : f32 from vector<8xf32>
            %66 = vector.broadcast %65 : f32 to vector<8xf32>
            %67 = vector.extract %arg4[4] : vector<8xf32> from vector<8x8xf32>
            %68 = vector.extract %35[0, 4] : vector<8xi1> from vector<1x8x8xi1>
            %69 = vector.fma %66, %36, %67 : vector<8xf32>
            %70 = arith.select %68, %69, %67 : vector<8xi1>, vector<8xf32>
            %71 = vector.insert %70, %64 [4] : vector<8xf32> into vector<8x8xf32>
            %72 = vector.extract %32[5] : f32 from vector<8xf32>
            %73 = vector.broadcast %72 : f32 to vector<8xf32>
            %74 = vector.extract %arg4[5] : vector<8xf32> from vector<8x8xf32>
            %75 = vector.extract %35[0, 5] : vector<8xi1> from vector<1x8x8xi1>
            %76 = vector.fma %73, %36, %74 : vector<8xf32>
            %77 = arith.select %75, %76, %74 : vector<8xi1>, vector<8xf32>
            %78 = vector.insert %77, %71 [5] : vector<8xf32> into vector<8x8xf32>
            %79 = vector.extract %32[6] : f32 from vector<8xf32>
            %80 = vector.broadcast %79 : f32 to vector<8xf32>
            %81 = vector.extract %arg4[6] : vector<8xf32> from vector<8x8xf32>
            %82 = vector.extract %35[0, 6] : vector<8xi1> from vector<1x8x8xi1>
            %83 = vector.fma %80, %36, %81 : vector<8xf32>
            %84 = arith.select %82, %83, %81 : vector<8xi1>, vector<8xf32>
            %85 = vector.insert %84, %78 [6] : vector<8xf32> into vector<8x8xf32>
            %86 = vector.extract %32[7] : f32 from vector<8xf32>
            %87 = vector.broadcast %86 : f32 to vector<8xf32>
            %88 = vector.extract %arg4[7] : vector<8xf32> from vector<8x8xf32>
            %89 = vector.extract %35[0, 7] : vector<8xi1> from vector<1x8x8xi1>
            %90 = vector.fma %87, %36, %88 : vector<8xf32>
            %91 = arith.select %89, %90, %88 : vector<8xi1>, vector<8xf32>
            %92 = vector.insert %91, %85 [7] : vector<8xf32> into vector<8x8xf32>
            scf.yield %92 : vector<8x8xf32>
          }
          %subview_13 = memref.subview %alloca_5[0, 0] [%13, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          vector.transfer_write %18, %subview_13[%c0, %c0], %14 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
          %subview_14 = memref.subview %alloca[0, 0] [%13, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %19 = vector.transfer_read %subview_14[%c0, %c0], %0, %14 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %20 = vector.transfer_read %assume_align_8[%arg2], %0 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
          %21 = vector.broadcast %20 : vector<8xf32> to vector<8x8xf32>
          %22 = arith.addf %19, %21 : vector<8x8xf32>
          %23 = math.powf %22, %cst_0 : vector<8x8xf32>
          %24 = arith.mulf %23, %cst_1 : vector<8x8xf32>
          %25 = arith.addf %22, %24 : vector<8x8xf32>
          %26 = arith.mulf %25, %cst_2 : vector<8x8xf32>
          %27 = math.tanh %26 : vector<8x8xf32>
          %28 = arith.addf %27, %cst_3 : vector<8x8xf32>
          %29 = arith.mulf %22, %cst_4 : vector<8x8xf32>
          %30 = arith.mulf %29, %28 : vector<8x8xf32>
          vector.transfer_write %30, %subview_12[%c0, %c0], %14 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        }
      }
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  return
}

