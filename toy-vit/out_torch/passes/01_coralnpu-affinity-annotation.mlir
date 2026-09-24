#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
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
#device_target_coralnpu = #hal.device.target<"coralnpu", [#executable_target_embedded_elf_riscv_32]> : !hal.device
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_x86_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #device_target_local
  util.global private @__device_1 = #device_target_coralnpu
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %cst = arith.constant dense_resource<torch_tensor_1_1_32_torch.float32> : tensor<1x1x32xf32>
    %cst_0 = arith.constant dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
    %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32> : tensor<32xf32>
    %cst_2 = arith.constant dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
    %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
    %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
    %cst_5 = arith.constant dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
    %cst_6 = arith.constant dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
    %cst_7 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
    %cst_8 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
    %cst_9 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %cst_10 = arith.constant dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>
    %cst_11 = arith.constant dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
    %cst_12 = arith.constant dense_resource<torch_tensor_32_torch.float32_5> : tensor<32xf32>
    %cst_13 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
    %cst_14 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
    %cst_15 = arith.constant dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
    %cst_16 = arith.constant dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
    %cst_17 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
    %cst_18 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
    %cst_19 = arith.constant dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
    %cst_20 = arith.constant dense_resource<torch_tensor_64_torch.float32_1> : tensor<64xf32>
    %cst_21 = arith.constant dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
    %cst_22 = arith.constant dense_resource<torch_tensor_32_torch.float32_10> : tensor<32xf32>
    %cst_23 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
    %cst_24 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
    %cst_25 = arith.constant dense_resource<torch_tensor_10_32_torch.float32> : tensor<10x32xf32>
    %cst_26 = arith.constant 0.000000e+00 : f32
    %cst_27 = arith.constant 9.99999997E-7 : f32
    %cst_28 = arith.constant 0xFF800000 : f32
    %cst_29 = arith.constant 4.471500e-02 : f32
    %cst_30 = arith.constant 0.797884523 : f32
    %cst_31 = arith.constant 1.000000e+00 : f32
    %cst_32 = arith.constant 3.200000e+01 : f32
    %cst_33 = arith.constant 2.000000e+00 : f32
    %cst_34 = arith.constant 4.000000e+00 : f32
    %cst_35 = arith.constant 5.000000e-01 : f32
    %cst_36 = arith.constant 3.000000e+00 : f32
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x32x32x3xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2], [3, 4], [5]] output_shape [1, 4, 8, 4, 8, 3] : tensor<1x32x32x3xf32> into tensor<1x4x8x4x8x3xf32>
    %1 = tensor.empty() : tensor<1x4x4x8x8x3xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded : tensor<1x4x8x4x8x3xf32>) outs(%1 : tensor<1x4x4x8x8x3xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x4x4x8x8x3xf32>
    %collapsed = tensor.collapse_shape %2 [[0, 1, 2], [3, 4, 5]] : tensor<1x4x4x8x8x3xf32> into tensor<16x192xf32>
    %3 = tensor.empty() : tensor<192x32xf32>
    %4 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<32x192xf32>) outs(%3 : tensor<192x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<192x32xf32>
    %5 = tensor.empty() : tensor<16x32xf32>
    %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%5 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %7 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed, %4 : tensor<16x192xf32>, tensor<192x32xf32>) outs(%6 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %8 = tensor.empty() : tensor<1xf32>
    %9 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_31 : f32
    } -> tensor<1xf32>
    %collapsed_37 = tensor.collapse_shape %9 [] : tensor<1xf32> into tensor<f32>
    %10 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%5 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %11 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%7, %10 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%5 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<16x32xf32>
    %12 = tensor.empty() : tensor<32xf32>
    %13 = linalg.generic {indexing_maps = [#map6, #map4], iterator_types = ["parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%12 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32xf32>
    %14 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%13, %cst_1 : tensor<32xf32>, tensor<32xf32>) outs(%12 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<32xf32>
    %15 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%14 : tensor<32xf32>) outs(%5 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %16 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%11, %15 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%5 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<16x32xf32>
    %expanded_38 = tensor.expand_shape %16 [[0, 1], [2]] output_shape [1, 16, 32] : tensor<16x32xf32> into tensor<1x16x32xf32>
    %17 = tensor.empty() : tensor<1x17x32xf32>
    %inserted_slice = tensor.insert_slice %cst into %17[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x1x32xf32> into tensor<1x17x32xf32>
    %inserted_slice_39 = tensor.insert_slice %expanded_38 into %inserted_slice[0, 1, 0] [1, 16, 32] [1, 1, 1] : tensor<1x16x32xf32> into tensor<1x17x32xf32>
    %18 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%inserted_slice_39, %cst_2 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %19 = tensor.empty() : tensor<1x17xf32>
    %20 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%19 : tensor<1x17xf32>) -> tensor<1x17xf32>
    %21 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%18 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_40 = tensor.expand_shape %21 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %22 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_32 : f32
    } -> tensor<1xf32>
    %collapsed_41 = tensor.collapse_shape %22 [] : tensor<1xf32> into tensor<f32>
    %23 = tensor.empty() : tensor<1x17x1xf32>
    %24 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_41 : tensor<f32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x1xf32>
    %25 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_40, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %26 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%25 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %27 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%18, %26 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %28 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_33 : f32
    } -> tensor<1xf32>
    %collapsed_42 = tensor.collapse_shape %28 [] : tensor<1xf32> into tensor<f32>
    %29 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_42 : tensor<f32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %30 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%27, %29 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %31 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%30 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_43 = tensor.expand_shape %31 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %32 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_43, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %33 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_27 : f32
    } -> tensor<1xf32>
    %collapsed_44 = tensor.collapse_shape %33 [] : tensor<1xf32> into tensor<f32>
    %34 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_44 : tensor<f32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x1xf32>
    %35 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%32, %34 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %36 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%35 : tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.sqrt %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %37 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%36 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %38 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%27, %37 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %39 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_3 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %40 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%38, %39 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %41 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_4 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %42 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%40, %41 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %43 = tensor.empty() : tensor<32x96xf32>
    %44 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_5 : tensor<96x32xf32>) outs(%43 : tensor<32x96xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x96xf32>
    %collapsed_45 = tensor.collapse_shape %42 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %45 = tensor.empty() : tensor<17x96xf32>
    %46 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%45 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %47 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_45, %44 : tensor<17x32xf32>, tensor<32x96xf32>) outs(%46 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_46 = tensor.expand_shape %47 [[0, 1], [2, 3, 4]] output_shape [1, 17, 3, 2, 16] : tensor<17x96xf32> into tensor<1x17x3x2x16xf32>
    %48 = tensor.empty() : tensor<3x1x2x17x16xf32>
    %49 = linalg.generic {indexing_maps = [#map13, #map14], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_46 : tensor<1x17x3x2x16xf32>) outs(%48 : tensor<3x1x2x17x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice = tensor.extract_slice %49[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %extracted_slice_47 = tensor.extract_slice %49[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %collapsed_48 = tensor.collapse_shape %extracted_slice_47 [[0], [1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<1x2x17x16xf32>
    %extracted_slice_49 = tensor.extract_slice %49[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %50 = tensor.empty() : tensor<1x2x16x17xf32>
    %51 = linalg.generic {indexing_maps = [#map15, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_48 : tensor<1x2x17x16xf32>) outs(%50 : tensor<1x2x16x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x16x17xf32>
    %collapsed_50 = tensor.collapse_shape %extracted_slice [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %collapsed_51 = tensor.collapse_shape %51 [[0, 1], [2], [3]] : tensor<1x2x16x17xf32> into tensor<2x16x17xf32>
    %52 = tensor.empty() : tensor<2x17x17xf32>
    %53 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%52 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %54 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_50, %collapsed_51 : tensor<2x17x16xf32>, tensor<2x16x17xf32>) outs(%53 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %expanded_52 = tensor.expand_shape %54 [[0, 1], [2], [3]] output_shape [1, 2, 17, 17] : tensor<2x17x17xf32> into tensor<1x2x17x17xf32>
    %55 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_34 : f32
    } -> tensor<1xf32>
    %collapsed_53 = tensor.collapse_shape %55 [] : tensor<1xf32> into tensor<f32>
    %56 = tensor.empty() : tensor<1x2x17x17xf32>
    %57 = linalg.generic {indexing_maps = [#map17, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_53 : tensor<f32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %58 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_52, %57 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %59 = tensor.empty() : tensor<1x2x17xf32>
    %60 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_28 : f32) outs(%59 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %61 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%58 : tensor<1x2x17x17xf32>) outs(%60 : tensor<1x2x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.maximumf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17xf32>
    %expanded_54 = tensor.expand_shape %61 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %62 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_54 : tensor<1x2x17x1xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %63 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%58, %62 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %64 = linalg.generic {indexing_maps = [#map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%63 : tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.exp %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %65 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%59 : tensor<1x2x17xf32>) -> tensor<1x2x17xf32>
    %66 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%64 : tensor<1x2x17x17xf32>) outs(%65 : tensor<1x2x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17xf32>
    %expanded_55 = tensor.expand_shape %66 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %67 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_55 : tensor<1x2x17x1xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %68 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%64, %67 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %collapsed_56 = tensor.collapse_shape %68 [[0, 1], [2], [3]] : tensor<1x2x17x17xf32> into tensor<2x17x17xf32>
    %collapsed_57 = tensor.collapse_shape %extracted_slice_49 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %69 = tensor.empty() : tensor<2x17x16xf32>
    %70 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%69 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %71 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_56, %collapsed_57 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%70 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %expanded_58 = tensor.expand_shape %71 [[0, 1], [2], [3]] output_shape [1, 2, 17, 16] : tensor<2x17x16xf32> into tensor<1x2x17x16xf32>
    %72 = tensor.empty() : tensor<1x17x2x16xf32>
    %73 = linalg.generic {indexing_maps = [#map20, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_58 : tensor<1x2x17x16xf32>) outs(%72 : tensor<1x17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x2x16xf32>
    %74 = tensor.empty() : tensor<32x32xf32>
    %75 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_6 : tensor<32x32xf32>) outs(%74 : tensor<32x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x32xf32>
    %collapsed_59 = tensor.collapse_shape %73 [[0, 1], [2, 3]] : tensor<1x17x2x16xf32> into tensor<17x32xf32>
    %76 = tensor.empty() : tensor<17x32xf32>
    %77 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%76 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %78 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_59, %75 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%77 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %expanded_60 = tensor.expand_shape %78 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %79 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%18, %expanded_60 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %80 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%79 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_61 = tensor.expand_shape %80 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %81 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_61, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %82 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%81 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %83 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%79, %82 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %84 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%83, %29 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %85 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%84 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_62 = tensor.expand_shape %85 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %86 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_62, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %87 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%86, %34 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %88 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%87 : tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.sqrt %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %89 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%88 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %90 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%83, %89 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %91 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_7 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %92 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%90, %91 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %93 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_8 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %94 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%92, %93 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %collapsed_63 = tensor.collapse_shape %94 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %95 = tensor.empty() : tensor<32x64xf32>
    %96 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_9 : tensor<64x32xf32>) outs(%95 : tensor<32x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %97 = tensor.empty() : tensor<17x64xf32>
    %98 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%97 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %99 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_63, %96 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%98 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %100 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %101 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%99, %100 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x64xf32>
    %102 = tensor.empty() : tensor<64xf32>
    %103 = linalg.generic {indexing_maps = [#map6, #map4], iterator_types = ["parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%102 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64xf32>
    %104 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%103, %cst_10 : tensor<64xf32>, tensor<64xf32>) outs(%102 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<64xf32>
    %105 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%104 : tensor<64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %106 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%101, %105 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x64xf32>
    %expanded_64 = tensor.expand_shape %106 [[0, 1], [2]] output_shape [1, 17, 64] : tensor<17x64xf32> into tensor<1x17x64xf32>
    %107 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_35 : f32
    } -> tensor<1xf32>
    %collapsed_65 = tensor.collapse_shape %107 [] : tensor<1xf32> into tensor<f32>
    %108 = tensor.empty() : tensor<1x17x64xf32>
    %109 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_65 : tensor<f32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %110 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %109 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %111 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_36 : f32
    } -> tensor<1xf32>
    %collapsed_66 = tensor.collapse_shape %111 [] : tensor<1xf32> into tensor<f32>
    %112 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_66 : tensor<f32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %113 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %112 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %114 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_29 : f32
    } -> tensor<1xf32>
    %collapsed_67 = tensor.collapse_shape %114 [] : tensor<1xf32> into tensor<f32>
    %115 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_67 : tensor<f32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %116 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%113, %115 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %117 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_64, %116 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %118 = linalg.generic {indexing_maps = [#map4], iterator_types = ["parallel"]} outs(%8 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%out: f32):
      linalg.yield %cst_30 : f32
    } -> tensor<1xf32>
    %collapsed_68 = tensor.collapse_shape %118 [] : tensor<1xf32> into tensor<f32>
    %119 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_68 : tensor<f32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %120 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%117, %119 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %121 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%120 : tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.tanh %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %122 = linalg.generic {indexing_maps = [#map10, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x64xf32>
    %123 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%121, %122 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %124 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%110, %123 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %collapsed_69 = tensor.collapse_shape %124 [[0, 1], [2]] : tensor<1x17x64xf32> into tensor<17x64xf32>
    %125 = tensor.empty() : tensor<64x32xf32>
    %126 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_11 : tensor<32x64xf32>) outs(%125 : tensor<64x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x32xf32>
    %127 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_69, %126 : tensor<17x64xf32>, tensor<64x32xf32>) outs(%77 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %128 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_37 : tensor<f32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %129 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%127, %128 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x32xf32>
    %130 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%13, %cst_12 : tensor<32xf32>, tensor<32xf32>) outs(%12 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<32xf32>
    %131 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%130 : tensor<32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %132 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%129, %131 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x32xf32>
    %expanded_70 = tensor.expand_shape %132 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %133 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%79, %expanded_70 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %134 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%133 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_71 = tensor.expand_shape %134 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %135 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_71, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %136 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%135 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %137 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%133, %136 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %138 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%137, %29 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %139 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%138 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_72 = tensor.expand_shape %139 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %140 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_72, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %141 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%140, %34 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %142 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%141 : tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.sqrt %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %143 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%142 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %144 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%137, %143 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %145 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_13 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %146 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%144, %145 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %147 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_14 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %148 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%146, %147 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %149 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_15 : tensor<96x32xf32>) outs(%43 : tensor<32x96xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x96xf32>
    %collapsed_73 = tensor.collapse_shape %148 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %150 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_73, %149 : tensor<17x32xf32>, tensor<32x96xf32>) outs(%46 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_74 = tensor.expand_shape %150 [[0, 1], [2, 3, 4]] output_shape [1, 17, 3, 2, 16] : tensor<17x96xf32> into tensor<1x17x3x2x16xf32>
    %151 = linalg.generic {indexing_maps = [#map13, #map14], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_74 : tensor<1x17x3x2x16xf32>) outs(%48 : tensor<3x1x2x17x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice_75 = tensor.extract_slice %151[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %extracted_slice_76 = tensor.extract_slice %151[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %collapsed_77 = tensor.collapse_shape %extracted_slice_76 [[0], [1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<1x2x17x16xf32>
    %extracted_slice_78 = tensor.extract_slice %151[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<1x1x2x17x16xf32>
    %152 = linalg.generic {indexing_maps = [#map15, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%collapsed_77 : tensor<1x2x17x16xf32>) outs(%50 : tensor<1x2x16x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x16x17xf32>
    %collapsed_79 = tensor.collapse_shape %extracted_slice_75 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %collapsed_80 = tensor.collapse_shape %152 [[0, 1], [2], [3]] : tensor<1x2x16x17xf32> into tensor<2x16x17xf32>
    %153 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_79, %collapsed_80 : tensor<2x17x16xf32>, tensor<2x16x17xf32>) outs(%53 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %expanded_81 = tensor.expand_shape %153 [[0, 1], [2], [3]] output_shape [1, 2, 17, 17] : tensor<2x17x17xf32> into tensor<1x2x17x17xf32>
    %154 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_81, %57 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %155 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%154 : tensor<1x2x17x17xf32>) outs(%60 : tensor<1x2x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.maximumf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17xf32>
    %expanded_82 = tensor.expand_shape %155 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %156 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_82 : tensor<1x2x17x1xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %157 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%154, %156 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %158 = linalg.generic {indexing_maps = [#map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%157 : tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.exp %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %159 = linalg.generic {indexing_maps = [#map16, #map18], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%158 : tensor<1x2x17x17xf32>) outs(%65 : tensor<1x2x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17xf32>
    %expanded_83 = tensor.expand_shape %159 [[0], [1], [2, 3]] output_shape [1, 2, 17, 1] : tensor<1x2x17xf32> into tensor<1x2x17x1xf32>
    %160 = linalg.generic {indexing_maps = [#map19, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_83 : tensor<1x2x17x1xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x17x17xf32>
    %161 = linalg.generic {indexing_maps = [#map16, #map16, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%158, %160 : tensor<1x2x17x17xf32>, tensor<1x2x17x17xf32>) outs(%56 : tensor<1x2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x2x17x17xf32>
    %collapsed_84 = tensor.collapse_shape %161 [[0, 1], [2], [3]] : tensor<1x2x17x17xf32> into tensor<2x17x17xf32>
    %collapsed_85 = tensor.collapse_shape %extracted_slice_78 [[0, 1, 2], [3], [4]] : tensor<1x1x2x17x16xf32> into tensor<2x17x16xf32>
    %162 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_84, %collapsed_85 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%70 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %expanded_86 = tensor.expand_shape %162 [[0, 1], [2], [3]] output_shape [1, 2, 17, 16] : tensor<2x17x16xf32> into tensor<1x2x17x16xf32>
    %163 = linalg.generic {indexing_maps = [#map20, #map16], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%expanded_86 : tensor<1x2x17x16xf32>) outs(%72 : tensor<1x17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x2x16xf32>
    %164 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_16 : tensor<32x32xf32>) outs(%74 : tensor<32x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x32xf32>
    %collapsed_87 = tensor.collapse_shape %163 [[0, 1], [2, 3]] : tensor<1x17x2x16xf32> into tensor<17x32xf32>
    %165 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_87, %164 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%77 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %expanded_88 = tensor.expand_shape %165 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %166 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%133, %expanded_88 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %167 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%166 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_89 = tensor.expand_shape %167 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %168 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_89, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %169 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%168 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %170 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%166, %169 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %171 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%170, %29 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %172 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel", "reduction"]} ins(%171 : tensor<1x17x32xf32>) outs(%20 : tensor<1x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17xf32>
    %expanded_90 = tensor.expand_shape %172 [[0], [1, 2]] output_shape [1, 17, 1] : tensor<1x17xf32> into tensor<1x17x1xf32>
    %173 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_90, %24 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %174 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%173, %34 : tensor<1x17x1xf32>, tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %175 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%174 : tensor<1x17x1xf32>) outs(%23 : tensor<1x17x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.sqrt %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x1xf32>
    %176 = linalg.generic {indexing_maps = [#map11, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%175 : tensor<1x17x1xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %177 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%170, %176 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %178 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_17 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %179 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%177, %178 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %180 = linalg.generic {indexing_maps = [#map12, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst_18 : tensor<32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x17x32xf32>
    %181 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%179, %180 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %collapsed_91 = tensor.collapse_shape %181 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %182 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_19 : tensor<64x32xf32>) outs(%95 : tensor<32x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x64xf32>
    %183 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_91, %182 : tensor<17x32xf32>, tensor<32x64xf32>) outs(%98 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %184 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%183, %100 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x64xf32>
    %185 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%103, %cst_20 : tensor<64xf32>, tensor<64xf32>) outs(%102 : tensor<64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<64xf32>
    %186 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%185 : tensor<64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %187 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%184, %186 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%97 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x64xf32>
    %expanded_92 = tensor.expand_shape %187 [[0, 1], [2]] output_shape [1, 17, 64] : tensor<17x64xf32> into tensor<1x17x64xf32>
    %188 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_92, %109 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %189 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_92, %112 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %190 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%189, %115 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %191 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded_92, %190 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %192 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%191, %119 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %193 = linalg.generic {indexing_maps = [#map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%192 : tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.tanh %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %194 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%193, %122 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %195 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%188, %194 : tensor<1x17x64xf32>, tensor<1x17x64xf32>) outs(%108 : tensor<1x17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x64xf32>
    %collapsed_93 = tensor.collapse_shape %195 [[0, 1], [2]] : tensor<1x17x64xf32> into tensor<17x64xf32>
    %196 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_21 : tensor<32x64xf32>) outs(%125 : tensor<64x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<64x32xf32>
    %197 = linalg.matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_93, %196 : tensor<17x64xf32>, tensor<64x32xf32>) outs(%77 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %198 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%197, %128 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x32xf32>
    %199 = linalg.generic {indexing_maps = [#map4, #map4, #map4], iterator_types = ["parallel"]} ins(%13, %cst_22 : tensor<32xf32>, tensor<32xf32>) outs(%12 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<32xf32>
    %200 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%199 : tensor<32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %201 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%198, %200 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%76 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<17x32xf32>
    %expanded_94 = tensor.expand_shape %201 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %202 = linalg.generic {indexing_maps = [#map8, #map8, #map8], iterator_types = ["parallel", "parallel", "parallel"]} ins(%166, %expanded_94 : tensor<1x17x32xf32>, tensor<1x17x32xf32>) outs(%17 : tensor<1x17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x17x32xf32>
    %extracted_slice_95 = tensor.extract_slice %202[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<1x1x32xf32>
    %collapsed_96 = tensor.collapse_shape %extracted_slice_95 [[0], [1, 2]] : tensor<1x1x32xf32> into tensor<1x32xf32>
    %203 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%8 : tensor<1xf32>) -> tensor<1xf32>
    %204 = linalg.generic {indexing_maps = [#map3, #map21], iterator_types = ["parallel", "reduction"]} ins(%collapsed_96 : tensor<1x32xf32>) outs(%203 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1xf32>
    %expanded_97 = tensor.expand_shape %204 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %expanded_98 = tensor.expand_shape %22 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %205 = tensor.empty() : tensor<1x1xf32>
    %206 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%expanded_97, %expanded_98 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%205 : tensor<1x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x1xf32>
    %207 = tensor.empty() : tensor<1x32xf32>
    %208 = linalg.generic {indexing_maps = [#map22, #map3], iterator_types = ["parallel", "parallel"]} ins(%206 : tensor<1x1xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %209 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_96, %208 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.subf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x32xf32>
    %210 = linalg.generic {indexing_maps = [#map5, #map3], iterator_types = ["parallel", "parallel"]} ins(%collapsed_42 : tensor<f32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %211 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%209, %210 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = math.powf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x32xf32>
    %212 = linalg.generic {indexing_maps = [#map3, #map21], iterator_types = ["parallel", "reduction"]} ins(%211 : tensor<1x32xf32>) outs(%203 : tensor<1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = arith.addf %out, %in : f32
      linalg.yield %228 : f32
    } -> tensor<1xf32>
    %expanded_99 = tensor.expand_shape %212 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %213 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%expanded_99, %expanded_98 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%205 : tensor<1x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x1xf32>
    %expanded_100 = tensor.expand_shape %33 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %214 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%213, %expanded_100 : tensor<1x1xf32>, tensor<1x1xf32>) outs(%205 : tensor<1x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x1xf32>
    %215 = linalg.generic {indexing_maps = [#map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%214 : tensor<1x1xf32>) outs(%205 : tensor<1x1xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %228 = math.sqrt %in : f32
      linalg.yield %228 : f32
    } -> tensor<1x1xf32>
    %216 = linalg.generic {indexing_maps = [#map22, #map3], iterator_types = ["parallel", "parallel"]} ins(%215 : tensor<1x1xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %217 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%209, %216 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.divf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x32xf32>
    %218 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_23 : tensor<32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %219 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%217, %218 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.mulf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x32xf32>
    %220 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_24 : tensor<32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x32xf32>
    %221 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%219, %220 : tensor<1x32xf32>, tensor<1x32xf32>) outs(%207 : tensor<1x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_103: f32, %out: f32):
      %228 = arith.addf %in, %in_103 : f32
      linalg.yield %228 : f32
    } -> tensor<1x32xf32>
    %222 = tensor.empty() : tensor<32x10xf32>
    %223 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_25 : tensor<10x32xf32>) outs(%222 : tensor<32x10xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x10xf32>
    %collapsed_101 = tensor.collapse_shape %221 [[0, 1]] : tensor<1x32xf32> into tensor<32xf32>
    %224 = tensor.empty() : tensor<10xf32>
    %225 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_26 : f32) outs(%224 : tensor<10xf32>) -> tensor<10xf32>
    %226 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_101, %223 : tensor<32xf32>, tensor<32x10xf32>) outs(%225 : tensor<10xf32>) -> tensor<10xf32>
    %expanded_102 = tensor.expand_shape %226 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
    %227 = hal.tensor.export %expanded_102 "output0" : tensor<1x10xf32> -> !hal.buffer_view
    util.return %227 : !hal.buffer_view
  }
}

{-#

#-}


