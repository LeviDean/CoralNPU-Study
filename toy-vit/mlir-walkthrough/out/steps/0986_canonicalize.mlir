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
  %9 = arith.cmpi sgt, %8, %c0 : index
  cf.cond_br %9, ^bb1(%c0 : index), ^bb27
^bb1(%10: index):  // 2 preds: ^bb0, ^bb26
  %11 = arith.cmpi slt, %10, %8 : index
  cf.cond_br %11, ^bb2, ^bb27
^bb2:  // pred: ^bb1
  %12 = arith.subi %8, %10 : index
  %13 = arith.minsi %12, %c8 : index
  %14 = vector.create_mask %13, %c8 : vector<8x8xi1>
  %15 = vector.extract %14[0] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c0, %c0], %15, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %16 = vector.extract %14[1] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c1, %c0], %16, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %17 = vector.extract %14[2] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c2, %c0], %17, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %18 = vector.extract %14[3] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c3, %c0], %18, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %19 = vector.extract %14[4] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c4, %c0], %19, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %20 = vector.extract %14[5] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c5, %c0], %20, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %21 = vector.extract %14[6] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c6, %c0], %21, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %22 = vector.extract %14[7] : vector<8xi1> from vector<8x8xi1>
  vector.maskedstore %alloca_20[%c7, %c0], %22, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %23 = arith.addi %10, %5 : index
  cf.br ^bb3(%c0 : index)
^bb3(%24: index):  // 2 preds: ^bb2, ^bb25
  %25 = arith.cmpi slt, %24, %c64 : index
  cf.cond_br %25, ^bb4, ^bb26
^bb4:  // pred: ^bb3
  %26 = vector.maskedload %alloca_20[%c0, %c0], %15, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %27 = vector.maskedload %alloca_20[%c1, %c0], %16, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %28 = vector.maskedload %alloca_20[%c2, %c0], %17, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %29 = vector.maskedload %alloca_20[%c3, %c0], %18, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %30 = vector.maskedload %alloca_20[%c4, %c0], %19, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %31 = vector.maskedload %alloca_20[%c5, %c0], %20, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %32 = vector.maskedload %alloca_20[%c6, %c0], %21, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %33 = vector.maskedload %alloca_20[%c7, %c0], %22, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %34:8 = vector.to_elements %26 : vector<8xf32>
  %35:8 = vector.to_elements %27 : vector<8xf32>
  %36:8 = vector.to_elements %28 : vector<8xf32>
  %37:8 = vector.to_elements %29 : vector<8xf32>
  %38:8 = vector.to_elements %30 : vector<8xf32>
  %39:8 = vector.to_elements %31 : vector<8xf32>
  %40:8 = vector.to_elements %32 : vector<8xf32>
  %41:8 = vector.to_elements %33 : vector<8xf32>
  %42 = vector.from_elements %34#0, %34#1, %34#2, %34#3, %34#4, %34#5, %34#6, %34#7, %35#0, %35#1, %35#2, %35#3, %35#4, %35#5, %35#6, %35#7, %36#0, %36#1, %36#2, %36#3, %36#4, %36#5, %36#6, %36#7, %37#0, %37#1, %37#2, %37#3, %37#4, %37#5, %37#6, %37#7, %38#0, %38#1, %38#2, %38#3, %38#4, %38#5, %38#6, %38#7, %39#0, %39#1, %39#2, %39#3, %39#4, %39#5, %39#6, %39#7, %40#0, %40#1, %40#2, %40#3, %40#4, %40#5, %40#6, %40#7, %41#0, %41#1, %41#2, %41#3, %41#4, %41#5, %41#6, %41#7 : vector<8x8xf32>
  cf.br ^bb5(%c0, %42 : index, vector<8x8xf32>)
^bb5(%43: index, %44: vector<8x8xf32>):  // 2 preds: ^bb4, ^bb11
  %45 = arith.cmpi slt, %43, %c32 : index
  cf.cond_br %45, ^bb6, ^bb12(%c0 : index)
^bb6:  // pred: ^bb5
  %46 = arith.index_cast %13 : index to i32
  %47 = vector.broadcast %46 : i32 to vector<8xi32>
  %48 = arith.cmpi sgt, %47, %cst_13 : vector<8xi32>
  cf.br ^bb7(%c0, %0 : index, vector<8xf32>)
