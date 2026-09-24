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

@0 = internal constant [16 x i8] c"main_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [1 x ptr] [ptr @main_dispatch_0_matmul_17x64x32_f32]
@iree_hal_executable_library_query_v0_attrs = internal constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i32] [i32 0, i32 -753564300, i32 1828292879, i32 -804103343, i32 1014845819, i32 828946858, i32 1853186616, i32 -182460703, i32 171030293, i32 926591435, i32 1276261410, i32 1617004845, i32 -717870553, i32 1453150082, i32 -582462423, i32 -1338354299, i32 1719614413, i32 -387162252, i32 1944781191, i32 -1723019757, i32 1110089947, i32 -1328691739, i32 -2103185264, i32 -1304550051, i32 -1722100819, i32 -218407353, i32 -578465124, i32 -588279703, i32 -587488121, i32 863738719, i32 -1566273318, i32 1533953344], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @main_dispatch_0_matmul_17x64x32_f32(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #0 !dbg !8 {
  %4 = alloca [64 x float], align 64, !dbg !84
  %5 = alloca [64 x float], align 64
  %6 = alloca [64 x float], align 64, !dbg !85
  %.elt27 = getelementptr inbounds nuw i8, ptr %1, i32 28, !dbg !86
  %.unpack28 = load ptr, ptr %.elt27, align 4, !dbg !86
  %7 = load ptr, ptr %.unpack28, align 4, !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i32 64) ], !dbg !86
  %8 = getelementptr i8, ptr %.unpack28, i32 4, !dbg !87
  %9 = load ptr, ptr %8, align 4, !dbg !87
  %10 = getelementptr i8, ptr %9, i32 256, !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i32 64) ], !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i32 64) ], !dbg !88
  %11 = getelementptr i8, ptr %.unpack28, i32 8, !dbg !89
  %12 = load ptr, ptr %11, align 4, !dbg !89
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i32 64) ], !dbg !89
  %.unpack = load i32, ptr %2, align 16, !dbg !84
  %13 = shl i32 %.unpack, 4, !dbg !84
  %14 = sub i32 17, %13, !dbg !84
  %15 = tail call i32 @llvm.smin.i32(i32 %14, i32 16), !dbg !84
  %16 = icmp sgt i32 %14, 0, !dbg !84
  br i1 %16, label %.lr.ph, label %.loopexit, !dbg !84

.lr.ph:                                           ; preds = %3
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 32
  %18 = getelementptr inbounds nuw i8, ptr %6, i32 64
  %19 = getelementptr inbounds nuw i8, ptr %6, i32 96
  %20 = getelementptr inbounds nuw i8, ptr %6, i32 128
  %21 = getelementptr inbounds nuw i8, ptr %6, i32 160
  %22 = getelementptr inbounds nuw i8, ptr %6, i32 192
  %23 = getelementptr inbounds nuw i8, ptr %6, i32 224
  %24 = getelementptr inbounds nuw i8, ptr %5, i32 32
  %25 = getelementptr inbounds nuw i8, ptr %5, i32 64
  %26 = getelementptr inbounds nuw i8, ptr %5, i32 96
  %27 = getelementptr inbounds nuw i8, ptr %5, i32 128
  %28 = getelementptr inbounds nuw i8, ptr %5, i32 160
  %29 = getelementptr inbounds nuw i8, ptr %5, i32 192
  %30 = getelementptr inbounds nuw i8, ptr %5, i32 224
  %31 = getelementptr inbounds nuw i8, ptr %4, i32 32
  %32 = getelementptr inbounds nuw i8, ptr %4, i32 64
  %33 = getelementptr inbounds nuw i8, ptr %4, i32 96
  %34 = getelementptr inbounds nuw i8, ptr %4, i32 128
  %35 = getelementptr inbounds nuw i8, ptr %4, i32 160
  %36 = getelementptr inbounds nuw i8, ptr %4, i32 192
  %37 = getelementptr inbounds nuw i8, ptr %4, i32 224
  br label %38, !dbg !84

38:                                               ; preds = %.lr.ph, %389
  %indvars.iv = phi i32 [ %15, %.lr.ph ], [ %indvars.iv.next, %389 ]
  %39 = phi i32 [ 0, %.lr.ph ], [ %390, %389 ]
  %40 = tail call i32 @llvm.smax.i32(i32 %indvars.iv, i32 1), !dbg !84
  %41 = tail call i32 @llvm.umin.i32(i32 %40, i32 8), !dbg !84
  %42 = sub nsw i32 %15, %39, !dbg !84
  %43 = tail call i32 @llvm.smin.i32(i32 %42, i32 8), !dbg !84
  %44 = icmp sgt i32 %42, 0, !dbg !85
  %45 = select i1 %44, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %46 = icmp sgt i32 %42, 1, !dbg !85
  %47 = select i1 %46, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %48 = icmp sgt i32 %42, 2, !dbg !85
  %49 = select i1 %48, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %50 = icmp sgt i32 %42, 3, !dbg !85
  %51 = select i1 %50, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %52 = icmp sgt i32 %42, 4, !dbg !85
  %53 = select i1 %52, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %54 = icmp sgt i32 %42, 5, !dbg !85
  %55 = select i1 %54, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %56 = icmp sgt i32 %42, 6, !dbg !85
  %57 = select i1 %56, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  %58 = icmp sgt i32 %42, 7, !dbg !85
  %59 = select i1 %58, <8 x i1> splat (i1 true), <8 x i1> zeroinitializer, !dbg !85
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 64 %6, <8 x i1> %45), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 32 %17, <8 x i1> %47), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 64 %18, <8 x i1> %49), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 32 %19, <8 x i1> %51), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 64 %20, <8 x i1> %53), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 32 %21, <8 x i1> %55), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 64 %22, <8 x i1> %57), !dbg !90
  call void @llvm.masked.store.v8f32.p0(<8 x float> zeroinitializer, ptr nonnull align 32 %23, <8 x i1> %59), !dbg !90
  %60 = add nuw nsw i32 %39, %13, !dbg !84
  %unmaskedload = load <8 x float>, ptr %6, align 64
  %unmaskedload43 = load <8 x float>, ptr %17, align 32
  %unmaskedload44 = load <8 x float>, ptr %18, align 64
  %unmaskedload45 = load <8 x float>, ptr %19, align 32
  %unmaskedload46 = load <8 x float>, ptr %20, align 64
  %unmaskedload47 = load <8 x float>, ptr %21, align 32
  %unmaskedload48 = load <8 x float>, ptr %22, align 64
  %unmaskedload49 = load <8 x float>, ptr %23, align 32
  %61 = insertelement <8 x i32> poison, i32 %43, i64 0
  %62 = shufflevector <8 x i32> %61, <8 x i32> poison, <8 x i32> zeroinitializer
  %63 = icmp sgt <8 x i32> %62, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %.idx = shl i32 %60, 8
  %64 = getelementptr i8, ptr %12, i32 %.idx
  br label %65, !dbg !84

