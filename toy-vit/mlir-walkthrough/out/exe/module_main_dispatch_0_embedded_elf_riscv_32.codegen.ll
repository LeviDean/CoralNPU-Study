; ModuleID = 'main_dispatch_0'
source_filename = "main_dispatch_0"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-eabi-elf"

%iree_hal_executable_library_header_t = type { i32, ptr, i32, i32 }
%iree_hal_executable_dispatch_attrs_v0_t = type { i64, i16, i8, i8, i32, i32, i16, i16, i64, i64, i64, i64, i64 }
%iree_hal_executable_library_v0_t = type { ptr, %iree_hal_executable_import_table_v0_t, %iree_hal_executable_export_table_v0_t, %iree_hal_executable_constant_table_v0_t, %iree_hal_executable_source_file_table_v0_t }
%iree_hal_executable_import_table_v0_t = type { i32, ptr }
%iree_hal_executable_export_table_v0_t = type { i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%iree_hal_executable_constant_table_v0_t = type { i32 }
%iree_hal_executable_source_file_table_v0_t = type { i32, ptr }
%iree_hal_executable_dispatch_state_v0_t = type { i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr }
%iree_hal_executable_workgroup_state_v0_t = type { i32, i32, i16, i16, i32, ptr, i32 }

@0 = private constant [16 x i8] c"main_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = private constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = private constant [1 x ptr] [ptr @main_dispatch_0_matmul_17x64x32_f32]
@iree_hal_executable_library_query_v0_attrs = private constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@iree_hal_executable_library_query_v0 = private constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }

define internal i32 @main_dispatch_0_matmul_17x64x32_f32(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !3 {
  %4 = alloca float, i32 64, align 64, !dbg !79
  %5 = alloca float, i32 64, align 64
  %6 = alloca float, i32 64, align 64, !dbg !80
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !81
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !81
  %9 = load ptr, ptr %8, align 4, !dbg !81
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i32 64) ], !dbg !81
  %10 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !82
  %11 = extractvalue %iree_hal_executable_dispatch_state_v0_t %10, 10, !dbg !82
  %12 = getelementptr ptr, ptr %11, i32 1, !dbg !82
  %13 = load ptr, ptr %12, align 4, !dbg !82
  %14 = getelementptr float, ptr %13, i32 64, !dbg !82
  call void @llvm.assume(i1 true) [ "align"(ptr %14, i32 64) ], !dbg !82
  %15 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !83
  %16 = extractvalue %iree_hal_executable_dispatch_state_v0_t %15, 10, !dbg !83
  %17 = getelementptr ptr, ptr %16, i32 1, !dbg !83
  %18 = load ptr, ptr %17, align 4, !dbg !83
  call void @llvm.assume(i1 true) [ "align"(ptr %18, i32 64) ], !dbg !83
  %19 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !84
  %20 = extractvalue %iree_hal_executable_dispatch_state_v0_t %19, 10, !dbg !84
  %21 = getelementptr ptr, ptr %20, i32 2, !dbg !84
  %22 = load ptr, ptr %21, align 4, !dbg !84
  call void @llvm.assume(i1 true) [ "align"(ptr %22, i32 64) ], !dbg !84
  %23 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 4, !dbg !79
  %24 = extractvalue %iree_hal_executable_workgroup_state_v0_t %23, 0, !dbg !79
  %25 = mul nsw i32 %24, 16, !dbg !79
  %26 = mul nsw i32 %24, -16, !dbg !79
  %27 = add i32 %26, 17, !dbg !79
  %28 = icmp slt i32 %27, 16, !dbg !79
  %29 = select i1 %28, i32 %27, i32 16, !dbg !79
  %30 = icmp sgt i32 %29, 0, !dbg !79
  br i1 %30, label %31, label %559, !dbg !79

31:                                               ; preds = %557, %3
  %32 = phi i32 [ %558, %557 ], [ 0, %3 ], !dbg !79
  %33 = icmp slt i32 %32, %29, !dbg !79
  br i1 %33, label %34, label %559, !dbg !79

34:                                               ; preds = %31
  %35 = sub i32 %29, %32, !dbg !79
  %36 = icmp slt i32 %35, 8, !dbg !79
  %37 = select i1 %36, i32 %35, i32 8, !dbg !79
  %38 = icmp sgt i32 %37, 0, !dbg !80
  %39 = select i1 %38, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %40 = icmp sgt i32 %37, 1, !dbg !80
  %41 = select i1 %40, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %42 = icmp sgt i32 %37, 2, !dbg !80
  %43 = select i1 %42, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %44 = icmp sgt i32 %37, 3, !dbg !80
  %45 = select i1 %44, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %46 = icmp sgt i32 %37, 4, !dbg !80
  %47 = select i1 %46, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %48 = icmp sgt i32 %37, 5, !dbg !80
  %49 = select i1 %48, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %50 = icmp sgt i32 %37, 6, !dbg !80
  %51 = select i1 %50, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %52 = icmp sgt i32 %37, 7, !dbg !80
  %53 = select i1 %52, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !80
  %54 = getelementptr float, ptr %6, i32 0, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %54, <8 x i1> %39), !dbg !85
  %55 = getelementptr float, ptr %6, i32 8, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %55, <8 x i1> %41), !dbg !85
  %56 = getelementptr float, ptr %6, i32 16, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %56, <8 x i1> %43), !dbg !85
  %57 = getelementptr float, ptr %6, i32 24, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %57, <8 x i1> %45), !dbg !85
  %58 = getelementptr float, ptr %6, i32 32, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %58, <8 x i1> %47), !dbg !85
  %59 = getelementptr float, ptr %6, i32 40, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %59, <8 x i1> %49), !dbg !85
  %60 = getelementptr float, ptr %6, i32 48, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %60, <8 x i1> %51), !dbg !85
  %61 = getelementptr float, ptr %6, i32 56, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %61, <8 x i1> %53), !dbg !85
  %62 = add i32 %32, %25, !dbg !79
  br label %63, !dbg !79

