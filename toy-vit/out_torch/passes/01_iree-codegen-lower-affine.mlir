hal.executable.variant public @embedded_elf_riscv_32 target(<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>) {
  hal.executable.export public @main_dispatch_13_matmul_17x64x32_f32 ordinal(0) layout(#hal.pipeline.layout<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    hal.return %c2, %c1, %c1_0 : index, index, index
  } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
  builtin.module {
    func.func @main_dispatch_13_matmul_17x64x32_f32() {
      %cst = arith.constant dense_resource<__elided__> : vector<8xi32>
      %0 = ub.poison : vector<8xf32>
      %c7 = arith.constant 7 : index
      %c6 = arith.constant 6 : index
      %c5 = arith.constant 5 : index
      %c4 = arith.constant 4 : index
      %c3 = arith.constant 3 : index
      %c2 = arith.constant 2 : index
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %cst_1 = arith.constant dense<3.000000e+00> : vector<8x8xf32>
      %cst_2 = arith.constant dense<4.471500e-02> : vector<8x8xf32>
      %cst_3 = arith.constant dense<0.797884523> : vector<8x8xf32>
      %cst_4 = arith.constant dense<1.000000e+00> : vector<8x8xf32>
      %cst_5 = arith.constant dense<5.000000e-01> : vector<8x8xf32>
      %alloca = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
      %alloca_6 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
      %alloca_7 = memref.alloca() {alignment = 64 : i64} : memref<8x8xf32>
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
      %assume_align_8 = memref.assume_alignment %7, 64 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %8 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%5#1) flags(ReadOnly) : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %assume_align_9 = memref.assume_alignment %8, 64 : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %9 = hal.interface.binding.subspan layout(<constants = 2, bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
      %assume_align_10 = memref.assume_alignment %9, 64 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
      %workgroup_id_x = hal.interface.workgroup.id[0] : index
      %workgroup_count_x = hal.interface.workgroup.count[0] : index
      %c16 = arith.constant 16 : index
      %10 = arith.muli %workgroup_id_x, %c16 overflow<nsw> : index
      %c-1 = arith.constant -1 : index
      %11 = arith.muli %10, %c-1 overflow<nsw> : index
      %c17 = arith.constant 17 : index
      %12 = arith.addi %11, %c17 : index
      %c16_11 = arith.constant 16 : index
      %13 = arith.minsi %12, %c16_11 : index
      %subview = memref.subview %assume_align_10[%10, 0] [%13, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %14 = arith.cmpi sgt, %13, %c0 : index
      scf.if %14 {
        %c-1_12 = arith.constant -1 : index
        %15 = arith.muli %10, %c-1_12 overflow<nsw> : index
        %c17_13 = arith.constant 17 : index
        %16 = arith.addi %15, %c17_13 : index
        %c16_14 = arith.constant 16 : index
        %17 = arith.minsi %16, %c16_14 : index
        %subview_15 = memref.subview %subview[0, 0] [%17, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        scf.for %arg0 = %c0 to %17 step %c8 {
          %c-1_16 = arith.constant -1 : index
          %18 = arith.muli %arg0, %c-1_16 overflow<nsw> : index
          %19 = arith.addi %18, %17 : index
          %c8_17 = arith.constant 8 : index
          %20 = arith.minsi %19, %c8_17 : index
          %subview_18 = memref.subview %alloca_7[0, 0] [%20, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          %21 = vector.create_mask %20, %c8 : vector<8x8xi1>
          %22 = vector.extract %21[0] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c0, %c0], %22, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %23 = vector.extract %21[1] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c1, %c0], %23, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %24 = vector.extract %21[2] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c2, %c0], %24, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %25 = vector.extract %21[3] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c3, %c0], %25, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %26 = vector.extract %21[4] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c4, %c0], %26, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %27 = vector.extract %21[5] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c5, %c0], %27, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %28 = vector.extract %21[6] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c6, %c0], %28, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %29 = vector.extract %21[7] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_18[%c7, %c0], %29, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %30 = arith.addi %arg0, %10 : index
          scf.for %arg1 = %c0 to %c64 step %c8 {
            %subview_19 = memref.subview %subview_15[%arg0, %arg1] [%20, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %31 = vector.extract %21[0] : vector<8xi1> from vector<8x8xi1>
            %32 = vector.maskedload %subview_18[%c0, %c0], %31, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %33 = vector.extract %21[1] : vector<8xi1> from vector<8x8xi1>
            %34 = vector.maskedload %subview_18[%c1, %c0], %33, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %35 = vector.extract %21[2] : vector<8xi1> from vector<8x8xi1>
            %36 = vector.maskedload %subview_18[%c2, %c0], %35, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %37 = vector.extract %21[3] : vector<8xi1> from vector<8x8xi1>
            %38 = vector.maskedload %subview_18[%c3, %c0], %37, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %39 = vector.extract %21[4] : vector<8xi1> from vector<8x8xi1>
            %40 = vector.maskedload %subview_18[%c4, %c0], %39, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %41 = vector.extract %21[5] : vector<8xi1> from vector<8x8xi1>
            %42 = vector.maskedload %subview_18[%c5, %c0], %41, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %43 = vector.extract %21[6] : vector<8xi1> from vector<8x8xi1>
            %44 = vector.maskedload %subview_18[%c6, %c0], %43, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %45 = vector.extract %21[7] : vector<8xi1> from vector<8x8xi1>
            %46 = vector.maskedload %subview_18[%c7, %c0], %45, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %47:8 = vector.to_elements %32 : vector<8xf32>
            %48:8 = vector.to_elements %34 : vector<8xf32>
            %49:8 = vector.to_elements %36 : vector<8xf32>
            %50:8 = vector.to_elements %38 : vector<8xf32>
            %51:8 = vector.to_elements %40 : vector<8xf32>
            %52:8 = vector.to_elements %42 : vector<8xf32>
            %53:8 = vector.to_elements %44 : vector<8xf32>
            %54:8 = vector.to_elements %46 : vector<8xf32>
            %55 = vector.from_elements %47#0, %47#1, %47#2, %47#3, %47#4, %47#5, %47#6, %47#7, %48#0, %48#1, %48#2, %48#3, %48#4, %48#5, %48#6, %48#7, %49#0, %49#1, %49#2, %49#3, %49#4, %49#5, %49#6, %49#7, %50#0, %50#1, %50#2, %50#3, %50#4, %50#5, %50#6, %50#7, %51#0, %51#1, %51#2, %51#3, %51#4, %51#5, %51#6, %51#7, %52#0, %52#1, %52#2, %52#3, %52#4, %52#5, %52#6, %52#7, %53#0, %53#1, %53#2, %53#3, %53#4, %53#5, %53#6, %53#7, %54#0, %54#1, %54#2, %54#3, %54#4, %54#5, %54#6, %54#7 : vector<8x8xf32>
            %56 = scf.for %arg2 = %c0 to %c32 step %c1 iter_args(%arg3 = %55) -> (vector<8x8xf32>) {
              %subview_22 = memref.subview %assume_align[%30, %arg2] [%20, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
              %125 = arith.index_cast %20 : index to i32
              %126 = vector.broadcast %125 : i32 to vector<8xi32>
              %127 = arith.cmpi sgt, %126, %cst : vector<8xi32>
              %subview_23 = memref.subview %subview_22[0, 0] [%20, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
              %128 = scf.for %arg4 = %c0 to %c8 step %c1 iter_args(%arg5 = %0) -> (vector<8xf32>) {
                %211 = vector.extract %127[%arg4] : i1 from vector<8xi1>
                %212 = scf.if %211 -> (vector<8xf32>) {
                  %213 = memref.load %subview_23[%arg4] : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
                  %214 = vector.insert %213, %arg5 [%arg4] : f32 into vector<8xf32>
                  scf.yield %214 : vector<8xf32>
                } else {
                  scf.yield %arg5 : vector<8xf32>
                }
                scf.yield %212 : vector<8xf32>
              }
              %129 = vector.load %assume_align_8[%arg1, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c1_24 = arith.constant 1 : index
              %130 = arith.addi %arg1, %c1_24 : index
              %131 = vector.load %assume_align_8[%130, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c2_25 = arith.constant 2 : index
              %132 = arith.addi %arg1, %c2_25 : index
              %133 = vector.load %assume_align_8[%132, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c3_26 = arith.constant 3 : index
              %134 = arith.addi %arg1, %c3_26 : index
              %135 = vector.load %assume_align_8[%134, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c4_27 = arith.constant 4 : index
              %136 = arith.addi %arg1, %c4_27 : index
              %137 = vector.load %assume_align_8[%136, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c5_28 = arith.constant 5 : index
              %138 = arith.addi %arg1, %c5_28 : index
              %139 = vector.load %assume_align_8[%138, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c6_29 = arith.constant 6 : index
              %140 = arith.addi %arg1, %c6_29 : index
              %141 = vector.load %assume_align_8[%140, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %c7_30 = arith.constant 7 : index
              %142 = arith.addi %arg1, %c7_30 : index
              %143 = vector.load %assume_align_8[%142, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %144 = vector.to_elements %129 : vector<1xf32>
              %145 = vector.to_elements %131 : vector<1xf32>
              %146 = vector.to_elements %133 : vector<1xf32>
              %147 = vector.to_elements %135 : vector<1xf32>
              %148 = vector.to_elements %137 : vector<1xf32>
              %149 = vector.to_elements %139 : vector<1xf32>
              %150 = vector.to_elements %141 : vector<1xf32>
              %151 = vector.to_elements %143 : vector<1xf32>
              %152 = vector.create_mask %c1, %20, %c8 : vector<1x8x8xi1>
              %153 = vector.from_elements %144, %145, %146, %147, %148, %149, %150, %151 : vector<8xf32>
              %154 = vector.extract %128[0] : f32 from vector<8xf32>
              %155 = vector.broadcast %154 : f32 to vector<8xf32>
              %156 = vector.extract %arg3[0] : vector<8xf32> from vector<8x8xf32>
              %157 = vector.extract %152[0, 0] : vector<8xi1> from vector<1x8x8xi1>
              %158 = vector.fma %155, %153, %156 : vector<8xf32>
              %159 = arith.select %157, %158, %156 : vector<8xi1>, vector<8xf32>
              %160 = vector.extract %128[1] : f32 from vector<8xf32>
              %161 = vector.broadcast %160 : f32 to vector<8xf32>
              %162 = vector.extract %arg3[1] : vector<8xf32> from vector<8x8xf32>
              %163 = vector.extract %152[0, 1] : vector<8xi1> from vector<1x8x8xi1>
              %164 = vector.fma %161, %153, %162 : vector<8xf32>
              %165 = arith.select %163, %164, %162 : vector<8xi1>, vector<8xf32>
              %166 = vector.extract %128[2] : f32 from vector<8xf32>
              %167 = vector.broadcast %166 : f32 to vector<8xf32>
              %168 = vector.extract %arg3[2] : vector<8xf32> from vector<8x8xf32>
              %169 = vector.extract %152[0, 2] : vector<8xi1> from vector<1x8x8xi1>
              %170 = vector.fma %167, %153, %168 : vector<8xf32>
              %171 = arith.select %169, %170, %168 : vector<8xi1>, vector<8xf32>
              %172 = vector.extract %128[3] : f32 from vector<8xf32>
              %173 = vector.broadcast %172 : f32 to vector<8xf32>
              %174 = vector.extract %arg3[3] : vector<8xf32> from vector<8x8xf32>
              %175 = vector.extract %152[0, 3] : vector<8xi1> from vector<1x8x8xi1>
              %176 = vector.fma %173, %153, %174 : vector<8xf32>
              %177 = arith.select %175, %176, %174 : vector<8xi1>, vector<8xf32>
              %178 = vector.extract %128[4] : f32 from vector<8xf32>
              %179 = vector.broadcast %178 : f32 to vector<8xf32>
              %180 = vector.extract %arg3[4] : vector<8xf32> from vector<8x8xf32>
              %181 = vector.extract %152[0, 4] : vector<8xi1> from vector<1x8x8xi1>
              %182 = vector.fma %179, %153, %180 : vector<8xf32>
              %183 = arith.select %181, %182, %180 : vector<8xi1>, vector<8xf32>
              %184 = vector.extract %128[5] : f32 from vector<8xf32>
              %185 = vector.broadcast %184 : f32 to vector<8xf32>
              %186 = vector.extract %arg3[5] : vector<8xf32> from vector<8x8xf32>
              %187 = vector.extract %152[0, 5] : vector<8xi1> from vector<1x8x8xi1>
              %188 = vector.fma %185, %153, %186 : vector<8xf32>
              %189 = arith.select %187, %188, %186 : vector<8xi1>, vector<8xf32>
              %190 = vector.extract %128[6] : f32 from vector<8xf32>
              %191 = vector.broadcast %190 : f32 to vector<8xf32>
              %192 = vector.extract %arg3[6] : vector<8xf32> from vector<8x8xf32>
              %193 = vector.extract %152[0, 6] : vector<8xi1> from vector<1x8x8xi1>
              %194 = vector.fma %191, %153, %192 : vector<8xf32>
              %195 = arith.select %193, %194, %192 : vector<8xi1>, vector<8xf32>
              %196 = vector.extract %128[7] : f32 from vector<8xf32>
              %197 = vector.broadcast %196 : f32 to vector<8xf32>
              %198 = vector.extract %arg3[7] : vector<8xf32> from vector<8x8xf32>
              %199 = vector.extract %152[0, 7] : vector<8xi1> from vector<1x8x8xi1>
              %200 = vector.fma %197, %153, %198 : vector<8xf32>
              %201 = arith.select %199, %200, %198 : vector<8xi1>, vector<8xf32>
              %202:8 = vector.to_elements %159 : vector<8xf32>
              %203:8 = vector.to_elements %165 : vector<8xf32>
              %204:8 = vector.to_elements %171 : vector<8xf32>
              %205:8 = vector.to_elements %177 : vector<8xf32>
              %206:8 = vector.to_elements %183 : vector<8xf32>
              %207:8 = vector.to_elements %189 : vector<8xf32>
              %208:8 = vector.to_elements %195 : vector<8xf32>
              %209:8 = vector.to_elements %201 : vector<8xf32>
              %210 = vector.from_elements %202#0, %202#1, %202#2, %202#3, %202#4, %202#5, %202#6, %202#7, %203#0, %203#1, %203#2, %203#3, %203#4, %203#5, %203#6, %203#7, %204#0, %204#1, %204#2, %204#3, %204#4, %204#5, %204#6, %204#7, %205#0, %205#1, %205#2, %205#3, %205#4, %205#5, %205#6, %205#7, %206#0, %206#1, %206#2, %206#3, %206#4, %206#5, %206#6, %206#7, %207#0, %207#1, %207#2, %207#3, %207#4, %207#5, %207#6, %207#7, %208#0, %208#1, %208#2, %208#3, %208#4, %208#5, %208#6, %208#7, %209#0, %209#1, %209#2, %209#3, %209#4, %209#5, %209#6, %209#7 : vector<8x8xf32>
              scf.yield %210 : vector<8x8xf32>
            }
            %subview_20 = memref.subview %alloca_6[0, 0] [%20, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_18 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_20 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            %57 = vector.extract %56[0] : vector<8xf32> from vector<8x8xf32>
            %58 = vector.extract %21[0] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c0, %c0], %58, %57 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %59 = vector.extract %56[1] : vector<8xf32> from vector<8x8xf32>
            %60 = vector.extract %21[1] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c1, %c0], %60, %59 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %61 = vector.extract %56[2] : vector<8xf32> from vector<8x8xf32>
            %62 = vector.extract %21[2] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c2, %c0], %62, %61 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %63 = vector.extract %56[3] : vector<8xf32> from vector<8x8xf32>
            %64 = vector.extract %21[3] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c3, %c0], %64, %63 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %65 = vector.extract %56[4] : vector<8xf32> from vector<8x8xf32>
            %66 = vector.extract %21[4] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c4, %c0], %66, %65 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %67 = vector.extract %56[5] : vector<8xf32> from vector<8x8xf32>
            %68 = vector.extract %21[5] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c5, %c0], %68, %67 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %69 = vector.extract %56[6] : vector<8xf32> from vector<8x8xf32>
            %70 = vector.extract %21[6] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c6, %c0], %70, %69 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %71 = vector.extract %56[7] : vector<8xf32> from vector<8x8xf32>
            %72 = vector.extract %21[7] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_20[%c7, %c0], %72, %71 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %subview_21 = memref.subview %alloca[0, 0] [%20, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_18 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_21 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_20 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_21 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            %73 = vector.extract %21[0] : vector<8xi1> from vector<8x8xi1>
            %74 = vector.maskedload %subview_21[%c0, %c0], %73, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %75 = vector.extract %21[1] : vector<8xi1> from vector<8x8xi1>
            %76 = vector.maskedload %subview_21[%c1, %c0], %75, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %77 = vector.extract %21[2] : vector<8xi1> from vector<8x8xi1>
            %78 = vector.maskedload %subview_21[%c2, %c0], %77, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %79 = vector.extract %21[3] : vector<8xi1> from vector<8x8xi1>
            %80 = vector.maskedload %subview_21[%c3, %c0], %79, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %81 = vector.extract %21[4] : vector<8xi1> from vector<8x8xi1>
            %82 = vector.maskedload %subview_21[%c4, %c0], %81, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %83 = vector.extract %21[5] : vector<8xi1> from vector<8x8xi1>
            %84 = vector.maskedload %subview_21[%c5, %c0], %83, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %85 = vector.extract %21[6] : vector<8xi1> from vector<8x8xi1>
            %86 = vector.maskedload %subview_21[%c6, %c0], %85, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %87 = vector.extract %21[7] : vector<8xi1> from vector<8x8xi1>
            %88 = vector.maskedload %subview_21[%c7, %c0], %87, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %89:8 = vector.to_elements %74 : vector<8xf32>
            %90:8 = vector.to_elements %76 : vector<8xf32>
            %91:8 = vector.to_elements %78 : vector<8xf32>
            %92:8 = vector.to_elements %80 : vector<8xf32>
            %93:8 = vector.to_elements %82 : vector<8xf32>
            %94:8 = vector.to_elements %84 : vector<8xf32>
            %95:8 = vector.to_elements %86 : vector<8xf32>
            %96:8 = vector.to_elements %88 : vector<8xf32>
            %97 = vector.from_elements %89#0, %89#1, %89#2, %89#3, %89#4, %89#5, %89#6, %89#7, %90#0, %90#1, %90#2, %90#3, %90#4, %90#5, %90#6, %90#7, %91#0, %91#1, %91#2, %91#3, %91#4, %91#5, %91#6, %91#7, %92#0, %92#1, %92#2, %92#3, %92#4, %92#5, %92#6, %92#7, %93#0, %93#1, %93#2, %93#3, %93#4, %93#5, %93#6, %93#7, %94#0, %94#1, %94#2, %94#3, %94#4, %94#5, %94#6, %94#7, %95#0, %95#1, %95#2, %95#3, %95#4, %95#5, %95#6, %95#7, %96#0, %96#1, %96#2, %96#3, %96#4, %96#5, %96#6, %96#7 : vector<8x8xf32>
            %98 = vector.load %assume_align_9[%arg1] : memref<64xf32, strided<[1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
            %99 = vector.broadcast %98 : vector<8xf32> to vector<8x8xf32>
            %100 = arith.addf %97, %99 : vector<8x8xf32>
            %101 = math.powf %100, %cst_1 : vector<8x8xf32>
            %102 = arith.mulf %101, %cst_2 : vector<8x8xf32>
            %103 = arith.addf %100, %102 : vector<8x8xf32>
            %104 = arith.mulf %103, %cst_3 : vector<8x8xf32>
            %105 = math.tanh %104 : vector<8x8xf32>
            %106 = arith.addf %105, %cst_4 : vector<8x8xf32>
            %107 = arith.mulf %100, %cst_5 : vector<8x8xf32>
            %108 = arith.mulf %107, %106 : vector<8x8xf32>
            %109 = vector.extract %108[0] : vector<8xf32> from vector<8x8xf32>
            %110 = vector.extract %21[0] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c0, %c0], %110, %109 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %111 = vector.extract %108[1] : vector<8xf32> from vector<8x8xf32>
            %112 = vector.extract %21[1] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c1, %c0], %112, %111 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %113 = vector.extract %108[2] : vector<8xf32> from vector<8x8xf32>
            %114 = vector.extract %21[2] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c2, %c0], %114, %113 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %115 = vector.extract %108[3] : vector<8xf32> from vector<8x8xf32>
            %116 = vector.extract %21[3] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c3, %c0], %116, %115 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %117 = vector.extract %108[4] : vector<8xf32> from vector<8x8xf32>
            %118 = vector.extract %21[4] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c4, %c0], %118, %117 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %119 = vector.extract %108[5] : vector<8xf32> from vector<8x8xf32>
            %120 = vector.extract %21[5] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c5, %c0], %120, %119 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %121 = vector.extract %108[6] : vector<8xf32> from vector<8x8xf32>
            %122 = vector.extract %21[6] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c6, %c0], %122, %121 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %123 = vector.extract %108[7] : vector<8xf32> from vector<8x8xf32>
            %124 = vector.extract %21[7] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_19[%c7, %c0], %124, %123 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
          }
        }
      }
      return
    }
  }
}