65:                                               ; preds = %38, %._crit_edge117
  %66 = phi i32 [ 0, %38 ], [ %387, %._crit_edge117 ]
  %.idx95 = shl nuw nsw i32 %66, 7
  %67 = getelementptr i8, ptr %10, i32 %.idx95
  br label %68, !dbg !84

.preheader107:                                    ; preds = %81
  br i1 %44, label %.preheader105, label %._crit_edge117.critedge

68:                                               ; preds = %65, %81
  %.pn50116 = phi <8 x float> [ %unmaskedload49, %65 ], [ %134, %81 ]
  %.pn52115 = phi <8 x float> [ %unmaskedload48, %65 ], [ %131, %81 ]
  %.pn54114 = phi <8 x float> [ %unmaskedload47, %65 ], [ %128, %81 ]
  %.pn56113 = phi <8 x float> [ %unmaskedload46, %65 ], [ %125, %81 ]
  %.pn58112 = phi <8 x float> [ %unmaskedload45, %65 ], [ %122, %81 ]
  %.pn60111 = phi <8 x float> [ %unmaskedload44, %65 ], [ %119, %81 ]
  %.pn62110 = phi <8 x float> [ %unmaskedload43, %65 ], [ %116, %81 ]
  %.pn64109 = phi <8 x float> [ %unmaskedload, %65 ], [ %113, %81 ]
  %69 = phi i32 [ 0, %65 ], [ %135, %81 ]
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %7, i32 %69, !dbg !84
  br label %70, !dbg !84

70:                                               ; preds = %68, %78
  %71 = phi <8 x float> [ poison, %68 ], [ %79, %78 ]
  %72 = phi i32 [ 0, %68 ], [ %80, %78 ]
  %73 = extractelement <8 x i1> %63, i32 %72, !dbg !84
  br i1 %73, label %74, label %78, !dbg !84

74:                                               ; preds = %70
  %75 = add nuw nsw i32 %72, %60, !dbg !84
  %.idx103 = shl nuw nsw i32 %75, 7, !dbg !84
  %gep = getelementptr inbounds nuw i8, ptr %invariant.gep, i32 %.idx103, !dbg !84
  %76 = load float, ptr %gep, align 4, !dbg !84
  %77 = insertelement <8 x float> %71, float %76, i32 %72, !dbg !84
  br label %78, !dbg !84

78:                                               ; preds = %74, %70
  %79 = phi <8 x float> [ %77, %74 ], [ %71, %70 ], !dbg !84
  %80 = add nuw nsw i32 %72, 1, !dbg !84
  %exitcond.not = icmp eq i32 %80, 8, !dbg !84
  br i1 %exitcond.not, label %81, label %70, !dbg !84