63:                                               ; preds = %282, %34
  %64 = phi i32 [ %556, %282 ], [ 0, %34 ], !dbg !79
  %65 = icmp slt i32 %64, 64, !dbg !79
  br i1 %65, label %66, label %557, !dbg !79

66:                                               ; preds = %63
  %67 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %54, <8 x i1> %39, <8 x float> poison), !dbg !79
  %68 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %55, <8 x i1> %41, <8 x float> poison), !dbg !79
  %69 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %56, <8 x i1> %43, <8 x float> poison), !dbg !79
  %70 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %57, <8 x i1> %45, <8 x float> poison), !dbg !79
  %71 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %58, <8 x i1> %47, <8 x float> poison), !dbg !79
  %72 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %59, <8 x i1> %49, <8 x float> poison), !dbg !79
  %73 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %60, <8 x i1> %51, <8 x float> poison), !dbg !79
  %74 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %61, <8 x i1> %53, <8 x float> poison), !dbg !79
  %75 = insertvalue [8 x <8 x float>] poison, <8 x float> %67, 0, !dbg !79
  %76 = insertvalue [8 x <8 x float>] %75, <8 x float> %68, 1, !dbg !79
  %77 = insertvalue [8 x <8 x float>] %76, <8 x float> %69, 2, !dbg !79
  %78 = insertvalue [8 x <8 x float>] %77, <8 x float> %70, 3, !dbg !79
  %79 = insertvalue [8 x <8 x float>] %78, <8 x float> %71, 4, !dbg !79
  %80 = insertvalue [8 x <8 x float>] %79, <8 x float> %72, 5, !dbg !79
  %81 = insertvalue [8 x <8 x float>] %80, <8 x float> %73, 6, !dbg !79
  %82 = insertvalue [8 x <8 x float>] %81, <8 x float> %74, 7, !dbg !79
  br label %83, !dbg !79

83:                                               ; preds = %107, %66
  %84 = phi i32 [ %219, %107 ], [ 0, %66 ], !dbg !79
  %85 = phi [8 x <8 x float>] [ %218, %107 ], [ %82, %66 ], !dbg !79
  %86 = icmp slt i32 %84, 32, !dbg !79
  br i1 %86, label %87, label %220, !dbg !79

87:                                               ; preds = %83
  %88 = insertelement <8 x i32> poison, i32 %37, i32 0, !dbg !79
  %89 = shufflevector <8 x i32> %88, <8 x i32> poison, <8 x i32> zeroinitializer, !dbg !79
  %90 = icmp sgt <8 x i32> %89, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !79
  br label %91, !dbg !79

91:                                               ; preds = %104, %87
  %92 = phi i32 [ %106, %104 ], [ 0, %87 ], !dbg !79
  %93 = phi <8 x float> [ %105, %104 ], [ poison, %87 ], !dbg !79
  %94 = icmp slt i32 %92, 8, !dbg !79
  br i1 %94, label %95, label %107, !dbg !79

95:                                               ; preds = %91
  %96 = extractelement <8 x i1> %90, i32 %92, !dbg !79
  br i1 %96, label %97, label %104, !dbg !79

97:                                               ; preds = %95
  %98 = add i32 %62, %92, !dbg !79
  %99 = mul nuw nsw i32 %98, 32, !dbg !79
  %100 = add nuw nsw i32 %99, %84, !dbg !79
  %101 = getelementptr inbounds nuw float, ptr %9, i32 %100, !dbg !79
  %102 = load float, ptr %101, align 4, !dbg !79
  %103 = insertelement <8 x float> %93, float %102, i32 %92, !dbg !79
  br label %104, !dbg !79

104:                                              ; preds = %97, %95
  %105 = phi <8 x float> [ %103, %97 ], [ %93, %95 ], !dbg !79
  %106 = add i32 %92, 1, !dbg !79
  br label %91, !dbg !79

