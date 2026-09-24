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
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    linalg.yield %78 : f32
  } -> tensor<16x32xf32>
  %inserted_slice = tensor.insert_slice %9 into %__hoisted_tensor_1x17x32xf32[0, 1, 0] [1, 16, 32] [1, 1, 1] : tensor<16x32xf32> into tensor<1x17x32xf32>
  %10 = tensor.empty() : tensor<17x32xf32>
  %11 = tensor.empty() : tensor<1x17x32xf32>
  %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%inserted_slice, %cst_27 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    linalg.yield %78 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_30 = tensor.collapse_shape %12 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %13 = tensor.empty() : tensor<17xf32>
  %14 = linalg.fill ins(%cst_8 : f32) outs(%13 : tensor<17xf32>) -> tensor<17xf32>
  %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_30 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.addf %out, %in : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %expanded_31 = tensor.expand_shape %15 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %16 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%12, %expanded_31 : tensor<1x17x32xf32>, tensor<1x17xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.subf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_32 = tensor.collapse_shape %16 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %17 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_32 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = math.powf %in, %cst_2 : f32
    %79 = arith.addf %out, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<17xf32>
  %expanded_33 = tensor.expand_shape %17 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %18 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%16, %expanded_33, %cst_26, %cst_25 : tensor<1x17x32xf32>, tensor<1x17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %in_68: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.addf %78, %cst_7 : f32
    %80 = math.sqrt %79 : f32
    %81 = arith.divf %in, %80 : f32
    %82 = arith.mulf %81, %in_67 : f32
    %83 = arith.addf %82, %in_68 : f32
    linalg.yield %83 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_34 = tensor.collapse_shape %18 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %19 = tensor.empty() : tensor<17x96xf32>
  %20 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%19 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %21 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_34, %cst_24 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%20 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %expanded_35 = tensor.expand_shape %21 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %22 = tensor.empty() : tensor<3x1x2x17x16xf32>
  %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_35 : tensor<17x3x1x2x16xf32>) outs(%22 : tensor<3x1x2x17x16xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x1x2x17x16xf32>
  %extracted_slice = tensor.extract_slice %23[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_36 = tensor.extract_slice %23[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_37 = tensor.extract_slice %23[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %24 = tensor.empty() : tensor<2x17x17xf32>
  %25 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%24 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %26 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice, %extracted_slice_36 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%25 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %27 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%26 : tensor<2x17x17xf32>) outs(%24 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.divf %in, %cst_1 : f32
    linalg.yield %78 : f32
  } -> tensor<2x17x17xf32>
  %28 = linalg.softmax dimension(2) ins(%27 : tensor<2x17x17xf32>) outs(%24 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %29 = tensor.empty() : tensor<2x17x16xf32>
  %30 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%29 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %31 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%28, %extracted_slice_37 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%30 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %32 = tensor.empty() : tensor<17x2x16xf32>
  %33 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%31 : tensor<2x17x16xf32>) outs(%32 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x2x16xf32>
  %collapsed_38 = tensor.collapse_shape %33 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %34 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%10 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %35 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_38, %cst_23 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%34 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %expanded_39 = tensor.expand_shape %35 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%12, %expanded_39 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    linalg.yield %78 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_40 = tensor.collapse_shape %36 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %37 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_40 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.addf %out, %in : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %expanded_41 = tensor.expand_shape %37 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %38 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%36, %expanded_41 : tensor<1x17x32xf32>, tensor<1x17xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.subf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_42 = tensor.collapse_shape %38 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %39 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_42 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = math.powf %in, %cst_2 : f32
    %79 = arith.addf %out, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<17xf32>
  %expanded_43 = tensor.expand_shape %39 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %40 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%38, %expanded_43, %cst_22, %cst_21 : tensor<1x17x32xf32>, tensor<1x17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %in_68: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.addf %78, %cst_7 : f32
    %80 = math.sqrt %79 : f32
    %81 = arith.divf %in, %80 : f32
    %82 = arith.mulf %81, %in_67 : f32
    %83 = arith.addf %82, %in_68 : f32
    linalg.yield %83 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_44 = tensor.collapse_shape %40 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %41 = tensor.empty() : tensor<17x64xf32>
  %42 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%41 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %43 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_44, %cst_20 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%42 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %44 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%43, %__hoisted_tensor_64xf32 : tensor<17x64xf32>, tensor<64xf32>) outs(%41 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    %79 = math.powf %78, %cst : f32
    %80 = arith.mulf %79, %cst_6 : f32
    %81 = arith.addf %78, %80 : f32
    %82 = arith.mulf %81, %cst_5 : f32
    %83 = math.tanh %82 : f32
    %84 = arith.addf %83, %cst_4 : f32
    %85 = arith.mulf %78, %cst_0 : f32
    %86 = arith.mulf %85, %84 : f32
    linalg.yield %86 : f32
  } -> tensor<17x64xf32>
  %45 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%44, %cst_19 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%34 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %expanded_45 = tensor.expand_shape %45 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %46 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%36, %expanded_45, %__hoisted_tensor_32xf32_0 : tensor<1x17x32xf32>, tensor<1x17x32xf32>, tensor<32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %out: f32):
    %78 = arith.addf %in_66, %in_67 : f32
    %79 = arith.addf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_46 = tensor.collapse_shape %46 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %47 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_46 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.addf %out, %in : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %expanded_47 = tensor.expand_shape %47 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %48 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%46, %expanded_47 : tensor<1x17x32xf32>, tensor<1x17xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.subf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_48 = tensor.collapse_shape %48 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %49 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_48 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = math.powf %in, %cst_2 : f32
    %79 = arith.addf %out, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<17xf32>
  %expanded_49 = tensor.expand_shape %49 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %50 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%48, %expanded_49, %cst_18, %cst_17 : tensor<1x17x32xf32>, tensor<1x17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %in_68: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.addf %78, %cst_7 : f32
    %80 = math.sqrt %79 : f32
    %81 = arith.divf %in, %80 : f32
    %82 = arith.mulf %81, %in_67 : f32
    %83 = arith.addf %82, %in_68 : f32
    linalg.yield %83 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_50 = tensor.collapse_shape %50 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %51 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_50, %cst_16 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%20 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %expanded_51 = tensor.expand_shape %51 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %52 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_51 : tensor<17x3x1x2x16xf32>) outs(%22 : tensor<3x1x2x17x16xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x1x2x17x16xf32>
  %extracted_slice_52 = tensor.extract_slice %52[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_53 = tensor.extract_slice %52[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_54 = tensor.extract_slice %52[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %53 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_52, %extracted_slice_53 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%25 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %54 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%53 : tensor<2x17x17xf32>) outs(%24 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.divf %in, %cst_1 : f32
    linalg.yield %78 : f32
  } -> tensor<2x17x17xf32>
  %55 = linalg.softmax dimension(2) ins(%54 : tensor<2x17x17xf32>) outs(%24 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %56 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%55, %extracted_slice_54 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%30 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %57 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%56 : tensor<2x17x16xf32>) outs(%32 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<17x2x16xf32>
  %collapsed_55 = tensor.collapse_shape %57 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %58 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_55, %cst_15 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%34 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %expanded_56 = tensor.expand_shape %58 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %59 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%46, %expanded_56 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    linalg.yield %78 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_57 = tensor.collapse_shape %59 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_57 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.addf %out, %in : f32
    linalg.yield %78 : f32
  } -> tensor<17xf32>
  %expanded_58 = tensor.expand_shape %60 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%59, %expanded_58 : tensor<1x17x32xf32>, tensor<1x17xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.subf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_59 = tensor.collapse_shape %61 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %62 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_59 : tensor<17x32xf32>) outs(%14 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = math.powf %in, %cst_2 : f32
    %79 = arith.addf %out, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<17xf32>
  %expanded_60 = tensor.expand_shape %62 [[0, 1]] output_shape [1, 17] : tensor<17xf32> into tensor<1x17xf32>
  %63 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%61, %expanded_60, %cst_14, %cst_13 : tensor<1x17x32xf32>, tensor<1x17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %in_68: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.addf %78, %cst_7 : f32
    %80 = math.sqrt %79 : f32
    %81 = arith.divf %in, %80 : f32
    %82 = arith.mulf %81, %in_67 : f32
    %83 = arith.addf %82, %in_68 : f32
    linalg.yield %83 : f32
  } -> tensor<1x17x32xf32>
  %collapsed_61 = tensor.collapse_shape %63 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %64 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_61, %cst_12 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%42 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %65 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%64, %__hoisted_tensor_64xf32_1 : tensor<17x64xf32>, tensor<64xf32>) outs(%41 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.addf %in, %in_66 : f32
    %79 = math.powf %78, %cst : f32
    %80 = arith.mulf %79, %cst_6 : f32
    %81 = arith.addf %78, %80 : f32
    %82 = arith.mulf %81, %cst_5 : f32
    %83 = math.tanh %82 : f32
    %84 = arith.addf %83, %cst_4 : f32
    %85 = arith.mulf %78, %cst_0 : f32
    %86 = arith.mulf %85, %84 : f32
    linalg.yield %86 : f32
  } -> tensor<17x64xf32>
  %66 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%65, %cst_11 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%34 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %expanded_62 = tensor.expand_shape %66 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %extracted_slice_63 = tensor.extract_slice %59[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
  %extracted_slice_64 = tensor.extract_slice %expanded_62[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
  %67 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%extracted_slice_63, %extracted_slice_64, %__hoisted_tensor_32xf32_2 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %out: f32):
    %78 = arith.addf %in_66, %in_67 : f32
    %79 = arith.addf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<32xf32>
  %68 = linalg.fill ins(%cst_8 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
  %69 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%67 : tensor<32xf32>) outs(%68 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = arith.addf %out, %in : f32
    linalg.yield %78 : f32
  } -> tensor<f32>
  %70 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%67, %69 : tensor<32xf32>, tensor<f32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.subf %in, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<32xf32>
  %71 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%70 : tensor<32xf32>) outs(%68 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %out: f32):
    %78 = math.powf %in, %cst_2 : f32
    %79 = arith.addf %out, %78 : f32
    linalg.yield %79 : f32
  } -> tensor<f32>
  %72 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%70, %71, %cst_10, %cst_9 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
  ^bb0(%in: f32, %in_66: f32, %in_67: f32, %in_68: f32, %out: f32):
    %78 = arith.divf %in_66, %cst_3 : f32
    %79 = arith.addf %78, %cst_7 : f32
    %80 = math.sqrt %79 : f32
    %81 = arith.divf %in, %80 : f32
    %82 = arith.mulf %81, %in_67 : f32
    %83 = arith.addf %82, %in_68 : f32
    linalg.yield %83 : f32
  } -> tensor<32xf32>
  %73 = tensor.empty() : tensor<10xf32>
  %74 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%73 : tensor<10xf32>) -> tensor<10xf32>
  %75 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%72, %__hoisted_tensor_32x10xf32 : tensor<32xf32>, tensor<32x10xf32>) outs(%74 : tensor<10xf32>) -> tensor<10xf32>
  %76 = iree_tensor_ext.compute_barrier.end %75 : tensor<10xf32> -> tensor<10xf32>
  %expanded_65 = tensor.expand_shape %76 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
  %77 = hal.tensor.export %expanded_65 "output0" : tensor<1x10xf32> -> !hal.buffer_view
  util.return %77 : !hal.buffer_view
}