81:                                               ; preds = %78
  %82 = getelementptr [4 x i8], ptr %67, i32 %69, !dbg !84
  %83 = load <1 x float>, ptr %82, align 4, !dbg !84
  %84 = getelementptr i8, ptr %82, i32 128, !dbg !84
  %85 = load <1 x float>, ptr %84, align 4, !dbg !84
  %86 = getelementptr i8, ptr %82, i32 256, !dbg !84
  %87 = load <1 x float>, ptr %86, align 4, !dbg !84
  %88 = shufflevector <1 x float> %87, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %89 = getelementptr i8, ptr %82, i32 384, !dbg !84
  %90 = load <1 x float>, ptr %89, align 4, !dbg !84
  %91 = shufflevector <1 x float> %90, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %92 = getelementptr i8, ptr %82, i32 512, !dbg !84
  %93 = load <1 x float>, ptr %92, align 4, !dbg !84
  %94 = shufflevector <1 x float> %93, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %95 = getelementptr i8, ptr %82, i32 640, !dbg !84
  %96 = load <1 x float>, ptr %95, align 4, !dbg !84
  %97 = shufflevector <1 x float> %96, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %98 = getelementptr i8, ptr %82, i32 768, !dbg !84
  %99 = load <1 x float>, ptr %98, align 4, !dbg !84
  %100 = shufflevector <1 x float> %99, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %101 = getelementptr i8, ptr %82, i32 896, !dbg !84
  %102 = load <1 x float>, ptr %101, align 4, !dbg !84
  %103 = shufflevector <1 x float> %102, <1 x float> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %104 = shufflevector <1 x float> %83, <1 x float> %85, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %105 = shufflevector <8 x float> %104, <8 x float> %88, <8 x i32> <i32 0, i32 1, i32 8, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %106 = shufflevector <8 x float> %105, <8 x float> %91, <8 x i32> <i32 0, i32 1, i32 2, i32 8, i32 poison, i32 poison, i32 poison, i32 poison>
  %107 = shufflevector <8 x float> %106, <8 x float> %94, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 poison, i32 poison, i32 poison>
  %108 = shufflevector <8 x float> %107, <8 x float> %97, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 8, i32 poison, i32 poison>
  %109 = shufflevector <8 x float> %108, <8 x float> %100, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 poison>
  %110 = shufflevector <8 x float> %109, <8 x float> %103, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 8>
  %111 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> zeroinitializer
  %112 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %111, <8 x float> %110, <8 x float> %.pn64109)
  %113 = select <8 x i1> %45, <8 x float> %112, <8 x float> %.pn64109
  %114 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %115 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %114, <8 x float> %110, <8 x float> %.pn62110)
  %116 = select <8 x i1> %47, <8 x float> %115, <8 x float> %.pn62110
  %117 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %118 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %117, <8 x float> %110, <8 x float> %.pn60111)
  %119 = select <8 x i1> %49, <8 x float> %118, <8 x float> %.pn60111
  %120 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %121 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %120, <8 x float> %110, <8 x float> %.pn58112)
  %122 = select <8 x i1> %51, <8 x float> %121, <8 x float> %.pn58112
  %123 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4>
  %124 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %123, <8 x float> %110, <8 x float> %.pn56113)
  %125 = select <8 x i1> %53, <8 x float> %124, <8 x float> %.pn56113
  %126 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5>
  %127 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %126, <8 x float> %110, <8 x float> %.pn54114)
  %128 = select <8 x i1> %55, <8 x float> %127, <8 x float> %.pn54114
  %129 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6, i32 6>
  %130 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %129, <8 x float> %110, <8 x float> %.pn52115)
  %131 = select <8 x i1> %57, <8 x float> %130, <8 x float> %.pn52115
  %132 = shufflevector <8 x float> %79, <8 x float> poison, <8 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  %133 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %132, <8 x float> %110, <8 x float> %.pn50116)
  %134 = select <8 x i1> %59, <8 x float> %133, <8 x float> %.pn50116
  %135 = add nuw nsw i32 %69, 1, !dbg !84
  %exitcond126.not = icmp eq i32 %135, 32, !dbg !84
  br i1 %exitcond126.not, label %.preheader107, label %68, !dbg !84, !llvm.loop !91

.preheader105:                                    ; preds = %.preheader107, %145
  %136 = phi i32 [ %146, %145 ], [ 0, %.preheader107 ]
  %137 = shl nuw nsw i32 %136, 3
  br label %138

138:                                              ; preds = %.preheader105, %138
  %139 = phi i32 [ 0, %.preheader105 ], [ %144, %138 ]
  %140 = add nuw nsw i32 %139, %137
  %141 = getelementptr inbounds nuw [4 x i8], ptr %6, i32 %140
  %142 = load float, ptr %141, align 4
  %143 = getelementptr inbounds nuw [4 x i8], ptr %5, i32 %140
  store float %142, ptr %143, align 4
  %144 = add nuw nsw i32 %139, 1
  %exitcond127.not = icmp eq i32 %144, 8
  br i1 %exitcond127.not, label %145, label %138

145:                                              ; preds = %138
  %146 = add nuw nsw i32 %136, 1
  %exitcond128.not = icmp eq i32 %146, %41
  br i1 %exitcond128.not, label %._crit_edge, label %.preheader105

._crit_edge:                                      ; preds = %145
  call void @llvm.masked.store.v8f32.p0(<8 x float> %113, ptr nonnull align 64 %5, <8 x i1> %45)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %116, ptr nonnull align 32 %24, <8 x i1> %47)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %119, ptr nonnull align 64 %25, <8 x i1> %49)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %122, ptr nonnull align 32 %26, <8 x i1> %51)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %125, ptr nonnull align 64 %27, <8 x i1> %53)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %128, ptr nonnull align 32 %28, <8 x i1> %55)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %131, ptr nonnull align 64 %29, <8 x i1> %57)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %134, ptr nonnull align 32 %30, <8 x i1> %59)
  br label %.preheader104, !dbg !84

.preheader104:                                    ; preds = %._crit_edge, %156
  %147 = phi i32 [ %157, %156 ], [ 0, %._crit_edge ]
  %148 = shl nuw nsw i32 %147, 3
  br label %149, !dbg !84

149:                                              ; preds = %.preheader104, %149
  %150 = phi i32 [ 0, %.preheader104 ], [ %155, %149 ]
  %151 = add nuw nsw i32 %150, %148, !dbg !84
  %152 = getelementptr inbounds nuw [4 x i8], ptr %6, i32 %151, !dbg !84
  %153 = load float, ptr %152, align 4, !dbg !84
  %154 = getelementptr inbounds nuw [4 x i8], ptr %4, i32 %151, !dbg !84
  store float %153, ptr %154, align 4, !dbg !84
  %155 = add nuw nsw i32 %150, 1, !dbg !84
  %exitcond129.not = icmp eq i32 %155, 8, !dbg !84
  br i1 %exitcond129.not, label %156, label %149, !dbg !84

156:                                              ; preds = %149
  %157 = add nuw nsw i32 %147, 1, !dbg !84
  %exitcond132.not = icmp eq i32 %157, %41, !dbg !84
  br i1 %exitcond132.not, label %.preheader, label %.preheader104, !dbg !84

.preheader:                                       ; preds = %156, %167
  %158 = phi i32 [ %168, %167 ], [ 0, %156 ]
  %159 = shl nuw nsw i32 %158, 3
  br label %160, !dbg !84