107:                                              ; preds = %91
  %108 = mul i32 %64, 32, !dbg !79
  %109 = add i32 %108, %84, !dbg !79
  %110 = getelementptr float, ptr %14, i32 %109, !dbg !79
  %111 = load <1 x float>, ptr %110, align 4, !dbg !79
  %112 = add i32 %64, 1, !dbg !79
  %113 = mul i32 %112, 32, !dbg !79
  %114 = add i32 %113, %84, !dbg !79
  %115 = getelementptr float, ptr %14, i32 %114, !dbg !79
  %116 = load <1 x float>, ptr %115, align 4, !dbg !79
  %117 = add i32 %64, 2, !dbg !79
  %118 = mul i32 %117, 32, !dbg !79
  %119 = add i32 %118, %84, !dbg !79
  %120 = getelementptr float, ptr %14, i32 %119, !dbg !79
  %121 = load <1 x float>, ptr %120, align 4, !dbg !79
  %122 = add i32 %64, 3, !dbg !79
  %123 = mul i32 %122, 32, !dbg !79
  %124 = add i32 %123, %84, !dbg !79
  %125 = getelementptr float, ptr %14, i32 %124, !dbg !79
  %126 = load <1 x float>, ptr %125, align 4, !dbg !79
  %127 = add i32 %64, 4, !dbg !79
  %128 = mul i32 %127, 32, !dbg !79
  %129 = add i32 %128, %84, !dbg !79
  %130 = getelementptr float, ptr %14, i32 %129, !dbg !79
  %131 = load <1 x float>, ptr %130, align 4, !dbg !79
  %132 = add i32 %64, 5, !dbg !79
  %133 = mul i32 %132, 32, !dbg !79
  %134 = add i32 %133, %84, !dbg !79
  %135 = getelementptr float, ptr %14, i32 %134, !dbg !79
  %136 = load <1 x float>, ptr %135, align 4, !dbg !79
  %137 = add i32 %64, 6, !dbg !79
  %138 = mul i32 %137, 32, !dbg !79
  %139 = add i32 %138, %84, !dbg !79
  %140 = getelementptr float, ptr %14, i32 %139, !dbg !79
  %141 = load <1 x float>, ptr %140, align 4, !dbg !79
  %142 = add i32 %64, 7, !dbg !79
  %143 = mul i32 %142, 32, !dbg !79
  %144 = add i32 %143, %84, !dbg !79
  %145 = getelementptr float, ptr %14, i32 %144, !dbg !79
  %146 = load <1 x float>, ptr %145, align 4, !dbg !79
  %147 = extractelement <1 x float> %111, i32 0, !dbg !79
  %148 = extractelement <1 x float> %116, i32 0, !dbg !79
  %149 = extractelement <1 x float> %121, i32 0, !dbg !79
  %150 = extractelement <1 x float> %126, i32 0, !dbg !79
  %151 = extractelement <1 x float> %131, i32 0, !dbg !79
  %152 = extractelement <1 x float> %136, i32 0, !dbg !79
  %153 = extractelement <1 x float> %141, i32 0, !dbg !79
  %154 = extractelement <1 x float> %146, i32 0, !dbg !79
  %155 = insertelement <8 x float> poison, float %147, i32 0
  %156 = insertelement <8 x float> %155, float %148, i32 1
  %157 = insertelement <8 x float> %156, float %149, i32 2
  %158 = insertelement <8 x float> %157, float %150, i32 3
  %159 = insertelement <8 x float> %158, float %151, i32 4
  %160 = insertelement <8 x float> %159, float %152, i32 5
  %161 = insertelement <8 x float> %160, float %153, i32 6
  %162 = insertelement <8 x float> %161, float %154, i32 7
  %163 = extractelement <8 x float> %93, i64 0
  %164 = insertelement <8 x float> poison, float %163, i32 0
  %165 = shufflevector <8 x float> %164, <8 x float> poison, <8 x i32> zeroinitializer
  %166 = extractvalue [8 x <8 x float>] %85, 0
  %167 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %165, <8 x float> %162, <8 x float> %166)
  %168 = select <8 x i1> %39, <8 x float> %167, <8 x float> %166
  %169 = extractelement <8 x float> %93, i64 1
  %170 = insertelement <8 x float> poison, float %169, i32 0
  %171 = shufflevector <8 x float> %170, <8 x float> poison, <8 x i32> zeroinitializer
  %172 = extractvalue [8 x <8 x float>] %85, 1
  %173 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %171, <8 x float> %162, <8 x float> %172)
  %174 = select <8 x i1> %41, <8 x float> %173, <8 x float> %172
  %175 = extractelement <8 x float> %93, i64 2
  %176 = insertelement <8 x float> poison, float %175, i32 0
  %177 = shufflevector <8 x float> %176, <8 x float> poison, <8 x i32> zeroinitializer
  %178 = extractvalue [8 x <8 x float>] %85, 2
  %179 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %177, <8 x float> %162, <8 x float> %178)
  %180 = select <8 x i1> %43, <8 x float> %179, <8 x float> %178
  %181 = extractelement <8 x float> %93, i64 3
  %182 = insertelement <8 x float> poison, float %181, i32 0
  %183 = shufflevector <8 x float> %182, <8 x float> poison, <8 x i32> zeroinitializer
  %184 = extractvalue [8 x <8 x float>] %85, 3
  %185 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %183, <8 x float> %162, <8 x float> %184)
  %186 = select <8 x i1> %45, <8 x float> %185, <8 x float> %184
  %187 = extractelement <8 x float> %93, i64 4
  %188 = insertelement <8 x float> poison, float %187, i32 0
  %189 = shufflevector <8 x float> %188, <8 x float> poison, <8 x i32> zeroinitializer
  %190 = extractvalue [8 x <8 x float>] %85, 4
  %191 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %189, <8 x float> %162, <8 x float> %190)
  %192 = select <8 x i1> %47, <8 x float> %191, <8 x float> %190
  %193 = extractelement <8 x float> %93, i64 5
  %194 = insertelement <8 x float> poison, float %193, i32 0
  %195 = shufflevector <8 x float> %194, <8 x float> poison, <8 x i32> zeroinitializer
  %196 = extractvalue [8 x <8 x float>] %85, 5
  %197 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %195, <8 x float> %162, <8 x float> %196)
  %198 = select <8 x i1> %49, <8 x float> %197, <8 x float> %196
  %199 = extractelement <8 x float> %93, i64 6
  %200 = insertelement <8 x float> poison, float %199, i32 0
  %201 = shufflevector <8 x float> %200, <8 x float> poison, <8 x i32> zeroinitializer
  %202 = extractvalue [8 x <8 x float>] %85, 6
  %203 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %201, <8 x float> %162, <8 x float> %202)
  %204 = select <8 x i1> %51, <8 x float> %203, <8 x float> %202
  %205 = extractelement <8 x float> %93, i64 7
  %206 = insertelement <8 x float> poison, float %205, i32 0
  %207 = shufflevector <8 x float> %206, <8 x float> poison, <8 x i32> zeroinitializer
  %208 = extractvalue [8 x <8 x float>] %85, 7
  %209 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %207, <8 x float> %162, <8 x float> %208)
  %210 = select <8 x i1> %53, <8 x float> %209, <8 x float> %208
  %211 = insertvalue [8 x <8 x float>] poison, <8 x float> %168, 0
  %212 = insertvalue [8 x <8 x float>] %211, <8 x float> %174, 1
  %213 = insertvalue [8 x <8 x float>] %212, <8 x float> %180, 2
  %214 = insertvalue [8 x <8 x float>] %213, <8 x float> %186, 3
  %215 = insertvalue [8 x <8 x float>] %214, <8 x float> %192, 4
  %216 = insertvalue [8 x <8 x float>] %215, <8 x float> %198, 5
  %217 = insertvalue [8 x <8 x float>] %216, <8 x float> %204, 6
  %218 = insertvalue [8 x <8 x float>] %217, <8 x float> %210, 7
  %219 = add i32 %84, 1, !dbg !79
  br label %83, !dbg !79, !llvm.loop !86

