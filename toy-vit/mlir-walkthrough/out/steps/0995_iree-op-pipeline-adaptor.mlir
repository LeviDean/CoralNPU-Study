module {
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
    %8 = arith.cmpi slt, %7, %c16 : index
    %9 = arith.select %8, %7, %c16 : index
    %10 = arith.cmpi sgt, %9, %c0 : index
    cf.cond_br %10, ^bb1(%c0 : index), ^bb27
  ^bb1(%11: index):  // 2 preds: ^bb0, ^bb26
    %12 = arith.cmpi slt, %11, %9 : index
    cf.cond_br %12, ^bb2, ^bb27
  ^bb2:  // pred: ^bb1
    %13 = arith.subi %9, %11 : index
    %14 = arith.cmpi slt, %13, %c8 : index
    %15 = arith.select %14, %13, %c8 : index
    %16 = vector.create_mask %15, %c8 : vector<8x8xi1>
    %17 = vector.extract %16[0] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c0, %c0], %17, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %18 = vector.extract %16[1] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c1, %c0], %18, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %19 = vector.extract %16[2] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c2, %c0], %19, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %20 = vector.extract %16[3] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c3, %c0], %20, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %21 = vector.extract %16[4] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c4, %c0], %21, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %22 = vector.extract %16[5] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c5, %c0], %22, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %23 = vector.extract %16[6] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c6, %c0], %23, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %24 = vector.extract %16[7] : vector<8xi1> from vector<8x8xi1>
    vector.maskedstore %alloca_20[%c7, %c0], %24, %cst_14 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %25 = arith.addi %11, %5 : index
    cf.br ^bb3(%c0 : index)
  ^bb3(%26: index):  // 2 preds: ^bb2, ^bb25
    %27 = arith.cmpi slt, %26, %c64 : index
    cf.cond_br %27, ^bb4, ^bb26
  ^bb4:  // pred: ^bb3
    %28 = vector.maskedload %alloca_20[%c0, %c0], %17, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %29 = vector.maskedload %alloca_20[%c1, %c0], %18, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %30 = vector.maskedload %alloca_20[%c2, %c0], %19, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %31 = vector.maskedload %alloca_20[%c3, %c0], %20, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %32 = vector.maskedload %alloca_20[%c4, %c0], %21, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %33 = vector.maskedload %alloca_20[%c5, %c0], %22, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %34 = vector.maskedload %alloca_20[%c6, %c0], %23, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %35 = vector.maskedload %alloca_20[%c7, %c0], %24, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %36:8 = vector.to_elements %28 : vector<8xf32>
    %37:8 = vector.to_elements %29 : vector<8xf32>
    %38:8 = vector.to_elements %30 : vector<8xf32>
    %39:8 = vector.to_elements %31 : vector<8xf32>
    %40:8 = vector.to_elements %32 : vector<8xf32>
    %41:8 = vector.to_elements %33 : vector<8xf32>
    %42:8 = vector.to_elements %34 : vector<8xf32>
    %43:8 = vector.to_elements %35 : vector<8xf32>
    %44 = vector.from_elements %36#0, %36#1, %36#2, %36#3, %36#4, %36#5, %36#6, %36#7, %37#0, %37#1, %37#2, %37#3, %37#4, %37#5, %37#6, %37#7, %38#0, %38#1, %38#2, %38#3, %38#4, %38#5, %38#6, %38#7, %39#0, %39#1, %39#2, %39#3, %39#4, %39#5, %39#6, %39#7, %40#0, %40#1, %40#2, %40#3, %40#4, %40#5, %40#6, %40#7, %41#0, %41#1, %41#2, %41#3, %41#4, %41#5, %41#6, %41#7, %42#0, %42#1, %42#2, %42#3, %42#4, %42#5, %42#6, %42#7, %43#0, %43#1, %43#2, %43#3, %43#4, %43#5, %43#6, %43#7 : vector<8x8xf32>
    cf.br ^bb5(%c0, %44 : index, vector<8x8xf32>)
  ^bb5(%45: index, %46: vector<8x8xf32>):  // 2 preds: ^bb4, ^bb11
    %47 = arith.cmpi slt, %45, %c32 : index
    cf.cond_br %47, ^bb6, ^bb12(%c0 : index)
  ^bb6:  // pred: ^bb5
    %48 = arith.index_cast %15 : index to i32
    %49 = vector.broadcast %48 : i32 to vector<8xi32>
    %50 = arith.cmpi sgt, %49, %cst_13 : vector<8xi32>
    cf.br ^bb7(%c0, %0 : index, vector<8xf32>)
  ^bb7(%51: index, %52: vector<8xf32>):  // 2 preds: ^bb6, ^bb10
    %53 = arith.cmpi slt, %51, %c8 : index
    cf.cond_br %53, ^bb8, ^bb11
  ^bb8:  // pred: ^bb7
    %54 = vector.extract %50[%51] : i1 from vector<8xi1>
    cf.cond_br %54, ^bb9, ^bb10(%52 : vector<8xf32>)
  ^bb9:  // pred: ^bb8
    %55 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%25, %51]
    %56 = memref.load %assume_align[%55, %45] : memref<17x32xf32>
    %57 = vector.insert %56, %52 [%51] : f32 into vector<8xf32>
    cf.br ^bb10(%57 : vector<8xf32>)
  ^bb10(%58: vector<8xf32>):  // 2 preds: ^bb8, ^bb9
    %59 = arith.addi %51, %c1 : index
    cf.br ^bb7(%59, %58 : index, vector<8xf32>)
  ^bb11:  // pred: ^bb7
    %60 = vector.load %assume_align_21[%26, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %61 = arith.addi %26, %c1 : index
    %62 = vector.load %assume_align_21[%61, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %63 = arith.addi %26, %c2 : index
    %64 = vector.load %assume_align_21[%63, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %65 = arith.addi %26, %c3 : index
    %66 = vector.load %assume_align_21[%65, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %67 = arith.addi %26, %c4 : index
    %68 = vector.load %assume_align_21[%67, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %69 = arith.addi %26, %c5 : index
    %70 = vector.load %assume_align_21[%69, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %71 = arith.addi %26, %c6 : index
    %72 = vector.load %assume_align_21[%71, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %73 = arith.addi %26, %c7 : index
    %74 = vector.load %assume_align_21[%73, %45] : memref<64x32xf32, strided<[32, 1], offset: ?>>, vector<1xf32>
    %75 = vector.to_elements %60 : vector<1xf32>
    %76 = vector.to_elements %62 : vector<1xf32>
    %77 = vector.to_elements %64 : vector<1xf32>
    %78 = vector.to_elements %66 : vector<1xf32>
    %79 = vector.to_elements %68 : vector<1xf32>
    %80 = vector.to_elements %70 : vector<1xf32>
    %81 = vector.to_elements %72 : vector<1xf32>
    %82 = vector.to_elements %74 : vector<1xf32>
    %83 = vector.create_mask %c1, %15, %c8 : vector<1x8x8xi1>
    %84 = vector.from_elements %75, %76, %77, %78, %79, %80, %81, %82 : vector<8xf32>
    %85 = vector.extract %52[0] : f32 from vector<8xf32>
    %86 = vector.broadcast %85 : f32 to vector<8xf32>
    %87 = vector.extract %46[0] : vector<8xf32> from vector<8x8xf32>
    %88 = vector.extract %83[0, 0] : vector<8xi1> from vector<1x8x8xi1>
    %89 = vector.fma %86, %84, %87 : vector<8xf32>
    %90 = arith.select %88, %89, %87 : vector<8xi1>, vector<8xf32>
    %91 = vector.extract %52[1] : f32 from vector<8xf32>
    %92 = vector.broadcast %91 : f32 to vector<8xf32>
    %93 = vector.extract %46[1] : vector<8xf32> from vector<8x8xf32>
    %94 = vector.extract %83[0, 1] : vector<8xi1> from vector<1x8x8xi1>
    %95 = vector.fma %92, %84, %93 : vector<8xf32>
    %96 = arith.select %94, %95, %93 : vector<8xi1>, vector<8xf32>
    %97 = vector.extract %52[2] : f32 from vector<8xf32>
    %98 = vector.broadcast %97 : f32 to vector<8xf32>
    %99 = vector.extract %46[2] : vector<8xf32> from vector<8x8xf32>
    %100 = vector.extract %83[0, 2] : vector<8xi1> from vector<1x8x8xi1>
    %101 = vector.fma %98, %84, %99 : vector<8xf32>
    %102 = arith.select %100, %101, %99 : vector<8xi1>, vector<8xf32>
    %103 = vector.extract %52[3] : f32 from vector<8xf32>
    %104 = vector.broadcast %103 : f32 to vector<8xf32>
    %105 = vector.extract %46[3] : vector<8xf32> from vector<8x8xf32>
    %106 = vector.extract %83[0, 3] : vector<8xi1> from vector<1x8x8xi1>
    %107 = vector.fma %104, %84, %105 : vector<8xf32>
    %108 = arith.select %106, %107, %105 : vector<8xi1>, vector<8xf32>
    %109 = vector.extract %52[4] : f32 from vector<8xf32>
    %110 = vector.broadcast %109 : f32 to vector<8xf32>
    %111 = vector.extract %46[4] : vector<8xf32> from vector<8x8xf32>
    %112 = vector.extract %83[0, 4] : vector<8xi1> from vector<1x8x8xi1>
    %113 = vector.fma %110, %84, %111 : vector<8xf32>
    %114 = arith.select %112, %113, %111 : vector<8xi1>, vector<8xf32>
    %115 = vector.extract %52[5] : f32 from vector<8xf32>
    %116 = vector.broadcast %115 : f32 to vector<8xf32>
    %117 = vector.extract %46[5] : vector<8xf32> from vector<8x8xf32>
    %118 = vector.extract %83[0, 5] : vector<8xi1> from vector<1x8x8xi1>
    %119 = vector.fma %116, %84, %117 : vector<8xf32>
    %120 = arith.select %118, %119, %117 : vector<8xi1>, vector<8xf32>
    %121 = vector.extract %52[6] : f32 from vector<8xf32>
    %122 = vector.broadcast %121 : f32 to vector<8xf32>
    %123 = vector.extract %46[6] : vector<8xf32> from vector<8x8xf32>
    %124 = vector.extract %83[0, 6] : vector<8xi1> from vector<1x8x8xi1>
    %125 = vector.fma %122, %84, %123 : vector<8xf32>
    %126 = arith.select %124, %125, %123 : vector<8xi1>, vector<8xf32>
    %127 = vector.extract %52[7] : f32 from vector<8xf32>
    %128 = vector.broadcast %127 : f32 to vector<8xf32>
    %129 = vector.extract %46[7] : vector<8xf32> from vector<8x8xf32>
    %130 = vector.extract %83[0, 7] : vector<8xi1> from vector<1x8x8xi1>
    %131 = vector.fma %128, %84, %129 : vector<8xf32>
    %132 = arith.select %130, %131, %129 : vector<8xi1>, vector<8xf32>
    %133:8 = vector.to_elements %90 : vector<8xf32>
    %134:8 = vector.to_elements %96 : vector<8xf32>
    %135:8 = vector.to_elements %102 : vector<8xf32>
    %136:8 = vector.to_elements %108 : vector<8xf32>
    %137:8 = vector.to_elements %114 : vector<8xf32>
    %138:8 = vector.to_elements %120 : vector<8xf32>
    %139:8 = vector.to_elements %126 : vector<8xf32>
    %140:8 = vector.to_elements %132 : vector<8xf32>
    %141 = vector.from_elements %133#0, %133#1, %133#2, %133#3, %133#4, %133#5, %133#6, %133#7, %134#0, %134#1, %134#2, %134#3, %134#4, %134#5, %134#6, %134#7, %135#0, %135#1, %135#2, %135#3, %135#4, %135#5, %135#6, %135#7, %136#0, %136#1, %136#2, %136#3, %136#4, %136#5, %136#6, %136#7, %137#0, %137#1, %137#2, %137#3, %137#4, %137#5, %137#6, %137#7, %138#0, %138#1, %138#2, %138#3, %138#4, %138#5, %138#6, %138#7, %139#0, %139#1, %139#2, %139#3, %139#4, %139#5, %139#6, %139#7, %140#0, %140#1, %140#2, %140#3, %140#4, %140#5, %140#6, %140#7 : vector<8x8xf32>
    %142 = arith.addi %45, %c1 : index
    cf.br ^bb5(%142, %141 : index, vector<8x8xf32>) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
  ^bb12(%143: index):  // 2 preds: ^bb5, ^bb15
    %144 = arith.cmpi slt, %143, %15 : index
    cf.cond_br %144, ^bb13(%c0 : index), ^bb16
  ^bb13(%145: index):  // 2 preds: ^bb12, ^bb14
    %146 = arith.cmpi slt, %145, %c8 : index
    cf.cond_br %146, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %147 = memref.load %alloca_20[%143, %145] : memref<8x8xf32>
    memref.store %147, %alloca_19[%143, %145] : memref<8x8xf32>
    %148 = arith.addi %145, %c1 : index
    cf.br ^bb13(%148 : index)
  ^bb15:  // pred: ^bb13
    %149 = arith.addi %143, %c1 : index
    cf.br ^bb12(%149 : index)
  ^bb16:  // pred: ^bb12
    %150 = vector.extract %46[0] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c0, %c0], %17, %150 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %151 = vector.extract %46[1] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c1, %c0], %18, %151 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %152 = vector.extract %46[2] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c2, %c0], %19, %152 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %153 = vector.extract %46[3] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c3, %c0], %20, %153 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %154 = vector.extract %46[4] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c4, %c0], %21, %154 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %155 = vector.extract %46[5] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c5, %c0], %22, %155 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %156 = vector.extract %46[6] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c6, %c0], %23, %156 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    %157 = vector.extract %46[7] : vector<8xf32> from vector<8x8xf32>
    vector.maskedstore %alloca_19[%c7, %c0], %24, %157 : memref<8x8xf32>, vector<8xi1>, vector<8xf32>
    cf.br ^bb17(%c0 : index)
  ^bb17(%158: index):  // 2 preds: ^bb16, ^bb20
    %159 = arith.cmpi slt, %158, %15 : index
    cf.cond_br %159, ^bb18(%c0 : index), ^bb21(%c0 : index)
  ^bb18(%160: index):  // 2 preds: ^bb17, ^bb19
    %161 = arith.cmpi slt, %160, %c8 : index
    cf.cond_br %161, ^bb19, ^bb20
  ^bb19:  // pred: ^bb18
    %162 = memref.load %alloca_20[%158, %160] : memref<8x8xf32>
    memref.store %162, %alloca[%158, %160] : memref<8x8xf32>
    %163 = arith.addi %160, %c1 : index
    cf.br ^bb18(%163 : index)
  ^bb20:  // pred: ^bb18
    %164 = arith.addi %158, %c1 : index
    cf.br ^bb17(%164 : index)
  ^bb21(%165: index):  // 2 preds: ^bb17, ^bb24
    %166 = arith.cmpi slt, %165, %15 : index
    cf.cond_br %166, ^bb22(%c0 : index), ^bb25
  ^bb22(%167: index):  // 2 preds: ^bb21, ^bb23
    %168 = arith.cmpi slt, %167, %c8 : index
    cf.cond_br %168, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %169 = memref.load %alloca_19[%165, %167] : memref<8x8xf32>
    memref.store %169, %alloca[%165, %167] : memref<8x8xf32>
    %170 = arith.addi %167, %c1 : index
    cf.br ^bb22(%170 : index)
  ^bb24:  // pred: ^bb22
    %171 = arith.addi %165, %c1 : index
    cf.br ^bb21(%171 : index)
  ^bb25:  // pred: ^bb21
    %172 = vector.maskedload %alloca[%c0, %c0], %17, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %173 = vector.maskedload %alloca[%c1, %c0], %18, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %174 = vector.maskedload %alloca[%c2, %c0], %19, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %175 = vector.maskedload %alloca[%c3, %c0], %20, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %176 = vector.maskedload %alloca[%c4, %c0], %21, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %177 = vector.maskedload %alloca[%c5, %c0], %22, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %178 = vector.maskedload %alloca[%c6, %c0], %23, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %179 = vector.maskedload %alloca[%c7, %c0], %24, %0 : memref<8x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
    %180:8 = vector.to_elements %172 : vector<8xf32>
    %181:8 = vector.to_elements %173 : vector<8xf32>
    %182:8 = vector.to_elements %174 : vector<8xf32>
    %183:8 = vector.to_elements %175 : vector<8xf32>
    %184:8 = vector.to_elements %176 : vector<8xf32>
    %185:8 = vector.to_elements %177 : vector<8xf32>
    %186:8 = vector.to_elements %178 : vector<8xf32>
    %187:8 = vector.to_elements %179 : vector<8xf32>
    %188 = vector.from_elements %180#0, %180#1, %180#2, %180#3, %180#4, %180#5, %180#6, %180#7, %181#0, %181#1, %181#2, %181#3, %181#4, %181#5, %181#6, %181#7, %182#0, %182#1, %182#2, %182#3, %182#4, %182#5, %182#6, %182#7, %183#0, %183#1, %183#2, %183#3, %183#4, %183#5, %183#6, %183#7, %184#0, %184#1, %184#2, %184#3, %184#4, %184#5, %184#6, %184#7, %185#0, %185#1, %185#2, %185#3, %185#4, %185#5, %185#6, %185#7, %186#0, %186#1, %186#2, %186#3, %186#4, %186#5, %186#6, %186#7, %187#0, %187#1, %187#2, %187#3, %187#4, %187#5, %187#6, %187#7 : vector<8x8xf32>
    %189 = vector.load %assume_align_22[%26] : memref<64xf32>, vector<8xf32>
    %190 = vector.broadcast %189 : vector<8xf32> to vector<8x8xf32>
    %191 = arith.addf %188, %190 : vector<8x8xf32>
    %192 = arith.mulf %191, %191 : vector<8x8xf32>
    %193 = arith.mulf %192, %191 : vector<8x8xf32>
    %194 = arith.mulf %193, %cst_15 : vector<8x8xf32>
    %195 = arith.addf %191, %194 : vector<8x8xf32>
    %196 = arith.mulf %195, %cst_16 : vector<8x8xf32>
    %197 = arith.cmpf ult, %196, %cst_11 : vector<8x8xf32>
    %198 = arith.select %197, %196, %cst_11 : vector<8x8xi1>, vector<8x8xf32>
    %199 = arith.cmpf ugt, %198, %cst_12 : vector<8x8xf32>
    %200 = arith.select %199, %198, %cst_12 : vector<8x8xi1>, vector<8x8xf32>
    %201 = math.absf %196 : vector<8x8xf32>
    %202 = arith.cmpf olt, %201, %cst_10 : vector<8x8xf32>
    %203 = arith.mulf %200, %200 : vector<8x8xf32>
    %204 = math.fma %203, %cst_3, %cst_4 : vector<8x8xf32>
    %205 = math.fma %203, %204, %cst_5 : vector<8x8xf32>
    %206 = math.fma %203, %205, %cst_6 : vector<8x8xf32>
    %207 = math.fma %203, %206, %cst_7 : vector<8x8xf32>
    %208 = math.fma %203, %207, %cst_8 : vector<8x8xf32>
    %209 = math.fma %203, %208, %cst_9 : vector<8x8xf32>
    %210 = arith.mulf %200, %209 : vector<8x8xf32>
    %211 = math.fma %203, %cst, %cst_0 : vector<8x8xf32>
    %212 = math.fma %203, %211, %cst_1 : vector<8x8xf32>
    %213 = math.fma %203, %212, %cst_2 : vector<8x8xf32>
    %214 = arith.divf %210, %213 : vector<8x8xf32>
    %215 = arith.select %202, %200, %214 : vector<8x8xi1>, vector<8x8xf32>
    %216 = arith.addf %215, %cst_17 : vector<8x8xf32>
    %217 = arith.mulf %191, %cst_18 : vector<8x8xf32>
    %218 = arith.mulf %217, %216 : vector<8x8xf32>
    %219 = vector.extract %218[0] : vector<8xf32> from vector<8x8xf32>
    %220 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%5, %11]
    vector.maskedstore %assume_align_23[%220, %26], %17, %219 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %221 = vector.extract %218[1] : vector<8xf32> from vector<8x8xf32>
    %222 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 1)>()[%5, %11]
    vector.maskedstore %assume_align_23[%222, %26], %18, %221 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %223 = vector.extract %218[2] : vector<8xf32> from vector<8x8xf32>
    %224 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 2)>()[%5, %11]
    vector.maskedstore %assume_align_23[%224, %26], %19, %223 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %225 = vector.extract %218[3] : vector<8xf32> from vector<8x8xf32>
    %226 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 3)>()[%5, %11]
    vector.maskedstore %assume_align_23[%226, %26], %20, %225 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %227 = vector.extract %218[4] : vector<8xf32> from vector<8x8xf32>
    %228 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 4)>()[%5, %11]
    vector.maskedstore %assume_align_23[%228, %26], %21, %227 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %229 = vector.extract %218[5] : vector<8xf32> from vector<8x8xf32>
    %230 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 5)>()[%5, %11]
    vector.maskedstore %assume_align_23[%230, %26], %22, %229 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %231 = vector.extract %218[6] : vector<8xf32> from vector<8x8xf32>
    %232 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 6)>()[%5, %11]
    vector.maskedstore %assume_align_23[%232, %26], %23, %231 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %233 = vector.extract %218[7] : vector<8xf32> from vector<8x8xf32>
    %234 = affine.apply affine_map<()[s0, s1] -> (s0 + s1 + 7)>()[%5, %11]
    vector.maskedstore %assume_align_23[%234, %26], %24, %233 : memref<17x64xf32>, vector<8xi1>, vector<8xf32>
    %235 = arith.addi %26, %c8 : index
    cf.br ^bb3(%235 : index) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
  ^bb26:  // pred: ^bb3
    %236 = arith.addi %11, %c8 : index
    cf.br ^bb1(%236 : index) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
  ^bb27:  // 2 preds: ^bb0, ^bb1
    return
  }
}