160:                                              ; preds = %.preheader, %160
  %161 = phi i32 [ 0, %.preheader ], [ %166, %160 ]
  %162 = add nuw nsw i32 %161, %159, !dbg !84
  %163 = getelementptr inbounds nuw [4 x i8], ptr %5, i32 %162, !dbg !84
  %164 = load float, ptr %163, align 4, !dbg !84
  %165 = getelementptr inbounds nuw [4 x i8], ptr %4, i32 %162, !dbg !84
  store float %164, ptr %165, align 4, !dbg !84
  %166 = add nuw nsw i32 %161, 1, !dbg !84
  %exitcond133.not = icmp eq i32 %166, 8, !dbg !84
  br i1 %exitcond133.not, label %167, label %160, !dbg !84

167:                                              ; preds = %160
  %168 = add nuw nsw i32 %158, 1, !dbg !84
  %exitcond136.not = icmp eq i32 %168, %41, !dbg !84
  br i1 %exitcond136.not, label %._crit_edge117, label %.preheader, !dbg !84

._crit_edge117.critedge:                          ; preds = %.preheader107
  call void @llvm.masked.store.v8f32.p0(<8 x float> %113, ptr nonnull align 64 %5, <8 x i1> %45)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %116, ptr nonnull align 32 %24, <8 x i1> %47)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %119, ptr nonnull align 64 %25, <8 x i1> %49)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %122, ptr nonnull align 32 %26, <8 x i1> %51)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %125, ptr nonnull align 64 %27, <8 x i1> %53)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %128, ptr nonnull align 32 %28, <8 x i1> %55)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %131, ptr nonnull align 64 %29, <8 x i1> %57)
  call void @llvm.masked.store.v8f32.p0(<8 x float> %134, ptr nonnull align 32 %30, <8 x i1> %59)
  br label %._crit_edge117, !dbg !84

