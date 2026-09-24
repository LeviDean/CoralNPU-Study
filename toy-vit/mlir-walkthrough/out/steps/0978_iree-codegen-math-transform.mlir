func.func @main_dispatch_0_matmul_17x64x32_f32() {
  %cst = arith.constant dense<1.19825836E-6> : vector<8x8xf32>
  %cst_0 = arith.constant dense<1.18534706E-4> : vector<8x8xf32>
  %cst_1 = arith.constant dense<0.00226843474> : vector<8x8xf32>
  %cst_2 = arith.constant dense<0.00489352504> : vector<8x8xf32>
  %cst_3 = arith.constant dense<-2.76076837E-16> : vector<8x8xf32>
  %cst_4 = arith.constant dense<2.00018794E-13> : vector<8x8xf32>
  %cst_5 = arith.constant dense<-8.60467184E-11> : vector<8x8xf32>
  %cst_6 = arith.constant dense<5.12229725E-8> : vector<8x8xf32>
  %cst_7 = arith.constant dense<1.48572235E-5> : vector<8x8xf32>
  %cst_8 = arith.constant dense<6.37261954E-4> : vector<8x8xf32>
  %cst_9 = arith.constant dense<0.00489352457> : vector<8x8xf32>
  %cst_10 = arith.constant dense<4.000000e-04> : vector<8x8xf32>
  %cst_11 = arith.constant dense<7.99881172> : vector<8x8xf32>
  %cst_12 = arith.constant dense<-7.99881172> : vector<8x8xf32>
  %c-16 = arith.constant -16 : index
  %c17 = arith.constant 17 : index
  %c16 = arith.constant 16 : index
  %cst_13 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>
  %0 = ub.poison : vector<8xf32>
  %c7 = arith.constant 7 : index
  %c6 = arith.constant 6 : index
  %c5 = arith.constant 5 : index
  %c4 = arith.constant 4 : index
  %c3 = arith.constant 3 : index
  %c2 = arith.constant 2 : index
  %cst_14 = arith.constant dense<0.000000e+00> : vector<8xf32>
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c8 = arith.constant 8 : index
  %cst_15 = arith.constant dense<4.471500e-02> : vector<8x8xf32>
  %cst_16 = arith.constant dense<0.797884523> : vector<8x8xf32>
  %cst_17 = arith.constant dense<1.000000e+00> : vector<8x8xf32>
  %cst_18 = arith.constant dense<5.000000e-01> : vector<8x8xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %alloca_19 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %alloca_20 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
  %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32>
  %assume_align = memref.assume_alignment %1, 64 : memref<17x32xf32>
  %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>>
  %assume_align_21 = memref.assume_alignment %2, 64 : memref<64x32xf32, strided<[32, 1], offset: ?>>
  %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : memref<64xf32>
  %assume_align_22 = memref.assume_alignment %3, 64 : memref<64xf32>
  %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32>
  %assume_align_23 = memref.assume_alignment %4, 64 : memref<17x64xf32>
  %workgroup_id_x = hal.interface.workgroup.id[0] : index
  %5 = arith.muli %workgroup_id_x, %c16 overflow<nsw> : index
  %6 = arith.muli %workgroup_id_x, %c-16 overflow<nsw> : index
  %7 = arith.addi %6, %c17 : index
  %8 = arith.minsi %7, %c16 : index
  %subview = memref.subview %assume_align_23[%5, 0] [%8, 64] [1, 1] : memref<17x64xf32> to memref<?x64xf32, strided<[64, 1], offset: ?>>
  %9 = arith.cmpi sgt, %8, %c0 : index
  scf.if %9 {
    scf.for %arg0 = %c0 to %8 step %c8 {
      %10 = arith.subi %8, %arg0 : index
      %11 = arith.minsi %10, %c8 : index
      %subview_24 = memref.subview %alloca_20[0, 0] [%11, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
      %12 = vector.create_mask %11, %c8 : vector<8x8xi1>
      %13 = vector.extract %12[0] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c0, %c0], %13, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %14 = vector.extract %12[1] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c1, %c0], %14, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %15 = vector.extract %12[2] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c2, %c0], %15, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %16 = vector.extract %12[3] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c3, %c0], %16, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %17 = vector.extract %12[4] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c4, %c0], %17, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %18 = vector.extract %12[5] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c5, %c0], %18, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %19 = vector.extract %12[6] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c6, %c0], %19, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %20 = vector.extract %12[7] : vector<8xi1> from vector<8x8xi1>
      vector.maskedstore %subview_24[%c7, %c0], %20, %cst_14 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
      %21 = arith.addi %arg0, %5 : index
      scf.for %arg1 = %c0 to %c64 step %c8 {
        %subview_25 = memref.subview %subview[%arg0, %arg1] [%11, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>> to memref<?x8xf32, strided<[64, 1], offset: ?>>
        %22 = vector.maskedload %subview_24[%c0, %c0], %13, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %23 = vector.maskedload %subview_24[%c1, %c0], %14, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %24 = vector.maskedload %subview_24[%c2, %c0], %15, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %25 = vector.maskedload %subview_24[%c3, %c0], %16, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %26 = vector.maskedload %subview_24[%c4, %c0], %17, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %27 = vector.maskedload %subview_24[%c5, %c0], %18, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %28 = vector.maskedload %subview_24[%c6, %c0], %19, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %29 = vector.maskedload %subview_24[%c7, %c0], %20, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %30:8 = vector.to_elements %22 : vector<8xf32>
        %31:8 = vector.to_elements %23 : vector<8xf32>
        %32:8 = vector.to_elements %24 : vector<8xf32>
        %33:8 = vector.to_elements %25 : vector<8xf32>
        %34:8 = vector.to_elements %26 : vector<8xf32>
        %35:8 = vector.to_elements %27 : vector<8xf32>
        %36:8 = vector.to_elements %28 : vector<8xf32>
        %37:8 = vector.to_elements %29 : vector<8xf32>
        %38 = vector.from_elements %30#0, %30#1, %30#2, %30#3, %30#4, %30#5, %30#6, %30#7, %31#0, %31#1, %31#2, %31#3, %31#4, %31#5, %31#6, %31#7, %32#0, %32#1, %32#2, %32#3, %32#4, %32#5, %32#6, %32#7, %33#0, %33#1, %33#2, %33#3, %33#4, %33#5, %33#6, %33#7, %34#0, %34#1, %34#2, %34#3, %34#4, %34#5, %34#6, %34#7, %35#0, %35#1, %35#2, %35#3, %35#4, %35#5, %35#6, %35#7, %36#0, %36#1, %36#2, %36#3, %36#4, %36#5, %36#6, %36#7, %37#0, %37#1, %37#2, %37#3, %37#4, %37#5, %37#6, %37#7 : vector<8x8xf32>
        %39 = scf.for %arg2 = %c0 to %c32 step %c1 iter_args(%arg3 = %38) -> (vector<8x8xf32>) {
          %subview_28 = memref.subview %assume_align[%21, %arg2] [%11, 1] [1, 1] : memref<17x32xf32> to memref<?x1xf32, strided<[32, 1], offset: ?>>
          %103 = arith.index_cast %11 : index to i32
          %104 = vector.broadcast %103 : i32 to vector<8xi32>
          %105 = arith.cmpi sgt, %104, %cst_13 : vector<8xi32>
          %subview_29 = memref.subview %subview_28[0, 0] [%11, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>>
          %106 = scf.for %arg4 = %c0 to %c8 step %c1 iter_args(%arg5 = %0) -> (vector<8xf32>) {
            %189 = vector.extract %105[%arg4] : i1 from vector<8xi1>
            %190 = scf.if %189 -> (vector<8xf32>) {
              %191 = memref.load %subview_29[%arg4] : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>>
              %192 = vector.insert %191, %arg5 [%arg4] : f32 into vector<8xf32>
              scf.yield %192 : vector<8xf32>
            } else {
              scf.yield %arg5 : vector<8xf32>
            }
            scf.yield %190 : vector<8xf32>
          }
          %107 = vector.load %assume_align_21[%arg1, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %108 = arith.addi %arg1, %c1 : index
          %109 = vector.load %assume_align_21[%108, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %110 = arith.addi %arg1, %c2 : index
          %111 = vector.load %assume_align_21[%110, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %112 = arith.addi %arg1, %c3 : index
          %113 = vector.load %assume_align_21[%112, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %114 = arith.addi %arg1, %c4 : index
          %115 = vector.load %assume_align_21[%114, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %116 = arith.addi %arg1, %c5 : index
          %117 = vector.load %assume_align_21[%116, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %118 = arith.addi %arg1, %c6 : index
          %119 = vector.load %assume_align_21[%118, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %120 = arith.addi %arg1, %c7 : index
          %121 = vector.load %assume_align_21[%120, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
          %122 = vector.to_elements %107 : vector<1xf32>
          %123 = vector.to_elements %109 : vector<1xf32>
          %124 = vector.to_elements %111 : vector<1xf32>
          %125 = vector.to_elements %113 : vector<1xf32>
          %126 = vector.to_elements %115 : vector<1xf32>
          %127 = vector.to_elements %117 : vector<1xf32>
          %128 = vector.to_elements %119 : vector<1xf32>
          %129 = vector.to_elements %121 : vector<1xf32>
          %130 = vector.create_mask %c1, %11, %c8 : vector<1x8x8xi1>
          %131 = vector.from_elements %122, %123, %124, %125, %126, %127, %128, %129 : vector<8xf32>
          %132 = vector.extract %106[0] : f32 from vector<8xf32>
          %133 = vector.broadcast %132 : f32 to vector<8xf32>
          %134 = vector.extract %arg3[0] : vector<8xf32> from vector<8x8xf32>
          %135 = vector.extract %130[0, 0] : vector<8xi1> from vector<1x8x8xi1>
          %136 = vector.fma %133, %131, %134 : vector<8xf32>
          %137 = arith.select %135, %136, %134 : vector<8xi1>, vector<8xf32>
          %138 = vector.extract %106[1] : f32 from vector<8xf32>
          %139 = vector.broadcast %138 : f32 to vector<8xf32>
          %140 = vector.extract %arg3[1] : vector<8xf32> from vector<8x8xf32>
          %141 = vector.extract %130[0, 1] : vector<8xi1> from vector<1x8x8xi1>
          %142 = vector.fma %139, %131, %140 : vector<8xf32>
          %143 = arith.select %141, %142, %140 : vector<8xi1>, vector<8xf32>
          %144 = vector.extract %106[2] : f32 from vector<8xf32>
          %145 = vector.broadcast %144 : f32 to vector<8xf32>
          %146 = vector.extract %arg3[2] : vector<8xf32> from vector<8x8xf32>
          %147 = vector.extract %130[0, 2] : vector<8xi1> from vector<1x8x8xi1>
          %148 = vector.fma %145, %131, %146 : vector<8xf32>
          %149 = arith.select %147, %148, %146 : vector<8xi1>, vector<8xf32>
          %150 = vector.extract %106[3] : f32 from vector<8xf32>
          %151 = vector.broadcast %150 : f32 to vector<8xf32>
          %152 = vector.extract %arg3[3] : vector<8xf32> from vector<8x8xf32>
          %153 = vector.extract %130[0, 3] : vector<8xi1> from vector<1x8x8xi1>
          %154 = vector.fma %151, %131, %152 : vector<8xf32>
          %155 = arith.select %153, %154, %152 : vector<8xi1>, vector<8xf32>
          %156 = vector.extract %106[4] : f32 from vector<8xf32>
          %157 = vector.broadcast %156 : f32 to vector<8xf32>
          %158 = vector.extract %arg3[4] : vector<8xf32> from vector<8x8xf32>
          %159 = vector.extract %130[0, 4] : vector<8xi1> from vector<1x8x8xi1>
          %160 = vector.fma %157, %131, %158 : vector<8xf32>
          %161 = arith.select %159, %160, %158 : vector<8xi1>, vector<8xf32>
          %162 = vector.extract %106[5] : f32 from vector<8xf32>
          %163 = vector.broadcast %162 : f32 to vector<8xf32>
          %164 = vector.extract %arg3[5] : vector<8xf32> from vector<8x8xf32>
          %165 = vector.extract %130[0, 5] : vector<8xi1> from vector<1x8x8xi1>
          %166 = vector.fma %163, %131, %164 : vector<8xf32>
          %167 = arith.select %165, %166, %164 : vector<8xi1>, vector<8xf32>
          %168 = vector.extract %106[6] : f32 from vector<8xf32>
          %169 = vector.broadcast %168 : f32 to vector<8xf32>
          %170 = vector.extract %arg3[6] : vector<8xf32> from vector<8x8xf32>
          %171 = vector.extract %130[0, 6] : vector<8xi1> from vector<1x8x8xi1>
          %172 = vector.fma %169, %131, %170 : vector<8xf32>
          %173 = arith.select %171, %172, %170 : vector<8xi1>, vector<8xf32>
          %174 = vector.extract %106[7] : f32 from vector<8xf32>
          %175 = vector.broadcast %174 : f32 to vector<8xf32>
          %176 = vector.extract %arg3[7] : vector<8xf32> from vector<8x8xf32>
          %177 = vector.extract %130[0, 7] : vector<8xi1> from vector<1x8x8xi1>
          %178 = vector.fma %175, %131, %176 : vector<8xf32>
          %179 = arith.select %177, %178, %176 : vector<8xi1>, vector<8xf32>
          %180:8 = vector.to_elements %137 : vector<8xf32>
          %181:8 = vector.to_elements %143 : vector<8xf32>
          %182:8 = vector.to_elements %149 : vector<8xf32>
          %183:8 = vector.to_elements %155 : vector<8xf32>
          %184:8 = vector.to_elements %161 : vector<8xf32>
          %185:8 = vector.to_elements %167 : vector<8xf32>
          %186:8 = vector.to_elements %173 : vector<8xf32>
          %187:8 = vector.to_elements %179 : vector<8xf32>
          %188 = vector.from_elements %180#0, %180#1, %180#2, %180#3, %180#4, %180#5, %180#6, %180#7, %181#0, %181#1, %181#2, %181#3, %181#4, %181#5, %181#6, %181#7, %182#0, %182#1, %182#2, %182#3, %182#4, %182#5, %182#6, %182#7, %183#0, %183#1, %183#2, %183#3, %183#4, %183#5, %183#6, %183#7, %184#0, %184#1, %184#2, %184#3, %184#4, %184#5, %184#6, %184#7, %185#0, %185#1, %185#2, %185#3, %185#4, %185#5, %185#6, %185#7, %186#0, %186#1, %186#2, %186#3, %186#4, %186#5, %186#6, %186#7, %187#0, %187#1, %187#2, %187#3, %187#4, %187#5, %187#6, %187#7 : vector<8x8xf32>
          scf.yield %188 : vector<8x8xf32>
        } {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
        %subview_26 = memref.subview %alloca_19[0, 0] [%11, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        scf.for %arg2 = %c0 to %11 step %c1 {
          scf.for %arg3 = %c0 to %c8 step %c1 {
            %103 = memref.load %subview_24[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
            memref.store %103, %subview_26[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
          }
        }
        %40 = vector.extract %39[0] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c0, %c0], %13, %40 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %41 = vector.extract %39[1] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c1, %c0], %14, %41 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %42 = vector.extract %39[2] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c2, %c0], %15, %42 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %43 = vector.extract %39[3] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c3, %c0], %16, %43 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %44 = vector.extract %39[4] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c4, %c0], %17, %44 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %45 = vector.extract %39[5] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c5, %c0], %18, %45 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %46 = vector.extract %39[6] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c6, %c0], %19, %46 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %47 = vector.extract %39[7] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_26[%c7, %c0], %20, %47 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
        %subview_27 = memref.subview %alloca[0, 0] [%11, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
        scf.for %arg2 = %c0 to %11 step %c1 {
          scf.for %arg3 = %c0 to %c8 step %c1 {
            %103 = memref.load %subview_24[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
            memref.store %103, %subview_27[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
          }
        }
        scf.for %arg2 = %c0 to %11 step %c1 {
          scf.for %arg3 = %c0 to %c8 step %c1 {
            %103 = memref.load %subview_26[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
            memref.store %103, %subview_27[%arg2, %arg3] : memref<?x8xf32, strided<[8, 1]>>
          }
        }
        %48 = vector.maskedload %subview_27[%c0, %c0], %13, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %49 = vector.maskedload %subview_27[%c1, %c0], %14, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %50 = vector.maskedload %subview_27[%c2, %c0], %15, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %51 = vector.maskedload %subview_27[%c3, %c0], %16, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %52 = vector.maskedload %subview_27[%c4, %c0], %17, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %53 = vector.maskedload %subview_27[%c5, %c0], %18, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %54 = vector.maskedload %subview_27[%c6, %c0], %19, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %55 = vector.maskedload %subview_27[%c7, %c0], %20, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
        %56:8 = vector.to_elements %48 : vector<8xf32>
        %57:8 = vector.to_elements %49 : vector<8xf32>
        %58:8 = vector.to_elements %50 : vector<8xf32>
        %59:8 = vector.to_elements %51 : vector<8xf32>
        %60:8 = vector.to_elements %52 : vector<8xf32>
        %61:8 = vector.to_elements %53 : vector<8xf32>
        %62:8 = vector.to_elements %54 : vector<8xf32>
        %63:8 = vector.to_elements %55 : vector<8xf32>
        %64 = vector.from_elements %56#0, %56#1, %56#2, %56#3, %56#4, %56#5, %56#6, %56#7, %57#0, %57#1, %57#2, %57#3, %57#4, %57#5, %57#6, %57#7, %58#0, %58#1, %58#2, %58#3, %58#4, %58#5, %58#6, %58#7, %59#0, %59#1, %59#2, %59#3, %59#4, %59#5, %59#6, %59#7, %60#0, %60#1, %60#2, %60#3, %60#4, %60#5, %60#6, %60#7, %61#0, %61#1, %61#2, %61#3, %61#4, %61#5, %61#6, %61#7, %62#0, %62#1, %62#2, %62#3, %62#4, %62#5, %62#6, %62#7, %63#0, %63#1, %63#2, %63#3, %63#4, %63#5, %63#6, %63#7 : vector<8x8xf32>
        %65 = vector.load %assume_align_22[%arg1] : memref<64xf32>, vector<8xf32>
        %66 = vector.broadcast %65 : vector<8xf32> to vector<8x8xf32>
        %67 = arith.addf %64, %66 : vector<8x8xf32>
        %68 = arith.mulf %67, %67 : vector<8x8xf32>
        %69 = arith.mulf %68, %67 : vector<8x8xf32>
        %70 = arith.mulf %69, %cst_15 : vector<8x8xf32>
        %71 = arith.addf %67, %70 : vector<8x8xf32>
        %72 = arith.mulf %71, %cst_16 : vector<8x8xf32>
        %73 = arith.cmpf ult, %72, %cst_11 : vector<8x8xf32>
        %74 = arith.select %73, %72, %cst_11 : vector<8x8xi1>, vector<8x8xf32>
        %75 = arith.cmpf ugt, %74, %cst_12 : vector<8x8xf32>
        %76 = arith.select %75, %74, %cst_12 : vector<8x8xi1>, vector<8x8xf32>
        %77 = math.absf %72 : vector<8x8xf32>
        %78 = arith.cmpf olt, %77, %cst_10 : vector<8x8xf32>
        %79 = arith.mulf %76, %76 : vector<8x8xf32>
        %80 = math.fma %79, %cst_3, %cst_4 : vector<8x8xf32>
        %81 = math.fma %79, %80, %cst_5 : vector<8x8xf32>
        %82 = math.fma %79, %81, %cst_6 : vector<8x8xf32>
        %83 = math.fma %79, %82, %cst_7 : vector<8x8xf32>
        %84 = math.fma %79, %83, %cst_8 : vector<8x8xf32>
        %85 = math.fma %79, %84, %cst_9 : vector<8x8xf32>
        %86 = arith.mulf %76, %85 : vector<8x8xf32>
        %87 = math.fma %79, %cst, %cst_0 : vector<8x8xf32>
        %88 = math.fma %79, %87, %cst_1 : vector<8x8xf32>
        %89 = math.fma %79, %88, %cst_2 : vector<8x8xf32>
        %90 = arith.divf %86, %89 : vector<8x8xf32>
        %91 = arith.select %78, %76, %90 : vector<8x8xi1>, vector<8x8xf32>
        %92 = arith.addf %91, %cst_17 : vector<8x8xf32>
        %93 = arith.mulf %67, %cst_18 : vector<8x8xf32>
        %94 = arith.mulf %93, %92 : vector<8x8xf32>
        %95 = vector.extract %94[0] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c0, %c0], %13, %95 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %96 = vector.extract %94[1] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c1, %c0], %14, %96 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %97 = vector.extract %94[2] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c2, %c0], %15, %97 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %98 = vector.extract %94[3] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c3, %c0], %16, %98 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %99 = vector.extract %94[4] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c4, %c0], %17, %99 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %100 = vector.extract %94[5] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c5, %c0], %18, %100 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %101 = vector.extract %94[6] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c6, %c0], %19, %101 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
        %102 = vector.extract %94[7] : vector<8xf32> from vector<8x8xf32>
        vector.maskedstore %subview_25[%c7, %c0], %20, %102 : memref<?x8xf32, strided<[64, 1], offset: ?>>, vector<8xi1>, vector<8xf32>
      } {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
    } {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
  }
  return
}

