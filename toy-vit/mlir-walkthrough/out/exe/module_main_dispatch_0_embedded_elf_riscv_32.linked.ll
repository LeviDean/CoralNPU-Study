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
%struct.exp2f_data = type { [32 x i32], double, [3 x double], double, double, [3 x double] }
%struct.powf_log2_data = type { [16 x %struct.anon], [5 x double] }
%struct.anon = type { double, double }
%iree_hal_executable_dispatch_state_v0_t = type { i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr }
%iree_hal_executable_workgroup_state_v0_t = type { i32, i32, i16, i16, i32, ptr, i32 }

@0 = private constant [16 x i8] c"main_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = private constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = private constant [1 x ptr] [ptr @main_dispatch_0_matmul_17x64x32_f32]
@iree_hal_executable_library_query_v0_attrs = private constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@iree_hal_executable_library_query_v0 = private constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = hidden local_unnamed_addr constant %struct.exp2f_data { [32 x i32] [i32 0, i32 -753564300, i32 1828292879, i32 -804103343, i32 1014845819, i32 828946858, i32 1853186616, i32 -182460703, i32 171030293, i32 926591435, i32 1276261410, i32 1617004845, i32 -717870553, i32 1453150082, i32 -582462423, i32 -1338354299, i32 1719614413, i32 -387162252, i32 1944781191, i32 -1723019757, i32 1110089947, i32 -1328691739, i32 -2103185264, i32 -1304550051, i32 -1722100819, i32 -218407353, i32 -578465124, i32 -588279703, i32 -587488121, i32 863738719, i32 -1566273318, i32 1533953344], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = hidden local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

define internal i32 @main_dispatch_0_matmul_17x64x32_f32(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !8 {
  %4 = alloca float, i32 64, align 64, !dbg !84
  %5 = alloca float, i32 64, align 64
  %6 = alloca float, i32 64, align 64, !dbg !85
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !86
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !86
  %9 = load ptr, ptr %8, align 4, !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i32 64) ], !dbg !86
  %10 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !87
  %11 = extractvalue %iree_hal_executable_dispatch_state_v0_t %10, 10, !dbg !87
  %12 = getelementptr ptr, ptr %11, i32 1, !dbg !87
  %13 = load ptr, ptr %12, align 4, !dbg !87
  %14 = getelementptr float, ptr %13, i32 64, !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %14, i32 64) ], !dbg !87
  %15 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !88
  %16 = extractvalue %iree_hal_executable_dispatch_state_v0_t %15, 10, !dbg !88
  %17 = getelementptr ptr, ptr %16, i32 1, !dbg !88
  %18 = load ptr, ptr %17, align 4, !dbg !88
  call void @llvm.assume(i1 true) [ "align"(ptr %18, i32 64) ], !dbg !88
  %19 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 4, !dbg !89
  %20 = extractvalue %iree_hal_executable_dispatch_state_v0_t %19, 10, !dbg !89
  %21 = getelementptr ptr, ptr %20, i32 2, !dbg !89
  %22 = load ptr, ptr %21, align 4, !dbg !89
  call void @llvm.assume(i1 true) [ "align"(ptr %22, i32 64) ], !dbg !89
  %23 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 4, !dbg !84
  %24 = extractvalue %iree_hal_executable_workgroup_state_v0_t %23, 0, !dbg !84
  %25 = mul nsw i32 %24, 16, !dbg !84
  %26 = mul nsw i32 %24, -16, !dbg !84
  %27 = add i32 %26, 17, !dbg !84
  %28 = icmp slt i32 %27, 16, !dbg !84
  %29 = select i1 %28, i32 %27, i32 16, !dbg !84
  %30 = icmp sgt i32 %29, 0, !dbg !84
  br i1 %30, label %31, label %559, !dbg !84

31:                                               ; preds = %557, %3
  %32 = phi i32 [ %558, %557 ], [ 0, %3 ], !dbg !84
  %33 = icmp slt i32 %32, %29, !dbg !84
  br i1 %33, label %34, label %559, !dbg !84

34:                                               ; preds = %31
  %35 = sub i32 %29, %32, !dbg !84
  %36 = icmp slt i32 %35, 8, !dbg !84
  %37 = select i1 %36, i32 %35, i32 8, !dbg !84
  %38 = icmp sgt i32 %37, 0, !dbg !85
  %39 = select i1 %38, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %40 = icmp sgt i32 %37, 1, !dbg !85
  %41 = select i1 %40, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %42 = icmp sgt i32 %37, 2, !dbg !85
  %43 = select i1 %42, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %44 = icmp sgt i32 %37, 3, !dbg !85
  %45 = select i1 %44, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %46 = icmp sgt i32 %37, 4, !dbg !85
  %47 = select i1 %46, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %48 = icmp sgt i32 %37, 5, !dbg !85
  %49 = select i1 %48, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %50 = icmp sgt i32 %37, 6, !dbg !85
  %51 = select i1 %50, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %52 = icmp sgt i32 %37, 7, !dbg !85
  %53 = select i1 %52, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %54 = getelementptr float, ptr %6, i32 0, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %54, <8 x i1> %39), !dbg !90
  %55 = getelementptr float, ptr %6, i32 8, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %55, <8 x i1> %41), !dbg !90
  %56 = getelementptr float, ptr %6, i32 16, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %56, <8 x i1> %43), !dbg !90
  %57 = getelementptr float, ptr %6, i32 24, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %57, <8 x i1> %45), !dbg !90
  %58 = getelementptr float, ptr %6, i32 32, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %58, <8 x i1> %47), !dbg !90
  %59 = getelementptr float, ptr %6, i32 40, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %59, <8 x i1> %49), !dbg !90
  %60 = getelementptr float, ptr %6, i32 48, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %60, <8 x i1> %51), !dbg !90
  %61 = getelementptr float, ptr %6, i32 56, !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr align 4 %61, <8 x i1> %53), !dbg !90
  %62 = add i32 %32, %25, !dbg !84
  br label %63, !dbg !84

63:                                               ; preds = %282, %34
  %64 = phi i32 [ %556, %282 ], [ 0, %34 ], !dbg !84
  %65 = icmp slt i32 %64, 64, !dbg !84
  br i1 %65, label %66, label %557, !dbg !84

66:                                               ; preds = %63
  %67 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %54, <8 x i1> %39, <8 x float> poison), !dbg !84
  %68 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %55, <8 x i1> %41, <8 x float> poison), !dbg !84
  %69 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %56, <8 x i1> %43, <8 x float> poison), !dbg !84
  %70 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %57, <8 x i1> %45, <8 x float> poison), !dbg !84
  %71 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %58, <8 x i1> %47, <8 x float> poison), !dbg !84
  %72 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %59, <8 x i1> %49, <8 x float> poison), !dbg !84
  %73 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %60, <8 x i1> %51, <8 x float> poison), !dbg !84
  %74 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %61, <8 x i1> %53, <8 x float> poison), !dbg !84
  %75 = insertvalue [8 x <8 x float>] poison, <8 x float> %67, 0, !dbg !84
  %76 = insertvalue [8 x <8 x float>] %75, <8 x float> %68, 1, !dbg !84
  %77 = insertvalue [8 x <8 x float>] %76, <8 x float> %69, 2, !dbg !84
  %78 = insertvalue [8 x <8 x float>] %77, <8 x float> %70, 3, !dbg !84
  %79 = insertvalue [8 x <8 x float>] %78, <8 x float> %71, 4, !dbg !84
  %80 = insertvalue [8 x <8 x float>] %79, <8 x float> %72, 5, !dbg !84
  %81 = insertvalue [8 x <8 x float>] %80, <8 x float> %73, 6, !dbg !84
  %82 = insertvalue [8 x <8 x float>] %81, <8 x float> %74, 7, !dbg !84
  br label %83, !dbg !84