._crit_edge117:                                   ; preds = %167, %._crit_edge117.critedge
  %unmaskedload65 = load <8 x float>, ptr %4, align 64, !dbg !93
  %unmaskedload66 = load <8 x float>, ptr %31, align 32, !dbg !93
  %unmaskedload67 = load <8 x float>, ptr %32, align 64, !dbg !93
  %unmaskedload68 = load <8 x float>, ptr %33, align 32, !dbg !93
  %unmaskedload69 = load <8 x float>, ptr %34, align 64, !dbg !93
  %unmaskedload70 = load <8 x float>, ptr %35, align 32, !dbg !93
  %unmaskedload71 = load <8 x float>, ptr %36, align 64, !dbg !93
  %unmaskedload72 = load <8 x float>, ptr %37, align 32, !dbg !93
  %169 = getelementptr [4 x i8], ptr %9, i32 %66, !dbg !93
  %170 = load <8 x float>, ptr %169, align 32, !dbg !93
  %171 = fadd contract <8 x float> %unmaskedload65, %170, !dbg !94
  %172 = fadd contract <8 x float> %unmaskedload66, %170, !dbg !94
  %173 = fadd contract <8 x float> %unmaskedload67, %170, !dbg !94
  %174 = fadd contract <8 x float> %unmaskedload68, %170, !dbg !94
  %175 = fadd contract <8 x float> %unmaskedload69, %170, !dbg !94
  %176 = fadd contract <8 x float> %unmaskedload70, %170, !dbg !94
  %177 = fadd contract <8 x float> %unmaskedload71, %170, !dbg !94
  %178 = fadd contract <8 x float> %unmaskedload72, %170, !dbg !94
  %179 = fmul contract <8 x float> %171, %171, !dbg !95
  %180 = fmul contract <8 x float> %172, %172, !dbg !95
  %181 = fmul contract <8 x float> %173, %173, !dbg !95
  %182 = fmul contract <8 x float> %174, %174, !dbg !95
  %183 = fmul contract <8 x float> %175, %175, !dbg !95
  %184 = fmul contract <8 x float> %176, %176, !dbg !95
  %185 = fmul contract <8 x float> %177, %177, !dbg !95
  %186 = fmul contract <8 x float> %178, %178, !dbg !95
  %187 = fmul contract <8 x float> %171, %179, !dbg !95
  %188 = fmul contract <8 x float> %172, %180, !dbg !95
  %189 = fmul contract <8 x float> %173, %181, !dbg !95
  %190 = fmul contract <8 x float> %174, %182, !dbg !95
  %191 = fmul contract <8 x float> %175, %183, !dbg !95
  %192 = fmul contract <8 x float> %176, %184, !dbg !95
  %193 = fmul contract <8 x float> %177, %185, !dbg !95
  %194 = fmul contract <8 x float> %178, %186, !dbg !95
  %195 = fmul contract <8 x float> %187, splat (float 0x3FA6E4E260000000), !dbg !96
  %196 = fmul contract <8 x float> %188, splat (float 0x3FA6E4E260000000), !dbg !96
  %197 = fmul contract <8 x float> %189, splat (float 0x3FA6E4E260000000), !dbg !96
  %198 = fmul contract <8 x float> %190, splat (float 0x3FA6E4E260000000), !dbg !96
  %199 = fmul contract <8 x float> %191, splat (float 0x3FA6E4E260000000), !dbg !96
  %200 = fmul contract <8 x float> %192, splat (float 0x3FA6E4E260000000), !dbg !96
  %201 = fmul contract <8 x float> %193, splat (float 0x3FA6E4E260000000), !dbg !96
  %202 = fmul contract <8 x float> %194, splat (float 0x3FA6E4E260000000), !dbg !96
  %203 = fadd contract <8 x float> %171, %195, !dbg !97
  %204 = fadd contract <8 x float> %172, %196, !dbg !97
  %205 = fadd contract <8 x float> %173, %197, !dbg !97
  %206 = fadd contract <8 x float> %174, %198, !dbg !97
  %207 = fadd contract <8 x float> %175, %199, !dbg !97
  %208 = fadd contract <8 x float> %176, %200, !dbg !97
  %209 = fadd contract <8 x float> %177, %201, !dbg !97
  %210 = fadd contract <8 x float> %178, %202, !dbg !97
  %211 = fmul contract <8 x float> %203, splat (float 0x3FE9884520000000), !dbg !98
  %212 = fmul contract <8 x float> %204, splat (float 0x3FE9884520000000), !dbg !98
  %213 = fmul contract <8 x float> %205, splat (float 0x3FE9884520000000), !dbg !98
  %214 = fmul contract <8 x float> %206, splat (float 0x3FE9884520000000), !dbg !98
  %215 = fmul contract <8 x float> %207, splat (float 0x3FE9884520000000), !dbg !98
  %216 = fmul contract <8 x float> %208, splat (float 0x3FE9884520000000), !dbg !98
  %217 = fmul contract <8 x float> %209, splat (float 0x3FE9884520000000), !dbg !98
  %218 = fmul contract <8 x float> %210, splat (float 0x3FE9884520000000), !dbg !98
  %.inv = fcmp oge <8 x float> %211, splat (float 0x401FFEC880000000), !dbg !99
  %219 = select <8 x i1> %.inv, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %211, !dbg !99
  %.inv73 = fcmp oge <8 x float> %212, splat (float 0x401FFEC880000000), !dbg !99
  %220 = select <8 x i1> %.inv73, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %212, !dbg !99
  %.inv74 = fcmp oge <8 x float> %213, splat (float 0x401FFEC880000000), !dbg !99
  %221 = select <8 x i1> %.inv74, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %213, !dbg !99
  %.inv75 = fcmp oge <8 x float> %214, splat (float 0x401FFEC880000000), !dbg !99
  %222 = select <8 x i1> %.inv75, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %214, !dbg !99
  %.inv76 = fcmp oge <8 x float> %215, splat (float 0x401FFEC880000000), !dbg !99
  %223 = select <8 x i1> %.inv76, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %215, !dbg !99
  %.inv77 = fcmp oge <8 x float> %216, splat (float 0x401FFEC880000000), !dbg !99
  %224 = select <8 x i1> %.inv77, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %216, !dbg !99
  %.inv78 = fcmp oge <8 x float> %217, splat (float 0x401FFEC880000000), !dbg !99
  %225 = select <8 x i1> %.inv78, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %217, !dbg !99
  %.inv79 = fcmp oge <8 x float> %218, splat (float 0x401FFEC880000000), !dbg !99
  %226 = select <8 x i1> %.inv79, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %218, !dbg !99
  %.inv80 = fcmp ole <8 x float> %219, splat (float 0xC01FFEC880000000), !dbg !99
  %227 = select <8 x i1> %.inv80, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %219, !dbg !99
  %.inv81 = fcmp ole <8 x float> %220, splat (float 0xC01FFEC880000000), !dbg !99
  %228 = select <8 x i1> %.inv81, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %220, !dbg !99
  %.inv82 = fcmp ole <8 x float> %221, splat (float 0xC01FFEC880000000), !dbg !99
  %229 = select <8 x i1> %.inv82, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %221, !dbg !99
  %.inv83 = fcmp ole <8 x float> %222, splat (float 0xC01FFEC880000000), !dbg !99
  %230 = select <8 x i1> %.inv83, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %222, !dbg !99
  %.inv84 = fcmp ole <8 x float> %223, splat (float 0xC01FFEC880000000), !dbg !99
  %231 = select <8 x i1> %.inv84, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %223, !dbg !99
  %.inv85 = fcmp ole <8 x float> %224, splat (float 0xC01FFEC880000000), !dbg !99
  %232 = select <8 x i1> %.inv85, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %224, !dbg !99
  %.inv86 = fcmp ole <8 x float> %225, splat (float 0xC01FFEC880000000), !dbg !99
  %233 = select <8 x i1> %.inv86, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %225, !dbg !99
  %.inv87 = fcmp ole <8 x float> %226, splat (float 0xC01FFEC880000000), !dbg !99
  %234 = select <8 x i1> %.inv87, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %226, !dbg !99
  %235 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %211), !dbg !99
  %236 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %212), !dbg !99
  %237 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %213), !dbg !99
  %238 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %214), !dbg !99
  %239 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %215), !dbg !99
  %240 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %216), !dbg !99
  %241 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %217), !dbg !99
  %242 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %218), !dbg !99
  %243 = fcmp olt <8 x float> %235, splat (float 0x3F3A36E2E0000000), !dbg !99
  %244 = fcmp olt <8 x float> %236, splat (float 0x3F3A36E2E0000000), !dbg !99
  %245 = fcmp olt <8 x float> %237, splat (float 0x3F3A36E2E0000000), !dbg !99
  %246 = fcmp olt <8 x float> %238, splat (float 0x3F3A36E2E0000000), !dbg !99
  %247 = fcmp olt <8 x float> %239, splat (float 0x3F3A36E2E0000000), !dbg !99
  %248 = fcmp olt <8 x float> %240, splat (float 0x3F3A36E2E0000000), !dbg !99
  %249 = fcmp olt <8 x float> %241, splat (float 0x3F3A36E2E0000000), !dbg !99
  %250 = fcmp olt <8 x float> %242, splat (float 0x3F3A36E2E0000000), !dbg !99
  %251 = fmul contract <8 x float> %227, %227, !dbg !99
  %252 = fmul contract <8 x float> %228, %228, !dbg !99
  %253 = fmul contract <8 x float> %229, %229, !dbg !99
  %254 = fmul contract <8 x float> %230, %230, !dbg !99
  %255 = fmul contract <8 x float> %231, %231, !dbg !99
  %256 = fmul contract <8 x float> %232, %232, !dbg !99
  %257 = fmul contract <8 x float> %233, %233, !dbg !99
  %258 = fmul contract <8 x float> %234, %234, !dbg !99
  %259 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %260 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %261 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %262 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %263 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %264 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %265 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %266 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !99
  %267 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %259, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %268 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %260, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %269 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %261, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %270 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %262, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %271 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %263, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %272 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %264, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %273 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %265, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %274 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %266, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !99
  %275 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %267, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %276 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %268, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %277 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %269, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %278 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %270, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %279 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %271, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %280 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %272, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %281 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %273, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %282 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %274, <8 x float> splat (float 0x3E6B800820000000)), !dbg !99
  %283 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %275, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %284 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %276, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %285 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %277, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %286 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %278, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %287 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %279, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %288 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %280, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %289 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %281, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %290 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %282, <8 x float> splat (float 0x3EEF286940000000)), !dbg !99
  %291 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %283, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %292 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %284, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %293 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %285, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %294 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %286, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %295 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %287, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %296 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %288, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %297 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %289, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %298 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %290, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !99
  %299 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %291, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %300 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %292, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %301 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %293, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %302 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %294, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %303 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %295, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %304 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %296, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %305 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %297, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %306 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %298, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !99
  %307 = fmul contract <8 x float> %227, %299, !dbg !99
  %308 = fmul contract <8 x float> %228, %300, !dbg !99
  %309 = fmul contract <8 x float> %229, %301, !dbg !99
  %310 = fmul contract <8 x float> %230, %302, !dbg !99
  %311 = fmul contract <8 x float> %231, %303, !dbg !99
  %312 = fmul contract <8 x float> %232, %304, !dbg !99
  %313 = fmul contract <8 x float> %233, %305, !dbg !99
  %314 = fmul contract <8 x float> %234, %306, !dbg !99
  %315 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %316 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %317 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %318 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %319 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %320 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %321 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %322 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !99
  %323 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %315, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %324 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %316, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %325 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %317, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %326 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %318, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %327 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %319, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %328 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %320, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %329 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %321, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %330 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %322, <8 x float> splat (float 0x3F629540A0000000)), !dbg !99
  %331 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %251, <8 x float> %323, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %332 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %252, <8 x float> %324, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %333 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %325, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %334 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %254, <8 x float> %326, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %335 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %255, <8 x float> %327, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %336 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %328, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %337 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %257, <8 x float> %329, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %338 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %258, <8 x float> %330, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !99
  %339 = fdiv <8 x float> %307, %331, !dbg !99
  %340 = fdiv <8 x float> %308, %332, !dbg !99
  %341 = fdiv <8 x float> %309, %333, !dbg !99
  %342 = fdiv <8 x float> %310, %334, !dbg !99
  %343 = fdiv <8 x float> %311, %335, !dbg !99
  %344 = fdiv <8 x float> %312, %336, !dbg !99
  %345 = fdiv <8 x float> %313, %337, !dbg !99
  %346 = fdiv <8 x float> %314, %338, !dbg !99
  %347 = select <8 x i1> %243, <8 x float> %227, <8 x float> %339, !dbg !99
  %348 = select <8 x i1> %244, <8 x float> %228, <8 x float> %340, !dbg !99
  %349 = select <8 x i1> %245, <8 x float> %229, <8 x float> %341, !dbg !99
  %350 = select <8 x i1> %246, <8 x float> %230, <8 x float> %342, !dbg !99
  %351 = select <8 x i1> %247, <8 x float> %231, <8 x float> %343, !dbg !99
  %352 = select <8 x i1> %248, <8 x float> %232, <8 x float> %344, !dbg !99
  %353 = select <8 x i1> %249, <8 x float> %233, <8 x float> %345, !dbg !99
  %354 = select <8 x i1> %250, <8 x float> %234, <8 x float> %346, !dbg !99
  %355 = fadd contract <8 x float> %347, splat (float 1.000000e+00), !dbg !100
  %356 = fadd contract <8 x float> %348, splat (float 1.000000e+00), !dbg !100
  %357 = fadd contract <8 x float> %349, splat (float 1.000000e+00), !dbg !100
  %358 = fadd contract <8 x float> %350, splat (float 1.000000e+00), !dbg !100
  %359 = fadd contract <8 x float> %351, splat (float 1.000000e+00), !dbg !100
  %360 = fadd contract <8 x float> %352, splat (float 1.000000e+00), !dbg !100
  %361 = fadd contract <8 x float> %353, splat (float 1.000000e+00), !dbg !100
  %362 = fadd contract <8 x float> %354, splat (float 1.000000e+00), !dbg !100
  %363 = fmul contract <8 x float> %171, splat (float 5.000000e-01), !dbg !101
  %364 = fmul contract <8 x float> %172, splat (float 5.000000e-01), !dbg !101
  %365 = fmul contract <8 x float> %173, splat (float 5.000000e-01), !dbg !101
  %366 = fmul contract <8 x float> %174, splat (float 5.000000e-01), !dbg !101
  %367 = fmul contract <8 x float> %175, splat (float 5.000000e-01), !dbg !101
  %368 = fmul contract <8 x float> %176, splat (float 5.000000e-01), !dbg !101
  %369 = fmul contract <8 x float> %177, splat (float 5.000000e-01), !dbg !101
  %370 = fmul contract <8 x float> %178, splat (float 5.000000e-01), !dbg !101
  %371 = fmul contract <8 x float> %363, %355, !dbg !102
  %372 = fmul contract <8 x float> %364, %356, !dbg !102
  %373 = fmul contract <8 x float> %365, %357, !dbg !102
  %374 = fmul contract <8 x float> %366, %358, !dbg !102
  %375 = fmul contract <8 x float> %367, %359, !dbg !102
  %376 = fmul contract <8 x float> %368, %360, !dbg !102
  %377 = fmul contract <8 x float> %369, %361, !dbg !102
  %378 = fmul contract <8 x float> %370, %362, !dbg !102
  %379 = getelementptr [4 x i8], ptr %64, i32 %66, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %371, ptr align 32 %379, <8 x i1> %45), !dbg !102
  %380 = getelementptr i8, ptr %379, i32 256, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %372, ptr align 32 %380, <8 x i1> %47), !dbg !102
  %381 = getelementptr i8, ptr %379, i32 512, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %373, ptr align 32 %381, <8 x i1> %49), !dbg !102
  %382 = getelementptr i8, ptr %379, i32 768, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %374, ptr align 32 %382, <8 x i1> %51), !dbg !102
  %383 = getelementptr i8, ptr %379, i32 1024, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %375, ptr align 32 %383, <8 x i1> %53), !dbg !102
  %384 = getelementptr i8, ptr %379, i32 1280, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %376, ptr align 32 %384, <8 x i1> %55), !dbg !102
  %385 = getelementptr i8, ptr %379, i32 1536, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %377, ptr align 32 %385, <8 x i1> %57), !dbg !102
  %386 = getelementptr i8, ptr %379, i32 1792, !dbg !102
  tail call void @llvm.masked.store.v8f32.p0(<8 x float> %378, ptr align 32 %386, <8 x i1> %59), !dbg !102
  %387 = add nuw nsw i32 %66, 8, !dbg !84
  %388 = icmp samesign ult i32 %66, 56, !dbg !84
  br i1 %388, label %65, label %389, !dbg !84, !llvm.loop !91

