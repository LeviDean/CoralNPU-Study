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
        %11 = vector.create_mask %8, %c1 : vector<8x1xi1>
        %12 = vector.create_mask %8, %c8, %c1 : vector<8x8x1xi1>
        scf.for %arg2 = %c0 to %c64 step %c8 {
          %subview_12 = memref.subview %subview_10[%arg1, %arg2] [%8, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %13 = vector.transfer_read %subview_11[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %14 = scf.for %arg3 = %c0 to %c32 step %c1 iter_args(%arg4 = %13) -> (vector<8x8xf32>) {
            %subview_15 = memref.subview %assume_align[%10, %arg3] [%8, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %27 = vector.transfer_read %subview_15[%c0, %c0], %0, %11 {in_bounds = [true, true]} : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %28 = vector.transfer_read %assume_align_7[%arg2, %arg3], %0 {in_bounds = [true, true]} : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8x1xf32>
            %29 = vector.mask %12 { vector.contract {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %27, %28, %arg4 : vector<8x1xf32>, vector<8x1xf32> into vector<8x8xf32> } : vector<8x8x1xi1> -> vector<8x8xf32>
            scf.yield %29 : vector<8x8xf32>
          }
          %subview_13 = memref.subview %alloca_5[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          vector.transfer_write %14, %subview_13[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[8, 1]>>
          %subview_14 = memref.subview %alloca[0, 0] [%8, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_11 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_13 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
          ^bb0(%in: f32, %out: f32):
            linalg.yield %in : f32
          }
          %15 = vector.transfer_read %subview_14[%c0, %c0], %0, %9 {in_bounds = [true, true]} : memref<?x8xf32, strided<[8, 1]>>, vector<8x8xf32>
          %16 = vector.transfer_read %assume_align_8[%arg2], %0 {in_bounds = [true]} : memref<64xf32, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
          %17 = vector.broadcast %16 : vector<8xf32> to vector<8x8xf32>
          %18 = arith.addf %15, %17 : vector<8x8xf32>
          %19 = math.powf %18, %cst_0 : vector<8x8xf32>
          %20 = arith.mulf %19, %cst_1 : vector<8x8xf32>
          %21 = arith.addf %18, %20 : vector<8x8xf32>
          %22 = arith.mulf %21, %cst_2 : vector<8x8xf32>
          %23 = math.tanh %22 : vector<8x8xf32>
          %24 = arith.addf %23, %cst_3 : vector<8x8xf32>
          %25 = arith.mulf %18, %cst_4 : vector<8x8xf32>
          %26 = arith.mulf %25, %24 : vector<8x8xf32>
          vector.transfer_write %26, %subview_12[%c0, %c0], %9 {in_bounds = [true, true]} : vector<8x8xf32>, memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        }
      }
    }
  } {mapping = [#iree_codegen.workgroup_mapping<x>]}
  return
}

