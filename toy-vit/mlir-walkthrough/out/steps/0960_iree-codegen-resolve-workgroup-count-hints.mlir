hal.executable.variant public @embedded_elf_riscv_32 target(<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>) {
  hal.executable.export public @main_dispatch_0_matmul_17x64x32_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    hal.return %c2, %c1, %c1_0 : index, index, index
  } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
  builtin.module {
    func.func @main_dispatch_0_matmul_17x64x32_f32() {
      %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>
      %0 = ub.poison : vector<8xf32>
      %c7 = arith.constant 7 : index
      %c6 = arith.constant 6 : index
      %c5 = arith.constant 5 : index
      %c4 = arith.constant 4 : index
      %c3 = arith.constant 3 : index
      %c2 = arith.constant 2 : index
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %c256 = arith.constant 256 : index
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
      %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
      %assume_align = memref.assume_alignment %1, 64 : memref<17x32xf32, #hal.descriptor_type<storage_buffer>>
      %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c256) flags(ReadOnly) : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %assume_align_8 = memref.assume_alignment %2, 64 : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : memref<64xf32, #hal.descriptor_type<storage_buffer>>
      %assume_align_9 = memref.assume_alignment %3, 64 : memref<64xf32, #hal.descriptor_type<storage_buffer>>
      %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
      %assume_align_10 = memref.assume_alignment %4, 64 : memref<17x64xf32, #hal.descriptor_type<storage_buffer>>
      %workgroup_id_x = hal.interface.workgroup.id[0] : index
      %workgroup_count_x = hal.interface.workgroup.count[0] : index
      %5 = affine.apply affine_map<()[s0] -> (s0 * 16)>()[%workgroup_id_x]
      %6 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%5)
      %subview = memref.subview %assume_align_10[%5, 0] [%6, 64] [1, 1] : memref<17x64xf32, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
      %7 = arith.cmpi sgt, %6, %c0 : index
      scf.if %7 {
        %8 = affine.min affine_map<(d0) -> (-d0 + 17, 16)>(%5)
        %subview_11 = memref.subview %subview[0, 0] [%8, 64] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
        scf.for %arg0 = %c0 to %8 step %c8 {
          %9 = affine.min affine_map<(d0)[s0] -> (-d0 + s0, 8)>(%arg0)[%8]
          %subview_12 = memref.subview %alloca_7[0, 0] [%9, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
          %10 = vector.create_mask %9, %c8 : vector<8x8xi1>
          %11 = vector.extract %10[0] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c0, %c0], %11, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %12 = vector.extract %10[1] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c1, %c0], %12, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %13 = vector.extract %10[2] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c2, %c0], %13, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %14 = vector.extract %10[3] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c3, %c0], %14, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %15 = vector.extract %10[4] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c4, %c0], %15, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %16 = vector.extract %10[5] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c5, %c0], %16, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %17 = vector.extract %10[6] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c6, %c0], %17, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %18 = vector.extract %10[7] : vector<8xi1> from vector<8x8xi1>
          vector.maskedstore %subview_12[%c7, %c0], %18, %cst_0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
          %19 = affine.apply affine_map<()[s0, s1] -> (s0 + s1)>()[%arg0, %5]
          scf.for %arg1 = %c0 to %c64 step %c8 {
            %subview_13 = memref.subview %subview_11[%arg0, %arg1] [%9, 8] [1, 1] : memref<?x64xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
            %20 = vector.extract %10[0] : vector<8xi1> from vector<8x8xi1>
            %21 = vector.maskedload %subview_12[%c0, %c0], %20, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %22 = vector.extract %10[1] : vector<8xi1> from vector<8x8xi1>
            %23 = vector.maskedload %subview_12[%c1, %c0], %22, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %24 = vector.extract %10[2] : vector<8xi1> from vector<8x8xi1>
            %25 = vector.maskedload %subview_12[%c2, %c0], %24, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %26 = vector.extract %10[3] : vector<8xi1> from vector<8x8xi1>
            %27 = vector.maskedload %subview_12[%c3, %c0], %26, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %28 = vector.extract %10[4] : vector<8xi1> from vector<8x8xi1>
            %29 = vector.maskedload %subview_12[%c4, %c0], %28, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %30 = vector.extract %10[5] : vector<8xi1> from vector<8x8xi1>
            %31 = vector.maskedload %subview_12[%c5, %c0], %30, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %32 = vector.extract %10[6] : vector<8xi1> from vector<8x8xi1>
            %33 = vector.maskedload %subview_12[%c6, %c0], %32, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %34 = vector.extract %10[7] : vector<8xi1> from vector<8x8xi1>
            %35 = vector.maskedload %subview_12[%c7, %c0], %34, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %36:8 = vector.to_elements %21 : vector<8xf32>
            %37:8 = vector.to_elements %23 : vector<8xf32>
            %38:8 = vector.to_elements %25 : vector<8xf32>
            %39:8 = vector.to_elements %27 : vector<8xf32>
            %40:8 = vector.to_elements %29 : vector<8xf32>
            %41:8 = vector.to_elements %31 : vector<8xf32>
            %42:8 = vector.to_elements %33 : vector<8xf32>
            %43:8 = vector.to_elements %35 : vector<8xf32>
            %44 = vector.from_elements %36#0, %36#1, %36#2, %36#3, %36#4, %36#5, %36#6, %36#7, %37#0, %37#1, %37#2, %37#3, %37#4, %37#5, %37#6, %37#7, %38#0, %38#1, %38#2, %38#3, %38#4, %38#5, %38#6, %38#7, %39#0, %39#1, %39#2, %39#3, %39#4, %39#5, %39#6, %39#7, %40#0, %40#1, %40#2, %40#3, %40#4, %40#5, %40#6, %40#7, %41#0, %41#1, %41#2, %41#3, %41#4, %41#5, %41#6, %41#7, %42#0, %42#1, %42#2, %42#3, %42#4, %42#5, %42#6, %42#7, %43#0, %43#1, %43#2, %43#3, %43#4, %43#5, %43#6, %43#7 : vector<8x8xf32>
            %45 = scf.for %arg2 = %c0 to %c32 step %c1 iter_args(%arg3 = %44) -> (vector<8x8xf32>) {
              %subview_16 = memref.subview %assume_align[%19, %arg2] [%9, 1] [1, 1] : memref<17x32xf32, #hal.descriptor_type<storage_buffer>> to memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
              %114 = arith.index_cast %9 : index to i32
              %115 = vector.broadcast %114 : i32 to vector<8xi32>
              %116 = arith.cmpi sgt, %115, %cst : vector<8xi32>
              %subview_17 = memref.subview %subview_16[0, 0] [%9, 1] [1, 1] : memref<?x1xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> to memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
              %117 = scf.for %arg4 = %c0 to %c8 step %c1 iter_args(%arg5 = %0) -> (vector<8xf32>) {
                %200 = vector.extract %116[%arg4] : i1 from vector<8xi1>
                %201 = scf.if %200 -> (vector<8xf32>) {
                  %202 = memref.load %subview_17[%arg4] : memref<?xf32, affine_map<(d0)[s0] -> (d0 * 32 + s0)>, #hal.descriptor_type<storage_buffer>>
                  %203 = vector.insert %202, %arg5 [%arg4] : f32 into vector<8xf32>
                  scf.yield %203 : vector<8xf32>
                } else {
                  scf.yield %arg5 : vector<8xf32>
                }
                scf.yield %201 : vector<8xf32>
              }
              %118 = vector.load %assume_align_8[%arg1, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %119 = affine.apply affine_map<(d0) -> (d0 + 1)>(%arg1)
              %120 = vector.load %assume_align_8[%119, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %121 = affine.apply affine_map<(d0) -> (d0 + 2)>(%arg1)
              %122 = vector.load %assume_align_8[%121, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %123 = affine.apply affine_map<(d0) -> (d0 + 3)>(%arg1)
              %124 = vector.load %assume_align_8[%123, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %125 = affine.apply affine_map<(d0) -> (d0 + 4)>(%arg1)
              %126 = vector.load %assume_align_8[%125, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %127 = affine.apply affine_map<(d0) -> (d0 + 5)>(%arg1)
              %128 = vector.load %assume_align_8[%127, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %129 = affine.apply affine_map<(d0) -> (d0 + 6)>(%arg1)
              %130 = vector.load %assume_align_8[%129, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %131 = affine.apply affine_map<(d0) -> (d0 + 7)>(%arg1)
              %132 = vector.load %assume_align_8[%131, %arg2] : memref<64x32xf32, strided<[32, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<1xf32>
              %133 = vector.to_elements %118 : vector<1xf32>
              %134 = vector.to_elements %120 : vector<1xf32>
              %135 = vector.to_elements %122 : vector<1xf32>
              %136 = vector.to_elements %124 : vector<1xf32>
              %137 = vector.to_elements %126 : vector<1xf32>
              %138 = vector.to_elements %128 : vector<1xf32>
              %139 = vector.to_elements %130 : vector<1xf32>
              %140 = vector.to_elements %132 : vector<1xf32>
              %141 = vector.create_mask %c1, %9, %c8 : vector<1x8x8xi1>
              %142 = vector.from_elements %133, %134, %135, %136, %137, %138, %139, %140 : vector<8xf32>
              %143 = vector.extract %117[0] : f32 from vector<8xf32>
              %144 = vector.broadcast %143 : f32 to vector<8xf32>
              %145 = vector.extract %arg3[0] : vector<8xf32> from vector<8x8xf32>
              %146 = vector.extract %141[0, 0] : vector<8xi1> from vector<1x8x8xi1>
              %147 = vector.fma %144, %142, %145 : vector<8xf32>
              %148 = arith.select %146, %147, %145 : vector<8xi1>, vector<8xf32>
              %149 = vector.extract %117[1] : f32 from vector<8xf32>
              %150 = vector.broadcast %149 : f32 to vector<8xf32>
              %151 = vector.extract %arg3[1] : vector<8xf32> from vector<8x8xf32>
              %152 = vector.extract %141[0, 1] : vector<8xi1> from vector<1x8x8xi1>
              %153 = vector.fma %150, %142, %151 : vector<8xf32>
              %154 = arith.select %152, %153, %151 : vector<8xi1>, vector<8xf32>
              %155 = vector.extract %117[2] : f32 from vector<8xf32>
              %156 = vector.broadcast %155 : f32 to vector<8xf32>
              %157 = vector.extract %arg3[2] : vector<8xf32> from vector<8x8xf32>
              %158 = vector.extract %141[0, 2] : vector<8xi1> from vector<1x8x8xi1>
              %159 = vector.fma %156, %142, %157 : vector<8xf32>
              %160 = arith.select %158, %159, %157 : vector<8xi1>, vector<8xf32>
              %161 = vector.extract %117[3] : f32 from vector<8xf32>
              %162 = vector.broadcast %161 : f32 to vector<8xf32>
              %163 = vector.extract %arg3[3] : vector<8xf32> from vector<8x8xf32>
              %164 = vector.extract %141[0, 3] : vector<8xi1> from vector<1x8x8xi1>
              %165 = vector.fma %162, %142, %163 : vector<8xf32>
              %166 = arith.select %164, %165, %163 : vector<8xi1>, vector<8xf32>
              %167 = vector.extract %117[4] : f32 from vector<8xf32>
              %168 = vector.broadcast %167 : f32 to vector<8xf32>
              %169 = vector.extract %arg3[4] : vector<8xf32> from vector<8x8xf32>
              %170 = vector.extract %141[0, 4] : vector<8xi1> from vector<1x8x8xi1>
              %171 = vector.fma %168, %142, %169 : vector<8xf32>
              %172 = arith.select %170, %171, %169 : vector<8xi1>, vector<8xf32>
              %173 = vector.extract %117[5] : f32 from vector<8xf32>
              %174 = vector.broadcast %173 : f32 to vector<8xf32>
              %175 = vector.extract %arg3[5] : vector<8xf32> from vector<8x8xf32>
              %176 = vector.extract %141[0, 5] : vector<8xi1> from vector<1x8x8xi1>
              %177 = vector.fma %174, %142, %175 : vector<8xf32>
              %178 = arith.select %176, %177, %175 : vector<8xi1>, vector<8xf32>
              %179 = vector.extract %117[6] : f32 from vector<8xf32>
              %180 = vector.broadcast %179 : f32 to vector<8xf32>
              %181 = vector.extract %arg3[6] : vector<8xf32> from vector<8x8xf32>
              %182 = vector.extract %141[0, 6] : vector<8xi1> from vector<1x8x8xi1>
              %183 = vector.fma %180, %142, %181 : vector<8xf32>
              %184 = arith.select %182, %183, %181 : vector<8xi1>, vector<8xf32>
              %185 = vector.extract %117[7] : f32 from vector<8xf32>
              %186 = vector.broadcast %185 : f32 to vector<8xf32>
              %187 = vector.extract %arg3[7] : vector<8xf32> from vector<8x8xf32>
              %188 = vector.extract %141[0, 7] : vector<8xi1> from vector<1x8x8xi1>
              %189 = vector.fma %186, %142, %187 : vector<8xf32>
              %190 = arith.select %188, %189, %187 : vector<8xi1>, vector<8xf32>
              %191:8 = vector.to_elements %148 : vector<8xf32>
              %192:8 = vector.to_elements %154 : vector<8xf32>
              %193:8 = vector.to_elements %160 : vector<8xf32>
              %194:8 = vector.to_elements %166 : vector<8xf32>
              %195:8 = vector.to_elements %172 : vector<8xf32>
              %196:8 = vector.to_elements %178 : vector<8xf32>
              %197:8 = vector.to_elements %184 : vector<8xf32>
              %198:8 = vector.to_elements %190 : vector<8xf32>
              %199 = vector.from_elements %191#0, %191#1, %191#2, %191#3, %191#4, %191#5, %191#6, %191#7, %192#0, %192#1, %192#2, %192#3, %192#4, %192#5, %192#6, %192#7, %193#0, %193#1, %193#2, %193#3, %193#4, %193#5, %193#6, %193#7, %194#0, %194#1, %194#2, %194#3, %194#4, %194#5, %194#6, %194#7, %195#0, %195#1, %195#2, %195#3, %195#4, %195#5, %195#6, %195#7, %196#0, %196#1, %196#2, %196#3, %196#4, %196#5, %196#6, %196#7, %197#0, %197#1, %197#2, %197#3, %197#4, %197#5, %197#6, %197#7, %198#0, %198#1, %198#2, %198#3, %198#4, %198#5, %198#6, %198#7 : vector<8x8xf32>
              scf.yield %199 : vector<8x8xf32>
            }
            %subview_14 = memref.subview %alloca_6[0, 0] [%9, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_12 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            %46 = vector.extract %45[0] : vector<8xf32> from vector<8x8xf32>
            %47 = vector.extract %10[0] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c0, %c0], %47, %46 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %48 = vector.extract %45[1] : vector<8xf32> from vector<8x8xf32>
            %49 = vector.extract %10[1] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c1, %c0], %49, %48 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %50 = vector.extract %45[2] : vector<8xf32> from vector<8x8xf32>
            %51 = vector.extract %10[2] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c2, %c0], %51, %50 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %52 = vector.extract %45[3] : vector<8xf32> from vector<8x8xf32>
            %53 = vector.extract %10[3] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c3, %c0], %53, %52 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %54 = vector.extract %45[4] : vector<8xf32> from vector<8x8xf32>
            %55 = vector.extract %10[4] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c4, %c0], %55, %54 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %56 = vector.extract %45[5] : vector<8xf32> from vector<8x8xf32>
            %57 = vector.extract %10[5] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c5, %c0], %57, %56 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %58 = vector.extract %45[6] : vector<8xf32> from vector<8x8xf32>
            %59 = vector.extract %10[6] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c6, %c0], %59, %58 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %60 = vector.extract %45[7] : vector<8xf32> from vector<8x8xf32>
            %61 = vector.extract %10[7] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_14[%c7, %c0], %61, %60 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32>
            %subview_15 = memref.subview %alloca[0, 0] [%9, 8] [1, 1] : memref<8x8xf32> to memref<?x8xf32, strided<[8, 1]>>
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_12 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_15 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%subview_14 : memref<?x8xf32, strided<[8, 1]>>) outs(%subview_15 : memref<?x8xf32, strided<[8, 1]>>) {
            ^bb0(%in: f32, %out: f32):
              linalg.yield %in : f32
            }
            %62 = vector.extract %10[0] : vector<8xi1> from vector<8x8xi1>
            %63 = vector.maskedload %subview_15[%c0, %c0], %62, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %64 = vector.extract %10[1] : vector<8xi1> from vector<8x8xi1>
            %65 = vector.maskedload %subview_15[%c1, %c0], %64, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %66 = vector.extract %10[2] : vector<8xi1> from vector<8x8xi1>
            %67 = vector.maskedload %subview_15[%c2, %c0], %66, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %68 = vector.extract %10[3] : vector<8xi1> from vector<8x8xi1>
            %69 = vector.maskedload %subview_15[%c3, %c0], %68, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %70 = vector.extract %10[4] : vector<8xi1> from vector<8x8xi1>
            %71 = vector.maskedload %subview_15[%c4, %c0], %70, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %72 = vector.extract %10[5] : vector<8xi1> from vector<8x8xi1>
            %73 = vector.maskedload %subview_15[%c5, %c0], %72, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %74 = vector.extract %10[6] : vector<8xi1> from vector<8x8xi1>
            %75 = vector.maskedload %subview_15[%c6, %c0], %74, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %76 = vector.extract %10[7] : vector<8xi1> from vector<8x8xi1>
            %77 = vector.maskedload %subview_15[%c7, %c0], %76, %0 : memref<?x8xf32, strided<[8, 1]>>, vector<8xi1>, vector<8xf32> into vector<8xf32>
            %78:8 = vector.to_elements %63 : vector<8xf32>
            %79:8 = vector.to_elements %65 : vector<8xf32>
            %80:8 = vector.to_elements %67 : vector<8xf32>
            %81:8 = vector.to_elements %69 : vector<8xf32>
            %82:8 = vector.to_elements %71 : vector<8xf32>
            %83:8 = vector.to_elements %73 : vector<8xf32>
            %84:8 = vector.to_elements %75 : vector<8xf32>
            %85:8 = vector.to_elements %77 : vector<8xf32>
            %86 = vector.from_elements %78#0, %78#1, %78#2, %78#3, %78#4, %78#5, %78#6, %78#7, %79#0, %79#1, %79#2, %79#3, %79#4, %79#5, %79#6, %79#7, %80#0, %80#1, %80#2, %80#3, %80#4, %80#5, %80#6, %80#7, %81#0, %81#1, %81#2, %81#3, %81#4, %81#5, %81#6, %81#7, %82#0, %82#1, %82#2, %82#3, %82#4, %82#5, %82#6, %82#7, %83#0, %83#1, %83#2, %83#3, %83#4, %83#5, %83#6, %83#7, %84#0, %84#1, %84#2, %84#3, %84#4, %84#5, %84#6, %84#7, %85#0, %85#1, %85#2, %85#3, %85#4, %85#5, %85#6, %85#7 : vector<8x8xf32>
            %87 = vector.load %assume_align_9[%arg1] : memref<64xf32, #hal.descriptor_type<storage_buffer>>, vector<8xf32>
            %88 = vector.broadcast %87 : vector<8xf32> to vector<8x8xf32>
            %89 = arith.addf %86, %88 : vector<8x8xf32>
            %90 = math.powf %89, %cst_1 : vector<8x8xf32>
            %91 = arith.mulf %90, %cst_2 : vector<8x8xf32>
            %92 = arith.addf %89, %91 : vector<8x8xf32>
            %93 = arith.mulf %92, %cst_3 : vector<8x8xf32>
            %94 = math.tanh %93 : vector<8x8xf32>
            %95 = arith.addf %94, %cst_4 : vector<8x8xf32>
            %96 = arith.mulf %89, %cst_5 : vector<8x8xf32>
            %97 = arith.mulf %96, %95 : vector<8x8xf32>
            %98 = vector.extract %97[0] : vector<8xf32> from vector<8x8xf32>
            %99 = vector.extract %10[0] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c0, %c0], %99, %98 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %100 = vector.extract %97[1] : vector<8xf32> from vector<8x8xf32>
            %101 = vector.extract %10[1] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c1, %c0], %101, %100 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %102 = vector.extract %97[2] : vector<8xf32> from vector<8x8xf32>
            %103 = vector.extract %10[2] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c2, %c0], %103, %102 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %104 = vector.extract %97[3] : vector<8xf32> from vector<8x8xf32>
            %105 = vector.extract %10[3] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c3, %c0], %105, %104 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %106 = vector.extract %97[4] : vector<8xf32> from vector<8x8xf32>
            %107 = vector.extract %10[4] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c4, %c0], %107, %106 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %108 = vector.extract %97[5] : vector<8xf32> from vector<8x8xf32>
            %109 = vector.extract %10[5] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c5, %c0], %109, %108 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %110 = vector.extract %97[6] : vector<8xf32> from vector<8x8xf32>
            %111 = vector.extract %10[6] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c6, %c0], %111, %110 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
            %112 = vector.extract %97[7] : vector<8xf32> from vector<8x8xf32>
            %113 = vector.extract %10[7] : vector<8xi1> from vector<8x8xi1>
            vector.maskedstore %subview_13[%c7, %c0], %113, %112 : memref<?x8xf32, strided<[64, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>, vector<8xi1>, vector<8xf32>
          }
        }
      }
      return
    }
  }
}