220:                                              ; preds = %233, %83
  %221 = phi i32 [ %234, %233 ], [ 0, %83 ]
  %222 = icmp slt i32 %221, %37
  br i1 %222, label %223, label %235

223:                                              ; preds = %226, %220
  %224 = phi i32 [ %232, %226 ], [ 0, %220 ]
  %225 = icmp slt i32 %224, 8
  br i1 %225, label %226, label %233

226:                                              ; preds = %223
  %227 = mul nuw nsw i32 %221, 8
  %228 = add nuw nsw i32 %227, %224
  %229 = getelementptr inbounds nuw float, ptr %6, i32 %228
  %230 = load float, ptr %229, align 4
  %231 = getelementptr inbounds nuw float, ptr %5, i32 %228
  store float %230, ptr %231, align 4
  %232 = add i32 %224, 1
  br label %223

233:                                              ; preds = %223
  %234 = add i32 %221, 1
  br label %220

235:                                              ; preds = %220
  %236 = extractvalue [8 x <8 x float>] %85, 0
  %237 = getelementptr float, ptr %5, i32 0
  call void @llvm.masked.store.v8f32.p0(<8 x float> %236, ptr align 4 %237, <8 x i1> %39)
  %238 = extractvalue [8 x <8 x float>] %85, 1
  %239 = getelementptr float, ptr %5, i32 8
  call void @llvm.masked.store.v8f32.p0(<8 x float> %238, ptr align 4 %239, <8 x i1> %41)
  %240 = extractvalue [8 x <8 x float>] %85, 2
  %241 = getelementptr float, ptr %5, i32 16
  call void @llvm.masked.store.v8f32.p0(<8 x float> %240, ptr align 4 %241, <8 x i1> %43)
  %242 = extractvalue [8 x <8 x float>] %85, 3
  %243 = getelementptr float, ptr %5, i32 24
  call void @llvm.masked.store.v8f32.p0(<8 x float> %242, ptr align 4 %243, <8 x i1> %45)
  %244 = extractvalue [8 x <8 x float>] %85, 4
  %245 = getelementptr float, ptr %5, i32 32
  call void @llvm.masked.store.v8f32.p0(<8 x float> %244, ptr align 4 %245, <8 x i1> %47)
  %246 = extractvalue [8 x <8 x float>] %85, 5
  %247 = getelementptr float, ptr %5, i32 40
  call void @llvm.masked.store.v8f32.p0(<8 x float> %246, ptr align 4 %247, <8 x i1> %49)
  %248 = extractvalue [8 x <8 x float>] %85, 6
  %249 = getelementptr float, ptr %5, i32 48
  call void @llvm.masked.store.v8f32.p0(<8 x float> %248, ptr align 4 %249, <8 x i1> %51)
  %250 = extractvalue [8 x <8 x float>] %85, 7
  %251 = getelementptr float, ptr %5, i32 56
  call void @llvm.masked.store.v8f32.p0(<8 x float> %250, ptr align 4 %251, <8 x i1> %53)
  br label %252, !dbg !79

252:                                              ; preds = %265, %235
  %253 = phi i32 [ %266, %265 ], [ 0, %235 ], !dbg !79
  %254 = icmp slt i32 %253, %37, !dbg !79
  br i1 %254, label %255, label %267, !dbg !79

255:                                              ; preds = %258, %252
  %256 = phi i32 [ %264, %258 ], [ 0, %252 ], !dbg !79
  %257 = icmp slt i32 %256, 8, !dbg !79
  br i1 %257, label %258, label %265, !dbg !79

258:                                              ; preds = %255
  %259 = mul nuw nsw i32 %253, 8, !dbg !79
  %260 = add nuw nsw i32 %259, %256, !dbg !79
  %261 = getelementptr inbounds nuw float, ptr %6, i32 %260, !dbg !79
  %262 = load float, ptr %261, align 4, !dbg !79
  %263 = getelementptr inbounds nuw float, ptr %4, i32 %260, !dbg !79
  store float %262, ptr %263, align 4, !dbg !79
  %264 = add i32 %256, 1, !dbg !79
  br label %255, !dbg !79

265:                                              ; preds = %255
  %266 = add i32 %253, 1, !dbg !79
  br label %252, !dbg !79

267:                                              ; preds = %280, %252
  %268 = phi i32 [ %281, %280 ], [ 0, %252 ], !dbg !79
  %269 = icmp slt i32 %268, %37, !dbg !79
  br i1 %269, label %270, label %282, !dbg !79

270:                                              ; preds = %273, %267
  %271 = phi i32 [ %279, %273 ], [ 0, %267 ], !dbg !79
  %272 = icmp slt i32 %271, 8, !dbg !79
  br i1 %272, label %273, label %280, !dbg !79

273:                                              ; preds = %270
  %274 = mul nuw nsw i32 %268, 8, !dbg !79
  %275 = add nuw nsw i32 %274, %271, !dbg !79
  %276 = getelementptr inbounds nuw float, ptr %5, i32 %275, !dbg !79
  %277 = load float, ptr %276, align 4, !dbg !79
  %278 = getelementptr inbounds nuw float, ptr %4, i32 %275, !dbg !79
  store float %277, ptr %278, align 4, !dbg !79
  %279 = add i32 %271, 1, !dbg !79
  br label %270, !dbg !79

280:                                              ; preds = %270
  %281 = add i32 %268, 1, !dbg !79
  br label %267, !dbg !79