389:                                              ; preds = %._crit_edge117
  %390 = add nuw nsw i32 %39, 8, !dbg !84
  %391 = icmp slt i32 %390, %15, !dbg !84
  %indvars.iv.next = add i32 %indvars.iv, -8, !dbg !84
  br i1 %391, label %38, label %.loopexit, !dbg !84, !llvm.loop !91

.loopexit:                                        ; preds = %389, %3
  ret i32 0, !dbg !103
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v8f32.p0(<8 x float>, ptr captures(none), <8 x i1>) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fmuladd.v8f32(<8 x float>, <8 x float>, <8 x float>) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr readnone captures(none) %1) local_unnamed_addr #4 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #5 {
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
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #5 {
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
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #5 {
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
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #5 {
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
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #5 {
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
  %29 = add nsw i32 %25, %28
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
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #5 {
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
  %30 = add nsw i32 %26, %29
  br label %31

31:                                               ; preds = %18, %16, %13, %8, %1
  %32 = phi i32 [ 31744, %8 ], [ %4, %1 ], [ %30, %18 ], [ 31744, %13 ], [ 0, %16 ]
  %33 = or i32 %32, %7
  %34 = trunc i32 %33 to i16
  br label %35

35:                                               ; preds = %10, %31
  %36 = phi i16 [ %12, %10 ], [ %34, %31 ]
  store i16 %36, ptr %2, align 4, !tbaa !104
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #5 {
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
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #5 {
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
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #5 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #7

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #8 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x4600000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x3A00000000000000, float 0xBA00000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x3A00000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #9 {
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

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @expf(float noundef %0) local_unnamed_addr #9 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 20
  %6 = and i32 %5, 2047
  %.not = icmp samesign ult i32 %6, 1067
  br i1 %.not, label %20, label %7, !prof !108

