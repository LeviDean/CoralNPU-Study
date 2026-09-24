func.func @main_dispatch_13_matmul_17x64x32_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
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
  %7 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#0) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#1) flags(ReadOnly) : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
  %9 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
  scf.forall (%arg0) = (0) to (17) step (16) {
    %10 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%arg0)
    %subview = memref.subview %9[%arg0, 0] [%10, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
    %11 = scf.for %arg1 = %c0 to %10 step %c16 iter_args(%arg2 = %subview) -> (memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
      %12 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 16)>(%arg1)[%10]
      %subview_8 = memref.subview %arg2[%arg1, 0] [%12, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %13 = scf.for %arg3 = %c0 to %12 step %c8 iter_args(%arg4 = %subview_8) -> (memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
        %14 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg3)[%12]
        %subview_10 = memref.subview %alloca_6[0, 0] [%14, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        %cast = memref.cast %subview_10 : memref<?x8xf32, strided<[8, 1]>> to memref<?x8xf32>
        %15 = vector.create_mask %14, %c8 : vector<8x8xi1>
        vector.transfer_write %cst, %subview_10[%c0, %c0], %15 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
        %16 = affine.apply affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>()[%arg3, %arg1, %arg0]
        %17 = vector.create_mask %14, %c1 : vector<8x1xi1>
        %18 = vector.create_mask %14, %c8, %c1 : vector<8x8x1xi1>
        %19 = scf.for %arg5 = %c0 to %c64 step %c8 iter_args(%arg6 = %arg4) -> (memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
          %subview_11 = memref.subview %arg6[%arg3, %arg5] [%14, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %subview_12 = memref.subview %cast[0, 0] [%14, 8] [1, 1] : memref<?x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          %20 = vector.transfer_read %subview_12[%c0, %c0], %0, %15 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %21 = scf.for %arg7 = %c0 to %c32 step %c1 iter_args(%arg8 = %20) -> (vector<8x8xf32>) {
            %subview_18 = memref.subview %6[%16, %arg7] [%14, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %34 = vector.transfer_read %subview_18[%c0, %c0], %0, %17 {in_bounds = [true, true]} : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %35 = vector.transfer_read %7[%arg5, %arg7], %0 {in_bounds = [true, true]} : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %36 = vector.mask %18 { vector.contract {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %34, %35, %arg8 : vector<8x1xf32>, vector<8x1xf32> into vector<8x8xf32> } : vector<8x8x1xi1> -> vector<8x8xf32>
            scf.yield %36 : vector<8x8xf32>
          }
          %subview_13 = memref.subview %alloca_5[0, 0] [%14, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_12 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          vector.transfer_write %21, %subview_13[%c0, %c0], %15 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
          %subview_14 = memref.subview %alloca[0, 0] [%14, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          %cast_15 = memref.cast %subview_14 : memref<?x8xf32, strided<[8, 1]>> to memref<?x8xf32>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_10 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %subview_16 = memref.subview %cast_15[0, 0] [%14, 8] [1, 1] : memref<?x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_16 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %22 = vector.transfer_read %subview_14[%c0, %c0], %0, %15 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %23 = vector.transfer_read %8[%arg5], %0 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
          %24 = vector.broadcast %23 : vector<8xf32> to vector<8x8xf32>
          %25 = arith.addf %22, %24 : vector<8x8xf32>
          %26 = math.powf %25, %cst_0 : vector<8x8xf32>
          %27 = arith.mulf %26, %cst_1 : vector<8x8xf32>
          %28 = arith.addf %25, %27 : vector<8x8xf32>
          %29 = arith.mulf %28, %cst_2 : vector<8x8xf32>
          %30 = math.tanh %29 : vector<8x8xf32>
          %31 = arith.addf %30, %cst_3 : vector<8x8xf32>
          %32 = arith.mulf %25, %cst_4 : vector<8x8xf32>
          %33 = arith.mulf %32, %31 : vector<8x8xf32>
          vector.transfer_write %33, %subview_11[%c0, %c0], %15 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %subview_17 = memref.subview %arg6[%arg3, %arg5] [%14, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) outs(%subview_17 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          scf.yield %arg6 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        }
        scf.yield %19 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      }
      %subview_9 = memref.subview %arg2[%arg1, 0] [%12, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%13 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) outs(%subview_9 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      }
      scf.yield %arg2 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
    }
    %subview_7 = memref.subview %9[%arg0, 0] [%10, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
    linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%11 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) outs(%subview_7 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%9 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>) outs(%9 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  return
}