83:                                               ; preds = %107, %66
  %84 = phi i32 [ %219, %107 ], [ 0, %66 ], !dbg !84
  %85 = phi [8 x <8 x float>] [ %218, %107 ], [ %82, %66 ], !dbg !84
  %86 = icmp slt i32 %84, 32, !dbg !84
  br i1 %86, label %87, label %220, !dbg !84

87:                                               ; preds = %83
  %88 = insertelement <8 x i32> poison, i32 %37, i32 0, !dbg !84
  %89 = shufflevector <8 x i32> %88, <8 x i32> poison, <8 x i32> zeroinitializer, !dbg !84
  %90 = icmp sgt <8 x i32> %89, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !84
  br label %91, !dbg !84

91:                                               ; preds = %104, %87
  %92 = phi i32 [ %106, %104 ], [ 0, %87 ], !dbg !84
  %93 = phi <8 x float> [ %105, %104 ], [ poison, %87 ], !dbg !84
  %94 = icmp slt i32 %92, 8, !dbg !84
  br i1 %94, label %95, label %107, !dbg !84

95:                                               ; preds = %91
  %96 = extractelement <8 x i1> %90, i32 %92, !dbg !84
  br i1 %96, label %97, label %104, !dbg !84

97:                                               ; preds = %95
  %98 = add i32 %62, %92, !dbg !84
  %99 = mul nuw nsw i32 %98, 32, !dbg !84
  %100 = add nuw nsw i32 %99, %84, !dbg !84
  %101 = getelementptr inbounds nuw float, ptr %9, i32 %100, !dbg !84
  %102 = load float, ptr %101, align 4, !dbg !84
  %103 = insertelement <8 x float> %93, float %102, i32 %92, !dbg !84
  br label %104, !dbg !84

104:                                              ; preds = %97, %95
  %105 = phi <8 x float> [ %103, %97 ], [ %93, %95 ], !dbg !84
  %106 = add i32 %92, 1, !dbg !84
  br label %91, !dbg !84

107:                                              ; preds = %91
  %108 = mul i32 %64, 32, !dbg !84
  %109 = add i32 %108, %84, !dbg !84
  %110 = getelementptr float, ptr %14, i32 %109, !dbg !84
  %111 = load <1 x float>, ptr %110, align 4, !dbg !84
  %112 = add i32 %64, 1, !dbg !84
  %113 = mul i32 %112, 32, !dbg !84
  %114 = add i32 %113, %84, !dbg !84
  %115 = getelementptr float, ptr %14, i32 %114, !dbg !84
  %116 = load <1 x float>, ptr %115, align 4, !dbg !84
  %117 = add i32 %64, 2, !dbg !84
  %118 = mul i32 %117, 32, !dbg !84
  %119 = add i32 %118, %84, !dbg !84
  %120 = getelementptr float, ptr %14, i32 %119, !dbg !84
  %121 = load <1 x float>, ptr %120, align 4, !dbg !84
  %122 = add i32 %64, 3, !dbg !84
  %123 = mul i32 %122, 32, !dbg !84
  %124 = add i32 %123, %84, !dbg !84
  %125 = getelementptr float, ptr %14, i32 %124, !dbg !84
  %126 = load <1 x float>, ptr %125, align 4, !dbg !84
  %127 = add i32 %64, 4, !dbg !84
  %128 = mul i32 %127, 32, !dbg !84
  %129 = add i32 %128, %84, !dbg !84
  %130 = getelementptr float, ptr %14, i32 %129, !dbg !84
  %131 = load <1 x float>, ptr %130, align 4, !dbg !84
  %132 = add i32 %64, 5, !dbg !84
  %133 = mul i32 %132, 32, !dbg !84
  %134 = add i32 %133, %84, !dbg !84
  %135 = getelementptr float, ptr %14, i32 %134, !dbg !84
  %136 = load <1 x float>, ptr %135, align 4, !dbg !84
  %137 = add i32 %64, 6, !dbg !84
  %138 = mul i32 %137, 32, !dbg !84
  %139 = add i32 %138, %84, !dbg !84
  %140 = getelementptr float, ptr %14, i32 %139, !dbg !84
  %141 = load <1 x float>, ptr %140, align 4, !dbg !84
  %142 = add i32 %64, 7, !dbg !84
  %143 = mul i32 %142, 32, !dbg !84
  %144 = add i32 %143, %84, !dbg !84
  %145 = getelementptr float, ptr %14, i32 %144, !dbg !84
  %146 = load <1 x float>, ptr %145, align 4, !dbg !84
  %147 = extractelement <1 x float> %111, i32 0, !dbg !84
  %148 = extractelement <1 x float> %116, i32 0, !dbg !84
  %149 = extractelement <1 x float> %121, i32 0, !dbg !84
  %150 = extractelement <1 x float> %126, i32 0, !dbg !84
  %151 = extractelement <1 x float> %131, i32 0, !dbg !84
  %152 = extractelement <1 x float> %136, i32 0, !dbg !84
  %153 = extractelement <1 x float> %141, i32 0, !dbg !84
  %154 = extractelement <1 x float> %146, i32 0, !dbg !84
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
  %219 = add i32 %84, 1, !dbg !84
  br label %83, !dbg !84, !llvm.loop !91

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
  br label %252, !dbg !84

252:                                              ; preds = %265, %235
  %253 = phi i32 [ %266, %265 ], [ 0, %235 ], !dbg !84
  %254 = icmp slt i32 %253, %37, !dbg !84
  br i1 %254, label %255, label %267, !dbg !84

255:                                              ; preds = %258, %252
  %256 = phi i32 [ %264, %258 ], [ 0, %252 ], !dbg !84
  %257 = icmp slt i32 %256, 8, !dbg !84
  br i1 %257, label %258, label %265, !dbg !84

258:                                              ; preds = %255
  %259 = mul nuw nsw i32 %253, 8, !dbg !84
  %260 = add nuw nsw i32 %259, %256, !dbg !84
  %261 = getelementptr inbounds nuw float, ptr %6, i32 %260, !dbg !84
  %262 = load float, ptr %261, align 4, !dbg !84
  %263 = getelementptr inbounds nuw float, ptr %4, i32 %260, !dbg !84
  store float %262, ptr %263, align 4, !dbg !84
  %264 = add i32 %256, 1, !dbg !84
  br label %255, !dbg !84

265:                                              ; preds = %255
  %266 = add i32 %253, 1, !dbg !84
  br label %252, !dbg !84

267:                                              ; preds = %280, %252
  %268 = phi i32 [ %281, %280 ], [ 0, %252 ], !dbg !84
  %269 = icmp slt i32 %268, %37, !dbg !84
  br i1 %269, label %270, label %282, !dbg !84

270:                                              ; preds = %273, %267
  %271 = phi i32 [ %279, %273 ], [ 0, %267 ], !dbg !84
  %272 = icmp slt i32 %271, 8, !dbg !84
  br i1 %272, label %273, label %280, !dbg !84

273:                                              ; preds = %270
  %274 = mul nuw nsw i32 %268, 8, !dbg !84
  %275 = add nuw nsw i32 %274, %271, !dbg !84
  %276 = getelementptr inbounds nuw float, ptr %5, i32 %275, !dbg !84
  %277 = load float, ptr %276, align 4, !dbg !84
  %278 = getelementptr inbounds nuw float, ptr %4, i32 %275, !dbg !84
  store float %277, ptr %278, align 4, !dbg !84
  %279 = add i32 %271, 1, !dbg !84
  br label %270, !dbg !84

280:                                              ; preds = %270
  %281 = add i32 %268, 1, !dbg !84
  br label %267, !dbg !84