7:                                                ; preds = %1
  %8 = fcmp oeq float %0, 0xFFF0000000000000
  br i1 %8, label %20, label %9

9:                                                ; preds = %7
  %.not34 = icmp samesign ult i32 %6, 2040
  br i1 %.not34, label %12, label %10

10:                                               ; preds = %9
  %11 = fadd float %0, %0
  br label %20

12:                                               ; preds = %9
  %13 = fcmp ogt float %0, 0x40562E42E0000000
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float 0x4600000000000000, ptr %3, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %15 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, 0x4600000000000000
  br label %20

16:                                               ; preds = %12
  %17 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %17, label %18, label %20

18:                                               ; preds = %16
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float 0x3A00000000000000, ptr %2, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %19 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3, 0x3A00000000000000
  br label %20

20:                                               ; preds = %18, %16, %14, %10, %7, %1
  %.0 = phi float [ %11, %10 ], [ %15, %14 ], [ %19, %18 ], [ 0.000000e+00, %7 ], [ undef, %16 ], [ undef, %1 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #8 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #9 {
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

; Function Attrs: inlinehint mustprogress nofree norecurse noreturn nosync nounwind willreturn memory(none)
define internal noundef float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #10 {
  unreachable
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(none)
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #11 {
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

.lr.ph:                                           ; preds = %26, %.lr.ph
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

.lr.ph90:                                         ; preds = %38, %.lr.ph90
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

.lr.ph96:                                         ; preds = %49, %57
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

.lr.ph103:                                        ; preds = %67, %.lr.ph103
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

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #7

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #12 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #14
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

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #8 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, 0x47E0000000000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %scalbnf.exit

8:                                                ; preds = %4
  %9 = fmul float %5, 0x47E0000000000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select.i = add nsw i32 %10, -254
  br label %scalbnf.exit

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %scalbnf.exit

13:                                               ; preds = %11
  %14 = fmul float %0, 0x3990000000000000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %scalbnf.exit

17:                                               ; preds = %13
  %18 = fmul float %14, 0x3990000000000000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1.i = add nuw nsw i32 %19, 204
  br label %scalbnf.exit

scalbnf.exit:                                     ; preds = %4, %8, %11, %13, %17
  %.018.i = phi i32 [ %spec.store.select.i, %8 ], [ %6, %4 ], [ %spec.store.select1.i, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0.i = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %20 = shl nsw i32 %.018.i, 23
  %21 = add nsw i32 %20, 1065353216
  %22 = bitcast i32 %21 to float
  %23 = fmul float %.0.i, %22
  ret float %23
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #8 {
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

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #7

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #7

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = bitcast float %1 to i32
  %6 = add i32 %4, -2139095040
  %7 = icmp ult i32 %6, -2130706432
  %.pre = shl i32 %5, 1
  br i1 %7, label %.critedge, label %.critedge.thread, !prof !109

.critedge.thread:                                 ; preds = %2
  %8 = icmp slt i32 %.pre, 1
  tail call void @llvm.assume(i1 %8)
  br label %11

.critedge:                                        ; preds = %2
  %9 = add i32 %.pre, -1
  %10 = icmp ult i32 %9, -16777217
  br i1 %10, label %27, label %11, !prof !110

11:                                               ; preds = %.critedge.thread, %.critedge
  %12 = icmp eq i32 %.pre, 0
  %13 = icmp eq i32 %4, 1065353216
  %or.cond69 = or i1 %13, %12
  br i1 %or.cond69, label %57, label %14

14:                                               ; preds = %11
  %15 = shl i32 %4, 1
  %16 = icmp ugt i32 %15, -16777216
  %17 = icmp samesign ugt i32 %.pre, -16777216
  %or.cond = or i1 %16, %17
  br i1 %or.cond, label %18, label %20

18:                                               ; preds = %14
  %19 = fadd float %0, %1
  br label %57

20:                                               ; preds = %14
  %21 = icmp eq i32 %15, 2130706432
  br i1 %21, label %57, label %22

22:                                               ; preds = %20
  %23 = icmp ult i32 %15, 2130706432
  %24 = icmp slt i32 %5, 0
  %25 = xor i1 %23, %24
  %26 = fmul float %1, %1
  %spec.select70 = select i1 %25, float 0.000000e+00, float %26
  br label %57

27:                                               ; preds = %.critedge
  %28 = shl i32 %4, 1
  %29 = add i32 %28, -1
  %30 = icmp ult i32 %29, -16777217
  br i1 %30, label %46, label %31, !prof !108

31:                                               ; preds = %27
  %32 = fmul float %0, %0
  %.not66 = icmp sgt i32 %4, -1
  br i1 %.not66, label %checkint.exit.thread, label %33

33:                                               ; preds = %31
  %34 = lshr i32 %5, 23
  %35 = and i32 %34, 255
  %36 = add nsw i32 %35, -151
  %or.cond85 = icmp ult i32 %36, -24
  br i1 %or.cond85, label %checkint.exit.thread, label %37

37:                                               ; preds = %33
  %38 = sub nuw nsw i32 150, %35
  %39 = shl nuw nsw i32 1, %38
  %40 = add nsw i32 %39, -1
  %41 = and i32 %40, %5
  %.not.i = icmp ne i32 %41, 0
  %42 = and i32 %39, %5
  %.not9.i = icmp eq i32 %42, 0
  %or.cond86 = or i1 %.not9.i, %.not.i
  %43 = fneg float %32
  %spec.select = select i1 %or.cond86, float %32, float %43
  br label %checkint.exit.thread

checkint.exit.thread:                             ; preds = %37, %33, %31
  %.057 = phi float [ %32, %31 ], [ %32, %33 ], [ %spec.select, %37 ]
  %.not67 = icmp sgt i32 %5, -1
  br i1 %.not67, label %57, label %44

44:                                               ; preds = %checkint.exit.thread
  %45 = fdiv float 1.000000e+00, %.057
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %45, ptr %3, align 4, !tbaa !106
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !106
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  br label %57

46:                                               ; preds = %27
  %.not64 = icmp slt i32 %4, 0
  tail call void @llvm.assume(i1 %.not64)
  %47 = lshr i32 %5, 23
  %48 = and i32 %47, 255
  %49 = icmp samesign ult i32 %48, 127
  br i1 %49, label %.thread, label %50

50:                                               ; preds = %46
  %51 = icmp samesign ult i32 %48, 151
  tail call void @llvm.assume(i1 %51)
  %52 = sub nuw nsw i32 150, %48
  %notmask = shl nsw i32 -1, %52
  %53 = xor i32 %notmask, -1
  %54 = and i32 %53, %5
  %.not.i71 = icmp ne i32 %54, 0
  tail call void @llvm.assume(i1 %.not.i71)
  br label %.thread

.thread:                                          ; preds = %50, %46
  %55 = fsub float %0, %0
  %56 = fdiv float %55, %55
  br label %57

57:                                               ; preds = %.thread, %44, %checkint.exit.thread, %22, %20, %18, %11
  %.0 = phi float [ %19, %18 ], [ 1.000000e+00, %11 ], [ 1.000000e+00, %20 ], [ %.0..0..0..0..0..0..0..0..0..0..i, %44 ], [ %.057, %checkint.exit.thread ], [ %spec.select70, %22 ], [ %56, %.thread ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #8 {
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

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @roundf(float noundef %0) local_unnamed_addr #9 {
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #13

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "nonlazybind" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #9 = { inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite) }
attributes #10 = { inlinehint mustprogress nofree norecurse noreturn nosync nounwind willreturn memory(none) }
attributes #11 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #12 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { inlinehint }

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
!110 = !{!"branch_weights", !"expected", i32 -2147483648, i32 0}