282:                                              ; preds = %267
  %283 = getelementptr float, ptr %4, i32 0, !dbg !88
  %284 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %283, <8 x i1> %39, <8 x float> poison), !dbg !88
  %285 = getelementptr float, ptr %4, i32 8, !dbg !88
  %286 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %285, <8 x i1> %41, <8 x float> poison), !dbg !88
  %287 = getelementptr float, ptr %4, i32 16, !dbg !88
  %288 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %287, <8 x i1> %43, <8 x float> poison), !dbg !88
  %289 = getelementptr float, ptr %4, i32 24, !dbg !88
  %290 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %289, <8 x i1> %45, <8 x float> poison), !dbg !88
  %291 = getelementptr float, ptr %4, i32 32, !dbg !88
  %292 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %291, <8 x i1> %47, <8 x float> poison), !dbg !88
  %293 = getelementptr float, ptr %4, i32 40, !dbg !88
  %294 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %293, <8 x i1> %49, <8 x float> poison), !dbg !88
  %295 = getelementptr float, ptr %4, i32 48, !dbg !88
  %296 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %295, <8 x i1> %51, <8 x float> poison), !dbg !88
  %297 = getelementptr float, ptr %4, i32 56, !dbg !88
  %298 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %297, <8 x i1> %53, <8 x float> poison), !dbg !88
  %299 = getelementptr float, ptr %18, i32 %64, !dbg !88
  %300 = load <8 x float>, ptr %299, align 4, !dbg !88
  %301 = fadd contract <8 x float> %284, %300, !dbg !89
  %302 = fadd contract <8 x float> %286, %300, !dbg !89
  %303 = fadd contract <8 x float> %288, %300, !dbg !89
  %304 = fadd contract <8 x float> %290, %300, !dbg !89
  %305 = fadd contract <8 x float> %292, %300, !dbg !89
  %306 = fadd contract <8 x float> %294, %300, !dbg !89
  %307 = fadd contract <8 x float> %296, %300, !dbg !89
  %308 = fadd contract <8 x float> %298, %300, !dbg !89
  %309 = fmul contract <8 x float> %301, %301, !dbg !90
  %310 = fmul contract <8 x float> %302, %302, !dbg !90
  %311 = fmul contract <8 x float> %303, %303, !dbg !90
  %312 = fmul contract <8 x float> %304, %304, !dbg !90
  %313 = fmul contract <8 x float> %305, %305, !dbg !90
  %314 = fmul contract <8 x float> %306, %306, !dbg !90
  %315 = fmul contract <8 x float> %307, %307, !dbg !90
  %316 = fmul contract <8 x float> %308, %308, !dbg !90
  %317 = fmul contract <8 x float> %309, %301, !dbg !90
  %318 = fmul contract <8 x float> %310, %302, !dbg !90
  %319 = fmul contract <8 x float> %311, %303, !dbg !90
  %320 = fmul contract <8 x float> %312, %304, !dbg !90
  %321 = fmul contract <8 x float> %313, %305, !dbg !90
  %322 = fmul contract <8 x float> %314, %306, !dbg !90
  %323 = fmul contract <8 x float> %315, %307, !dbg !90
  %324 = fmul contract <8 x float> %316, %308, !dbg !90
  %325 = fmul contract <8 x float> %317, splat (float 0x3FA6E4E260000000), !dbg !91
  %326 = fmul contract <8 x float> %318, splat (float 0x3FA6E4E260000000), !dbg !91
  %327 = fmul contract <8 x float> %319, splat (float 0x3FA6E4E260000000), !dbg !91
  %328 = fmul contract <8 x float> %320, splat (float 0x3FA6E4E260000000), !dbg !91
  %329 = fmul contract <8 x float> %321, splat (float 0x3FA6E4E260000000), !dbg !91
  %330 = fmul contract <8 x float> %322, splat (float 0x3FA6E4E260000000), !dbg !91
  %331 = fmul contract <8 x float> %323, splat (float 0x3FA6E4E260000000), !dbg !91
  %332 = fmul contract <8 x float> %324, splat (float 0x3FA6E4E260000000), !dbg !91
  %333 = fadd contract <8 x float> %301, %325, !dbg !92
  %334 = fadd contract <8 x float> %302, %326, !dbg !92
  %335 = fadd contract <8 x float> %303, %327, !dbg !92
  %336 = fadd contract <8 x float> %304, %328, !dbg !92
  %337 = fadd contract <8 x float> %305, %329, !dbg !92
  %338 = fadd contract <8 x float> %306, %330, !dbg !92
  %339 = fadd contract <8 x float> %307, %331, !dbg !92
  %340 = fadd contract <8 x float> %308, %332, !dbg !92
  %341 = fmul contract <8 x float> %333, splat (float 0x3FE9884520000000), !dbg !93
  %342 = fmul contract <8 x float> %334, splat (float 0x3FE9884520000000), !dbg !93
  %343 = fmul contract <8 x float> %335, splat (float 0x3FE9884520000000), !dbg !93
  %344 = fmul contract <8 x float> %336, splat (float 0x3FE9884520000000), !dbg !93
  %345 = fmul contract <8 x float> %337, splat (float 0x3FE9884520000000), !dbg !93
  %346 = fmul contract <8 x float> %338, splat (float 0x3FE9884520000000), !dbg !93
  %347 = fmul contract <8 x float> %339, splat (float 0x3FE9884520000000), !dbg !93
  %348 = fmul contract <8 x float> %340, splat (float 0x3FE9884520000000), !dbg !93
  %349 = fcmp ult <8 x float> %341, splat (float 0x401FFEC880000000), !dbg !94
  %350 = fcmp ult <8 x float> %342, splat (float 0x401FFEC880000000), !dbg !94
  %351 = fcmp ult <8 x float> %343, splat (float 0x401FFEC880000000), !dbg !94
  %352 = fcmp ult <8 x float> %344, splat (float 0x401FFEC880000000), !dbg !94
  %353 = fcmp ult <8 x float> %345, splat (float 0x401FFEC880000000), !dbg !94
  %354 = fcmp ult <8 x float> %346, splat (float 0x401FFEC880000000), !dbg !94
  %355 = fcmp ult <8 x float> %347, splat (float 0x401FFEC880000000), !dbg !94
  %356 = fcmp ult <8 x float> %348, splat (float 0x401FFEC880000000), !dbg !94
  %357 = select <8 x i1> %349, <8 x float> %341, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %358 = select <8 x i1> %350, <8 x float> %342, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %359 = select <8 x i1> %351, <8 x float> %343, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %360 = select <8 x i1> %352, <8 x float> %344, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %361 = select <8 x i1> %353, <8 x float> %345, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %362 = select <8 x i1> %354, <8 x float> %346, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %363 = select <8 x i1> %355, <8 x float> %347, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %364 = select <8 x i1> %356, <8 x float> %348, <8 x float> splat (float 0x401FFEC880000000), !dbg !94
  %365 = fcmp ugt <8 x float> %357, splat (float 0xC01FFEC880000000), !dbg !94
  %366 = fcmp ugt <8 x float> %358, splat (float 0xC01FFEC880000000), !dbg !94
  %367 = fcmp ugt <8 x float> %359, splat (float 0xC01FFEC880000000), !dbg !94
  %368 = fcmp ugt <8 x float> %360, splat (float 0xC01FFEC880000000), !dbg !94
  %369 = fcmp ugt <8 x float> %361, splat (float 0xC01FFEC880000000), !dbg !94
  %370 = fcmp ugt <8 x float> %362, splat (float 0xC01FFEC880000000), !dbg !94
  %371 = fcmp ugt <8 x float> %363, splat (float 0xC01FFEC880000000), !dbg !94
  %372 = fcmp ugt <8 x float> %364, splat (float 0xC01FFEC880000000), !dbg !94
  %373 = select <8 x i1> %365, <8 x float> %357, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %374 = select <8 x i1> %366, <8 x float> %358, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %375 = select <8 x i1> %367, <8 x float> %359, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %376 = select <8 x i1> %368, <8 x float> %360, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %377 = select <8 x i1> %369, <8 x float> %361, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %378 = select <8 x i1> %370, <8 x float> %362, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %379 = select <8 x i1> %371, <8 x float> %363, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %380 = select <8 x i1> %372, <8 x float> %364, <8 x float> splat (float 0xC01FFEC880000000), !dbg !94
  %381 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %341), !dbg !94
  %382 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %342), !dbg !94
  %383 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %343), !dbg !94
  %384 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %344), !dbg !94
  %385 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %345), !dbg !94
  %386 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %346), !dbg !94
  %387 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %347), !dbg !94
  %388 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %348), !dbg !94
  %389 = fcmp olt <8 x float> %381, splat (float 0x3F3A36E2E0000000), !dbg !94
  %390 = fcmp olt <8 x float> %382, splat (float 0x3F3A36E2E0000000), !dbg !94
  %391 = fcmp olt <8 x float> %383, splat (float 0x3F3A36E2E0000000), !dbg !94
  %392 = fcmp olt <8 x float> %384, splat (float 0x3F3A36E2E0000000), !dbg !94
  %393 = fcmp olt <8 x float> %385, splat (float 0x3F3A36E2E0000000), !dbg !94
  %394 = fcmp olt <8 x float> %386, splat (float 0x3F3A36E2E0000000), !dbg !94
  %395 = fcmp olt <8 x float> %387, splat (float 0x3F3A36E2E0000000), !dbg !94
  %396 = fcmp olt <8 x float> %388, splat (float 0x3F3A36E2E0000000), !dbg !94
  %397 = fmul contract <8 x float> %373, %373, !dbg !94
  %398 = fmul contract <8 x float> %374, %374, !dbg !94
  %399 = fmul contract <8 x float> %375, %375, !dbg !94
  %400 = fmul contract <8 x float> %376, %376, !dbg !94
  %401 = fmul contract <8 x float> %377, %377, !dbg !94
  %402 = fmul contract <8 x float> %378, %378, !dbg !94
  %403 = fmul contract <8 x float> %379, %379, !dbg !94
  %404 = fmul contract <8 x float> %380, %380, !dbg !94
  %405 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %406 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %407 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %408 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %409 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %410 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %411 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %412 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !94
  %413 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %405, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %414 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %406, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %415 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %407, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %416 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %408, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %417 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %409, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %418 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %410, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %419 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %411, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %420 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %412, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !94
  %421 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %413, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %422 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %414, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %423 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %415, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %424 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %416, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %425 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %417, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %426 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %418, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %427 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %419, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %428 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %420, <8 x float> splat (float 0x3E6B800820000000)), !dbg !94
  %429 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %421, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %430 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %422, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %431 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %423, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %432 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %424, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %433 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %425, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %434 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %426, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %435 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %427, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %436 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %428, <8 x float> splat (float 0x3EEF286940000000)), !dbg !94
  %437 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %429, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %438 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %430, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %439 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %431, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %440 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %432, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %441 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %433, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %442 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %434, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %443 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %435, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %444 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %436, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !94
  %445 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %437, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %446 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %438, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %447 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %439, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %448 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %440, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %449 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %441, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %450 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %442, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %451 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %443, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %452 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %444, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !94
  %453 = fmul contract <8 x float> %373, %445, !dbg !94
  %454 = fmul contract <8 x float> %374, %446, !dbg !94
  %455 = fmul contract <8 x float> %375, %447, !dbg !94
  %456 = fmul contract <8 x float> %376, %448, !dbg !94
  %457 = fmul contract <8 x float> %377, %449, !dbg !94
  %458 = fmul contract <8 x float> %378, %450, !dbg !94
  %459 = fmul contract <8 x float> %379, %451, !dbg !94
  %460 = fmul contract <8 x float> %380, %452, !dbg !94
  %461 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %462 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %463 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %464 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %465 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %466 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %467 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %468 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !94
  %469 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %461, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %470 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %462, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %471 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %463, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %472 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %464, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %473 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %465, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %474 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %466, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %475 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %467, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %476 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %468, <8 x float> splat (float 0x3F629540A0000000)), !dbg !94
  %477 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %469, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %478 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %470, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %479 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %471, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %480 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %472, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %481 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %473, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %482 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %474, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %483 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %475, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %484 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %476, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !94
  %485 = fdiv <8 x float> %453, %477, !dbg !94
  %486 = fdiv <8 x float> %454, %478, !dbg !94
  %487 = fdiv <8 x float> %455, %479, !dbg !94
  %488 = fdiv <8 x float> %456, %480, !dbg !94
  %489 = fdiv <8 x float> %457, %481, !dbg !94
  %490 = fdiv <8 x float> %458, %482, !dbg !94
  %491 = fdiv <8 x float> %459, %483, !dbg !94
  %492 = fdiv <8 x float> %460, %484, !dbg !94
  %493 = select <8 x i1> %389, <8 x float> %373, <8 x float> %485, !dbg !94
  %494 = select <8 x i1> %390, <8 x float> %374, <8 x float> %486, !dbg !94
  %495 = select <8 x i1> %391, <8 x float> %375, <8 x float> %487, !dbg !94
  %496 = select <8 x i1> %392, <8 x float> %376, <8 x float> %488, !dbg !94
  %497 = select <8 x i1> %393, <8 x float> %377, <8 x float> %489, !dbg !94
  %498 = select <8 x i1> %394, <8 x float> %378, <8 x float> %490, !dbg !94
  %499 = select <8 x i1> %395, <8 x float> %379, <8 x float> %491, !dbg !94
  %500 = select <8 x i1> %396, <8 x float> %380, <8 x float> %492, !dbg !94
  %501 = fadd contract <8 x float> %493, splat (float 1.000000e+00), !dbg !95
  %502 = fadd contract <8 x float> %494, splat (float 1.000000e+00), !dbg !95
  %503 = fadd contract <8 x float> %495, splat (float 1.000000e+00), !dbg !95
  %504 = fadd contract <8 x float> %496, splat (float 1.000000e+00), !dbg !95
  %505 = fadd contract <8 x float> %497, splat (float 1.000000e+00), !dbg !95
  %506 = fadd contract <8 x float> %498, splat (float 1.000000e+00), !dbg !95
  %507 = fadd contract <8 x float> %499, splat (float 1.000000e+00), !dbg !95
  %508 = fadd contract <8 x float> %500, splat (float 1.000000e+00), !dbg !95
  %509 = fmul contract <8 x float> %301, splat (float 5.000000e-01), !dbg !96
  %510 = fmul contract <8 x float> %302, splat (float 5.000000e-01), !dbg !96
  %511 = fmul contract <8 x float> %303, splat (float 5.000000e-01), !dbg !96
  %512 = fmul contract <8 x float> %304, splat (float 5.000000e-01), !dbg !96
  %513 = fmul contract <8 x float> %305, splat (float 5.000000e-01), !dbg !96
  %514 = fmul contract <8 x float> %306, splat (float 5.000000e-01), !dbg !96
  %515 = fmul contract <8 x float> %307, splat (float 5.000000e-01), !dbg !96
  %516 = fmul contract <8 x float> %308, splat (float 5.000000e-01), !dbg !96
  %517 = fmul contract <8 x float> %509, %501, !dbg !97
  %518 = fmul contract <8 x float> %510, %502, !dbg !97
  %519 = fmul contract <8 x float> %511, %503, !dbg !97
  %520 = fmul contract <8 x float> %512, %504, !dbg !97
  %521 = fmul contract <8 x float> %513, %505, !dbg !97
  %522 = fmul contract <8 x float> %514, %506, !dbg !97
  %523 = fmul contract <8 x float> %515, %507, !dbg !97
  %524 = fmul contract <8 x float> %516, %508, !dbg !97
  %525 = mul i32 %62, 64, !dbg !97
  %526 = add i32 %525, %64, !dbg !97
  %527 = getelementptr float, ptr %22, i32 %526, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %517, ptr align 4 %527, <8 x i1> %39), !dbg !97
  %528 = add i32 %62, 1, !dbg !97
  %529 = mul i32 %528, 64, !dbg !97
  %530 = add i32 %529, %64, !dbg !97
  %531 = getelementptr float, ptr %22, i32 %530, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %518, ptr align 4 %531, <8 x i1> %41), !dbg !97
  %532 = add i32 %62, 2, !dbg !97
  %533 = mul i32 %532, 64, !dbg !97
  %534 = add i32 %533, %64, !dbg !97
  %535 = getelementptr float, ptr %22, i32 %534, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %519, ptr align 4 %535, <8 x i1> %43), !dbg !97
  %536 = add i32 %62, 3, !dbg !97
  %537 = mul i32 %536, 64, !dbg !97
  %538 = add i32 %537, %64, !dbg !97
  %539 = getelementptr float, ptr %22, i32 %538, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %520, ptr align 4 %539, <8 x i1> %45), !dbg !97
  %540 = add i32 %62, 4, !dbg !97
  %541 = mul i32 %540, 64, !dbg !97
  %542 = add i32 %541, %64, !dbg !97
  %543 = getelementptr float, ptr %22, i32 %542, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %521, ptr align 4 %543, <8 x i1> %47), !dbg !97
  %544 = add i32 %62, 5, !dbg !97
  %545 = mul i32 %544, 64, !dbg !97
  %546 = add i32 %545, %64, !dbg !97
  %547 = getelementptr float, ptr %22, i32 %546, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %522, ptr align 4 %547, <8 x i1> %49), !dbg !97
  %548 = add i32 %62, 6, !dbg !97
  %549 = mul i32 %548, 64, !dbg !97
  %550 = add i32 %549, %64, !dbg !97
  %551 = getelementptr float, ptr %22, i32 %550, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %523, ptr align 4 %551, <8 x i1> %51), !dbg !97
  %552 = add i32 %62, 7, !dbg !97
  %553 = mul i32 %552, 64, !dbg !97
  %554 = add i32 %553, %64, !dbg !97
  %555 = getelementptr float, ptr %22, i32 %554, !dbg !97
  call void @llvm.masked.store.v8f32.p0(<8 x float> %524, ptr align 4 %555, <8 x i1> %53), !dbg !97
  %556 = add i32 %64, 8, !dbg !79
  br label %63, !dbg !79, !llvm.loop !86