282:                                              ; preds = %267
  %283 = getelementptr float, ptr %4, i32 0, !dbg !93
  %284 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %283, <8 x i1> %39, <8 x float> poison), !dbg !93
  %285 = getelementptr float, ptr %4, i32 8, !dbg !93
  %286 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %285, <8 x i1> %41, <8 x float> poison), !dbg !93
  %287 = getelementptr float, ptr %4, i32 16, !dbg !93
  %288 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %287, <8 x i1> %43, <8 x float> poison), !dbg !93
  %289 = getelementptr float, ptr %4, i32 24, !dbg !93
  %290 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %289, <8 x i1> %45, <8 x float> poison), !dbg !93
  %291 = getelementptr float, ptr %4, i32 32, !dbg !93
  %292 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %291, <8 x i1> %47, <8 x float> poison), !dbg !93
  %293 = getelementptr float, ptr %4, i32 40, !dbg !93
  %294 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %293, <8 x i1> %49, <8 x float> poison), !dbg !93
  %295 = getelementptr float, ptr %4, i32 48, !dbg !93
  %296 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %295, <8 x i1> %51, <8 x float> poison), !dbg !93
  %297 = getelementptr float, ptr %4, i32 56, !dbg !93
  %298 = call <8 x float> @llvm.masked.load.v8f32.p0(ptr align 4 %297, <8 x i1> %53, <8 x float> poison), !dbg !93
  %299 = getelementptr float, ptr %18, i32 %64, !dbg !93
  %300 = load <8 x float>, ptr %299, align 4, !dbg !93
  %301 = fadd contract <8 x float> %284, %300, !dbg !94
  %302 = fadd contract <8 x float> %286, %300, !dbg !94
  %303 = fadd contract <8 x float> %288, %300, !dbg !94
  %304 = fadd contract <8 x float> %290, %300, !dbg !94
  %305 = fadd contract <8 x float> %292, %300, !dbg !94
  %306 = fadd contract <8 x float> %294, %300, !dbg !94
  %307 = fadd contract <8 x float> %296, %300, !dbg !94
  %308 = fadd contract <8 x float> %298, %300, !dbg !94
  %309 = fmul contract <8 x float> %301, %301, !dbg !95
  %310 = fmul contract <8 x float> %302, %302, !dbg !95
  %311 = fmul contract <8 x float> %303, %303, !dbg !95
  %312 = fmul contract <8 x float> %304, %304, !dbg !95
  %313 = fmul contract <8 x float> %305, %305, !dbg !95
  %314 = fmul contract <8 x float> %306, %306, !dbg !95
  %315 = fmul contract <8 x float> %307, %307, !dbg !95
  %316 = fmul contract <8 x float> %308, %308, !dbg !95
  %317 = fmul contract <8 x float> %309, %301, !dbg !95
  %318 = fmul contract <8 x float> %310, %302, !dbg !95
  %319 = fmul contract <8 x float> %311, %303, !dbg !95
  %320 = fmul contract <8 x float> %312, %304, !dbg !95
  %321 = fmul contract <8 x float> %313, %305, !dbg !95
  %322 = fmul contract <8 x float> %314, %306, !dbg !95
  %323 = fmul contract <8 x float> %315, %307, !dbg !95
  %324 = fmul contract <8 x float> %316, %308, !dbg !95
  %325 = fmul contract <8 x float> %317, splat (float 0x3FA6E4E260000000), !dbg !96
  %326 = fmul contract <8 x float> %318, splat (float 0x3FA6E4E260000000), !dbg !96
  %327 = fmul contract <8 x float> %319, splat (float 0x3FA6E4E260000000), !dbg !96
  %328 = fmul contract <8 x float> %320, splat (float 0x3FA6E4E260000000), !dbg !96
  %329 = fmul contract <8 x float> %321, splat (float 0x3FA6E4E260000000), !dbg !96
  %330 = fmul contract <8 x float> %322, splat (float 0x3FA6E4E260000000), !dbg !96
  %331 = fmul contract <8 x float> %323, splat (float 0x3FA6E4E260000000), !dbg !96
  %332 = fmul contract <8 x float> %324, splat (float 0x3FA6E4E260000000), !dbg !96
  %333 = fadd contract <8 x float> %301, %325, !dbg !97
  %334 = fadd contract <8 x float> %302, %326, !dbg !97
  %335 = fadd contract <8 x float> %303, %327, !dbg !97
  %336 = fadd contract <8 x float> %304, %328, !dbg !97
  %337 = fadd contract <8 x float> %305, %329, !dbg !97
  %338 = fadd contract <8 x float> %306, %330, !dbg !97
  %339 = fadd contract <8 x float> %307, %331, !dbg !97
  %340 = fadd contract <8 x float> %308, %332, !dbg !97
  %341 = fmul contract <8 x float> %333, splat (float 0x3FE9884520000000), !dbg !98
  %342 = fmul contract <8 x float> %334, splat (float 0x3FE9884520000000), !dbg !98
  %343 = fmul contract <8 x float> %335, splat (float 0x3FE9884520000000), !dbg !98
  %344 = fmul contract <8 x float> %336, splat (float 0x3FE9884520000000), !dbg !98
  %345 = fmul contract <8 x float> %337, splat (float 0x3FE9884520000000), !dbg !98
  %346 = fmul contract <8 x float> %338, splat (float 0x3FE9884520000000), !dbg !98
  %347 = fmul contract <8 x float> %339, splat (float 0x3FE9884520000000), !dbg !98
  %348 = fmul contract <8 x float> %340, splat (float 0x3FE9884520000000), !dbg !98
  %349 = fcmp ult <8 x float> %341, splat (float 0x401FFEC880000000), !dbg !99
  %350 = fcmp ult <8 x float> %342, splat (float 0x401FFEC880000000), !dbg !99
  %351 = fcmp ult <8 x float> %343, splat (float 0x401FFEC880000000), !dbg !99
  %352 = fcmp ult <8 x float> %344, splat (float 0x401FFEC880000000), !dbg !99
  %353 = fcmp ult <8 x float> %345, splat (float 0x401FFEC880000000), !dbg !99
  %354 = fcmp ult <8 x float> %346, splat (float 0x401FFEC880000000), !dbg !99
  %355 = fcmp ult <8 x float> %347, splat (float 0x401FFEC880000000), !dbg !99
  %356 = fcmp ult <8 x float> %348, splat (float 0x401FFEC880000000), !dbg !99
  %357 = select <8 x i1> %349, <8 x float> %341, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %358 = select <8 x i1> %350, <8 x float> %342, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %359 = select <8 x i1> %351, <8 x float> %343, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %360 = select <8 x i1> %352, <8 x float> %344, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %361 = select <8 x i1> %353, <8 x float> %345, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %362 = select <8 x i1> %354, <8 x float> %346, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %363 = select <8 x i1> %355, <8 x float> %347, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %364 = select <8 x i1> %356, <8 x float> %348, <8 x float> splat (float 0x401FFEC880000000), !dbg !99
  %365 = fcmp ugt <8 x float> %357, splat (float 0xC01FFEC880000000), !dbg !99
  %366 = fcmp ugt <8 x float> %358, splat (float 0xC01FFEC880000000), !dbg !99
  %367 = fcmp ugt <8 x float> %359, splat (float 0xC01FFEC880000000), !dbg !99
  %368 = fcmp ugt <8 x float> %360, splat (float 0xC01FFEC880000000), !dbg !99
  %369 = fcmp ugt <8 x float> %361, splat (float 0xC01FFEC880000000), !dbg !99
  %370 = fcmp ugt <8 x float> %362, splat (float 0xC01FFEC880000000), !dbg !99
  %371 = fcmp ugt <8 x float> %363, splat (float 0xC01FFEC880000000), !dbg !99
  %372 = fcmp ugt <8 x float> %364, splat (float 0xC01FFEC880000000), !dbg !99
  %373 = select <8 x i1> %365, <8 x float> %357, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %374 = select <8 x i1> %366, <8 x float> %358, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %375 = select <8 x i1> %367, <8 x float> %359, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %376 = select <8 x i1> %368, <8 x float> %360, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %377 = select <8 x i1> %369, <8 x float> %361, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %378 = select <8 x i1> %370, <8 x float> %362, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %379 = select <8 x i1> %371, <8 x float> %363, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %380 = select <8 x i1> %372, <8 x float> %364, <8 x float> splat (float 0xC01FFEC880000000), !dbg !99
  %381 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %341), !dbg !99
  %382 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %342), !dbg !99
  %383 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %343), !dbg !99
  %384 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %344), !dbg !99
  %385 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %345), !dbg !99
  %386 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %346), !dbg !99
  %387 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %347), !dbg !99
  %388 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %348), !dbg !99
  %389 = fcmp olt <8 x float> %381, splat (float 0x3F3A36E2E0000000), !dbg !99
  %390 = fcmp olt <8 x float> %382, splat (float 0x3F3A36E2E0000000), !dbg !99
  %391 = fcmp olt <8 x float> %383, splat (float 0x3F3A36E2E0000000), !dbg !99
  %392 = fcmp olt <8 x float> %384, splat (float 0x3F3A36E2E0000000), !dbg !99
  %393 = fcmp olt <8 x float> %385, splat (float 0x3F3A36E2E0000000), !dbg !99
  %394 = fcmp olt <8 x float> %386, splat (float 0x3F3A36E2E0000000), !dbg !99
  %395 = fcmp olt <8 x float> %387, splat (float 0x3F3A36E2E0000000), !dbg !99
  %396 = fcmp olt <8 x float> %388, splat (float 0x3F3A36E2E0000000), !dbg !99
  %397 = fmul contract <8 x float> %373, %373, !dbg !99
  %398 = fmul contract <8 x float> %374, %374, !dbg !99
  %399 = fmul contract <8 x float> %375, %375, !dbg !99
  %400 = fmul contract <8 x float> %376, %376, !dbg !99
  %401 = fmul contract <8 x float> %377, %377, !dbg !99
  %402 = fmul contract <8 x float> %378, %378, !dbg !99
  %403 = fmul contract <8 x float> %379, %379, !dbg !99
  %404 = fmul contract <8 x float> %380, %380, !dbg !99
  %405 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %406 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %407 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %408 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %409 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %410 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %411 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %412 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %413 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %405, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %414 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %406, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %415 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %407, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %416 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %408, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %417 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %409, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %418 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %410, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %419 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %411, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %420 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %412, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %421 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %413, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %422 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %414, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %423 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %415, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %424 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %416, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %425 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %417, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %426 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %418, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %427 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %419, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %428 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %420, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %429 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %421, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %430 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %422, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %431 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %423, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %432 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %424, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %433 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %425, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %434 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %426, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %435 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %427, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %436 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %428, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %437 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %429, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %438 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %430, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %439 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %431, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %440 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %432, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %441 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %433, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %442 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %434, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %443 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %435, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %444 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %436, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %445 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %437, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %446 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %438, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %447 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %439, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %448 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %440, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %449 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %441, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %450 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %442, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %451 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %443, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %452 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %444, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %453 = fmul contract <8 x float> %373, %445, !dbg !99
  %454 = fmul contract <8 x float> %374, %446, !dbg !99
  %455 = fmul contract <8 x float> %375, %447, !dbg !99
  %456 = fmul contract <8 x float> %376, %448, !dbg !99
  %457 = fmul contract <8 x float> %377, %449, !dbg !99
  %458 = fmul contract <8 x float> %378, %450, !dbg !99
  %459 = fmul contract <8 x float> %379, %451, !dbg !99
  %460 = fmul contract <8 x float> %380, %452, !dbg !99
  %461 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %462 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %463 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %464 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %465 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %466 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %467 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %468 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %469 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %461, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %470 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %462, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %471 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %463, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %472 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %464, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %473 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %465, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %474 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %466, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %475 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %467, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %476 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %468, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %477 = call <8 x float> @llvm.fma.v8f32(<8 x float> %397, <8 x float> %469, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %478 = call <8 x float> @llvm.fma.v8f32(<8 x float> %398, <8 x float> %470, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %479 = call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %471, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %480 = call <8 x float> @llvm.fma.v8f32(<8 x float> %400, <8 x float> %472, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %481 = call <8 x float> @llvm.fma.v8f32(<8 x float> %401, <8 x float> %473, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %482 = call <8 x float> @llvm.fma.v8f32(<8 x float> %402, <8 x float> %474, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %483 = call <8 x float> @llvm.fma.v8f32(<8 x float> %403, <8 x float> %475, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %484 = call <8 x float> @llvm.fma.v8f32(<8 x float> %404, <8 x float> %476, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %485 = fdiv <8 x float> %453, %477, !dbg !99
  %486 = fdiv <8 x float> %454, %478, !dbg !99
  %487 = fdiv <8 x float> %455, %479, !dbg !99
  %488 = fdiv <8 x float> %456, %480, !dbg !99
  %489 = fdiv <8 x float> %457, %481, !dbg !99
  %490 = fdiv <8 x float> %458, %482, !dbg !99
  %491 = fdiv <8 x float> %459, %483, !dbg !99
  %492 = fdiv <8 x float> %460, %484, !dbg !99
  %493 = select <8 x i1> %389, <8 x float> %373, <8 x float> %485, !dbg !99
  %494 = select <8 x i1> %390, <8 x float> %374, <8 x float> %486, !dbg !99
  %495 = select <8 x i1> %391, <8 x float> %375, <8 x float> %487, !dbg !99
  %496 = select <8 x i1> %392, <8 x float> %376, <8 x float> %488, !dbg !99
  %497 = select <8 x i1> %393, <8 x float> %377, <8 x float> %489, !dbg !99
  %498 = select <8 x i1> %394, <8 x float> %378, <8 x float> %490, !dbg !99
  %499 = select <8 x i1> %395, <8 x float> %379, <8 x float> %491, !dbg !99
  %500 = select <8 x i1> %396, <8 x float> %380, <8 x float> %492, !dbg !99
  %501 = fadd contract <8 x float> %493, splat (float 1.000000e+00), !dbg !100
  %502 = fadd contract <8 x float> %494, splat (float 1.000000e+00), !dbg !100
  %503 = fadd contract <8 x float> %495, splat (float 1.000000e+00), !dbg !100
  %504 = fadd contract <8 x float> %496, splat (float 1.000000e+00), !dbg !100
  %505 = fadd contract <8 x float> %497, splat (float 1.000000e+00), !dbg !100
  %506 = fadd contract <8 x float> %498, splat (float 1.000000e+00), !dbg !100
  %507 = fadd contract <8 x float> %499, splat (float 1.000000e+00), !dbg !100
  %508 = fadd contract <8 x float> %500, splat (float 1.000000e+00), !dbg !100
  %509 = fmul contract <8 x float> %301, splat (float 5.000000e-01), !dbg !101
  %510 = fmul contract <8 x float> %302, splat (float 5.000000e-01), !dbg !101
  %511 = fmul contract <8 x float> %303, splat (float 5.000000e-01), !dbg !101
  %512 = fmul contract <8 x float> %304, splat (float 5.000000e-01), !dbg !101
  %513 = fmul contract <8 x float> %305, splat (float 5.000000e-01), !dbg !101
  %514 = fmul contract <8 x float> %306, splat (float 5.000000e-01), !dbg !101
  %515 = fmul contract <8 x float> %307, splat (float 5.000000e-01), !dbg !101
  %516 = fmul contract <8 x float> %308, splat (float 5.000000e-01), !dbg !101
  %517 = fmul contract <8 x float> %509, %501, !dbg !102
  %518 = fmul contract <8 x float> %510, %502, !dbg !102
  %519 = fmul contract <8 x float> %511, %503, !dbg !102
  %520 = fmul contract <8 x float> %512, %504, !dbg !102
  %521 = fmul contract <8 x float> %513, %505, !dbg !102
  %522 = fmul contract <8 x float> %514, %506, !dbg !102
  %523 = fmul contract <8 x float> %515, %507, !dbg !102
  %524 = fmul contract <8 x float> %516, %508, !dbg !102
  %525 = mul i32 %62, 64, !dbg !102
  %526 = add i32 %525, %64, !dbg !102
  %527 = getelementptr float, ptr %22, i32 %526, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %517, ptr align 4 %527, <8 x i1> %39), !dbg !102
  %528 = add i32 %62, 1, !dbg !102
  %529 = mul i32 %528, 64, !dbg !102
  %530 = add i32 %529, %64, !dbg !102
  %531 = getelementptr float, ptr %22, i32 %530, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %518, ptr align 4 %531, <8 x i1> %41), !dbg !102
  %532 = add i32 %62, 2, !dbg !102
  %533 = mul i32 %532, 64, !dbg !102
  %534 = add i32 %533, %64, !dbg !102
  %535 = getelementptr float, ptr %22, i32 %534, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %519, ptr align 4 %535, <8 x i1> %43), !dbg !102
  %536 = add i32 %62, 3, !dbg !102
  %537 = mul i32 %536, 64, !dbg !102
  %538 = add i32 %537, %64, !dbg !102
  %539 = getelementptr float, ptr %22, i32 %538, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %520, ptr align 4 %539, <8 x i1> %45), !dbg !102
  %540 = add i32 %62, 4, !dbg !102
  %541 = mul i32 %540, 64, !dbg !102
  %542 = add i32 %541, %64, !dbg !102
  %543 = getelementptr float, ptr %22, i32 %542, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %521, ptr align 4 %543, <8 x i1> %47), !dbg !102
  %544 = add i32 %62, 5, !dbg !102
  %545 = mul i32 %544, 64, !dbg !102
  %546 = add i32 %545, %64, !dbg !102
  %547 = getelementptr float, ptr %22, i32 %546, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %522, ptr align 4 %547, <8 x i1> %49), !dbg !102
  %548 = add i32 %62, 6, !dbg !102
  %549 = mul i32 %548, 64, !dbg !102
  %550 = add i32 %549, %64, !dbg !102
  %551 = getelementptr float, ptr %22, i32 %550, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %523, ptr align 4 %551, <8 x i1> %51), !dbg !102
  %552 = add i32 %62, 7, !dbg !102
  %553 = mul i32 %552, 64, !dbg !102
  %554 = add i32 %553, %64, !dbg !102
  %555 = getelementptr float, ptr %22, i32 %554, !dbg !102
  call void @llvm.masked.store.v8f32.p0(<8 x float> %524, ptr align 4 %555, <8 x i1> %53), !dbg !102
  %556 = add i32 %64, 8, !dbg !84
  br label %63, !dbg !84, !llvm.loop !91

