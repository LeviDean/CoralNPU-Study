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
  %3 = flow.dispatch.region -> (tensor<4x4x8x8x3xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d1, d3, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<4x8x4x8x3xf32>) outs(%2 : tensor<4x4x8x8x3xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<4x4x8x8x3xf32>
    flow.return %60 : tensor<4x4x8x8x3xf32>
  }
  %collapsed_29 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4]] : tensor<4x4x8x8x3xf32> into tensor<16x192xf32>
  %4 = tensor.empty() : tensor<16x32xf32>
  %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
  %6 = flow.dispatch.region -> (tensor<16x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_29, %cst_28 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%5 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%60, %__hoisted_tensor_32xf32 : tensor<16x32xf32>, tensor<32xf32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.addf %in, %in_45 : f32
      linalg.yield %62 : f32
    } -> tensor<16x32xf32>
    flow.return %61 : tensor<16x32xf32>
  }
  %7 = tensor.empty() : tensor<f32>
  %8 = tensor.empty() : tensor<32xf32>
  %inserted_slice = tensor.insert_slice %6 into %__hoisted_tensor_1x17x32xf32[0, 1, 0] [1, 16, 32] [1, 1, 1] : tensor<16x32xf32> into tensor<1x17x32xf32>
  %9 = tensor.empty() : tensor<17x32xf32>
  %10 = tensor.empty() : tensor<1x17x32xf32>
  %11 = flow.dispatch.region -> (tensor<1x17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%inserted_slice, %cst_27 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%10 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %61 = arith.addf %in, %in_45 : f32
      linalg.yield %61 : f32
    } -> tensor<1x17x32xf32>
    flow.return %60 : tensor<1x17x32xf32>
  }
  %collapsed_30 = tensor.collapse_shape %11 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
  %12 = tensor.empty() : tensor<17xf32>
  %13 = linalg.fill ins(%cst_8 : f32) outs(%12 : tensor<17xf32>) -> tensor<17xf32>
  %14 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%collapsed_30 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.addf %out, %in : f32
      linalg.yield %62 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_30, %60 : tensor<17x32xf32>, tensor<17xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.subf %in, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %15 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%14 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = math.powf %in, %cst_2 : f32
      %63 = arith.addf %out, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%14, %60, %cst_26, %cst_25 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %in_47: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.addf %62, %cst_7 : f32
      %64 = math.sqrt %63 : f32
      %65 = arith.divf %in, %64 : f32
      %66 = arith.mulf %65, %in_46 : f32
      %67 = arith.addf %66, %in_47 : f32
      linalg.yield %67 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %16 = tensor.empty() : tensor<17x96xf32>
  %17 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%16 : tensor<17x96xf32>) -> tensor<17x96xf32>
  %18 = flow.dispatch.region -> (tensor<17x96xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%15, %cst_24 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%17 : tensor<17x96xf32>) -> tensor<17x96xf32>
    flow.return %60 : tensor<17x96xf32>
  }
  %expanded_31 = tensor.expand_shape %18 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %19 = tensor.empty() : tensor<3x1x2x17x16xf32>
  %20 = flow.dispatch.region -> (tensor<3x1x2x17x16xf32>) {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_31 : tensor<17x3x1x2x16xf32>) outs(%19 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    flow.return %60 : tensor<3x1x2x17x16xf32>
  }
  %extracted_slice = tensor.extract_slice %20[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_32 = tensor.extract_slice %20[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_33 = tensor.extract_slice %20[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %21 = tensor.empty() : tensor<2x17x17xf32>
  %22 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%21 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
  %23 = flow.dispatch.region -> (tensor<2x17x17xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice, %extracted_slice_32 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%22 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%60 : tensor<2x17x17xf32>) outs(%21 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.divf %in, %cst_1 : f32
      linalg.yield %62 : f32
    } -> tensor<2x17x17xf32>
    flow.return %61 : tensor<2x17x17xf32>
  }
  %24 = flow.dispatch.region -> (tensor<2x17x17xf32>) {
    %60 = linalg.softmax dimension(2) ins(%23 : tensor<2x17x17xf32>) outs(%21 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    flow.return %60 : tensor<2x17x17xf32>
  }
  %25 = tensor.empty() : tensor<2x17x16xf32>
  %26 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%25 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
  %27 = tensor.empty() : tensor<17x2x16xf32>
  %28 = flow.dispatch.region -> (tensor<17x2x16xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%24, %extracted_slice_33 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%26 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%60 : tensor<2x17x16xf32>) outs(%27 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x2x16xf32>
    flow.return %61 : tensor<17x2x16xf32>
  }
  %collapsed_34 = tensor.collapse_shape %28 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %29 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%9 : tensor<17x32xf32>) -> tensor<17x32xf32>
  %30 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_34, %cst_23 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%29 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_30, %60 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.addf %in, %in_45 : f32
      linalg.yield %62 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %31 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%30 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.addf %out, %in : f32
      linalg.yield %62 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%30, %60 : tensor<17x32xf32>, tensor<17xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.subf %in, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %32 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = math.powf %in, %cst_2 : f32
      %63 = arith.addf %out, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %60, %cst_22, %cst_21 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %in_47: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.addf %62, %cst_7 : f32
      %64 = math.sqrt %63 : f32
      %65 = arith.divf %in, %64 : f32
      %66 = arith.mulf %65, %in_46 : f32
      %67 = arith.addf %66, %in_47 : f32
      linalg.yield %67 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %33 = tensor.empty() : tensor<17x64xf32>
  %34 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%33 : tensor<17x64xf32>) -> tensor<17x64xf32>
  %35 = flow.dispatch.region -> (tensor<17x64xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%32, %cst_20 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%34 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%60, %__hoisted_tensor_64xf32 : tensor<17x64xf32>, tensor<64xf32>) outs(%33 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.addf %in, %in_45 : f32
      %63 = math.powf %62, %cst : f32
      %64 = arith.mulf %63, %cst_6 : f32
      %65 = arith.addf %62, %64 : f32
      %66 = arith.mulf %65, %cst_5 : f32
      %67 = math.tanh %66 : f32
      %68 = arith.addf %67, %cst_4 : f32
      %69 = arith.mulf %62, %cst_0 : f32
      %70 = arith.mulf %69, %68 : f32
      linalg.yield %70 : f32
    } -> tensor<17x64xf32>
    flow.return %61 : tensor<17x64xf32>
  }
  %36 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%35, %cst_19 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%29 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%30, %60, %__hoisted_tensor_32xf32_0 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %out: f32):
      %62 = arith.addf %in_45, %in_46 : f32
      %63 = arith.addf %in, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %37 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%36 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.addf %out, %in : f32
      linalg.yield %62 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%36, %60 : tensor<17x32xf32>, tensor<17xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.subf %in, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %38 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%37 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = math.powf %in, %cst_2 : f32
      %63 = arith.addf %out, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%37, %60, %cst_18, %cst_17 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %in_47: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.addf %62, %cst_7 : f32
      %64 = math.sqrt %63 : f32
      %65 = arith.divf %in, %64 : f32
      %66 = arith.mulf %65, %in_46 : f32
      %67 = arith.addf %66, %in_47 : f32
      linalg.yield %67 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %39 = flow.dispatch.region -> (tensor<17x96xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%38, %cst_16 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%17 : tensor<17x96xf32>) -> tensor<17x96xf32>
    flow.return %60 : tensor<17x96xf32>
  }
  %expanded_35 = tensor.expand_shape %39 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
  %40 = flow.dispatch.region -> (tensor<3x1x2x17x16xf32>) {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d3, d0, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_35 : tensor<17x3x1x2x16xf32>) outs(%19 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    flow.return %60 : tensor<3x1x2x17x16xf32>
  }
  %extracted_slice_36 = tensor.extract_slice %40[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_37 = tensor.extract_slice %40[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %extracted_slice_38 = tensor.extract_slice %40[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
  %41 = flow.dispatch.region -> (tensor<2x17x17xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_36, %extracted_slice_37 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%22 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%60 : tensor<2x17x17xf32>) outs(%21 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.divf %in, %cst_1 : f32
      linalg.yield %62 : f32
    } -> tensor<2x17x17xf32>
    flow.return %61 : tensor<2x17x17xf32>
  }
  %42 = flow.dispatch.region -> (tensor<2x17x17xf32>) {
    %60 = linalg.softmax dimension(2) ins(%41 : tensor<2x17x17xf32>) outs(%21 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    flow.return %60 : tensor<2x17x17xf32>
  }
  %43 = flow.dispatch.region -> (tensor<17x2x16xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%42, %extracted_slice_38 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%26 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%60 : tensor<2x17x16xf32>) outs(%27 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x2x16xf32>
    flow.return %61 : tensor<17x2x16xf32>
  }
  %collapsed_39 = tensor.collapse_shape %43 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
  %44 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_39, %cst_15 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%29 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%36, %60 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.addf %in, %in_45 : f32
      linalg.yield %62 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %expanded_40 = tensor.expand_shape %44 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %45 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%44 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = arith.addf %out, %in : f32
      linalg.yield %62 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%44, %60 : tensor<17x32xf32>, tensor<17xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.subf %in, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %46 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%45 : tensor<17x32xf32>) outs(%13 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %62 = math.powf %in, %cst_2 : f32
      %63 = arith.addf %out, %62 : f32
      linalg.yield %63 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%45, %60, %cst_14, %cst_13 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %in_47: f32, %out: f32):
      %62 = arith.divf %in_45, %cst_3 : f32
      %63 = arith.addf %62, %cst_7 : f32
      %64 = math.sqrt %63 : f32
      %65 = arith.divf %in, %64 : f32
      %66 = arith.mulf %65, %in_46 : f32
      %67 = arith.addf %66, %in_47 : f32
      linalg.yield %67 : f32
    } -> tensor<17x32xf32>
    flow.return %61 : tensor<17x32xf32>
  }
  %47 = flow.dispatch.region -> (tensor<17x64xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%46, %cst_12 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%34 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%60, %__hoisted_tensor_64xf32_1 : tensor<17x64xf32>, tensor<64xf32>) outs(%33 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %62 = arith.addf %in, %in_45 : f32
      %63 = math.powf %62, %cst : f32
      %64 = arith.mulf %63, %cst_6 : f32
      %65 = arith.addf %62, %64 : f32
      %66 = arith.mulf %65, %cst_5 : f32
      %67 = math.tanh %66 : f32
      %68 = arith.addf %67, %cst_4 : f32
      %69 = arith.mulf %62, %cst_0 : f32
      %70 = arith.mulf %69, %68 : f32
      linalg.yield %70 : f32
    } -> tensor<17x64xf32>
    flow.return %61 : tensor<17x64xf32>
  }
  %48 = flow.dispatch.region -> (tensor<17x32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%47, %cst_11 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%29 : tensor<17x32xf32>) -> tensor<17x32xf32>
    flow.return %60 : tensor<17x32xf32>
  }
  %expanded_41 = tensor.expand_shape %48 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
  %extracted_slice_42 = tensor.extract_slice %expanded_40[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
  %extracted_slice_43 = tensor.extract_slice %expanded_41[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
  %49 = flow.dispatch.region -> (tensor<32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%extracted_slice_42, %extracted_slice_43, %__hoisted_tensor_32xf32_2 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %out: f32):
      %61 = arith.addf %in_45, %in_46 : f32
      %62 = arith.addf %in, %61 : f32
      linalg.yield %62 : f32
    } -> tensor<32xf32>
    flow.return %60 : tensor<32xf32>
  }
  %50 = linalg.fill ins(%cst_8 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
  %51 = flow.dispatch.region -> (tensor<f32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%49 : tensor<32xf32>) outs(%50 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %61 = arith.addf %out, %in : f32
      linalg.yield %61 : f32
    } -> tensor<f32>
    flow.return %60 : tensor<f32>
  }
  %52 = flow.dispatch.region -> (tensor<32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%49, %51 : tensor<32xf32>, tensor<f32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %out: f32):
      %61 = arith.divf %in_45, %cst_3 : f32
      %62 = arith.subf %in, %61 : f32
      linalg.yield %62 : f32
    } -> tensor<32xf32>
    flow.return %60 : tensor<32xf32>
  }
  %53 = flow.dispatch.region -> (tensor<f32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%52 : tensor<32xf32>) outs(%50 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %61 = math.powf %in, %cst_2 : f32
      %62 = arith.addf %out, %61 : f32
      linalg.yield %62 : f32
    } -> tensor<f32>
    flow.return %60 : tensor<f32>
  }
  %54 = flow.dispatch.region -> (tensor<32xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_0>} {
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%52, %53, %cst_10, %cst_9 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%8 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_45: f32, %in_46: f32, %in_47: f32, %out: f32):
      %61 = arith.divf %in_45, %cst_3 : f32
      %62 = arith.addf %61, %cst_7 : f32
      %63 = math.sqrt %62 : f32
      %64 = arith.divf %in, %63 : f32
      %65 = arith.mulf %64, %in_46 : f32
      %66 = arith.addf %65, %in_47 : f32
      linalg.yield %66 : f32
    } -> tensor<32xf32>
    flow.return %60 : tensor<32xf32>
  }
  %55 = tensor.empty() : tensor<10xf32>
  %56 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_8 : f32) outs(%55 : tensor<10xf32>) -> tensor<10xf32>
  %57 = flow.dispatch.region -> (tensor<10xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
    %60 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%54, %__hoisted_tensor_32x10xf32 : tensor<32xf32>, tensor<32x10xf32>) outs(%56 : tensor<10xf32>) -> tensor<10xf32>
    flow.return %60 : tensor<10xf32>
  }
  %58 = iree_tensor_ext.compute_barrier.end %57 : tensor<10xf32> -> tensor<10xf32>
  %expanded_44 = tensor.expand_shape %58 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
  %59 = hal.tensor.export %expanded_44 "output0" : tensor<1x10xf32> -> !hal.buffer_view
  util.return %59 : !hal.buffer_view
}