557:                                              ; preds = %63
  %558 = add i32 %32, 8, !dbg !79
  br label %31, !dbg !79, !llvm.loop !86

559:                                              ; preds = %31, %3
  ret i32 0, !dbg !98
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v8f32.p0(<8 x float>, ptr captures(none), <8 x i1>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <8 x float> @llvm.masked.load.v8f32.p0(ptr captures(none), <8 x i1>, <8 x float>) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fmuladd.v8f32(<8 x float>, <8 x float>, <8 x float>) #4

define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr %1) #5 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

attributes #0 = { "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #5 = { "nonlazybind" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C17, file: !1, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "configured_module_main_dispatch_0.mlir", directory: "/home/builder/work/walk/out/exe")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_dispatch_0_matmul_17x64x32_f32", linkageName: "main_dispatch_0_matmul_17x64x32_f32", scope: !1, file: !1, line: 1, type: !4, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!4 = !DISubroutineType(cc: DW_CC_normal, types: !5)
!5 = !{!6, !7, !38, !67}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 32)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_environment_v0_t", baseType: !10)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_environment_v0_t", scope: !11, file: !11, line: 246, size: 768, elements: !12)
!11 = !DIFile(filename: "runtime/src/iree/hal/local/executable_library.h", directory: ".")
!12 = !{!13, !21, !24, !27, !29}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !14, size: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, scope: !11, file: !11, line: 227, baseType: !17, size: 2048, elements: !19)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", baseType: !18)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !{!20}
!20 = !DISubrange(count: 64)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "import_thunk", baseType: !22, size: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 32)
!23 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "import_funcs", baseType: !25, size: 32, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "import_contexts", baseType: !28, size: 32, offset: 96)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "processor", baseType: !30, offset: 128)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_processor_v0_t", scope: !11, file: !11, line: 227, size: 512, elements: !31)
!31 = !{!32}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data", baseType: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, scope: !11, file: !11, line: 227, baseType: !34, size: 512, elements: !36)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", baseType: !35)
!35 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !{!37}
!37 = !DISubrange(count: 8)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 32)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_dispatch_state_v0_t", baseType: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_dispatch_state_v0_t", scope: !11, file: !11, line: 275, size: 384, elements: !42)
!42 = !{!43, !44, !45, !48, !49, !50, !51, !52, !55, !56, !57, !62}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_x", baseType: !17, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_y", baseType: !17, size: 32, offset: 32)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_z", baseType: !46, size: 16, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", baseType: !47)
!47 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "constant_count", baseType: !46, size: 16, offset: 80)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_x", baseType: !17, size: 32, offset: 96)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_y", baseType: !17, size: 32, offset: 128)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_z", baseType: !46, size: 16, offset: 160)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "max_concurrency", baseType: !53, size: 8, offset: 176)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", baseType: !54)
!54 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "binding_count", baseType: !53, size: 8, offset: 184)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !14, size: 32, offset: 192)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "binding_ptrs", baseType: !58, size: 32, offset: 224)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, scope: !11, file: !11, line: 227, baseType: !61, size: 2048, elements: !19)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "binding_lengths", baseType: !63, size: 32, offset: 256)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, scope: !11, file: !11, line: 227, baseType: !66, size: 2048, elements: !19)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", baseType: !17)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 32)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_workgroup_state_v0_t", baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_workgroup_state_v0_t", scope: !11, file: !11, line: 321, size: 256, elements: !71)
!71 = !{!72, !73, !74, !75, !76, !77, !78}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_x", baseType: !17, size: 32)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_y", baseType: !17, size: 32, offset: 32)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_z", baseType: !46, size: 16, offset: 64)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", baseType: !46, size: 16, offset: 80)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "processor_id", baseType: !17, size: 32, offset: 96)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory", baseType: !22, size: 32, offset: 128)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory_size", baseType: !17, size: 32, offset: 160)
!79 = !DILocation(line: 26, column: 8, scope: !3)
!80 = !DILocation(line: 25, column: 8, scope: !3)
!81 = !DILocation(line: 17, column: 8, scope: !3)
!82 = !DILocation(line: 18, column: 8, scope: !3)
!83 = !DILocation(line: 19, column: 8, scope: !3)
!84 = !DILocation(line: 20, column: 8, scope: !3)
!85 = !DILocation(line: 9, column: 8, scope: !3)
!86 = distinct !{!86, !87}
!87 = !{!"llvm.loop.unroll.disable"}
!88 = !DILocation(line: 27, column: 8, scope: !3)
!89 = !DILocation(line: 29, column: 10, scope: !3)
!90 = !DILocation(line: 30, column: 10, scope: !3)
!91 = !DILocation(line: 31, column: 10, scope: !3)
!92 = !DILocation(line: 32, column: 10, scope: !3)
!93 = !DILocation(line: 33, column: 10, scope: !3)
!94 = !DILocation(line: 34, column: 10, scope: !3)
!95 = !DILocation(line: 35, column: 10, scope: !3)
!96 = !DILocation(line: 36, column: 10, scope: !3)
!97 = !DILocation(line: 37, column: 10, scope: !3)
!98 = !DILocation(line: 41, column: 8, scope: !3)