557:                                              ; preds = %63
  %558 = add i32 %32, 8, !dbg !84
  br label %31, !dbg !84, !llvm.loop !91

559:                                              ; preds = %31, %3
  ret i32 0, !dbg !103
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %23, %15, %12, %9
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %30
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %30, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %34

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 23
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %30, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %30, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -126, i32 -127
  %24 = add nsw i32 %23, %13
  %25 = shl nsw i32 %24, 10
  %26 = add nsw i32 %25, 15360
  %27 = lshr i32 %21, 13
  %28 = select i1 %22, i32 0, i32 %27
  %29 = add nuw nsw i32 %26, %28
  br label %30

30:                                               ; preds = %17, %12, %15, %1, %7
  %31 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %29, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %32 = or i32 %31, %6
  %33 = trunc i32 %32 to i16
  br label %34

34:                                               ; preds = %30, %9
  %35 = phi i16 [ %11, %9 ], [ %33, %30 ]
  ret i16 %35
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %9, %12, %15, %23
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @__extendhfsf2(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  ret float %30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %30
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %30, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %34

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 23
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %30, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %30, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -126, i32 -127
  %24 = add nsw i32 %23, %13
  %25 = shl nsw i32 %24, 10
  %26 = lshr i32 %21, 13
  %27 = add nuw nsw i32 %26, 15360
  %28 = select i1 %22, i32 15360, i32 %27
  %29 = add nsw i32 %28, %25
  br label %30

30:                                               ; preds = %17, %15, %12, %7, %1
  %31 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %29, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %32 = or i32 %31, %6
  %33 = trunc i32 %32 to i16
  br label %34

34:                                               ; preds = %9, %30
  %35 = phi i16 [ %11, %9 ], [ %33, %30 ]
  ret i16 %35
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @__truncsfhf2(float noundef %0) local_unnamed_addr #6 {
  %2 = alloca i16, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2139095040
  %5 = and i32 %3, 8388607
  %6 = lshr i32 %3, 16
  %7 = and i32 %6, 32768
  switch i32 %4, label %13 [
    i32 2139095040, label %8
    i32 0, label %31
  ]

8:                                                ; preds = %1
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %31, label %10

10:                                               ; preds = %8
  %11 = trunc nuw i32 %6 to i16
  %12 = or i16 %11, 32767
  br label %35

13:                                               ; preds = %1
  %14 = lshr exact i32 %4, 23
  %15 = icmp samesign ugt i32 %4, 1191182336
  br i1 %15, label %31, label %16

16:                                               ; preds = %13
  %17 = icmp samesign ult i32 %4, 947912704
  br i1 %17, label %31, label %18

18:                                               ; preds = %16
  %19 = and i32 %3, 8192
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 4095, i32 4096
  %22 = add nuw nsw i32 %21, %5
  %23 = icmp samesign ugt i32 %22, 8388607
  %24 = select i1 %23, i32 -126, i32 -127
  %25 = add nsw i32 %24, %14
  %26 = shl nsw i32 %25, 10
  %27 = lshr i32 %22, 13
  %28 = add nuw nsw i32 %27, 15360
  %29 = select i1 %23, i32 15360, i32 %28
  %30 = add nsw i32 %29, %26
  br label %31

31:                                               ; preds = %18, %16, %13, %8, %1
  %32 = phi i32 [ 31744, %8 ], [ %4, %1 ], [ %30, %18 ], [ 31744, %13 ], [ 0, %16 ]
  %33 = or i32 %32, %7
  %34 = trunc i32 %33 to i16
  br label %35

35:                                               ; preds = %10, %31
  %36 = phi i16 [ %12, %10 ], [ %34, %31 ]
  store i16 %36, ptr %2, align 4, !tbaa !104
  %37 = load float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %37
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden double @__extendhfdf2(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  %31 = fpext float %30 to double
  ret double %31
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @__truncdfhf2(double noundef %0) local_unnamed_addr #6 {
  %2 = alloca i16, align 4
  %3 = fptrunc double %0 to float
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %4 = bitcast float %3 to i32
  %5 = and i32 %4, 2139095040
  %6 = and i32 %4, 8388607
  %7 = lshr i32 %4, 16
  %8 = and i32 %7, 32768
  switch i32 %5, label %14 [
    i32 2139095040, label %9
    i32 0, label %32
  ]

9:                                                ; preds = %1
  %10 = icmp eq i32 %6, 0
  br i1 %10, label %32, label %11

11:                                               ; preds = %9
  %12 = trunc nuw i32 %7 to i16
  %13 = or i16 %12, 32767
  br label %36

14:                                               ; preds = %1
  %15 = lshr exact i32 %5, 23
  %16 = icmp samesign ugt i32 %5, 1191182336
  br i1 %16, label %32, label %17

17:                                               ; preds = %14
  %18 = icmp samesign ult i32 %5, 947912704
  br i1 %18, label %32, label %19

19:                                               ; preds = %17
  %20 = and i32 %4, 8192
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 4095, i32 4096
  %23 = add nuw nsw i32 %22, %6
  %24 = icmp samesign ugt i32 %23, 8388607
  %25 = select i1 %24, i32 -126, i32 -127
  %26 = add nsw i32 %25, %15
  %27 = shl nsw i32 %26, 10
  %28 = lshr i32 %23, 13
  %29 = add nuw nsw i32 %28, 15360
  %30 = select i1 %24, i32 15360, i32 %29
  %31 = add nsw i32 %27, %30
  br label %32

32:                                               ; preds = %19, %17, %14, %9, %1
  %33 = phi i32 [ 31744, %9 ], [ %5, %1 ], [ %31, %19 ], [ 31744, %14 ], [ 0, %17 ]
  %34 = or i32 %33, %8
  %35 = trunc i32 %34 to i16
  br label %36

36:                                               ; preds = %11, %32
  %37 = phi i16 [ %13, %11 ], [ %35, %32 ]
  store i16 %37, ptr %2, align 4, !tbaa !104
  %38 = load float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #8

; Function Attrs: inlinehint
define hidden noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #9 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @__math_oflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x4600000000000000) #9
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !106
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint
define hidden float @__math_uflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x3A00000000000000) #9
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @ceilf(float noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %26, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %23

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %17 = icmp slt i32 %4, 0
  %18 = ashr i32 -8388608, %7
  %19 = select i1 %17, i32 0, i32 %12
  %20 = add nuw i32 %19, %4
  %21 = and i32 %20, %18
  %22 = bitcast i32 %21 to float
  br label %26

23:                                               ; preds = %9
  %24 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %24, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %.not = icmp sgt i32 %4, -1
  br i1 %.not, label %25, label %26

25:                                               ; preds = %23
  %.not18 = icmp eq i32 %4, 0
  %spec.select = select i1 %.not18, float %0, float 1.000000e+00
  br label %26

26:                                               ; preds = %25, %23, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %22, %15 ], [ -0.000000e+00, %23 ], [ %spec.select, %25 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden float @expf(float noundef %0) local_unnamed_addr #9 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 20
  %4 = and i32 %3, 2047
  %.not = icmp samesign ult i32 %4, 1067
  br i1 %.not, label %18, label %5, !prof !108

5:                                                ; preds = %1
  %6 = fcmp oeq float %0, 0xFFF0000000000000
  br i1 %6, label %18, label %7

7:                                                ; preds = %5
  %.not34 = icmp samesign ult i32 %4, 2040
  br i1 %.not34, label %10, label %8

8:                                                ; preds = %7
  %9 = fadd float %0, %0
  br label %18

10:                                               ; preds = %7
  %11 = fcmp ogt float %0, 0x40562E42E0000000
  br i1 %11, label %12, label %14

12:                                               ; preds = %10
  %13 = tail call float @__math_oflowf(i32 noundef 0) #9
  br label %18

14:                                               ; preds = %10
  %15 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = tail call float @__math_uflowf(i32 noundef 0) #9
  br label %18

18:                                               ; preds = %16, %14, %12, %8, %5, %1
  %.0 = phi float [ %9, %8 ], [ %13, %12 ], [ %17, %16 ], [ 0.000000e+00, %5 ], [ undef, %14 ], [ undef, %1 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetround() local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden float @floorf(float noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %27, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %22

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %27, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %.not1819 = icmp slt i32 %4, 0
  %17 = ashr i32 -8388608, %7
  %18 = select i1 %.not1819, i32 %12, i32 0
  %19 = add nsw i32 %18, %4
  %20 = and i32 %19, %17
  %21 = bitcast i32 %20 to float
  br label %27

22:                                               ; preds = %9
  %23 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %23, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %24 = icmp sgt i32 %4, -1
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %.not = fcmp oeq float %0, 0.000000e+00
  br i1 %.not, label %27, label %26

26:                                               ; preds = %25
  br label %27

27:                                               ; preds = %26, %25, %22, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %21, %15 ], [ -1.000000e+00, %26 ], [ %0, %25 ], [ 0.000000e+00, %22 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden noundef float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #9 {
  unreachable
}

; Function Attrs: inlinehint
define hidden float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = bitcast float %1 to i32
  %7 = lshr i32 %6, 23
  %8 = and i32 %7, 255
  %9 = and i32 %3, -2147483648
  %10 = shl i32 %6, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %2
  %13 = tail call float @llvm.fabs.f32(float %1)
  %14 = bitcast float %13 to i32
  %15 = icmp samesign ugt i32 %14, 2139095040
  %16 = icmp eq i32 %5, 255
  %or.cond = or i1 %15, %16
  br i1 %or.cond, label %17, label %20

17:                                               ; preds = %12, %2
  %18 = fmul float %0, %1
  %19 = fdiv float %18, %18
  br label %83

20:                                               ; preds = %12
  %21 = shl i32 %3, 1
  %.not = icmp ugt i32 %21, %10
  br i1 %.not, label %25, label %22

22:                                               ; preds = %20
  %23 = icmp eq i32 %21, %10
  %24 = fmul float %0, 0.000000e+00
  %spec.select = select i1 %23, float %24, float %0
  br label %83

25:                                               ; preds = %20
  %.not81 = icmp eq i32 %5, 0
  br i1 %.not81, label %26, label %34

26:                                               ; preds = %25
  %27 = shl i32 %3, 9
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %26
  %.06586 = phi i32 [ %30, %.lr.ph ], [ %27, %26 ]
  %.07085 = phi i32 [ %29, %.lr.ph ], [ 0, %26 ]
  %29 = add nsw i32 %.07085, -1
  %30 = shl nuw i32 %.06586, 1
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %26
  %.070.lcssa = phi i32 [ 0, %26 ], [ %29, %.lr.ph ]
  %32 = sub i32 1, %.070.lcssa
  %33 = shl i32 %3, %32
  br label %37

34:                                               ; preds = %25
  %35 = and i32 %3, 8388607
  %36 = or disjoint i32 %35, 8388608
  br label %37

37:                                               ; preds = %34, %._crit_edge
  %.171 = phi i32 [ %5, %34 ], [ %.070.lcssa, %._crit_edge ]
  %.0 = phi i32 [ %36, %34 ], [ %33, %._crit_edge ]
  %.not82 = icmp eq i32 %8, 0
  br i1 %.not82, label %38, label %46

38:                                               ; preds = %37
  %39 = shl i32 %6, 9
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %.lr.ph90, label %._crit_edge91

.lr.ph90:                                         ; preds = %.lr.ph90, %38
  %.16688 = phi i32 [ %42, %.lr.ph90 ], [ %39, %38 ]
  %.06887 = phi i32 [ %41, %.lr.ph90 ], [ 0, %38 ]
  %41 = add nsw i32 %.06887, -1
  %42 = shl nuw i32 %.16688, 1
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %.lr.ph90, label %._crit_edge91

._crit_edge91:                                    ; preds = %.lr.ph90, %38
  %.068.lcssa = phi i32 [ 0, %38 ], [ %41, %.lr.ph90 ]
  %44 = sub i32 1, %.068.lcssa
  %45 = shl i32 %6, %44
  br label %49

46:                                               ; preds = %37
  %47 = and i32 %6, 8388607
  %48 = or disjoint i32 %47, 8388608
  br label %49

49:                                               ; preds = %46, %._crit_edge91
  %.sroa.0.0.in = phi i32 [ %48, %46 ], [ %45, %._crit_edge91 ]
  %.169 = phi i32 [ %8, %46 ], [ %.068.lcssa, %._crit_edge91 ]
  %50 = icmp sgt i32 %.171, %.169
  br i1 %50, label %.lr.ph96, label %._crit_edge97

.lr.ph96:                                         ; preds = %57, %49
  %.194 = phi i32 [ %58, %57 ], [ %.0, %49 ]
  %.27293 = phi i32 [ %59, %57 ], [ %.171, %49 ]
  %51 = sub i32 %.194, %.sroa.0.0.in
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %53, label %57

53:                                               ; preds = %.lr.ph96
  %54 = icmp eq i32 %51, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %53
  %56 = fmul float %0, 0.000000e+00
  br label %83

57:                                               ; preds = %53, %.lr.ph96
  %.2 = phi i32 [ %.194, %.lr.ph96 ], [ %51, %53 ]
  %58 = shl i32 %.2, 1
  %59 = add nsw i32 %.27293, -1
  %60 = icmp sgt i32 %59, %.169
  br i1 %60, label %.lr.ph96, label %._crit_edge97

._crit_edge97:                                    ; preds = %57, %49
  %.272.lcssa = phi i32 [ %.171, %49 ], [ %.169, %57 ]
  %.1.lcssa = phi i32 [ %.0, %49 ], [ %58, %57 ]
  %61 = sub i32 %.1.lcssa, %.sroa.0.0.in
  %62 = icmp sgt i32 %61, -1
  br i1 %62, label %63, label %67

63:                                               ; preds = %._crit_edge97
  %64 = icmp eq i32 %61, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %63
  %66 = fmul float %0, 0.000000e+00
  br label %83

67:                                               ; preds = %63, %._crit_edge97
  %.3 = phi i32 [ %.1.lcssa, %._crit_edge97 ], [ %61, %63 ]
  %68 = icmp ult i32 %.3, 8388608
  br i1 %68, label %.lr.ph103, label %._crit_edge104

.lr.ph103:                                        ; preds = %.lr.ph103, %67
  %.4101 = phi i32 [ %69, %.lr.ph103 ], [ %.3, %67 ]
  %.373100 = phi i32 [ %70, %.lr.ph103 ], [ %.272.lcssa, %67 ]
  %69 = shl nuw nsw i32 %.4101, 1
  %70 = add nsw i32 %.373100, -1
  %71 = icmp samesign ult i32 %.4101, 4194304
  br i1 %71, label %.lr.ph103, label %._crit_edge104

._crit_edge104:                                   ; preds = %.lr.ph103, %67
  %.373.lcssa = phi i32 [ %.272.lcssa, %67 ], [ %70, %.lr.ph103 ]
  %.4.lcssa = phi i32 [ %.3, %67 ], [ %69, %.lr.ph103 ]
  %72 = icmp sgt i32 %.373.lcssa, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %._crit_edge104
  %74 = add i32 %.4.lcssa, -8388608
  %75 = shl i32 %.373.lcssa, 23
  %76 = or i32 %74, %75
  br label %80

77:                                               ; preds = %._crit_edge104
  %78 = sub i32 1, %.373.lcssa
  %79 = lshr i32 %.4.lcssa, %78
  br label %80

80:                                               ; preds = %77, %73
  %.5 = phi i32 [ %76, %73 ], [ %79, %77 ]
  %81 = or i32 %.5, %9
  %82 = bitcast i32 %81 to float
  br label %83

83:                                               ; preds = %80, %65, %55, %22, %17
  %.067 = phi float [ %19, %17 ], [ %56, %55 ], [ %66, %65 ], [ %82, %80 ], [ %spec.select, %22 ]
  ret float %.067
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #8

; Function Attrs: inlinehint
define hidden float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #9 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %trunc = trunc i32 %4 to i8
  switch i8 %trunc, label %13 [
    i8 0, label %5
    i8 -1, label %19
  ]

5:                                                ; preds = %2
  %6 = fcmp une float %0, 0.000000e+00
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = fmul float %0, 0x43F0000000000000
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #9
  %10 = load i32, ptr %1, align 4, !tbaa !4
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !4
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !4
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = tail call float @scalbnf(float noundef %0, i32 noundef %1) #9
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, 0x47E0000000000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = fmul float %5, 0x47E0000000000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select = add nsw i32 %10, -254
  br label %20

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %20

13:                                               ; preds = %11
  %14 = fmul float %0, 0x3990000000000000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = fmul float %14, 0x3990000000000000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1 = add nuw nsw i32 %19, 204
  br label %20

20:                                               ; preds = %17, %13, %11, %8, %4
  %.018 = phi i32 [ %spec.store.select, %8 ], [ %6, %4 ], [ %spec.store.select1, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0 = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %21 = shl nsw i32 %.018, 23
  %22 = add nsw i32 %21, 1065353216
  %23 = bitcast i32 %22 to float
  %24 = fmul float %.0, %23
  ret float %24
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #8

; Function Attrs: inlinehint
define hidden float @powf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = bitcast float %1 to i32
  %6 = add i32 %4, -2139095040
  %7 = icmp ult i32 %6, -2130706432
  %.pre = shl i32 %5, 1
  br i1 %7, label %.critedge, label %8, !prof !109

8:                                                ; preds = %2
  %9 = add i32 %.pre, 16777216
  %10 = icmp ult i32 %9, 16777217
  tail call void @llvm.assume(i1 %10)
  br label %.critedge

.critedge:                                        ; preds = %8, %2
  %11 = add i32 %.pre, -1
  %12 = icmp ult i32 %11, -16777217
  br i1 %12, label %29, label %13, !prof !108

13:                                               ; preds = %.critedge
  %14 = icmp eq i32 %.pre, 0
  %15 = icmp eq i32 %4, 1065353216
  %or.cond69 = or i1 %15, %14
  br i1 %or.cond69, label %58, label %16

16:                                               ; preds = %13
  %17 = shl i32 %4, 1
  %18 = icmp ugt i32 %17, -16777216
  %19 = icmp samesign ugt i32 %.pre, -16777216
  %or.cond = or i1 %18, %19
  br i1 %or.cond, label %20, label %22

20:                                               ; preds = %16
  %21 = fadd float %0, %1
  br label %58

22:                                               ; preds = %16
  %23 = icmp eq i32 %17, 2130706432
  br i1 %23, label %58, label %24

24:                                               ; preds = %22
  %25 = icmp ult i32 %17, 2130706432
  %26 = icmp slt i32 %5, 0
  %27 = xor i1 %25, %26
  %28 = fmul float %1, %1
  %spec.select70 = select i1 %27, float 0.000000e+00, float %28
  br label %58

29:                                               ; preds = %.critedge
  %30 = shl i32 %4, 1
  %31 = add i32 %30, -1
  %32 = icmp ult i32 %31, -16777217
  br i1 %32, label %48, label %33, !prof !108

33:                                               ; preds = %29
  %34 = fmul float %0, %0
  %.not66 = icmp sgt i32 %4, -1
  br i1 %.not66, label %checkint.exit.thread, label %35

35:                                               ; preds = %33
  %36 = lshr i32 %5, 23
  %37 = and i32 %36, 255
  %38 = add nsw i32 %37, -151
  %or.cond85 = icmp ult i32 %38, -24
  br i1 %or.cond85, label %checkint.exit.thread, label %39

39:                                               ; preds = %35
  %40 = sub nuw nsw i32 150, %37
  %41 = shl nuw nsw i32 1, %40
  %42 = add nsw i32 %41, -1
  %43 = and i32 %42, %5
  %.not.i = icmp ne i32 %43, 0
  %44 = and i32 %41, %5
  %.not9.i = icmp eq i32 %44, 0
  %or.cond86 = or i1 %.not9.i, %.not.i
  %45 = fneg float %34
  %spec.select = select i1 %or.cond86, float %34, float %45
  br label %checkint.exit.thread

checkint.exit.thread:                             ; preds = %39, %35, %33
  %.057 = phi float [ %34, %33 ], [ %34, %35 ], [ %spec.select, %39 ]
  %.not67 = icmp sgt i32 %5, -1
  br i1 %.not67, label %58, label %46

46:                                               ; preds = %checkint.exit.thread
  %47 = fdiv float 1.000000e+00, %.057
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %47, ptr %3, align 4, !tbaa !106
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  br label %58

48:                                               ; preds = %29
  %.not64 = icmp slt i32 %4, 0
  tail call void @llvm.assume(i1 %.not64)
  %49 = lshr i32 %5, 23
  %50 = and i32 %49, 255
  %51 = icmp samesign ult i32 %50, 127
  br i1 %51, label %.thread, label %52

52:                                               ; preds = %48
  %53 = icmp samesign ult i32 %50, 151
  tail call void @llvm.assume(i1 %53)
  %54 = sub nuw nsw i32 150, %50
  %notmask = shl nsw i32 -1, %54
  %55 = xor i32 %notmask, -1
  %56 = and i32 %55, %5
  %.not.i71 = icmp ne i32 %56, 0
  tail call void @llvm.assume(i1 %.not.i71)
  br label %.thread

.thread:                                          ; preds = %52, %48
  %57 = tail call float @__math_invalidf(float noundef %0) #9
  br label %58

58:                                               ; preds = %.thread, %46, %checkint.exit.thread, %24, %22, %20, %13
  %.0 = phi float [ %21, %20 ], [ 1.000000e+00, %13 ], [ 1.000000e+00, %22 ], [ %.0..0..0..0..0..0..i, %46 ], [ %.057, %checkint.exit.thread ], [ %spec.select70, %24 ], [ %57, %.thread ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden noundef float @rintf(float noundef %0) local_unnamed_addr #9 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2130706432
  %4 = icmp samesign ugt i32 %3, 1249902592
  br i1 %4, label %13, label %5

5:                                                ; preds = %1
  %.not = icmp sgt i32 %2, -1
  %6 = fadd float %0, 0xC160000000000000
  %7 = fadd float %6, 0x4160000000000000
  %8 = fadd float %0, 0x4160000000000000
  %9 = fadd float %8, 0xC160000000000000
  %.0 = select i1 %.not, float %9, float %7
  %10 = fcmp oeq float %.0, 0.000000e+00
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = select i1 %.not, float 0.000000e+00, float -0.000000e+00
  br label %13

13:                                               ; preds = %11, %5, %1
  %.010 = phi float [ %12, %11 ], [ %0, %1 ], [ %.0, %5 ]
  ret float %.010
}

; Function Attrs: inlinehint
define hidden float @roundf(float noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = icmp samesign ugt i32 %5, 149
  br i1 %6, label %26, label %7

7:                                                ; preds = %1
  %spec.select = tail call float @llvm.fabs.f32(float %0)
  %8 = icmp samesign ult i32 %5, 126
  %9 = fadd float %spec.select, 0x4160000000000000
  br i1 %8, label %10, label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %9, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %11 = fmul float %0, 0.000000e+00
  br label %26

12:                                               ; preds = %7
  %13 = fadd float %9, 0xC160000000000000
  %14 = fsub float %13, %spec.select
  %15 = fcmp ogt float %14, 5.000000e-01
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = fadd float %spec.select, %14
  %18 = fadd float %17, -1.000000e+00
  br label %24

19:                                               ; preds = %12
  %20 = fcmp ugt float %14, -5.000000e-01
  %21 = fadd float %spec.select, %14
  br i1 %20, label %24, label %22

22:                                               ; preds = %19
  %23 = fadd float %21, 1.000000e+00
  br label %24

24:                                               ; preds = %22, %19, %16
  %.0 = phi float [ %18, %16 ], [ %23, %22 ], [ %21, %19 ]
  %25 = fneg float %.0
  %.not26 = icmp slt i32 %3, 0
  %spec.select25 = select i1 %.not26, float %25, float %.0
  br label %26

26:                                               ; preds = %24, %10, %1
  %.020 = phi float [ %11, %10 ], [ %spec.select25, %24 ], [ %0, %1 ]
  ret float %.020
}

attributes #0 = { "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #5 = { "nonlazybind" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { inlinehint }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}
!llvm.errno.tbaa = !{!4}

!0 = distinct !DICompileUnit(language: DW_LANG_C17, file: !1, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "configured_module_main_dispatch_0.mlir", directory: "/home/builder/work/walk/out/exe")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !DISubprogram(name: "main_dispatch_0_matmul_17x64x32_f32", linkageName: "main_dispatch_0_matmul_17x64x32_f32", scope: !1, file: !1, line: 1, type: !9, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!9 = !DISubroutineType(cc: DW_CC_normal, types: !10)
!10 = !{!11, !12, !43, !72}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_environment_v0_t", baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_environment_v0_t", scope: !16, file: !16, line: 246, size: 768, elements: !17)
!16 = !DIFile(filename: "runtime/src/iree/hal/local/executable_library.h", directory: ".")
!17 = !{!18, !26, !29, !32, !34}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !19, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, scope: !16, file: !16, line: 227, baseType: !22, size: 2048, elements: !24)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", baseType: !23)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !{!25}
!25 = !DISubrange(count: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "import_thunk", baseType: !27, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 32)
!28 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "import_funcs", baseType: !30, size: 32, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "import_contexts", baseType: !33, size: 32, offset: 96)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "processor", baseType: !35, offset: 128)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_processor_v0_t", scope: !16, file: !16, line: 227, size: 512, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "data", baseType: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, scope: !16, file: !16, line: 227, baseType: !39, size: 512, elements: !41)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", baseType: !40)
!40 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !{!42}
!42 = !DISubrange(count: 8)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_dispatch_state_v0_t", baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_dispatch_state_v0_t", scope: !16, file: !16, line: 275, size: 384, elements: !47)
!47 = !{!48, !49, !50, !53, !54, !55, !56, !57, !60, !61, !62, !67}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_x", baseType: !22, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_y", baseType: !22, size: 32, offset: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_z", baseType: !51, size: 16, offset: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", baseType: !52)
!52 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "constant_count", baseType: !51, size: 16, offset: 80)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_x", baseType: !22, size: 32, offset: 96)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_y", baseType: !22, size: 32, offset: 128)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_z", baseType: !51, size: 16, offset: 160)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "max_concurrency", baseType: !58, size: 8, offset: 176)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", baseType: !59)
!59 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "binding_count", baseType: !58, size: 8, offset: 184)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !19, size: 32, offset: 192)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "binding_ptrs", baseType: !63, size: 32, offset: 224)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, scope: !16, file: !16, line: 227, baseType: !66, size: 2048, elements: !24)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "binding_lengths", baseType: !68, size: 32, offset: 256)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 32)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, scope: !16, file: !16, line: 227, baseType: !71, size: 2048, elements: !24)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", baseType: !22)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 32)
!73 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_workgroup_state_v0_t", baseType: !75)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_workgroup_state_v0_t", scope: !16, file: !16, line: 321, size: 256, elements: !76)
!76 = !{!77, !78, !79, !80, !81, !82, !83}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_x", baseType: !22, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_y", baseType: !22, size: 32, offset: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_z", baseType: !51, size: 16, offset: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", baseType: !51, size: 16, offset: 80)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "processor_id", baseType: !22, size: 32, offset: 96)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory", baseType: !27, size: 32, offset: 128)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory_size", baseType: !22, size: 32, offset: 160)
!84 = !DILocation(line: 26, column: 8, scope: !8)
!85 = !DILocation(line: 25, column: 8, scope: !8)
!86 = !DILocation(line: 17, column: 8, scope: !8)
!87 = !DILocation(line: 18, column: 8, scope: !8)
!88 = !DILocation(line: 19, column: 8, scope: !8)
!89 = !DILocation(line: 20, column: 8, scope: !8)
!90 = !DILocation(line: 9, column: 8, scope: !8)
!91 = distinct !{!91, !92}
!92 = !{!"llvm.loop.unroll.disable"}
!93 = !DILocation(line: 27, column: 8, scope: !8)
!94 = !DILocation(line: 29, column: 10, scope: !8)
!95 = !DILocation(line: 30, column: 10, scope: !8)
!96 = !DILocation(line: 31, column: 10, scope: !8)
!97 = !DILocation(line: 32, column: 10, scope: !8)
!98 = !DILocation(line: 33, column: 10, scope: !8)
!99 = !DILocation(line: 34, column: 10, scope: !8)
!100 = !DILocation(line: 35, column: 10, scope: !8)
!101 = !DILocation(line: 36, column: 10, scope: !8)
!102 = !DILocation(line: 37, column: 10, scope: !8)
!103 = !DILocation(line: 41, column: 8, scope: !8)
!104 = !{!105, !105, i64 0}
!105 = !{!"short", !6, i64 0}
!106 = !{!107, !107, i64 0}
!107 = !{!"float", !6, i64 0}
!108 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!109 = !{!"branch_weights", !"expected", i32 1, i32 2000}
