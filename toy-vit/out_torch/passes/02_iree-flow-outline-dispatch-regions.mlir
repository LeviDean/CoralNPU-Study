#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> (d0, d1)>
#map6 = affine_map<(d0, d1) -> (d1)>
#map7 = affine_map<(d0) -> (d0)>
#map8 = affine_map<(d0, d1) -> (d0)>
#map9 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map10 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map11 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map12 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map13 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map14 = affine_map<(d0) -> ()>
#device_target_coralnpu = #hal.device.target<"coralnpu", [#executable_target_embedded_elf_riscv_32]> : !hal.device
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_x86_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #device_target_local
  util.global private @__device_1 = #device_target_coralnpu
  util.global private @__hoisted_tensor_32xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<32xf32>
  util.global private @__hoisted_tensor_1x17x32xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<1x17x32xf32>
  util.global private @__hoisted_tensor_64xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<64xf32>
  util.global private @__hoisted_tensor_32xf32_0 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<32xf32>
  util.global private @__hoisted_tensor_64xf32_1 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<64xf32>
  util.global private @__hoisted_tensor_32xf32_2 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<32xf32>
  util.global private @__hoisted_tensor_32x10xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<32x10xf32>
  flow.executable private @main_dispatch_0 {
    flow.executable.export public @main_dispatch_0 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_0(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0, 0], sizes = [4, 8, 4, 24], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>> -> tensor<4x8x4x24xf32>
        %1 = tensor.empty() : tensor<4x4x8x24xf32>
        %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%0 : tensor<4x8x4x24xf32>) outs(%1 : tensor<4x4x8x24xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<4x4x8x24xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0, 0], sizes = [4, 4, 8, 24], strides = [1, 1, 1, 1] : tensor<4x4x8x24xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_1 {
    flow.executable.export public @main_dispatch_1 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_1(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>> -> tensor<16x192xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>> -> tensor<32x192xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<16x32xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %5 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<16x32xf32>, tensor<32xf32>) outs(%3 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<16x32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [16, 32], strides = [1, 1] : tensor<16x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_2 {
    flow.executable.export public @main_dispatch_2 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_2(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %2 = tensor.empty() : tensor<544xf32>
        %3 = linalg.generic {indexing_maps = [#map7, #map7, #map7], iterator_types = ["parallel"]} ins(%0, %1 : tensor<544xf32>, tensor<544xf32>) outs(%2 : tensor<544xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %4 = arith.addf %in, %in_0 : f32
          linalg.yield %4 : f32
        } -> tensor<544xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [544], strides = [1] : tensor<544xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_3 {
    flow.executable.export public @main_dispatch_3 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_3(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<17x32xf32>, tensor<17xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %6 = arith.divf %in_1, %cst_0 : f32
          %7 = arith.subf %in, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_4 {
    flow.executable.export public @main_dispatch_4 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_4(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_5 {
    flow.executable.export public @main_dispatch_5 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_5(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [96, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>> -> tensor<96x32xf32>
        %2 = tensor.empty() : tensor<17x96xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<17x96xf32>) -> tensor<17x96xf32>
        %4 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%3 : tensor<17x96xf32>) -> tensor<17x96xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0], sizes = [17, 96], strides = [1, 1] : tensor<17x96xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_6 {
    flow.executable.export public @main_dispatch_6 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_6(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [17, 6, 16], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>> -> tensor<17x6x16xf32>
        %1 = tensor.empty() : tensor<6x17x16xf32>
        %2 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<17x6x16xf32>) outs(%1 : tensor<6x17x16xf32>) {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<6x17x16xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [6, 17, 16], strides = [1, 1, 1] : tensor<6x17x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_7 {
    flow.executable.export public @main_dispatch_7 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_7(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 4.000000e+00 : f32
        %0 = tensor.empty() : tensor<2x17x17xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [1, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%0 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %4 = linalg.batch_matmul indexing_maps = [#map11, #map12, #map13] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%2, %1 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%3 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %5 = linalg.generic {indexing_maps = [#map9, #map9], iterator_types = ["parallel", "parallel", "parallel"]} ins(%4 : tensor<2x17x17xf32>) outs(%0 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.divf %in, %cst_0 : f32
          linalg.yield %6 : f32
        } -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_8 {
    flow.executable.export public @main_dispatch_8 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_8(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<2x17x17xf32>
        %2 = linalg.softmax dimension(2) ins(%0 : tensor<2x17x17xf32>) outs(%1 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_9 {
    flow.executable.export public @main_dispatch_9 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_9(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<17x2x16xf32>
        %2 = tensor.empty() : tensor<2x17x16xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [2, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %5 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %3 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%4 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %6 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<2x17x16xf32>) outs(%1 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<17x2x16xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg2, offsets = [0, 0, 0], sizes = [17, 2, 16], strides = [1, 1, 1] : tensor<17x2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_10 {
    flow.executable.export public @main_dispatch_10 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_10(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>> -> tensor<32x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %5 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%4 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map5, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %5 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_11 {
    flow.executable.export public @main_dispatch_11 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_11(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<17x32xf32>, tensor<17xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %6 = arith.divf %in_1, %cst_0 : f32
          %7 = arith.subf %in, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_12 {
    flow.executable.export public @main_dispatch_12 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_12(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_13 {
    flow.executable.export public @main_dispatch_13 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_13(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.000000e+00 : f32
        %cst_1 = arith.constant 4.471500e-02 : f32
        %cst_2 = arith.constant 0.797884523 : f32
        %cst_3 = arith.constant 1.000000e+00 : f32
        %cst_4 = arith.constant 5.000000e-01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
        %3 = tensor.empty() : tensor<17x64xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %5 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %out: f32):
          %7 = arith.addf %in, %in_5 : f32
          %8 = math.powf %7, %cst_0 : f32
          %9 = arith.mulf %8, %cst_1 : f32
          %10 = arith.addf %7, %9 : f32
          %11 = arith.mulf %10, %cst_2 : f32
          %12 = math.tanh %11 : f32
          %13 = arith.addf %12, %cst_3 : f32
          %14 = arith.mulf %7, %cst_4 : f32
          %15 = arith.mulf %14, %13 : f32
          linalg.yield %15 : f32
        } -> tensor<17x64xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_14 {
    flow.executable.export public @main_dispatch_14 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_14(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg4: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg3, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = tensor.empty() : tensor<17x32xf32>
        %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%4 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %6 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%5 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %3 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%4 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %8 = arith.addf %in_0, %in_1 : f32
          %9 = arith.addf %in, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %arg4, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_15 {
    flow.executable.export public @main_dispatch_15 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_15(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<17x32xf32>, tensor<17xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %6 = arith.divf %in_1, %cst_0 : f32
          %7 = arith.subf %in, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_16 {
    flow.executable.export public @main_dispatch_16 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_16(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_17 {
    flow.executable.export public @main_dispatch_17 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_17(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [96, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>> -> tensor<96x32xf32>
        %2 = tensor.empty() : tensor<17x96xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<17x96xf32>) -> tensor<17x96xf32>
        %4 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%3 : tensor<17x96xf32>) -> tensor<17x96xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0], sizes = [17, 96], strides = [1, 1] : tensor<17x96xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_18 {
    flow.executable.export public @main_dispatch_18 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_18(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [17, 6, 16], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>> -> tensor<17x6x16xf32>
        %1 = tensor.empty() : tensor<6x17x16xf32>
        %2 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<17x6x16xf32>) outs(%1 : tensor<6x17x16xf32>) {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<6x17x16xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [6, 17, 16], strides = [1, 1, 1] : tensor<6x17x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_19 {
    flow.executable.export public @main_dispatch_19 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_19(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 4.000000e+00 : f32
        %0 = tensor.empty() : tensor<2x17x17xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [1, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%0 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %4 = linalg.batch_matmul indexing_maps = [#map11, #map12, #map13] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%2, %1 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%3 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %5 = linalg.generic {indexing_maps = [#map9, #map9], iterator_types = ["parallel", "parallel", "parallel"]} ins(%4 : tensor<2x17x17xf32>) outs(%0 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.divf %in, %cst_0 : f32
          linalg.yield %6 : f32
        } -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_20 {
    flow.executable.export public @main_dispatch_20 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_20(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<2x17x17xf32>
        %2 = linalg.softmax dimension(2) ins(%0 : tensor<2x17x17xf32>) outs(%1 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_21 {
    flow.executable.export public @main_dispatch_21 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_21(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<17x2x16xf32>
        %2 = tensor.empty() : tensor<2x17x16xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [2, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %5 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %3 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%4 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %6 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<2x17x16xf32>) outs(%1 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<17x2x16xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg2, offsets = [0, 0, 0], sizes = [17, 2, 16], strides = [1, 1, 1] : tensor<17x2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_22 {
    flow.executable.export public @main_dispatch_22 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_22(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>> -> tensor<32x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %5 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%4 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map5, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %5 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_23 {
    flow.executable.export public @main_dispatch_23 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_23(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<17x32xf32>, tensor<17xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %6 = arith.divf %in_1, %cst_0 : f32
          %7 = arith.subf %in, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_24 {
    flow.executable.export public @main_dispatch_24 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_24(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_25 {
    flow.executable.export public @main_dispatch_25 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_25(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.000000e+00 : f32
        %cst_1 = arith.constant 4.471500e-02 : f32
        %cst_2 = arith.constant 0.797884523 : f32
        %cst_3 = arith.constant 1.000000e+00 : f32
        %cst_4 = arith.constant 5.000000e-01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
        %3 = tensor.empty() : tensor<17x64xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %5 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %out: f32):
          %7 = arith.addf %in, %in_5 : f32
          %8 = math.powf %7, %cst_0 : f32
          %9 = arith.mulf %8, %cst_1 : f32
          %10 = arith.addf %7, %9 : f32
          %11 = arith.mulf %10, %cst_2 : f32
          %12 = math.tanh %11 : f32
          %13 = arith.addf %12, %cst_3 : f32
          %14 = arith.mulf %7, %cst_4 : f32
          %15 = arith.mulf %14, %13 : f32
          linalg.yield %15 : f32
        } -> tensor<17x64xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_26 {
    flow.executable.export public @main_dispatch_26 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_26(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %2 = tensor.empty() : tensor<17x32xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %4 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%3 : tensor<17x32xf32>) -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_27 {
    flow.executable.export public @main_dispatch_27 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_27(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %4 = linalg.generic {indexing_maps = [#map7, #map7, #map7, #map7], iterator_types = ["parallel"]} ins(%3, %2, %0 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %5 = arith.addf %in_0, %in_1 : f32
          %6 = arith.addf %in, %5 : f32
          linalg.yield %6 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg3, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_28 {
    flow.executable.export public @main_dispatch_28 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_28(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<f32>
        %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<f32>) -> tensor<f32>
        %3 = linalg.generic {indexing_maps = [#map7, #map14], iterator_types = ["reduction"]} ins(%0 : tensor<32xf32>) outs(%2 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %4 = arith.addf %out, %in : f32
          linalg.yield %4 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_29 {
    flow.executable.export public @main_dispatch_29 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_29(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %cst = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %2 = tensor.empty() : tensor<32xf32>
        %3 = linalg.generic {indexing_maps = [#map7, #map14, #map7], iterator_types = ["parallel"]} ins(%0, %1 : tensor<32xf32>, tensor<f32>) outs(%2 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %4 = arith.divf %in_0, %cst : f32
          %5 = arith.subf %in, %4 : f32
          linalg.yield %5 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_30 {
    flow.executable.export public @main_dispatch_30 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_30(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<f32>
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<f32>) -> tensor<f32>
        %3 = linalg.generic {indexing_maps = [#map7, #map14], iterator_types = ["reduction"]} ins(%0 : tensor<32xf32>) outs(%2 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %4 = math.powf %in, %cst : f32
          %5 = arith.addf %out, %4 : f32
          linalg.yield %5 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_31 {
    flow.executable.export public @main_dispatch_31 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_31(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %cst = arith.constant 3.200000e+01 : f32
        %cst_0 = arith.constant 9.99999997E-7 : f32
        %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
        %cst_2 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %2 = tensor.empty() : tensor<32xf32>
        %3 = linalg.generic {indexing_maps = [#map7, #map14, #map7, #map7, #map7], iterator_types = ["parallel"]} ins(%0, %1, %cst_1, %cst_2 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%2 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
          %4 = arith.divf %in_3, %cst : f32
          %5 = arith.addf %4, %cst_0 : f32
          %6 = math.sqrt %5 : f32
          %7 = arith.divf %in, %6 : f32
          %8 = arith.mulf %7, %in_4 : f32
          %9 = arith.addf %8, %in_5 : f32
          linalg.yield %9 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_32 {
    flow.executable.export public @main_dispatch_32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 10], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>> -> tensor<32x10xf32>
        %2 = tensor.empty() : tensor<10xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<10xf32>) -> tensor<10xf32>
        %4 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<32xf32>, tensor<32x10xf32>) outs(%3 : tensor<10xf32>) -> tensor<10xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0], sizes = [10], strides = [1] : tensor<10xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        return
      }
    }
  }
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
    %cst_0 = arith.constant dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
    %cst_1 = arith.constant dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
    %cst_2 = arith.constant dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
    %cst_3 = arith.constant dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
    %cst_4 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %cst_5 = arith.constant dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
    %cst_6 = arith.constant dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
    %cst_7 = arith.constant dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
    %cst_8 = arith.constant dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : tensor<32xf32>
    %__hoisted_tensor_1x17x32xf32 = util.global.load immutable @__hoisted_tensor_1x17x32xf32 : tensor<1x17x32xf32>
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
    %__hoisted_tensor_32xf32_0 = util.global.load immutable @__hoisted_tensor_32xf32_0 : tensor<32xf32>
    %__hoisted_tensor_64xf32_1 = util.global.load immutable @__hoisted_tensor_64xf32_1 : tensor<64xf32>
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : tensor<32xf32>
    %__hoisted_tensor_32x10xf32 = util.global.load immutable @__hoisted_tensor_32x10xf32 : tensor<32x10xf32>
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x32x32x3xf32>
    %1 = flow.tensor.reshape %0 : tensor<1x32x32x3xf32> -> tensor<4x8x4x24xf32>
    %2 = flow.dispatch @main_dispatch_0::@main_dispatch_0(%1) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<4x8x4x24xf32>) -> tensor<4x4x8x24xf32>
    %3 = flow.tensor.reshape %2 : tensor<4x4x8x24xf32> -> tensor<16x192xf32>
    %4 = flow.dispatch @main_dispatch_1::@main_dispatch_1(%3, %cst_8, %__hoisted_tensor_32xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<16x192xf32>, tensor<32x192xf32>, tensor<32xf32>) -> tensor<16x32xf32>
    %5 = flow.tensor.reshape %4 : tensor<16x32xf32> -> tensor<1x16x32xf32>
    %6 = flow.tensor.update %5, %__hoisted_tensor_1x17x32xf32[%c0, %c1, %c0] : tensor<1x16x32xf32> -> %__hoisted_tensor_1x17x32xf32 as tensor<1x17x32xf32>
    %7 = flow.tensor.reshape %6 : tensor<1x17x32xf32> -> tensor<544xf32>
    %8 = flow.tensor.reshape %cst_7 : tensor<1x17x32xf32> -> tensor<544xf32>
    %9 = flow.dispatch @main_dispatch_2::@main_dispatch_2(%7, %8) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<544xf32>, tensor<544xf32>) -> tensor<544xf32>
    %10 = flow.tensor.reshape %9 : tensor<544xf32> -> tensor<17x32xf32>
    %11 = flow.dispatch @main_dispatch_3::@main_dispatch_3(%10) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %12 = flow.dispatch @main_dispatch_4::@main_dispatch_4(%11) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %13 = flow.dispatch @main_dispatch_5::@main_dispatch_5(%12, %cst_6) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<96x32xf32>) -> tensor<17x96xf32>
    %14 = flow.tensor.reshape %13 : tensor<17x96xf32> -> tensor<17x6x16xf32>
    %15 = flow.dispatch @main_dispatch_6::@main_dispatch_6(%14) : (tensor<17x6x16xf32>) -> tensor<6x17x16xf32>
    %16 = flow.tensor.reshape %15 : tensor<6x17x16xf32> -> tensor<3x1x2x17x16xf32>
    %17 = flow.dispatch @main_dispatch_7::@main_dispatch_7(%16) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>) -> tensor<2x17x17xf32>
    %18 = flow.dispatch @main_dispatch_8::@main_dispatch_8(%17) : (tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %19 = flow.dispatch @main_dispatch_9::@main_dispatch_9(%16, %18) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>, tensor<2x17x17xf32>) -> tensor<17x2x16xf32>
    %20 = flow.tensor.reshape %19 : tensor<17x2x16xf32> -> tensor<17x32xf32>
    %21 = flow.dispatch @main_dispatch_10::@main_dispatch_10(%20, %cst_5, %10) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<32x32xf32>, tensor<17x32xf32>) -> tensor<17x32xf32>
    %22 = flow.dispatch @main_dispatch_11::@main_dispatch_11(%21) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %23 = flow.dispatch @main_dispatch_12::@main_dispatch_12(%22) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %24 = flow.dispatch @main_dispatch_13::@main_dispatch_13(%23, %cst_4, %__hoisted_tensor_64xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
    %25 = flow.dispatch @main_dispatch_14::@main_dispatch_14(%24, %cst_3, %21, %__hoisted_tensor_32xf32_0) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x64xf32>, tensor<32x64xf32>, tensor<17x32xf32>, tensor<32xf32>) -> tensor<17x32xf32>
    %26 = flow.dispatch @main_dispatch_15::@main_dispatch_15(%25) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %27 = flow.dispatch @main_dispatch_16::@main_dispatch_16(%26) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %28 = flow.dispatch @main_dispatch_17::@main_dispatch_17(%27, %cst_2) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<96x32xf32>) -> tensor<17x96xf32>
    %29 = flow.tensor.reshape %28 : tensor<17x96xf32> -> tensor<17x6x16xf32>
    %30 = flow.dispatch @main_dispatch_18::@main_dispatch_18(%29) : (tensor<17x6x16xf32>) -> tensor<6x17x16xf32>
    %31 = flow.tensor.reshape %30 : tensor<6x17x16xf32> -> tensor<3x1x2x17x16xf32>
    %32 = flow.dispatch @main_dispatch_19::@main_dispatch_19(%31) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>) -> tensor<2x17x17xf32>
    %33 = flow.dispatch @main_dispatch_20::@main_dispatch_20(%32) : (tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %34 = flow.dispatch @main_dispatch_21::@main_dispatch_21(%31, %33) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>, tensor<2x17x17xf32>) -> tensor<17x2x16xf32>
    %35 = flow.tensor.reshape %34 : tensor<17x2x16xf32> -> tensor<17x32xf32>
    %36 = flow.dispatch @main_dispatch_22::@main_dispatch_22(%35, %cst_1, %25) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<32x32xf32>, tensor<17x32xf32>) -> tensor<17x32xf32>
    %37 = flow.tensor.reshape %36 : tensor<17x32xf32> -> tensor<1x17x32xf32>
    %38 = flow.dispatch @main_dispatch_23::@main_dispatch_23(%36) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %39 = flow.dispatch @main_dispatch_24::@main_dispatch_24(%38) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %40 = flow.dispatch @main_dispatch_25::@main_dispatch_25(%39, %cst_0, %__hoisted_tensor_64xf32_1) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
    %41 = flow.dispatch @main_dispatch_26::@main_dispatch_26(%40, %cst) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x64xf32>, tensor<32x64xf32>) -> tensor<17x32xf32>
    %42 = flow.tensor.reshape %41 : tensor<17x32xf32> -> tensor<1x17x32xf32>
    %43 = flow.dispatch @main_dispatch_27::@main_dispatch_27(%42, %37, %__hoisted_tensor_32xf32_2) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<1x17x32xf32>, tensor<1x17x32xf32>, tensor<32xf32>) -> tensor<32xf32>
    %44 = flow.dispatch @main_dispatch_28::@main_dispatch_28(%43) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>) -> tensor<f32>
    %45 = flow.dispatch @main_dispatch_29::@main_dispatch_29(%43, %44) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>, tensor<f32>) -> tensor<32xf32>
    %46 = flow.dispatch @main_dispatch_30::@main_dispatch_30(%45) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>) -> tensor<f32>
    %47 = flow.dispatch @main_dispatch_31::@main_dispatch_31(%45, %46) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>, tensor<f32>) -> tensor<32xf32>
    %48 = flow.dispatch @main_dispatch_32::@main_dispatch_32(%47, %__hoisted_tensor_32x10xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<32xf32>, tensor<32x10xf32>) -> tensor<10xf32>
    %49 = flow.tensor.reshape %48 : tensor<10xf32> -> tensor<1x10xf32>
    %50 = hal.tensor.export %49 "output0" : tensor<1x10xf32> -> !hal.buffer_view
    util.return %50 : !hal.buffer_view
  }
}

{-#

#-}