^bb7(%49: index, %50: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
  %51 = arith.cmpi slt, %49, %c8 : index
  cf.cond_br %51, ^bb8, ^bb11
^bb8:  // pred: ^bb7
  %52 = vector.extract %48[%49] : i1 from vector<8xi1>
  cf.cond_br %52, ^bb9, ^bb10(%50 : vector<8xf32>)
^bb9:  // pred: ^bb8
  %53 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%23, %49]
  %54 = memref.load %assume_align[%53, %43] : memref<17x32xf32>
  %55 = vector.insert %54, %50 [%49] : f32 into vector<8xf32>
  cf.br ^bb10(%55 : vector<8xf32>)
^bb10(%56: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
  %57 = arith.addi %49, %c1 : index
  cf.br ^bb7(%57, %56 : index, vector<8xf32>)
^bb11:  // pred: ^bb7
  %58 = vector.load %assume_align_21[%24, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %59 = arith.addi %24, %c1 : index
  %60 = vector.load %assume_align_21[%59, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %61 = arith.addi %24, %c2 : index
  %62 = vector.load %assume_align_21[%61, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %63 = arith.addi %24, %c3 : index
  %64 = vector.load %assume_align_21[%63, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %65 = arith.addi %24, %c4 : index
  %66 = vector.load %assume_align_21[%65, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %67 = arith.addi %24, %c5 : index
  %68 = vector.load %assume_align_21[%67, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %69 = arith.addi %24, %c6 : index
  %70 = vector.load %assume_align_21[%69, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %71 = arith.addi %24, %c7 : index
  %72 = vector.load %assume_align_21[%71, %43] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
  %73 = vector.to_elements %58 : vector<1xf32>
  %74 = vector.to_elements %60 : vector<1xf32>
  %75 = vector.to_elements %62 : vector<1xf32>
  %76 = vector.to_elements %64 : vector<1xf32>
  %77 = vector.to_elements %66 : vector<1xf32>
  %78 = vector.to_elements %68 : vector<1xf32>
  %79 = vector.to_elements %70 : vector<1xf32>
  %80 = vector.to_elements %72 : vector<1xf32>
  %81 = vector.create_mask %c1, %13, %c8 : vector<1x8x8xi1>
  %82 = vector.from_elements %73, %74, %75, %76, %77, %78, %79, %80 : vector<8xf32>
  %83 = vector.extract %50[0] : f32 from vector<8xf32>
  %84 = vector.broadcast %83 : f32 to vector<8xf32>
  %85 = vector.extract %44[0] : vector<8xf32> from vector<8x8xf32>
  %86 = vector.extract %81[0, 0] : vector<8xi1> from vector<1x8x8xi1>
  %87 = vector.fma %84, %82, %85 : vector<8xf32>
  %88 = arith.select %86, %87, %85 : vector<8xi1>, vector<8xf32>
  %89 = vector.extract %50[1] : f32 from vector<8xf32>
  %90 = vector.broadcast %89 : f32 to vector<8xf32>
  %91 = vector.extract %44[1] : vector<8xf32> from vector<8x8xf32>
  %92 = vector.extract %81[0, 1] : vector<8xi1> from vector<1x8x8xi1>
  %93 = vector.fma %90, %82, %91 : vector<8xf32>
  %94 = arith.select %92, %93, %91 : vector<8xi1>, vector<8xf32>
  %95 = vector.extract %50[2] : f32 from vector<8xf32>
  %96 = vector.broadcast %95 : f32 to vector<8xf32>
  %97 = vector.extract %44[2] : vector<8xf32> from vector<8x8xf32>
  %98 = vector.extract %81[0, 2] : vector<8xi1> from vector<1x8x8xi1>
  %99 = vector.fma %96, %82, %97 : vector<8xf32>
  %100 = arith.select %98, %99, %97 : vector<8xi1>, vector<8xf32>
  %101 = vector.extract %50[3] : f32 from vector<8xf32>
  %102 = vector.broadcast %101 : f32 to vector<8xf32>
  %103 = vector.extract %44[3] : vector<8xf32> from vector<8x8xf32>
  %104 = vector.extract %81[0, 3] : vector<8xi1> from vector<1x8x8xi1>
  %105 = vector.fma %102, %82, %103 : vector<8xf32>
  %106 = arith.select %104, %105, %103 : vector<8xi1>, vector<8xf32>
  %107 = vector.extract %50[4] : f32 from vector<8xf32>
  %108 = vector.broadcast %107 : f32 to vector<8xf32>
  %109 = vector.extract %44[4] : vector<8xf32> from vector<8x8xf32>
  %110 = vector.extract %81[0, 4] : vector<8xi1> from vector<1x8x8xi1>
  %111 = vector.fma %108, %82, %109 : vector<8xf32>
  %112 = arith.select %110, %111, %109 : vector<8xi1>, vector<8xf32>
  %113 = vector.extract %50[5] : f32 from vector<8xf32>
  %114 = vector.broadcast %113 : f32 to vector<8xf32>
  %115 = vector.extract %44[5] : vector<8xf32> from vector<8x8xf32>
  %116 = vector.extract %81[0, 5] : vector<8xi1> from vector<1x8x8xi1>
  %117 = vector.fma %114, %82, %115 : vector<8xf32>
  %118 = arith.select %116, %117, %115 : vector<8xi1>, vector<8xf32>
  %119 = vector.extract %50[6] : f32 from vector<8xf32>
  %120 = vector.broadcast %119 : f32 to vector<8xf32>
  %121 = vector.extract %44[6] : vector<8xf32> from vector<8x8xf32>
  %122 = vector.extract %81[0, 6] : vector<8xi1> from vector<1x8x8xi1>
  %123 = vector.fma %120, %82, %121 : vector<8xf32>
  %124 = arith.select %122, %123, %121 : vector<8xi1>, vector<8xf32>
  %125 = vector.extract %50[7] : f32 from vector<8xf32>
  %126 = vector.broadcast %125 : f32 to vector<8xf32>
  %127 = vector.extract %44[7] : vector<8xf32> from vector<8x8xf32>
  %128 = vector.extract %81[0, 7] : vector<8xi1> from vector<1x8x8xi1>
  %129 = vector.fma %126, %82, %127 : vector<8xf32>
  %130 = arith.select %128, %129, %127 : vector<8xi1>, vector<8xf32>
  %131:8 = vector.to_elements %88 : vector<8xf32>
  %132:8 = vector.to_elements %94 : vector<8xf32>
  %133:8 = vector.to_elements %100 : vector<8xf32>
  %134:8 = vector.to_elements %106 : vector<8xf32>
  %135:8 = vector.to_elements %112 : vector<8xf32>
  %136:8 = vector.to_elements %118 : vector<8xf32>
  %137:8 = vector.to_elements %124 : vector<8xf32>
  %138:8 = vector.to_elements %130 : vector<8xf32>
  %139 = vector.from_elements %131#0, %131#1, %131#2, %131#3, %131#4, %131#5, %131#6, %131#7, %132#0, %132#1, %132#2, %132#3, %132#4, %132#5, %132#6, %132#7, %133#0, %133#1, %133#2, %133#3, %133#4, %133#5, %133#6, %133#7, %134#0, %134#1, %134#2, %134#3, %134#4, %134#5, %134#6, %134#7, %135#0, %135#1, %135#2, %135#3, %135#4, %135#5, %135#6, %135#7, %136#0, %136#1, %136#2, %136#3, %136#4, %136#5, %136#6, %136#7, %137#0, %137#1, %137#2, %137#3, %137#4, %137#5, %137#6, %137#7, %138#0, %138#1, %138#2, %138#3, %138#4, %138#5, %138#6, %138#7 : vector<8x8xf32>
  %140 = arith.addi %43, %c1 : index
  cf.br ^bb5(%140, %139 : index, vector<8x8xf32>) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
^bb12(%141: index):  // 2 preds: ^bb5, ^bb15
  %142 = arith.cmpi slt, %141, %13 : index
  cf.cond_br %142, ^bb13(%c0 : index), ^bb16
^bb13(%143: index):  // 2 preds: ^bb12, ^bb14
  %144 = arith.cmpi slt, %143, %c8 : index
  cf.cond_br %144, ^bb14, ^bb15
^bb14:  // pred: ^bb13
  %145 = memref.load %alloca_20[%141, %143] : memref<8x8xf32>
  memref.store %145, %alloca_19[%141, %143] : memref<8x8xf32>
  %146 = arith.addi %143, %c1 : index
  cf.br ^bb13(%146 : index)
^bb15:  // pred: ^bb13
  %147 = arith.addi %141, %c1 : index
  cf.br ^bb12(%147 : index)
^bb16:  // pred: ^bb12
  %148 = vector.extract %44[0] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c0, %c0], %15, %148 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %149 = vector.extract %44[1] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c1, %c0], %16, %149 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %150 = vector.extract %44[2] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c2, %c0], %17, %150 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %151 = vector.extract %44[3] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c3, %c0], %18, %151 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %152 = vector.extract %44[4] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c4, %c0], %19, %152 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %153 = vector.extract %44[5] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c5, %c0], %20, %153 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %154 = vector.extract %44[6] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c6, %c0], %21, %154 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  %155 = vector.extract %44[7] : vector<8xf32> from vector<8x8xf32>
  vector.maskedstore %alloca_19[%c7, %c0], %22, %155 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
  cf.br ^bb17(%c0 : index)
^bb17(%156: index):  // 2 preds: ^bb16, ^bb20
  %157 = arith.cmpi slt, %156, %13 : index
  cf.cond_br %157, ^bb18(%c0 : index), ^bb21(%c0 : index)
^bb18(%158: index):  // 2 preds: ^bb17, ^bb19
  %159 = arith.cmpi slt, %158, %c8 : index
  cf.cond_br %159, ^bb19, ^bb20
^bb19:  // pred: ^bb18
  %160 = memref.load %alloca_20[%156, %158] : memref<8x8xf32>
  memref.store %160, %alloca[%156, %158] : memref<8x8xf32>
  %161 = arith.addi %158, %c1 : index
  cf.br ^bb18(%161 : index)
^bb20:  // pred: ^bb18
  %162 = arith.addi %156, %c1 : index
  cf.br ^bb17(%162 : index)
^bb21(%163: index):  // 2 preds: ^bb17, ^bb24
  %164 = arith.cmpi slt, %163, %13 : index
  cf.cond_br %164, ^bb22(%c0 : index), ^bb25
^bb22(%165: index):  // 2 preds: ^bb21, ^bb23
  %166 = arith.cmpi slt, %165, %c8 : index
  cf.cond_br %166, ^bb23, ^bb24
^bb23:  // pred: ^bb22
  %167 = memref.load %alloca_19[%163, %165] : memref<8x8xf32>
  memref.store %167, %alloca[%163, %165] : memref<8x8xf32>
  %168 = arith.addi %165, %c1 : index
  cf.br ^bb22(%168 : index)
^bb24:  // pred: ^bb22
  %169 = arith.addi %163, %c1 : index
  cf.br ^bb21(%169 : index)
^bb25:  // pred: ^bb21
  %170 = vector.maskedload %alloca[%c0, %c0], %15, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %171 = vector.maskedload %alloca[%c1, %c0], %16, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %172 = vector.maskedload %alloca[%c2, %c0], %17, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %173 = vector.maskedload %alloca[%c3, %c0], %18, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %174 = vector.maskedload %alloca[%c4, %c0], %19, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %175 = vector.maskedload %alloca[%c5, %c0], %20, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %176 = vector.maskedload %alloca[%c6, %c0], %21, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %177 = vector.maskedload %alloca[%c7, %c0], %22, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  %178:8 = vector.to_elements %170 : vector<8xf32>
  %179:8 = vector.to_elements %171 : vector<8xf32>
  %180:8 = vector.to_elements %172 : vector<8xf32>
  %181:8 = vector.to_elements %173 : vector<8xf32>
  %182:8 = vector.to_elements %174 : vector<8xf32>
  %183:8 = vector.to_elements %175 : vector<8xf32>
  %184:8 = vector.to_elements %176 : vector<8xf32>
  %185:8 = vector.to_elements %177 : vector<8xf32>
  %186 = vector.from_elements %178#0, %178#1, %178#2, %178#3, %178#4, %178#5, %178#6, %178#7, %179#0, %179#1, %179#2, %179#3, %179#4, %179#5, %179#6, %179#7, %180#0, %180#1, %180#2, %180#3, %180#4, %180#5, %180#6, %180#7, %181#0, %181#1, %181#2, %181#3, %181#4, %181#5, %181#6, %181#7, %182#0, %182#1, %182#2, %182#3, %182#4, %182#5, %182#6, %182#7, %183#0, %183#1, %183#2, %183#3, %183#4, %183#5, %183#6, %183#7, %184#0, %184#1, %184#2, %184#3, %184#4, %184#5, %184#6, %184#7, %185#0, %185#1, %185#2, %185#3, %185#4, %185#5, %185#6, %185#7 : vector<8x8xf32>
  %187 = vector.load %assume_align_22[%24] : memref<64xf32>, vector<8xf32>
  %188 = vector.broadcast %187 : vector<8xf32> to vector<8x8xf32>
  %189 = arith.addf %186, %188 : vector<8x8xf32>
  %190 = arith.mulf %189, %189 : vector<8x8xf32>
  %191 = arith.mulf %190, %189 : vector<8x8xf32>
  %192 = arith.mulf %191, %cst_15 : vector<8x8xf32>
  %193 = arith.addf %189, %192 : vector<8x8xf32>
  %194 = arith.mulf %193, %cst_16 : vector<8x8xf32>
  %195 = arith.cmpf ult, %194, %cst_11 : vector<8x8xf32>
  %196 = arith.select %195, %194, %cst_11 : vector<8x8xi1>, vector<8x8xf32>
  %197 = arith.cmpf ugt, %196, %cst_12 : vector<8x8xf32>
  %198 = arith.select %197, %196, %cst_12 : vector<8x8xi1>, vector<8x8xf32>
  %199 = math.absf %194 : vector<8x8xf32>
  %200 = arith.cmpf olt, %199, %cst_10 : vector<8x8xf32>
  %201 = arith.mulf %198, %198 : vector<8x8xf32>
  %202 = math.fma %201, %cst_3, %cst_4 : vector<8x8xf32>
  %203 = math.fma %201, %202, %cst_5 : vector<8x8xf32>
  %204 = math.fma %201, %203, %cst_6 : vector<8x8xf32>
  %205 = math.fma %201, %204, %cst_7 : vector<8x8xf32>
  %206 = math.fma %201, %205, %cst_8 : vector<8x8xf32>
  %207 = math.fma %201, %206, %cst_9 : vector<8x8xf32>
  %208 = arith.mulf %198, %207 : vector<8x8xf32>
  %209 = math.fma %201, %cst, %cst_0 : vector<8x8xf32>
  %210 = math.fma %201, %209, %cst_1 : vector<8x8xf32>
  %211 = math.fma %201, %210, %cst_2 : vector<8x8xf32>
  %212 = arith.divf %208, %211 : vector<8x8xf32>
  %213 = arith.select %200, %198, %212 : vector<8x8xi1>, vector<8x8xf32>
  %214 = arith.addf %213, %cst_17 : vector<8x8xf32>
  %215 = arith.mulf %189, %cst_18 : vector<8x8xf32>
  %216 = arith.mulf %215, %214 : vector<8x8xf32>
  %217 = vector.extract %216[0] : vector<8xf32> from vector<8x8xf32>
  %218 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%5, %10]
  vector.maskedstore %assume_align_23[%218, %24], %15, %217 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %219 = vector.extract %216[1] : vector<8xf32> from vector<8x8xf32>
  %220 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 1)>()[%5, %10]
  vector.maskedstore %assume_align_23[%220, %24], %16, %219 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %221 = vector.extract %216[2] : vector<8xf32> from vector<8x8xf32>
  %222 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 2)>()[%5, %10]
  vector.maskedstore %assume_align_23[%222, %24], %17, %221 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %223 = vector.extract %216[3] : vector<8xf32> from vector<8x8xf32>
  %224 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 3)>()[%5, %10]
  vector.maskedstore %assume_align_23[%224, %24], %18, %223 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %225 = vector.extract %216[4] : vector<8xf32> from vector<8x8xf32>
  %226 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 4)>()[%5, %10]
  vector.maskedstore %assume_align_23[%226, %24], %19, %225 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %227 = vector.extract %216[5] : vector<8xf32> from vector<8x8xf32>
  %228 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 5)>()[%5, %10]
  vector.maskedstore %assume_align_23[%228, %24], %20, %227 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %229 = vector.extract %216[6] : vector<8xf32> from vector<8x8xf32>
  %230 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 6)>()[%5, %10]
  vector.maskedstore %assume_align_23[%230, %24], %21, %229 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %231 = vector.extract %216[7] : vector<8xf32> from vector<8x8xf32>
  %232 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 7)>()[%5, %10]
  vector.maskedstore %assume_align_23[%232, %24], %22, %231 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
  %233 = arith.addi %24, %c8 : index
  cf.br ^bb3(%233 : index) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
^bb26:  // pred: ^bb3
  %234 = arith.addi %10, %c8 : index
  cf.br ^bb1(%234 : index) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
^bb27:  // 2 preds: ^bb0, ^bb1
  return
}

