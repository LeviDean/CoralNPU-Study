#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d2, d4, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map2 = affine_map<(d0, d1) -> (d1, d0)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0) -> (d0)>
#map5 = affine_map<(d0, d1) -> ()>
#map6 = affine_map<(d0) -> ()>
#map7 = affine_map<(d0, d1) -> (d1)>
#map8 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map9 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map10 = affine_map<(d0, d1, d2) -> ()>
#map11 = affine_map<(d0, d1, d2) -> (d0, d1, 0)>
#map12 = affine_map<(d0, d1, d2) -> (d2)>
#map13 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d0, d2, d4)>
#map14 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#map15 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3, d2)>
#map16 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map17 = affine_map<(d0, d1, d2, d3) -> ()>
#map18 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map19 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, 0)>
#map20 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
#map21 = affine_map<(d0, d1) -> (d0)>
#map22 = affine_map<(d0, d1) -> (d0, 0)>
module {
  func.func @main(%arg0: tensor<1x32x32x3xf32>) -> tensor<1x10xf32> {
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 4.000000e+00 : f32
    %cst_2 = arith.constant 2.000000e+00 : f32
    %cst_3 = arith.constant 3.200000e+01 : f32
    %c1 = arith.constant 1 : index
    %cst_4 = arith.constant 1.000000e+00 : f32
    %cst_5 = arith.constant 0.79788456080286541 : f64
    %cst_6 = arith.constant 4.471500e-02 : f64
    %cst_7 = arith.constant 0xFF800000 : f32
    %cst_8 = arith.constant 9.9999999999999995E-7 : f64
    %cst_9 = arith.constant 0.000000e+00 : f32
    %cst_10 = arith.constant dense_resource<torch_tensor_10_32_torch.float32> : tensor<10x32xf32>
    %cst_11 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
    %cst_12 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
    %cst_13 = arith.constant dense_resource<torch_tensor_32_torch.float32_10> : tensor<32xf32>
    %cst_14 = arith.constant dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
    %cst_15 = arith.constant dense_resource<torch_tensor_64_torch.float32_1> : tensor<64xf32>
    %cst_16 = arith.constant dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
    %cst_17 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
    %cst_18 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
    %cst_19 = arith.constant dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
    %cst_20 = arith.constant dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
    %cst_21 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
    %cst_22 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
    %cst_23 = arith.constant dense_resource<torch_tensor_32_torch.float32_5> : tensor<32xf32>
    %cst_24 = arith.constant dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
    %cst_25 = arith.constant dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>
    %cst_26 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %cst_27 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
    %cst_28 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
    %cst_29 = arith.constant dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
    %cst_30 = arith.constant dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
    %cst_31 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
    %cst_32 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
    %cst_33 = arith.constant dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
    %cst_34 = arith.constant dense_resource<torch_tensor_32_torch.float32> : tensor<32xf32>
    %cst_35 = arith.constant dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
    %cst_36 = arith.constant dense_resource<torch_tensor_1_1_32_torch.float32> : tensor<1x1x32xf32>
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2], [3, 4], [5]] output_shape [1, 4, 8, 4, 8, 3] : tensor<1x32x32x3xf32> into tensor<1x4x8x4x8x3xf32>
    %0 = tensor.empty() : tensor<1x4x4x8x8x3xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded : tensor<1x4x8x4x8x3xf32>) outs(%0 : tensor<1x4x4x8x8x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x4x4x8x8x3xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1, 2], [3, 4, 5]] : tensor<1x4x4x8x8x3xf32> into tensor<16x192xf32>
    %2 = tensor.empty() : tensor<192x32xf32>
    %3 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_35 : tensor<32x192xf32>) outs(%2 : tensor<192x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<192x32xf32>
    %4 = tensor.empty() : tensor<16x32xf32>
    %5 = linalg.fill ins(%cst_9 : f32) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %6 = linalg.matmul ins(%collapsed, %3 : tensor<16x192xf32>, tensor<192x32xf32>) outs(%5 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %7 = tensor.empty() : tensor<1xf32>
    %8 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%7 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_4 : f32
    } -> tensor<1xf32>
    %collapsed_37 = tensor.collapse_shape %8 [] : tensor<1xf32> into tensor<f32>
    %9 = tensor.empty() : tensor<16x32xf32>
    %10 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%9 : tensor<16x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %11 = tensor.empty() : tensor<16x32xf32>
    %12 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%6, %10 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%11 : tensor<16x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<16x32xf32>
    %13 = tensor.empty() : tensor<32xf32>
    %14 = linalg.generic {indexing_maps = [#map6, #map4], iterator_types = ["parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%13 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32xf32>
    %15 = tensor.empty() : tensor<32xf32>
    %16 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%14, %cst_34 : tensor<32xf32>, tensor<32xf32>) outs(%15 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<32xf32>
    %17 = tensor.empty() : tensor<16x32xf32>
    %18 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%16 : tensor<32xf32>) outs(%17 : tensor<16x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %19 = tensor.empty() : tensor<16x32xf32>
    %20 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%12, %18 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%19 : tensor<16x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<16x32xf32>
    %expanded_38 = tensor.expand_shape %20 [[0, 1], [2]] output_shape [1, 16, 32] : tensor<16x32xf32> into tensor<1x16x32xf32>
    %21 = tensor.empty() : tensor<1x17x32xf32>
    %inserted_slice = tensor.insert_slice %cst_36 into %21[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x1x32xf32> into tensor<1x17x32xf32>
    %inserted_slice_39 = tensor.insert_slice %expanded_38 into %inserted_slice[0, %c1, 0] [1, 16, 32] [1, 1, 1] : tensor<1x16x32xf32> into tensor<1x17x32xf32>
    %22 = tensor.empty() : tensor<1x17x32xf32>
    %23 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%inserted_slice_39, %cst_33 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%22 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %24 = tensor.empty() : tensor<1x17xf32>
    %25 = linalg.fill ins(%cst_9 : f32) outs(%24 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %26 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%23 : tensor<1x17x32xf32>) outs(%25 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_40 = tensor.expand_shape %26 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %27 = tensor.empty() : tensor<1xf32>
    %28 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%27 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_3 : f32
    } -> tensor<1xf32>
    %collapsed_41 = tensor.collapse_shape %28 [] : tensor<1xf32> into tensor<f32>
    %29 = tensor.empty() : tensor<1x17x1xf32>
    %30 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_41 : tensor<f32>) outs(%29 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x1xf32>
    %31 = tensor.empty() : tensor<1x17x1xf32>
    %32 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_40, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%31 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %33 = tensor.empty() : tensor<1x17x32xf32>
    %34 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%32 : tensor<1x17x1xf32>) outs(%33 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %35 = tensor.empty() : tensor<1x17x32xf32>
    %36 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%23, %34 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%35 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %37 = tensor.empty() : tensor<1xf32>
    %38 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%37 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_2 : f32
    } -> tensor<1xf32>
    %collapsed_42 = tensor.collapse_shape %38 [] : tensor<1xf32> into tensor<f32>
    %39 = tensor.empty() : tensor<1x17x32xf32>
    %40 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_42 : tensor<f32>) outs(%39 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %41 = tensor.empty() : tensor<1x17x32xf32>
    %42 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%36, %40 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%41 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %43 = tensor.empty() : tensor<1x17xf32>
    %44 = linalg.fill ins(%cst_9 : f32) outs(%43 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %45 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%42 : tensor<1x17x32xf32>) outs(%44 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_43 = tensor.expand_shape %45 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %46 = tensor.empty() : tensor<1x17x1xf32>
    %47 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_43, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%46 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %48 = tensor.empty() : tensor<1xf32>
    %49 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%48 : tensor<1xf32>) {
    ^bb0(%out: f32):
      %405 = arith.truncf %cst_8 : f64 to f32
      linalg.yield %405 : f32
    } -> tensor<1xf32>
    %collapsed_44 = tensor.collapse_shape %49 [] : tensor<1xf32> into tensor<f32>
    %50 = tensor.empty() : tensor<1x17x1xf32>
    %51 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_44 : tensor<f32>) outs(%50 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x1xf32>
    %52 = tensor.empty() : tensor<1x17x1xf32>
    %53 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%47, %51 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%52 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %54 = tensor.empty() : tensor<1x17x1xf32>
    %55 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%53 : tensor<1x17x1xf32>) outs(%54 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.sqrt %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %56 = tensor.empty() : tensor<1x17x32xf32>
    %57 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%55 : tensor<1x17x1xf32>) outs(%56 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %58 = tensor.empty() : tensor<1x17x32xf32>
    %59 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%36, %57 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%58 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %60 = tensor.empty() : tensor<1x17x32xf32>
    %61 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_32 : tensor<32xf32>) outs(%60 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %62 = tensor.empty() : tensor<1x17x32xf32>
    %63 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%59, %61 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%62 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %64 = tensor.empty() : tensor<1x17x32xf32>
    %65 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_31 : tensor<32xf32>) outs(%64 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %66 = tensor.empty() : tensor<1x17x32xf32>
    %67 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%63, %65 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%66 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %68 = tensor.empty() : tensor<32x96xf32>
    %69 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_30 : tensor<96x32xf32>) outs(%68 : tensor<32x96xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x96xf32>
    %collapsed_45 = tensor.collapse_shape %67 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %70 = tensor.empty() : tensor<17x96xf32>
    %71 = linalg.fill ins(%cst_9 : f32) outs(%70 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %72 = linalg.matmul ins(%collapsed_45, %69 : tensor<17x32xf32>, tensor<32x96xf32>) outs(%71 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_46 = tensor.expand_shape %72 [[0, 1], [2, 3, 4]] output_shape [1, 17, 3, 2, 16] : tensor<17x96xf32> into tensor<1x17x3x2x16xf32>
    %73 = tensor.empty() : tensor<3x1x2x17x16xf32>
    %74 = linalg.generic {indexing_maps = [#map13, #map14], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_46 : tensor<1x17x3x2x16xf32>) outs(%73 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice = tensor.extract_slice %74[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %extracted_slice_47 = tensor.extract_slice %74[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %collapsed_48 = tensor.collapse_shape %extracted_slice_47 [[0], [1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<1x2x17x16xf32>
    %extracted_slice_49 = tensor.extract_slice %74[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %75 = tensor.empty() : tensor<1x2x16x17xf32>
    %76 = linalg.generic {indexing_maps = [#map15, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_48 : tensor<1x2x17x16xf32>) outs(%75 : tensor<1x2x16x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x16x17xf32>
    %collapsed_50 = tensor.collapse_shape %extracted_slice [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %collapsed_51 = tensor.collapse_shape %76 [[0, 1], [2], [3]] : tensor<1x2x16x17xf32> into tensor<2x16x17xf32>
    %77 = tensor.empty() : tensor<2x17x17xf32>
    %78 = linalg.fill ins(%cst_9 : f32) outs(%77 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %79 = linalg.batch_matmul ins(%collapsed_50, %collapsed_51 : tensor<2x17x16xf32>, tensor<2x16x17xf32>) outs(%78 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %expanded_52 = tensor.expand_shape %79 [[0, 1], [2], [3]] output_shape [1, 2, 17, 17] : tensor<2x17x17xf32> into tensor<1x2x17x17xf32>
    %80 = tensor.empty() : tensor<1xf32>
    %81 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%80 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_1 : f32
    } -> tensor<1xf32>
    %collapsed_53 = tensor.collapse_shape %81 [] : tensor<1xf32> into tensor<f32>
    %82 = tensor.empty() : tensor<1x2x17x17xf32>
    %83 = linalg.generic {indexing_maps = [#map17, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_53 : tensor<f32>) outs(%82 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %84 = tensor.empty() : tensor<1x2x17x17xf32>
    %85 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_52, %83 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%84 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %86 = tensor.empty() : tensor<1x2x17xf32>
    %87 = linalg.fill ins(%cst_7 : f32) outs(%86 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %88 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%85 : tensor<1x2x17x17xf32>) outs(%87 : tensor<1x2x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.maximumf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17xf32>
    %expanded_54 = tensor.expand_shape %88 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %89 = tensor.empty() : tensor<1x2x17x17xf32>
    %90 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_54 : tensor<1x2x17x1xf32>) outs(%89 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %91 = tensor.empty() : tensor<1x2x17x17xf32>
    %92 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%85, %90 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%91 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %93 = tensor.empty() : tensor<1x2x17x17xf32>
    %94 = linalg.generic {indexing_maps = [#map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%92 : tensor<1x2x17x17xf32>) outs(%93 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.exp %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %95 = tensor.empty() : tensor<1x2x17xf32>
    %96 = linalg.fill ins(%cst_9 : f32) outs(%95 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %97 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%94 : tensor<1x2x17x17xf32>) outs(%96 : tensor<1x2x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17xf32>
    %expanded_55 = tensor.expand_shape %97 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %98 = tensor.empty() : tensor<1x2x17x17xf32>
    %99 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_55 : tensor<1x2x17x1xf32>) outs(%98 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %100 = tensor.empty() : tensor<1x2x17x17xf32>
    %101 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%94, %99 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%100 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %collapsed_56 = tensor.collapse_shape %101 [[0, 1], [2], [3]] : tensor<1x2x17x17xf32> into tensor<2x17x17xf32>
    %collapsed_57 = tensor.collapse_shape %extracted_slice_49 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %102 = tensor.empty() : tensor<2x17x16xf32>
    %103 = linalg.fill ins(%cst_9 : f32) outs(%102 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %104 = linalg.batch_matmul ins(%collapsed_56, %collapsed_57 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%103 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %expanded_58 = tensor.expand_shape %104 [[0, 1], [2], [3]] output_shape [1, 2, 17, 16] : tensor<2x17x16xf32> into tensor<1x2x17x16xf32>
    %105 = tensor.empty() : tensor<1x17x2x16xf32>
    %106 = linalg.generic {indexing_maps = [#map20, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_58 : tensor<1x2x17x16xf32>) outs(%105 : tensor<1x17x2x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x2x16xf32>
    %107 = tensor.empty() : tensor<32x32xf32>
    %108 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_29 : tensor<32x32xf32>) outs(%107 : tensor<32x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x32xf32>
    %collapsed_59 = tensor.collapse_shape %106 [[0, 1], [2, 3]] : tensor<1x17x2x16xf32> into tensor<17x32xf32>
    %109 = tensor.empty() : tensor<17x32xf32>
    %110 = linalg.fill ins(%cst_9 : f32) outs(%109 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %111 = linalg.matmul ins(%collapsed_59, %108 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%110 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %expanded_60 = tensor.expand_shape %111 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %112 = tensor.empty() : tensor<1x17x32xf32>
    %113 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%23, %expanded_60 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%112 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %114 = tensor.empty() : tensor<1x17xf32>
    %115 = linalg.fill ins(%cst_9 : f32) outs(%114 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %116 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%113 : tensor<1x17x32xf32>) outs(%115 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_61 = tensor.expand_shape %116 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %117 = tensor.empty() : tensor<1x17x1xf32>
    %118 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_61, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%117 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %119 = tensor.empty() : tensor<1x17x32xf32>
    %120 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%118 : tensor<1x17x1xf32>) outs(%119 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %121 = tensor.empty() : tensor<1x17x32xf32>
    %122 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%113, %120 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%121 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %123 = tensor.empty() : tensor<1x17x32xf32>
    %124 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%122, %40 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%123 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %125 = tensor.empty() : tensor<1x17xf32>
    %126 = linalg.fill ins(%cst_9 : f32) outs(%125 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %127 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%124 : tensor<1x17x32xf32>) outs(%126 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_62 = tensor.expand_shape %127 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %128 = tensor.empty() : tensor<1x17x1xf32>
    %129 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_62, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%128 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %130 = tensor.empty() : tensor<1x17x1xf32>
    %131 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%129, %51 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%130 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %132 = tensor.empty() : tensor<1x17x1xf32>
    %133 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%131 : tensor<1x17x1xf32>) outs(%132 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.sqrt %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %134 = tensor.empty() : tensor<1x17x32xf32>
    %135 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%133 : tensor<1x17x1xf32>) outs(%134 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %136 = tensor.empty() : tensor<1x17x32xf32>
    %137 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%122, %135 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%136 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %138 = tensor.empty() : tensor<1x17x32xf32>
    %139 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_28 : tensor<32xf32>) outs(%138 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %140 = tensor.empty() : tensor<1x17x32xf32>
    %141 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%137, %139 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%140 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %142 = tensor.empty() : tensor<1x17x32xf32>
    %143 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_27 : tensor<32xf32>) outs(%142 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %144 = tensor.empty() : tensor<1x17x32xf32>
    %145 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%141, %143 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%144 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %collapsed_63 = tensor.collapse_shape %145 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %146 = tensor.empty() : tensor<32x64xf32>
    %147 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_26 : tensor<64x32xf32>) outs(%146 : tensor<32x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %148 = tensor.empty() : tensor<17x64xf32>
    %149 = linalg.fill ins(%cst_9 : f32) outs(%148 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %150 = linalg.matmul ins(%collapsed_63, %147 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%149 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %151 = tensor.empty() : tensor<17x64xf32>
    %152 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%151 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %153 = tensor.empty() : tensor<17x64xf32>
    %154 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%150, %152 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%153 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x64xf32>
    %155 = tensor.empty() : tensor<64xf32>
    %156 = linalg.generic {indexing_maps = [#map6, #map4], iterator_types = ["parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%155 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64xf32>
    %157 = tensor.empty() : tensor<64xf32>
    %158 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%156, %cst_25 : tensor<64xf32>, tensor<64xf32>) outs(%157 : tensor<64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<64xf32>
    %159 = tensor.empty() : tensor<17x64xf32>
    %160 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%158 : tensor<64xf32>) outs(%159 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %161 = tensor.empty() : tensor<17x64xf32>
    %162 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%154, %160 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%161 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x64xf32>
    %expanded_64 = tensor.expand_shape %162 [[0, 1], [2]] output_shape [1, 17, 64] : tensor<17x64xf32> into tensor<1x17x64xf32>
    %163 = tensor.empty() : tensor<1xf32>
    %164 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%163 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_0 : f32
    } -> tensor<1xf32>
    %collapsed_65 = tensor.collapse_shape %164 [] : tensor<1xf32> into tensor<f32>
    %165 = tensor.empty() : tensor<1x17x64xf32>
    %166 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_65 : tensor<f32>) outs(%165 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %167 = tensor.empty() : tensor<1x17x64xf32>
    %168 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %166 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%167 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %169 = tensor.empty() : tensor<1xf32>
    %170 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%169 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<1xf32>
    %collapsed_66 = tensor.collapse_shape %170 [] : tensor<1xf32> into tensor<f32>
    %171 = tensor.empty() : tensor<1x17x64xf32>
    %172 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_66 : tensor<f32>) outs(%171 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %173 = tensor.empty() : tensor<1x17x64xf32>
    %174 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %172 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%173 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %175 = tensor.empty() : tensor<1xf32>
    %176 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%175 : tensor<1xf32>) {
    ^bb0(%out: f32):
      %405 = arith.truncf %cst_6 : f64 to f32
      linalg.yield %405 : f32
    } -> tensor<1xf32>
    %collapsed_67 = tensor.collapse_shape %176 [] : tensor<1xf32> into tensor<f32>
    %177 = tensor.empty() : tensor<1x17x64xf32>
    %178 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_67 : tensor<f32>) outs(%177 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %179 = tensor.empty() : tensor<1x17x64xf32>
    %180 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%174, %178 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%179 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %181 = tensor.empty() : tensor<1x17x64xf32>
    %182 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %180 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%181 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %183 = tensor.empty() : tensor<1xf32>
    %184 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%183 : tensor<1xf32>) {
    ^bb0(%out: f32):
      %405 = arith.truncf %cst_5 : f64 to f32
      linalg.yield %405 : f32
    } -> tensor<1xf32>
    %collapsed_68 = tensor.collapse_shape %184 [] : tensor<1xf32> into tensor<f32>
    %185 = tensor.empty() : tensor<1x17x64xf32>
    %186 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_68 : tensor<f32>) outs(%185 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %187 = tensor.empty() : tensor<1x17x64xf32>
    %188 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%182, %186 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%187 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %189 = tensor.empty() : tensor<1x17x64xf32>
    %190 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%188 : tensor<1x17x64xf32>) outs(%189 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.tanh %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %191 = tensor.empty() : tensor<1xf32>
    %192 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%191 : tensor<1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst_4 : f32
    } -> tensor<1xf32>
    %collapsed_69 = tensor.collapse_shape %192 [] : tensor<1xf32> into tensor<f32>
    %193 = tensor.empty() : tensor<1x17x64xf32>
    %194 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_69 : tensor<f32>) outs(%193 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %195 = tensor.empty() : tensor<1x17x64xf32>
    %196 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%190, %194 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%195 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %197 = tensor.empty() : tensor<1x17x64xf32>
    %198 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%168, %196 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%197 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %collapsed_70 = tensor.collapse_shape %198 [[0, 1], [2]] : tensor<1x17x64xf32> into tensor<17x64xf32>
    %199 = tensor.empty() : tensor<64x32xf32>
    %200 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_24 : tensor<32x64xf32>) outs(%199 : tensor<64x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x32xf32>
    %201 = tensor.empty() : tensor<17x32xf32>
    %202 = linalg.fill ins(%cst_9 : f32) outs(%201 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %203 = linalg.matmul ins(%collapsed_70, %200 : tensor<17x64xf32>, tensor<64x32xf32>) outs(%202 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %204 = tensor.empty() : tensor<17x32xf32>
    %205 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%204 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %206 = tensor.empty() : tensor<17x32xf32>
    %207 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%203, %205 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%206 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x32xf32>
    %208 = tensor.empty() : tensor<32xf32>
    %209 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%14, %cst_23 : tensor<32xf32>, tensor<32xf32>) outs(%208 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<32xf32>
    %210 = tensor.empty() : tensor<17x32xf32>
    %211 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%209 : tensor<32xf32>) outs(%210 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %212 = tensor.empty() : tensor<17x32xf32>
    %213 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%207, %211 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%212 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x32xf32>
    %expanded_71 = tensor.expand_shape %213 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %214 = tensor.empty() : tensor<1x17x32xf32>
    %215 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%113, %expanded_71 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%214 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %216 = tensor.empty() : tensor<1x17xf32>
    %217 = linalg.fill ins(%cst_9 : f32) outs(%216 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %218 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%215 : tensor<1x17x32xf32>) outs(%217 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_72 = tensor.expand_shape %218 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %219 = tensor.empty() : tensor<1x17x1xf32>
    %220 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_72, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%219 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %221 = tensor.empty() : tensor<1x17x32xf32>
    %222 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%220 : tensor<1x17x1xf32>) outs(%221 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %223 = tensor.empty() : tensor<1x17x32xf32>
    %224 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%215, %222 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%223 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %225 = tensor.empty() : tensor<1x17x32xf32>
    %226 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%224, %40 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%225 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %227 = tensor.empty() : tensor<1x17xf32>
    %228 = linalg.fill ins(%cst_9 : f32) outs(%227 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %229 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%226 : tensor<1x17x32xf32>) outs(%228 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_73 = tensor.expand_shape %229 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %230 = tensor.empty() : tensor<1x17x1xf32>
    %231 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_73, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%230 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %232 = tensor.empty() : tensor<1x17x1xf32>
    %233 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%231, %51 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%232 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %234 = tensor.empty() : tensor<1x17x1xf32>
    %235 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%233 : tensor<1x17x1xf32>) outs(%234 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.sqrt %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %236 = tensor.empty() : tensor<1x17x32xf32>
    %237 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%235 : tensor<1x17x1xf32>) outs(%236 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %238 = tensor.empty() : tensor<1x17x32xf32>
    %239 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%224, %237 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%238 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %240 = tensor.empty() : tensor<1x17x32xf32>
    %241 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_22 : tensor<32xf32>) outs(%240 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %242 = tensor.empty() : tensor<1x17x32xf32>
    %243 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%239, %241 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%242 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %244 = tensor.empty() : tensor<1x17x32xf32>
    %245 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_21 : tensor<32xf32>) outs(%244 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %246 = tensor.empty() : tensor<1x17x32xf32>
    %247 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%243, %245 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%246 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %248 = tensor.empty() : tensor<32x96xf32>
    %249 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_20 : tensor<96x32xf32>) outs(%248 : tensor<32x96xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x96xf32>
    %collapsed_74 = tensor.collapse_shape %247 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %250 = tensor.empty() : tensor<17x96xf32>
    %251 = linalg.fill ins(%cst_9 : f32) outs(%250 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %252 = linalg.matmul ins(%collapsed_74, %249 : tensor<17x32xf32>, tensor<32x96xf32>) outs(%251 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_75 = tensor.expand_shape %252 [[0, 1], [2, 3, 4]] output_shape [1, 17, 3, 2, 16] : tensor<17x96xf32> into tensor<1x17x3x2x16xf32>
    %253 = tensor.empty() : tensor<3x1x2x17x16xf32>
    %254 = linalg.generic {indexing_maps = [#map13, #map14], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_75 : tensor<1x17x3x2x16xf32>) outs(%253 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice_76 = tensor.extract_slice %254[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %extracted_slice_77 = tensor.extract_slice %254[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %collapsed_78 = tensor.collapse_shape %extracted_slice_77 [[0], [1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<1x2x17x16xf32>
    %extracted_slice_79 = tensor.extract_slice %254[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %255 = tensor.empty() : tensor<1x2x16x17xf32>
    %256 = linalg.generic {indexing_maps = [#map15, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_78 : tensor<1x2x17x16xf32>) outs(%255 : tensor<1x2x16x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x16x17xf32>
    %collapsed_80 = tensor.collapse_shape %extracted_slice_76 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %collapsed_81 = tensor.collapse_shape %256 [[0, 1], [2], [3]] : tensor<1x2x16x17xf32> into tensor<2x16x17xf32>
    %257 = tensor.empty() : tensor<2x17x17xf32>
    %258 = linalg.fill ins(%cst_9 : f32) outs(%257 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %259 = linalg.batch_matmul ins(%collapsed_80, %collapsed_81 : tensor<2x17x16xf32>, tensor<2x16x17xf32>) outs(%258 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %expanded_82 = tensor.expand_shape %259 [[0, 1], [2], [3]] output_shape [1, 2, 17, 17] : tensor<2x17x17xf32> into tensor<1x2x17x17xf32>
    %260 = tensor.empty() : tensor<1x2x17x17xf32>
    %261 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_82, %83 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%260 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %262 = tensor.empty() : tensor<1x2x17xf32>
    %263 = linalg.fill ins(%cst_7 : f32) outs(%262 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %264 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%261 : tensor<1x2x17x17xf32>) outs(%263 : tensor<1x2x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.maximumf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17xf32>
    %expanded_83 = tensor.expand_shape %264 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %265 = tensor.empty() : tensor<1x2x17x17xf32>
    %266 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_83 : tensor<1x2x17x1xf32>) outs(%265 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %267 = tensor.empty() : tensor<1x2x17x17xf32>
    %268 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%261, %266 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%267 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %269 = tensor.empty() : tensor<1x2x17x17xf32>
    %270 = linalg.generic {indexing_maps = [#map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%268 : tensor<1x2x17x17xf32>) outs(%269 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.exp %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %271 = tensor.empty() : tensor<1x2x17xf32>
    %272 = linalg.fill ins(%cst_9 : f32) outs(%271 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %273 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%270 : tensor<1x2x17x17xf32>) outs(%272 : tensor<1x2x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17xf32>
    %expanded_84 = tensor.expand_shape %273 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %274 = tensor.empty() : tensor<1x2x17x17xf32>
    %275 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_84 : tensor<1x2x17x1xf32>) outs(%274 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %276 = tensor.empty() : tensor<1x2x17x17xf32>
    %277 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%270, %275 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%276 : tensor<1x2x17x17xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x2x17x17xf32>
    %collapsed_85 = tensor.collapse_shape %277 [[0, 1], [2], [3]] : tensor<1x2x17x17xf32> into tensor<2x17x17xf32>
    %collapsed_86 = tensor.collapse_shape %extracted_slice_79 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %278 = tensor.empty() : tensor<2x17x16xf32>
    %279 = linalg.fill ins(%cst_9 : f32) outs(%278 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %280 = linalg.batch_matmul ins(%collapsed_85, %collapsed_86 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%279 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %expanded_87 = tensor.expand_shape %280 [[0, 1], [2], [3]] output_shape [1, 2, 17, 16] : tensor<2x17x16xf32> into tensor<1x2x17x16xf32>
    %281 = tensor.empty() : tensor<1x17x2x16xf32>
    %282 = linalg.generic {indexing_maps = [#map20, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_87 : tensor<1x2x17x16xf32>) outs(%281 : tensor<1x17x2x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x2x16xf32>
    %283 = tensor.empty() : tensor<32x32xf32>
    %284 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_19 : tensor<32x32xf32>) outs(%283 : tensor<32x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x32xf32>
    %collapsed_88 = tensor.collapse_shape %282 [[0, 1], [2, 3]] : tensor<1x17x2x16xf32> into tensor<17x32xf32>
    %285 = tensor.empty() : tensor<17x32xf32>
    %286 = linalg.fill ins(%cst_9 : f32) outs(%285 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %287 = linalg.matmul ins(%collapsed_88, %284 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%286 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %expanded_89 = tensor.expand_shape %287 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %288 = tensor.empty() : tensor<1x17x32xf32>
    %289 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%215, %expanded_89 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%288 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %290 = tensor.empty() : tensor<1x17xf32>
    %291 = linalg.fill ins(%cst_9 : f32) outs(%290 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %292 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%289 : tensor<1x17x32xf32>) outs(%291 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_90 = tensor.expand_shape %292 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %293 = tensor.empty() : tensor<1x17x1xf32>
    %294 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_90, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%293 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %295 = tensor.empty() : tensor<1x17x32xf32>
    %296 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%294 : tensor<1x17x1xf32>) outs(%295 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %297 = tensor.empty() : tensor<1x17x32xf32>
    %298 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%289, %296 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%297 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %299 = tensor.empty() : tensor<1x17x32xf32>
    %300 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%298, %40 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%299 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %301 = tensor.empty() : tensor<1x17xf32>
    %302 = linalg.fill ins(%cst_9 : f32) outs(%301 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %303 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%300 : tensor<1x17x32xf32>) outs(%302 : tensor<1x17xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17xf32>
    %expanded_91 = tensor.expand_shape %303 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %304 = tensor.empty() : tensor<1x17x1xf32>
    %305 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_91, %30 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%304 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %306 = tensor.empty() : tensor<1x17x1xf32>
    %307 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%305, %51 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%306 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %308 = tensor.empty() : tensor<1x17x1xf32>
    %309 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%307 : tensor<1x17x1xf32>) outs(%308 : tensor<1x17x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.sqrt %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x1xf32>
    %310 = tensor.empty() : tensor<1x17x32xf32>
    %311 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%309 : tensor<1x17x1xf32>) outs(%310 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %312 = tensor.empty() : tensor<1x17x32xf32>
    %313 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%298, %311 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%312 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %314 = tensor.empty() : tensor<1x17x32xf32>
    %315 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_18 : tensor<32xf32>) outs(%314 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %316 = tensor.empty() : tensor<1x17x32xf32>
    %317 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%313, %315 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%316 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %318 = tensor.empty() : tensor<1x17x32xf32>
    %319 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_17 : tensor<32xf32>) outs(%318 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %320 = tensor.empty() : tensor<1x17x32xf32>
    %321 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%317, %319 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%320 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %collapsed_92 = tensor.collapse_shape %321 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %322 = tensor.empty() : tensor<32x64xf32>
    %323 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_16 : tensor<64x32xf32>) outs(%322 : tensor<32x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %324 = tensor.empty() : tensor<17x64xf32>
    %325 = linalg.fill ins(%cst_9 : f32) outs(%324 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %326 = linalg.matmul ins(%collapsed_92, %323 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%325 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %327 = tensor.empty() : tensor<17x64xf32>
    %328 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%326, %152 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%327 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x64xf32>
    %329 = tensor.empty() : tensor<64xf32>
    %330 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%156, %cst_15 : tensor<64xf32>, tensor<64xf32>) outs(%329 : tensor<64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<64xf32>
    %331 = tensor.empty() : tensor<17x64xf32>
    %332 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%330 : tensor<64xf32>) outs(%331 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %333 = tensor.empty() : tensor<17x64xf32>
    %334 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%328, %332 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%333 : tensor<17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x64xf32>
    %expanded_93 = tensor.expand_shape %334 [[0, 1], [2]] output_shape [1, 17, 64] : tensor<17x64xf32> into tensor<1x17x64xf32>
    %335 = tensor.empty() : tensor<1x17x64xf32>
    %336 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_93, %166 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%335 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %337 = tensor.empty() : tensor<1x17x64xf32>
    %338 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_93, %172 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%337 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %339 = tensor.empty() : tensor<1x17x64xf32>
    %340 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%338, %178 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%339 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %341 = tensor.empty() : tensor<1x17x64xf32>
    %342 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_93, %340 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%341 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %343 = tensor.empty() : tensor<1x17x64xf32>
    %344 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%342, %186 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%343 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %345 = tensor.empty() : tensor<1x17x64xf32>
    %346 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%344 : tensor<1x17x64xf32>) outs(%345 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.tanh %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %347 = tensor.empty() : tensor<1x17x64xf32>
    %348 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%346, %194 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%347 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %349 = tensor.empty() : tensor<1x17x64xf32>
    %350 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%336, %348 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%349 : tensor<1x17x64xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x64xf32>
    %collapsed_94 = tensor.collapse_shape %350 [[0, 1], [2]] : tensor<1x17x64xf32> into tensor<17x64xf32>
    %351 = tensor.empty() : tensor<64x32xf32>
    %352 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_14 : tensor<32x64xf32>) outs(%351 : tensor<64x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x32xf32>
    %353 = tensor.empty() : tensor<17x32xf32>
    %354 = linalg.fill ins(%cst_9 : f32) outs(%353 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %355 = linalg.matmul ins(%collapsed_94, %352 : tensor<17x64xf32>, tensor<64x32xf32>) outs(%354 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %356 = tensor.empty() : tensor<17x32xf32>
    %357 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%355, %205 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%356 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x32xf32>
    %358 = tensor.empty() : tensor<32xf32>
    %359 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%14, %cst_13 : tensor<32xf32>, tensor<32xf32>) outs(%358 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<32xf32>
    %360 = tensor.empty() : tensor<17x32xf32>
    %361 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%359 : tensor<32xf32>) outs(%360 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %362 = tensor.empty() : tensor<17x32xf32>
    %363 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%357, %361 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%362 : tensor<17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<17x32xf32>
    %expanded_95 = tensor.expand_shape %363 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %364 = tensor.empty() : tensor<1x17x32xf32>
    %365 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%289, %expanded_95 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%364 : tensor<1x17x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x17x32xf32>
    %extracted_slice_96 = tensor.extract_slice %365[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<1x1x32xf32>
    %collapsed_97 = tensor.collapse_shape %extracted_slice_96 [[0], [1, 2]] : tensor<1x1x32xf32> into tensor<1x32xf32>
    %366 = tensor.empty() : tensor<1xf32>
    %367 = linalg.fill ins(%cst_9 : f32) outs(%366 : tensor<1xf32>) -> tensor<1xf32>
    %368 = linalg.generic {indexing_maps = [#map3, #map21], iterator_types = ["parallel", "reduction"]} ins(%collapsed_97 : tensor<1x32xf32>) outs(%367 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1xf32>
    %expanded_98 = tensor.expand_shape %368 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %expanded_99 = tensor.expand_shape %28 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %369 = tensor.empty() : tensor<1x1xf32>
    %370 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%expanded_98, %expanded_99 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%369 : tensor<1x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x1xf32>
    %371 = tensor.empty() : tensor<1x32xf32>
    %372 = linalg.generic {indexing_maps = [#map22, #map3], iterator_types = ["parallel", "parallel"]} ins(%370 : tensor<1x1xf32>) outs(%371 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %373 = tensor.empty() : tensor<1x32xf32>
    %374 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_97, %372 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%373 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.subf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x32xf32>
    %375 = tensor.empty() : tensor<1x32xf32>
    %376 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_42 : tensor<f32>) outs(%375 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %377 = tensor.empty() : tensor<1x32xf32>
    %378 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%374, %376 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%377 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = math.powf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x32xf32>
    %379 = tensor.empty() : tensor<1xf32>
    %380 = linalg.fill ins(%cst_9 : f32) outs(%379 : tensor<1xf32>) -> tensor<1xf32>
    %381 = linalg.generic {indexing_maps = [#map3, #map21], iterator_types = ["parallel", "reduction"]} ins(%378 : tensor<1x32xf32>) outs(%380 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = arith.addf %out, %in : f32
      linalg.yield %405 : f32
    } -> tensor<1xf32>
    %expanded_100 = tensor.expand_shape %381 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %382 = tensor.empty() : tensor<1x1xf32>
    %383 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%expanded_100, %expanded_99 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%382 : tensor<1x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x1xf32>
    %expanded_101 = tensor.expand_shape %49 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %384 = tensor.empty() : tensor<1x1xf32>
    %385 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%383, %expanded_101 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%384 : tensor<1x1xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x1xf32>
    %386 = tensor.empty() : tensor<1x1xf32>
    %387 = linalg.generic {indexing_maps = [#map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%385 : tensor<1x1xf32>) outs(%386 : tensor<1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %405 = math.sqrt %in : f32
      linalg.yield %405 : f32
    } -> tensor<1x1xf32>
    %388 = tensor.empty() : tensor<1x32xf32>
    %389 = linalg.generic {indexing_maps = [#map22, #map3], iterator_types = ["parallel", "parallel"]} ins(%387 : tensor<1x1xf32>) outs(%388 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %390 = tensor.empty() : tensor<1x32xf32>
    %391 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%374, %389 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%390 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.divf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x32xf32>
    %392 = tensor.empty() : tensor<1x32xf32>
    %393 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_12 : tensor<32xf32>) outs(%392 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %394 = tensor.empty() : tensor<1x32xf32>
    %395 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%391, %393 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%394 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.mulf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x32xf32>
    %396 = tensor.empty() : tensor<1x32xf32>
    %397 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_11 : tensor<32xf32>) outs(%396 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %398 = tensor.empty() : tensor<1x32xf32>
    %399 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%395, %397 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%398 : tensor<1x32xf32>) {
    ^bb0(%in: f32, %in_104: f32, %out: f32):
      %405 = arith.addf %in, %in_104 : f32
      linalg.yield %405 : f32
    } -> tensor<1x32xf32>
    %400 = tensor.empty() : tensor<32x10xf32>
    %401 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_10 : tensor<10x32xf32>) outs(%400 : tensor<32x10xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x10xf32>
    %collapsed_102 = tensor.collapse_shape %399 [[0, 1]] : tensor<1x32xf32> into tensor<32xf32>
    %402 = tensor.empty() : tensor<10xf32>
    %403 = linalg.fill ins(%cst_9 : f32) outs(%402 : tensor<10xf32>) -> tensor<10xf32>
    %404 = linalg.vecmat ins(%collapsed_102, %401 : tensor<32xf32>, tensor<32x10xf32>) outs(%403 : tensor<10xf32>) -> tensor<10xf32>
    %expanded_103 = tensor.expand_shape %404 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
    return %expanded_103 : tensor<1x10xf32>
  }
}

{-#

#-}


