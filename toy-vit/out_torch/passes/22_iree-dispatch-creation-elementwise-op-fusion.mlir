util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
  %cst = arith.constant 3.000000e+00 : f32
  %cst_0 = arith.constant 5.000000e-01 : f32
  %cst_1 = arith.constant 4.000000e+00 : f32
  %cst_2 = arith.constant 2.000000e+00 : f32
  %cst_3 = arith.constant 3.200000e+01 : f32
  %cst_4 = arith.constant 1.000000e+00 : f32
  %cst_5 = arith.constant 0.797884523 : f32
  %cst_6 = arith.constant 4.471500e-02 : f32
  %cst_7 = arith.constant 9.99999997E-7 : f32
  %cst_8 = arith.constant 0.000000e+00 : f32
  %cst_9 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
  %cst_10 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
  %cst_11 = arith.constant dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
  %cst_12 = arith.constant dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
  %cst_13 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
  %cst_14 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
  %cst_15 = arith.constant dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
  %cst_16 = arith.constant dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
  %cst_17 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
  %cst_18 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
  %cst_19 = arith.constant dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
  %cst_20 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %cst_21 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
  %cst_22 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
  %cst_23 = arith.constant dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
  %cst_24 = arith.constant dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
  %cst_25 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
  %cst_26 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
  %cst_27 = arith.constant dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
  %cst_28 = arith.constant dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
  %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : tensor<32xf32>
  %__hoisted_tensor_1x17x32xf32 = util.global.load immutable @__hoisted_tensor_1x17x32xf32 : tensor<1x17x32xf32>
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
  %__hoisted_tensor_32xf32_0 = util.global.load immutable @__hoisted_tensor_32xf32_0 : tensor<32xf32>
  %__hoisted_tensor_64xf32_1 = util.global.load immutable @__hoisted_tensor_64xf32_1 : tensor<64xf32>
  %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : tensor<32xf32>
  %__hoisted_tensor_32x10xf32 = util.global.load immutable @__hoisted_tensor_32x10xf32 : tensor<32x10xf32>
  %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x32x32x3xf32>
  %expanded = tensor.expand_shape %0 [[0], [1, 2], [3, 4], [5]] output_shape [1, 4, 8, 4, 8, 3] : tensor<1x32x32x3xf32> into tensor<1x4x8x4x8x3xf32>
  %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3], [4], [5]] : tensor<1x4x8x4x8x3xf32> into tensor<4x8x4x8x3xf32>
  %1 = iree_tensor_ext.compute_barrier.start %collapsed : tensor<4x8x4x8x3xf32> -> tensor<4x8x4x8x3xf32>
  %2 = tensor.empty() : tensor<4x4x8x8x3xf32>
  %3 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d1, d3, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<4x8x4x8x3xf32>) outs(%2 : tensor<4x4x8x8x3xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<4x4x8x8x3xf32>
  %collapsed_29 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4]] : tensor<4x4x8x8x3xf32> into tensor<16x192xf32>
  %4 = tensor.empty() : tensor<16x32xf32>
  %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
  %6 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_29, %cst_28 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%5 : tensor<16x32xf32>) -> tensor<16x32xf32>
  %7 = tensor.empty() : tensor<f32>
  %8 = tensor.empty() : tensor<32xf32>
  %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%6, %__hoisted_tensor_32xf32 : tensor<16x32xf32>, tensor<32xf32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    linalg.yield %77 : f32
  } -> tensor<16x32xf32>
  %inserted_slice = tensor.insert_slice %9 into %__hoisted_tensor_1x17x32xf32[0, 1, 0] [1, 16, 32] [1, 1, 1] : tensor<16x32xf32> into tensor<1x17x32xf32>
  %collapsed_30 = tensor.collapse_shape %inserted_slice [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %collapsed_31 = tensor.collapse_shape %cst_27 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %10 = tensor.empty() : tensor<17x32xf32>
  %11 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_30, %collapsed_31 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    linalg.yield %77 : f32
  } -> tensor<17x32xf32>
  %12 = tensor.empty() : tensor<17xf32>
  %13 = linalg.fill ins(%cst_8 : f32) outs(%12 : tensor<17xf32>) -> tensor<17xf32>
  %14 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%11 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.addf %out, %in : f32
    linalg.yield %77 : f32
  } -> tensor<17xf32>
  %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%11, %14 : tensor<17x32xf32>, tensor<17xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.subf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %16 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%15 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = math.powf %in, %cst_2 : f32
    %78 = arith.addf %out, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %17 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %16, %cst_26, %cst_25 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %in_46: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.addf %77, %cst_7 : f32
    %79 = math.sqrt %78 : f32
    %80 = arith.divf %in, %79 : f32
    %81 = arith.mulf %80, %in_45 : f32
    %82 = arith.addf %81, %in_46 : f32
    linalg.yield %82 : f32
  } -> tensor<17x32xf32>
  %18 = tensor.empty() : tensor<17x96xf32>
  %19 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%18 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %20 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%17, %cst_24 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%19 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %expanded_32 = tensor.expand_shape %20 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %21 = tensor.empty() : tensor<3x1x2x17x16xf32>
  %22 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_32 : tensor<17x3x1x2x16xf32>) outs(%21 : tensor<3x1x2x17x16xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x1x2x17x16xf32>
  %extracted_slice = tensor.extract_slice %22[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_33 = tensor.extract_slice %22[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_34 = tensor.extract_slice %22[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %23 = tensor.empty() : tensor<2x17x17xf32>
  %24 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%23 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %25 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice, %extracted_slice_33 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%24 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %26 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%25 : tensor<2x17x17xf32>) outs(%23 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.divf %in, %cst_1 : f32
    linalg.yield %77 : f32
  } -> tensor<2x17x17xf32>
  %27 = linalg.softmax dimension(2) ins(%26 : tensor<2x17x17xf32>) outs(%23 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %28 = tensor.empty() : tensor<2x17x16xf32>
  %29 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%28 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %30 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%27, %extracted_slice_34 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%29 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %31 = tensor.empty() : tensor<17x2x16xf32>
  %32 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%30 : tensor<2x17x16xf32>) outs(%31 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x2x16xf32>
  %collapsed_35 = tensor.collapse_shape %32 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %33 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%10 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %34 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_35, %cst_23 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%33 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%11, %34 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    linalg.yield %77 : f32
  } -> tensor<17x32xf32>
  %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%35 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.addf %out, %in : f32
    linalg.yield %77 : f32
  } -> tensor<17xf32>
  %37 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%35, %36 : tensor<17x32xf32>, tensor<17xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.subf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %38 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%37 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = math.powf %in, %cst_2 : f32
    %78 = arith.addf %out, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %39 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%37, %38, %cst_22, %cst_21 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %in_46: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.addf %77, %cst_7 : f32
    %79 = math.sqrt %78 : f32
    %80 = arith.divf %in, %79 : f32
    %81 = arith.mulf %80, %in_45 : f32
    %82 = arith.addf %81, %in_46 : f32
    linalg.yield %82 : f32
  } -> tensor<17x32xf32>
  %40 = tensor.empty() : tensor<17x64xf32>
  %41 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%40 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %42 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%39, %cst_20 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%41 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %43 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%42, %__hoisted_tensor_64xf32 : tensor<17x64xf32>, tensor<64xf32>) outs(%40 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    %78 = math.powf %77, %cst : f32
    %79 = arith.mulf %78, %cst_6 : f32
    %80 = arith.addf %77, %79 : f32
    %81 = arith.mulf %80, %cst_5 : f32
    %82 = math.tanh %81 : f32
    %83 = arith.addf %82, %cst_4 : f32
    %84 = arith.mulf %77, %cst_0 : f32
    %85 = arith.mulf %84, %83 : f32
    linalg.yield %85 : f32
  } -> tensor<17x64xf32>
  %44 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%43, %cst_19 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%33 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %45 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%35, %44, %__hoisted_tensor_32xf32_0 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %out: f32):
    %77 = arith.addf %in_44, %in_45 : f32
    %78 = arith.addf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %46 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%45 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.addf %out, %in : f32
    linalg.yield %77 : f32
  } -> tensor<17xf32>
  %47 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%45, %46 : tensor<17x32xf32>, tensor<17xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.subf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %48 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%47 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = math.powf %in, %cst_2 : f32
    %78 = arith.addf %out, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %49 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%47, %48, %cst_18, %cst_17 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %in_46: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.addf %77, %cst_7 : f32
    %79 = math.sqrt %78 : f32
    %80 = arith.divf %in, %79 : f32
    %81 = arith.mulf %80, %in_45 : f32
    %82 = arith.addf %81, %in_46 : f32
    linalg.yield %82 : f32
  } -> tensor<17x32xf32>
  %50 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%49, %cst_16 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%19 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %expanded_36 = tensor.expand_shape %50 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %51 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_36 : tensor<17x3x1x2x16xf32>) outs(%21 : tensor<3x1x2x17x16xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x1x2x17x16xf32>
  %extracted_slice_37 = tensor.extract_slice %51[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_38 = tensor.extract_slice %51[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_39 = tensor.extract_slice %51[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %52 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_37, %extracted_slice_38 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%24 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %53 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%52 : tensor<2x17x17xf32>) outs(%23 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.divf %in, %cst_1 : f32
    linalg.yield %77 : f32
  } -> tensor<2x17x17xf32>
  %54 = linalg.softmax dimension(2) ins(%53 : tensor<2x17x17xf32>) outs(%23 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %55 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%54, %extracted_slice_39 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%29 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %56 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%55 : tensor<2x17x16xf32>) outs(%31 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x2x16xf32>
  %collapsed_40 = tensor.collapse_shape %56 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %57 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_40, %cst_15 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%33 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %58 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%45, %57 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    linalg.yield %77 : f32
  } -> tensor<17x32xf32>
  %59 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%58 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.addf %out, %in : f32
    linalg.yield %77 : f32
  } -> tensor<17xf32>
  %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%58, %59 : tensor<17x32xf32>, tensor<17xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.subf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%60 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = math.powf %in, %cst_2 : f32
    %78 = arith.addf %out, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %62 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%60, %61, %cst_14, %cst_13 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %in_46: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.addf %77, %cst_7 : f32
    %79 = math.sqrt %78 : f32
    %80 = arith.divf %in, %79 : f32
    %81 = arith.mulf %80, %in_45 : f32
    %82 = arith.addf %81, %in_46 : f32
    linalg.yield %82 : f32
  } -> tensor<17x32xf32>
  %63 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%62, %cst_12 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%41 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %64 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%63, %__hoisted_tensor_64xf32_1 : tensor<17x64xf32>, tensor<64xf32>) outs(%40 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.addf %in, %in_44 : f32
    %78 = math.powf %77, %cst : f32
    %79 = arith.mulf %78, %cst_6 : f32
    %80 = arith.addf %77, %79 : f32
    %81 = arith.mulf %80, %cst_5 : f32
    %82 = math.tanh %81 : f32
    %83 = arith.addf %82, %cst_4 : f32
    %84 = arith.mulf %77, %cst_0 : f32
    %85 = arith.mulf %84, %83 : f32
    linalg.yield %85 : f32
  } -> tensor<17x64xf32>
  %65 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%64, %cst_11 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%33 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %66 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%58, %65, %__hoisted_tensor_32xf32_2 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%10 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %out: f32):
    %77 = arith.addf %in_44, %in_45 : f32
    %78 = arith.addf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<17x32xf32>
  %expanded_41 = tensor.expand_shape %66 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %extracted_slice_42 = tensor.extract_slice %expanded_41[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
  %67 = linalg.fill ins(%cst_8 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
  %68 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%extracted_slice_42 : tensor<32xf32>) outs(%67 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = arith.addf %out, %in : f32
    linalg.yield %77 : f32
  } -> tensor<f32>
  %69 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%extracted_slice_42, %68 : tensor<32xf32>, tensor<f32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.subf %in, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<32xf32>
  %70 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%69 : tensor<32xf32>) outs(%67 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %77 = math.powf %in, %cst_2 : f32
    %78 = arith.addf %out, %77 : f32
    linalg.yield %78 : f32
  } -> tensor<f32>
  %71 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%69, %70, %cst_10, %cst_9 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_44: f32, %in_45: f32, %in_46: f32, %out: f32):
    %77 = arith.divf %in_44, %cst_3 : f32
    %78 = arith.addf %77, %cst_7 : f32
    %79 = math.sqrt %78 : f32
    %80 = arith.divf %in, %79 : f32
    %81 = arith.mulf %80, %in_45 : f32
    %82 = arith.addf %81, %in_46 : f32
    linalg.yield %82 : f32
  } -> tensor<32xf32>
  %72 = tensor.empty() : tensor<10xf32>
  %73 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%72 : tensor<10xf32>) -> tensor<10xf32>
  %74 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%71, %__hoisted_tensor_32x10xf32 : tensor<32xf32>, tensor<32x10xf32>) outs(%73 : tensor<10xf32>) -> tensor<10xf32>
  %75 = iree_tensor_ext.compute_barrier.end %74 : tensor<10xf32> -> tensor<10xf32>
  %expanded_43 = tensor.expand_shape %75 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
  %76 = hal.tensor.export %expanded_43 "output0" : tensor<1x10xf32> -> !hal.buffer_view
  util.return %76 : !hal.buffer_view
}

