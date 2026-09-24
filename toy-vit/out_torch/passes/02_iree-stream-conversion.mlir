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
  util.global private @__hoisted_tensor_32xf32 : !stream.resource<constant>
  util.global private @__hoisted_tensor_32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_32xf32 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_32xf32__size : index
    util.return
  }
  util.global private @__hoisted_tensor_1x17x32xf32 : !stream.resource<constant>
  util.global private @__hoisted_tensor_1x17x32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant : tensor<1x17x32xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<1x17x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_1x17x32xf32 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_1x17x32xf32__size : index
    util.return
  }
  util.global private @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.global private @__hoisted_tensor_64xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<64xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_64xf32 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_64xf32__size : index
    util.return
  }
  util.global private @__hoisted_tensor_32xf32_0 : !stream.resource<constant>
  util.global private @__hoisted_tensor_32xf32_0__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_32xf32_0 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_32xf32_0__size : index
    util.return
  }
  util.global private @__hoisted_tensor_64xf32_1 : !stream.resource<constant>
  util.global private @__hoisted_tensor_64xf32_1__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<64xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_64xf32_1 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_64xf32_1__size : index
    util.return
  }
  util.global private @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
  util.global private @__hoisted_tensor_32xf32_2__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_0>) : tensor<32xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_32xf32_2__size : index
    util.return
  }
  util.global private @__hoisted_tensor_32x10xf32 : !stream.resource<constant>
  util.global private @__hoisted_tensor_32x10xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x10xf32> in !stream.resource<constant> = dense_resource<__elided__> : tensor<32x10xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__hoisted_tensor_32x10xf32 : !stream.resource<constant>
    util.global.store %0, @__hoisted_tensor_32x10xf32__size : index
    util.return
  }
  stream.executable private @main_dispatch_0 {
    stream.executable.export public @main_dispatch_0_transpose_4x8x4x24_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_0_transpose_4x8x4x24_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0, 0], sizes = [4, 8, 4, 24], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>> -> tensor<4x8x4x24xf32>
        %3 = tensor.empty() : tensor<4x4x8x24xf32>
        %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%2 : tensor<4x8x4x24xf32>) outs(%3 : tensor<4x4x8x24xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<4x4x8x24xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0, 0], sizes = [4, 4, 8, 24], strides = [1, 1, 1, 1] : tensor<4x4x8x24xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_1 {
    stream.executable.export public @main_dispatch_1_matmul_16x32x192_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_1_matmul_16x32x192_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>> -> tensor<16x192xf32>
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>> -> tensor<32x192xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %7 = tensor.empty() : tensor<16x32xf32>
        %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%7 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %9 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %5 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%8 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %10 = linalg.generic {indexing_maps = [#map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%9, %6 : tensor<16x32xf32>, tensor<32xf32>) outs(%7 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %11 = arith.addf %in, %in_0 : f32
          linalg.yield %11 : f32
        } -> tensor<16x32xf32>
        iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [16, 32], strides = [1, 1] : tensor<16x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_2 {
    stream.executable.export public @main_dispatch_2_elementwise_544_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_2_elementwise_544_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %5 = tensor.empty() : tensor<544xf32>
        %6 = linalg.generic {indexing_maps = [#map7, #map7, #map7], iterator_types = ["parallel"]} ins(%3, %4 : tensor<544xf32>, tensor<544xf32>) outs(%5 : tensor<544xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<544xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [544], strides = [1] : tensor<544xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_3 {
    stream.executable.export public @main_dispatch_3_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_3_reduction_17x32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = arith.addf %out, %in : f32
          linalg.yield %8 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map8, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6 : tensor<17x32xf32>, tensor<17xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %8 = arith.divf %in_1, %cst_0 : f32
          %9 = arith.subf %in, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_4 {
    stream.executable.export public @main_dispatch_4_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_4_reduction_17x32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_5 {
    stream.executable.export public @main_dispatch_5_matmul_17x96x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_5_matmul_17x96x32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [96, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>> -> tensor<96x32xf32>
        %5 = tensor.empty() : tensor<17x96xf32>
        %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<17x96xf32>) -> tensor<17x96xf32>
        %7 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%6 : tensor<17x96xf32>) -> tensor<17x96xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0], sizes = [17, 96], strides = [1, 1] : tensor<17x96xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_6 {
    stream.executable.export public @main_dispatch_6_transpose_17x6x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_6_transpose_17x6x16_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [17, 6, 16], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>> -> tensor<17x6x16xf32>
        %3 = tensor.empty() : tensor<6x17x16xf32>
        %4 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%2 : tensor<17x6x16xf32>) outs(%3 : tensor<6x17x16xf32>) {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<6x17x16xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0], sizes = [6, 17, 16], strides = [1, 1, 1] : tensor<6x17x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_7 {
    stream.executable.export public @main_dispatch_7_batch_matmul_2x17x17x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_7_batch_matmul_2x17x17x16_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 4.000000e+00 : f32
        %2 = tensor.empty() : tensor<2x17x17xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [1, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %6 = linalg.batch_matmul indexing_maps = [#map11, #map12, #map13] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %3 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%5 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %7 = linalg.generic {indexing_maps = [#map9, #map9], iterator_types = ["parallel", "parallel", "parallel"]} ins(%6 : tensor<2x17x17xf32>) outs(%2 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = arith.divf %in, %cst_0 : f32
          linalg.yield %8 : f32
        } -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_8 {
    stream.executable.export public @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %3 = tensor.empty() : tensor<2x17x17xf32>
        %4 = linalg.softmax dimension(2) ins(%2 : tensor<2x17x17xf32>) outs(%3 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_9 {
    stream.executable.export public @main_dispatch_9_batch_matmul_2x17x16x17_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_9_batch_matmul_2x17x16x17_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %3 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %4 = tensor.empty() : tensor<17x2x16xf32>
        %5 = tensor.empty() : tensor<2x17x16xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [2, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %7 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %8 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %6 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%7 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %9 = linalg.generic {indexing_maps = [#map9, #map10], iterator_types = ["parallel", "parallel", "parallel"]} ins(%8 : tensor<2x17x16xf32>) outs(%4 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<17x2x16xf32>
        iree_tensor_ext.dispatch.tensor.store %9, %2, offsets = [0, 0, 0], sizes = [17, 2, 16], strides = [1, 1, 1] : tensor<17x2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_10 {
    stream.executable.export public @main_dispatch_10_matmul_17x32x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_10_matmul_17x32x32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>> -> tensor<32x32xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %7 = tensor.empty() : tensor<17x32xf32>
        %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%7 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %9 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %5 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%8 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %10 = linalg.generic {indexing_maps = [#map5, #map5, #map5], iterator_types = ["parallel", "parallel"]} ins(%6, %9 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%7 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %11 = arith.addf %in, %in_0 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_12 {
    stream.executable.export public @main_dispatch_12_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_12_reduction_17x32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_13 {
    stream.executable.export public @main_dispatch_13_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_13_matmul_17x64x32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.000000e+00 : f32
        %cst_1 = arith.constant 4.471500e-02 : f32
        %cst_2 = arith.constant 0.797884523 : f32
        %cst_3 = arith.constant 1.000000e+00 : f32
        %cst_4 = arith.constant 5.000000e-01 : f32
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
        %7 = tensor.empty() : tensor<17x64xf32>
        %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%7 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %9 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %5 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%8 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %10 = linalg.generic {indexing_maps = [#map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%9, %6 : tensor<17x64xf32>, tensor<64xf32>) outs(%7 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %out: f32):
          %11 = arith.addf %in, %in_5 : f32
          %12 = math.powf %11, %cst_0 : f32
          %13 = arith.mulf %12, %cst_1 : f32
          %14 = arith.addf %11, %13 : f32
          %15 = arith.mulf %14, %cst_2 : f32
          %16 = math.tanh %15 : f32
          %17 = arith.addf %16, %cst_3 : f32
          %18 = arith.mulf %11, %cst_4 : f32
          %19 = arith.mulf %18, %17 : f32
          linalg.yield %19 : f32
        } -> tensor<17x64xf32>
        iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_14 {
    stream.executable.export public @main_dispatch_14_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_14_matmul_17x32x64_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding, %arg4: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %4 = stream.binding.subspan %arg4[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %5 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %8 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %9 = tensor.empty() : tensor<17x32xf32>
        %10 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%9 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %11 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%5, %6 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%10 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %12 = linalg.generic {indexing_maps = [#map5, #map5, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%7, %11, %8 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %13 = arith.addf %in_0, %in_1 : f32
          %14 = arith.addf %in, %13 : f32
          linalg.yield %14 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %12, %4, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_16 {
    stream.executable.export public @main_dispatch_16_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_16_reduction_17x32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_24 {
    stream.executable.export public @main_dispatch_24_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_24_reduction_17x32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [#map5, #map8], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [#map5, #map8, #map6, #map6, #map5], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_26 {
    stream.executable.export public @main_dispatch_26_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_26_matmul_17x32x64_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %5 = tensor.empty() : tensor<17x32xf32>
        %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %7 = linalg.matmul indexing_maps = [#map2, #map3, #map4] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%6 : tensor<17x32xf32>) -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_27 {
    stream.executable.export public @main_dispatch_27_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_27_elementwise_32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding, %arg3: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %4 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %8 = linalg.generic {indexing_maps = [#map7, #map7, #map7, #map7], iterator_types = ["parallel"]} ins(%7, %6, %4 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %9 = arith.addf %in_0, %in_1 : f32
          %10 = arith.addf %in, %9 : f32
          linalg.yield %10 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %8, %3, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_28 {
    stream.executable.export public @main_dispatch_28_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_28_reduction_32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        %cst = arith.constant 0.000000e+00 : f32
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<f32>
        %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<f32>) -> tensor<f32>
        %5 = linalg.generic {indexing_maps = [#map7, #map14], iterator_types = ["reduction"]} ins(%2 : tensor<32xf32>) outs(%4 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %5, %1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_29 {
    stream.executable.export public @main_dispatch_29_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_29_elementwise_32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %cst = arith.constant 3.200000e+01 : f32
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = linalg.generic {indexing_maps = [#map7, #map14, #map7], iterator_types = ["parallel"]} ins(%3, %4 : tensor<32xf32>, tensor<f32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.divf %in_0, %cst : f32
          %8 = arith.subf %in, %7 : f32
          linalg.yield %8 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_30 {
    stream.executable.export public @main_dispatch_30_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_30_reduction_32_f32(%arg0: !stream.binding, %arg1: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<f32>
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<f32>) -> tensor<f32>
        %5 = linalg.generic {indexing_maps = [#map7, #map14], iterator_types = ["reduction"]} ins(%2 : tensor<32xf32>) outs(%4 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %5, %1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_31 {
    stream.executable.export public @main_dispatch_31_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_31_elementwise_32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %cst = arith.constant 3.200000e+01 : f32
        %cst_0 = arith.constant 9.99999997E-7 : f32
        %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
        %cst_2 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = linalg.generic {indexing_maps = [#map7, #map14, #map7, #map7, #map7], iterator_types = ["parallel"]} ins(%3, %4, %cst_1, %cst_2 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
          %7 = arith.divf %in_3, %cst : f32
          %8 = arith.addf %7, %cst_0 : f32
          %9 = math.sqrt %8 : f32
          %10 = arith.divf %in, %9 : f32
          %11 = arith.mulf %10, %in_4 : f32
          %12 = arith.addf %11, %in_5 : f32
          linalg.yield %12 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_32 {
    stream.executable.export public @main_dispatch_32_vecmat_10x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_32_vecmat_10x32_f32(%arg0: !stream.binding, %arg1: !stream.binding, %arg2: !stream.binding) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        %cst = arith.constant 0.000000e+00 : f32
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 10], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>> -> tensor<32x10xf32>
        %5 = tensor.empty() : tensor<10xf32>
        %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<10xf32>) -> tensor<10xf32>
        %7 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<32xf32>, tensor<32x10xf32>) outs(%6 : tensor<10xf32>) -> tensor<10xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0], sizes = [10], strides = [1] : tensor<10xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        return
      }
    }
  }
  util.global private @__constant_tensor_32x64xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_32x64xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x64xf32> in !stream.resource<constant> = dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_32x64xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_32x64xf32__size : index
    util.return
  }
  util.global private @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_64x32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_64x32xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_64x32xf32__size : index
    util.return
  }
  util.global private @__constant_tensor_32x32xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_32x32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_32x32xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_32x32xf32__size : index
    util.return
  }
  util.global private @__constant_tensor_96x32xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_96x32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<96x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_96x32xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_96x32xf32__size : index
    util.return
  }
  util.global private @__constant_tensor_32x64xf32_0 : !stream.resource<constant>
  util.global private @__constant_tensor_32x64xf32_0__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x64xf32> in !stream.resource<constant> = dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_32x64xf32_0 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_32x64xf32_0__size : index
    util.return
  }
  util.global private @__constant_tensor_64x32xf32_1 : !stream.resource<constant>
  util.global private @__constant_tensor_64x32xf32_1__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<64x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_64x32xf32_1 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_64x32xf32_1__size : index
    util.return
  }
  util.global private @__constant_tensor_32x32xf32_2 : !stream.resource<constant>
  util.global private @__constant_tensor_32x32xf32_2__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_32x32xf32_2 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_32x32xf32_2__size : index
    util.return
  }
  util.global private @__constant_tensor_96x32xf32_3 : !stream.resource<constant>
  util.global private @__constant_tensor_96x32xf32_3__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<96x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_96x32xf32_3 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_96x32xf32_3__size : index
    util.return
  }
  util.global private @__constant_tensor_1x17x32xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_1x17x32xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_0>) : tensor<1x17x32xf32> in !stream.resource<constant> = dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_1x17x32xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_1x17x32xf32__size : index
    util.return
  }
  util.global private @__constant_tensor_32x192xf32 : !stream.resource<constant>
  util.global private @__constant_tensor_32x192xf32__size : index
  util.initializer {
    %cst = stream.tensor.constant on(#hal.device.affinity<@__device_1>) : tensor<32x192xf32> in !stream.resource<constant> = dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
    %0 = stream.resource.size %cst : !stream.resource<constant>
    util.global.store %cst, @__constant_tensor_32x192xf32 : !stream.resource<constant>
    util.global.store %0, @__constant_tensor_32x192xf32__size : index
    util.return
  }
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %__constant_tensor_32x64xf32 = util.global.load @__constant_tensor_32x64xf32 : !stream.resource<constant>
    %__constant_tensor_32x64xf32__size = util.global.load @__constant_tensor_32x64xf32__size : index
    %0 = stream.async.transfer %__constant_tensor_32x64xf32 : !stream.resource<constant>{%__constant_tensor_32x64xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_32x64xf32__size}
    %__constant_tensor_64x32xf32 = util.global.load @__constant_tensor_64x32xf32 : !stream.resource<constant>
    %__constant_tensor_64x32xf32__size = util.global.load @__constant_tensor_64x32xf32__size : index
    %1 = stream.async.transfer %__constant_tensor_64x32xf32 : !stream.resource<constant>{%__constant_tensor_64x32xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_64x32xf32__size}
    %__constant_tensor_32x32xf32 = util.global.load @__constant_tensor_32x32xf32 : !stream.resource<constant>
    %__constant_tensor_32x32xf32__size = util.global.load @__constant_tensor_32x32xf32__size : index
    %2 = stream.async.transfer %__constant_tensor_32x32xf32 : !stream.resource<constant>{%__constant_tensor_32x32xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_32x32xf32__size}
    %__constant_tensor_96x32xf32 = util.global.load @__constant_tensor_96x32xf32 : !stream.resource<constant>
    %__constant_tensor_96x32xf32__size = util.global.load @__constant_tensor_96x32xf32__size : index
    %3 = stream.async.transfer %__constant_tensor_96x32xf32 : !stream.resource<constant>{%__constant_tensor_96x32xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_96x32xf32__size}
    %__constant_tensor_32x64xf32_0 = util.global.load @__constant_tensor_32x64xf32_0 : !stream.resource<constant>
    %__constant_tensor_32x64xf32_0__size = util.global.load @__constant_tensor_32x64xf32_0__size : index
    %4 = stream.async.transfer %__constant_tensor_32x64xf32_0 : !stream.resource<constant>{%__constant_tensor_32x64xf32_0__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_32x64xf32_0__size}
    %__constant_tensor_64x32xf32_1 = util.global.load @__constant_tensor_64x32xf32_1 : !stream.resource<constant>
    %__constant_tensor_64x32xf32_1__size = util.global.load @__constant_tensor_64x32xf32_1__size : index
    %5 = stream.async.transfer %__constant_tensor_64x32xf32_1 : !stream.resource<constant>{%__constant_tensor_64x32xf32_1__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_64x32xf32_1__size}
    %__constant_tensor_32x32xf32_2 = util.global.load @__constant_tensor_32x32xf32_2 : !stream.resource<constant>
    %__constant_tensor_32x32xf32_2__size = util.global.load @__constant_tensor_32x32xf32_2__size : index
    %6 = stream.async.transfer %__constant_tensor_32x32xf32_2 : !stream.resource<constant>{%__constant_tensor_32x32xf32_2__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_32x32xf32_2__size}
    %__constant_tensor_96x32xf32_3 = util.global.load @__constant_tensor_96x32xf32_3 : !stream.resource<constant>
    %__constant_tensor_96x32xf32_3__size = util.global.load @__constant_tensor_96x32xf32_3__size : index
    %7 = stream.async.transfer %__constant_tensor_96x32xf32_3 : !stream.resource<constant>{%__constant_tensor_96x32xf32_3__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_96x32xf32_3__size}
    %__constant_tensor_1x17x32xf32 = util.global.load @__constant_tensor_1x17x32xf32 : !stream.resource<constant>
    %__constant_tensor_1x17x32xf32__size = util.global.load @__constant_tensor_1x17x32xf32__size : index
    %8 = stream.async.transfer %__constant_tensor_1x17x32xf32 : !stream.resource<constant>{%__constant_tensor_1x17x32xf32__size} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%__constant_tensor_1x17x32xf32__size}
    %__constant_tensor_32x192xf32 = util.global.load @__constant_tensor_32x192xf32 : !stream.resource<constant>
    %__constant_tensor_32x192xf32__size = util.global.load @__constant_tensor_32x192xf32__size : index
    %9 = stream.async.transfer %__constant_tensor_32x192xf32 : !stream.resource<constant>{%__constant_tensor_32x192xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__constant_tensor_32x192xf32__size}
    %__hoisted_tensor_32xf32 = util.global.load @__hoisted_tensor_32xf32 : !stream.resource<constant>
    %__hoisted_tensor_32xf32__size = util.global.load @__hoisted_tensor_32xf32__size : index
    %10 = stream.async.transfer %__hoisted_tensor_32xf32 : !stream.resource<constant>{%__hoisted_tensor_32xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__hoisted_tensor_32xf32__size}
    %__hoisted_tensor_1x17x32xf32 = util.global.load @__hoisted_tensor_1x17x32xf32 : !stream.resource<constant>
    %__hoisted_tensor_1x17x32xf32__size = util.global.load @__hoisted_tensor_1x17x32xf32__size : index
    %11 = stream.async.transfer %__hoisted_tensor_1x17x32xf32 : !stream.resource<constant>{%__hoisted_tensor_1x17x32xf32__size} -> !stream.resource<*>{%__hoisted_tensor_1x17x32xf32__size}
    %__hoisted_tensor_64xf32 = util.global.load @__hoisted_tensor_64xf32 : !stream.resource<constant>
    %__hoisted_tensor_64xf32__size = util.global.load @__hoisted_tensor_64xf32__size : index
    %12 = stream.async.transfer %__hoisted_tensor_64xf32 : !stream.resource<constant>{%__hoisted_tensor_64xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__hoisted_tensor_64xf32__size}
    %__hoisted_tensor_32xf32_0 = util.global.load @__hoisted_tensor_32xf32_0 : !stream.resource<constant>
    %__hoisted_tensor_32xf32_0__size = util.global.load @__hoisted_tensor_32xf32_0__size : index
    %13 = stream.async.transfer %__hoisted_tensor_32xf32_0 : !stream.resource<constant>{%__hoisted_tensor_32xf32_0__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__hoisted_tensor_32xf32_0__size}
    %__hoisted_tensor_64xf32_1 = util.global.load @__hoisted_tensor_64xf32_1 : !stream.resource<constant>
    %__hoisted_tensor_64xf32_1__size = util.global.load @__hoisted_tensor_64xf32_1__size : index
    %14 = stream.async.transfer %__hoisted_tensor_64xf32_1 : !stream.resource<constant>{%__hoisted_tensor_64xf32_1__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__hoisted_tensor_64xf32_1__size}
    %__hoisted_tensor_32xf32_2 = util.global.load @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
    %__hoisted_tensor_32xf32_2__size = util.global.load @__hoisted_tensor_32xf32_2__size : index
    %15 = stream.async.transfer %__hoisted_tensor_32xf32_2 : !stream.resource<constant>{%__hoisted_tensor_32xf32_2__size} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%__hoisted_tensor_32xf32_2__size}
    %__hoisted_tensor_32x10xf32 = util.global.load @__hoisted_tensor_32x10xf32 : !stream.resource<constant>
    %__hoisted_tensor_32x10xf32__size = util.global.load @__hoisted_tensor_32x10xf32__size : index
    %16 = stream.async.transfer %__hoisted_tensor_32x10xf32 : !stream.resource<constant>{%__hoisted_tensor_32x10xf32__size} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%__hoisted_tensor_32x10xf32__size}
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    %c1_0 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c32_1 = arith.constant 32 : index
    %c3 = arith.constant 3 : index
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c1_0, %c32, %c32_1, %c3]) type(%element_type_f32) encoding(%dense_row_major)
    %17 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<1x32x32x3xf32> : index
    %18 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<1x32x32x3xf32> in !stream.resource<external>{%17}
    %19 = stream.async.transfer %18 : !stream.resource<external>{%17} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%17}
    %20 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<4x8x4x24xf32> : index
    %21 = stream.tensor.clone on(#hal.device.affinity<@__device_0>) %19 : tensor<1x32x32x3xf32> in !stream.resource<*>{%17} -> tensor<4x8x4x24xf32> in !stream.resource<*>{%20}
    %22 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<4x4x8x24xf32> : index
    %23 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_0::@main_dispatch_0_transpose_4x8x4x24_f32(%21) : (tensor<4x8x4x24xf32> in !stream.resource<*>{%20}) -> tensor<4x4x8x24xf32> in !stream.resource<*>{%22}
    %24 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<16x192xf32> : index
    %25 = stream.tensor.clone on(#hal.device.affinity<@__device_0>) %23 : tensor<4x4x8x24xf32> in !stream.resource<*>{%22} -> tensor<16x192xf32> in !stream.resource<*>{%24}
    %26 = stream.async.transfer %25 : !stream.resource<*>{%24} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%24}
    %27 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<16x32xf32> : index
    %28 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_1::@main_dispatch_1_matmul_16x32x192_f32(%26, %9, %10) : (tensor<16x192xf32> in !stream.resource<*>{%24}, tensor<32x192xf32> in !stream.resource<*>{%__constant_tensor_32x192xf32__size}, tensor<32xf32> in !stream.resource<*>{%__hoisted_tensor_32xf32__size}) -> tensor<16x32xf32> in !stream.resource<*>{%27}
    %29 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<1x16x32xf32> : index
    %30 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %28 : tensor<16x32xf32> in !stream.resource<*>{%27} -> tensor<1x16x32xf32> in !stream.resource<*>{%29}
    %31 = stream.async.transfer %30 : !stream.resource<*>{%29} from(#hal.device.affinity<@__device_1>) -> !stream.resource<*>{%29}
    %32 = stream.tensor.update %31, %11[%c0, %c1, %c0] : tensor<1x16x32xf32> in !stream.resource<*>{%29} -> tensor<1x17x32xf32> in %11 as !stream.resource<*>{%__hoisted_tensor_1x17x32xf32__size}
    %33 = stream.tensor.sizeof tensor<544xf32> : index
    %34 = stream.tensor.clone %32 : tensor<1x17x32xf32> in !stream.resource<*>{%__hoisted_tensor_1x17x32xf32__size} -> tensor<544xf32> in !stream.resource<*>{%33}
    %35 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<544xf32> : index
    %36 = stream.tensor.clone on(#hal.device.affinity<@__device_0>) %8 : tensor<1x17x32xf32> in !stream.resource<*>{%__constant_tensor_1x17x32xf32__size} -> tensor<544xf32> in !stream.resource<*>{%35}
    %37 = stream.async.transfer %34 : !stream.resource<*>{%33} -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%33}
    %38 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<544xf32> : index
    %39 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_2::@main_dispatch_2_elementwise_544_f32(%37, %36) : (tensor<544xf32> in !stream.resource<*>{%33}, tensor<544xf32> in !stream.resource<*>{%35}) -> tensor<544xf32> in !stream.resource<*>{%38}
    %40 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %41 = stream.tensor.clone on(#hal.device.affinity<@__device_0>) %39 : tensor<544xf32> in !stream.resource<*>{%38} -> tensor<17x32xf32> in !stream.resource<*>{%40}
    %42 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %43 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%41) : (tensor<17x32xf32> in !stream.resource<*>{%40}) -> tensor<17x32xf32> in !stream.resource<*>{%42}
    %44 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %45 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_4::@main_dispatch_4_reduction_17x32_f32(%43) : (tensor<17x32xf32> in !stream.resource<*>{%42}) -> tensor<17x32xf32> in !stream.resource<*>{%44}
    %46 = stream.async.transfer %45 : !stream.resource<*>{%44} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%44}
    %47 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x96xf32> : index
    %48 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%46, %7) : (tensor<17x32xf32> in !stream.resource<*>{%44}, tensor<96x32xf32> in !stream.resource<*>{%__constant_tensor_96x32xf32_3__size}) -> tensor<17x96xf32> in !stream.resource<*>{%47}
    %49 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x6x16xf32> : index
    %50 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %48 : tensor<17x96xf32> in !stream.resource<*>{%47} -> tensor<17x6x16xf32> in !stream.resource<*>{%49}
    %51 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<6x17x16xf32> : index
    %52 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32(%50) : (tensor<17x6x16xf32> in !stream.resource<*>{%49}) -> tensor<6x17x16xf32> in !stream.resource<*>{%51}
    %53 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<3x1x2x17x16xf32> : index
    %54 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %52 : tensor<6x17x16xf32> in !stream.resource<*>{%51} -> tensor<3x1x2x17x16xf32> in !stream.resource<*>{%53}
    %55 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<2x17x17xf32> : index
    %56 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32(%54) : (tensor<3x1x2x17x16xf32> in !stream.resource<*>{%53}) -> tensor<2x17x17xf32> in !stream.resource<*>{%55}
    %57 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<2x17x17xf32> : index
    %58 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%56) : (tensor<2x17x17xf32> in !stream.resource<*>{%55}) -> tensor<2x17x17xf32> in !stream.resource<*>{%57}
    %59 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x2x16xf32> : index
    %60 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32(%54, %58) : (tensor<3x1x2x17x16xf32> in !stream.resource<*>{%53}, tensor<2x17x17xf32> in !stream.resource<*>{%57}) -> tensor<17x2x16xf32> in !stream.resource<*>{%59}
    %61 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %62 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %60 : tensor<17x2x16xf32> in !stream.resource<*>{%59} -> tensor<17x32xf32> in !stream.resource<*>{%61}
    %63 = stream.async.transfer %41 : !stream.resource<*>{%40} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%40}
    %64 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %65 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%62, %6, %63) : (tensor<17x32xf32> in !stream.resource<*>{%61}, tensor<32x32xf32> in !stream.resource<*>{%__constant_tensor_32x32xf32_2__size}, tensor<17x32xf32> in !stream.resource<*>{%40}) -> tensor<17x32xf32> in !stream.resource<*>{%64}
    %66 = stream.async.transfer %65 : !stream.resource<*>{%64} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%64}
    %67 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %68 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%66) : (tensor<17x32xf32> in !stream.resource<*>{%64}) -> tensor<17x32xf32> in !stream.resource<*>{%67}
    %69 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %70 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_12::@main_dispatch_12_reduction_17x32_f32(%68) : (tensor<17x32xf32> in !stream.resource<*>{%67}) -> tensor<17x32xf32> in !stream.resource<*>{%69}
    %71 = stream.async.transfer %70 : !stream.resource<*>{%69} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%69}
    %72 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x64xf32> : index
    %73 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%71, %5, %12) : (tensor<17x32xf32> in !stream.resource<*>{%69}, tensor<64x32xf32> in !stream.resource<*>{%__constant_tensor_64x32xf32_1__size}, tensor<64xf32> in !stream.resource<*>{%__hoisted_tensor_64xf32__size}) -> tensor<17x64xf32> in !stream.resource<*>{%72}
    %74 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %75 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_14::@main_dispatch_14_matmul_17x32x64_f32(%73, %4, %65, %13) : (tensor<17x64xf32> in !stream.resource<*>{%72}, tensor<32x64xf32> in !stream.resource<*>{%__constant_tensor_32x64xf32_0__size}, tensor<17x32xf32> in !stream.resource<*>{%64}, tensor<32xf32> in !stream.resource<*>{%__hoisted_tensor_32xf32_0__size}) -> tensor<17x32xf32> in !stream.resource<*>{%74}
    %76 = stream.async.transfer %75 : !stream.resource<*>{%74} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%74}
    %77 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %78 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%76) : (tensor<17x32xf32> in !stream.resource<*>{%74}) -> tensor<17x32xf32> in !stream.resource<*>{%77}
    %79 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %80 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_16::@main_dispatch_16_reduction_17x32_f32(%78) : (tensor<17x32xf32> in !stream.resource<*>{%77}) -> tensor<17x32xf32> in !stream.resource<*>{%79}
    %81 = stream.async.transfer %80 : !stream.resource<*>{%79} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%79}
    %82 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x96xf32> : index
    %83 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%81, %3) : (tensor<17x32xf32> in !stream.resource<*>{%79}, tensor<96x32xf32> in !stream.resource<*>{%__constant_tensor_96x32xf32__size}) -> tensor<17x96xf32> in !stream.resource<*>{%82}
    %84 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x6x16xf32> : index
    %85 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %83 : tensor<17x96xf32> in !stream.resource<*>{%82} -> tensor<17x6x16xf32> in !stream.resource<*>{%84}
    %86 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<6x17x16xf32> : index
    %87 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32(%85) : (tensor<17x6x16xf32> in !stream.resource<*>{%84}) -> tensor<6x17x16xf32> in !stream.resource<*>{%86}
    %88 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<3x1x2x17x16xf32> : index
    %89 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %87 : tensor<6x17x16xf32> in !stream.resource<*>{%86} -> tensor<3x1x2x17x16xf32> in !stream.resource<*>{%88}
    %90 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<2x17x17xf32> : index
    %91 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32(%89) : (tensor<3x1x2x17x16xf32> in !stream.resource<*>{%88}) -> tensor<2x17x17xf32> in !stream.resource<*>{%90}
    %92 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<2x17x17xf32> : index
    %93 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%91) : (tensor<2x17x17xf32> in !stream.resource<*>{%90}) -> tensor<2x17x17xf32> in !stream.resource<*>{%92}
    %94 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x2x16xf32> : index
    %95 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32(%89, %93) : (tensor<3x1x2x17x16xf32> in !stream.resource<*>{%88}, tensor<2x17x17xf32> in !stream.resource<*>{%92}) -> tensor<17x2x16xf32> in !stream.resource<*>{%94}
    %96 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %97 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %95 : tensor<17x2x16xf32> in !stream.resource<*>{%94} -> tensor<17x32xf32> in !stream.resource<*>{%96}
    %98 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %99 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%97, %2, %75) : (tensor<17x32xf32> in !stream.resource<*>{%96}, tensor<32x32xf32> in !stream.resource<*>{%__constant_tensor_32x32xf32__size}, tensor<17x32xf32> in !stream.resource<*>{%74}) -> tensor<17x32xf32> in !stream.resource<*>{%98}
    %100 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<1x17x32xf32> : index
    %101 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %99 : tensor<17x32xf32> in !stream.resource<*>{%98} -> tensor<1x17x32xf32> in !stream.resource<*>{%100}
    %102 = stream.async.transfer %99 : !stream.resource<*>{%98} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%98}
    %103 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %104 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%102) : (tensor<17x32xf32> in !stream.resource<*>{%98}) -> tensor<17x32xf32> in !stream.resource<*>{%103}
    %105 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<17x32xf32> : index
    %106 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_24::@main_dispatch_24_reduction_17x32_f32(%104) : (tensor<17x32xf32> in !stream.resource<*>{%103}) -> tensor<17x32xf32> in !stream.resource<*>{%105}
    %107 = stream.async.transfer %106 : !stream.resource<*>{%105} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%105}
    %108 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x64xf32> : index
    %109 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%107, %1, %14) : (tensor<17x32xf32> in !stream.resource<*>{%105}, tensor<64x32xf32> in !stream.resource<*>{%__constant_tensor_64x32xf32__size}, tensor<64xf32> in !stream.resource<*>{%__hoisted_tensor_64xf32_1__size}) -> tensor<17x64xf32> in !stream.resource<*>{%108}
    %110 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
    %111 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_26::@main_dispatch_26_matmul_17x32x64_f32(%109, %0) : (tensor<17x64xf32> in !stream.resource<*>{%108}, tensor<32x64xf32> in !stream.resource<*>{%__constant_tensor_32x64xf32__size}) -> tensor<17x32xf32> in !stream.resource<*>{%110}
    %112 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<1x17x32xf32> : index
    %113 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %111 : tensor<17x32xf32> in !stream.resource<*>{%110} -> tensor<1x17x32xf32> in !stream.resource<*>{%112}
    %114 = stream.async.transfer %113 : !stream.resource<*>{%112} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%112}
    %115 = stream.async.transfer %101 : !stream.resource<*>{%100} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_0>) !stream.resource<*>{%100}
    %116 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<32xf32> : index
    %117 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_27::@main_dispatch_27_elementwise_32_f32(%114, %115, %15) : (tensor<1x17x32xf32> in !stream.resource<*>{%112}, tensor<1x17x32xf32> in !stream.resource<*>{%100}, tensor<32xf32> in !stream.resource<*>{%__hoisted_tensor_32xf32_2__size}) -> tensor<32xf32> in !stream.resource<*>{%116}
    %118 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<f32> : index
    %119 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_28::@main_dispatch_28_reduction_32_f32(%117) : (tensor<32xf32> in !stream.resource<*>{%116}) -> tensor<f32> in !stream.resource<*>{%118}
    %120 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<32xf32> : index
    %121 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_29::@main_dispatch_29_elementwise_32_f32(%117, %119) : (tensor<32xf32> in !stream.resource<*>{%116}, tensor<f32> in !stream.resource<*>{%118}) -> tensor<32xf32> in !stream.resource<*>{%120}
    %122 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<f32> : index
    %123 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_30::@main_dispatch_30_reduction_32_f32(%121) : (tensor<32xf32> in !stream.resource<*>{%120}) -> tensor<f32> in !stream.resource<*>{%122}
    %124 = stream.tensor.sizeof on(#hal.device.affinity<@__device_0>) tensor<32xf32> : index
    %125 = stream.tensor.dispatch on(#hal.device.affinity<@__device_0>) @main_dispatch_31::@main_dispatch_31_elementwise_32_f32(%121, %123) : (tensor<32xf32> in !stream.resource<*>{%120}, tensor<f32> in !stream.resource<*>{%122}) -> tensor<32xf32> in !stream.resource<*>{%124}
    %126 = stream.async.transfer %125 : !stream.resource<*>{%124} from(#hal.device.affinity<@__device_0>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<*>{%124}
    %127 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<10xf32> : index
    %128 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_32::@main_dispatch_32_vecmat_10x32_f32(%126, %16) : (tensor<32xf32> in !stream.resource<*>{%124}, tensor<32x10xf32> in !stream.resource<*>{%__hoisted_tensor_32x10xf32__size}) -> tensor<10xf32> in !stream.resource<*>{%127}
    %129 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<1x10xf32> : index
    %130 = stream.tensor.clone on(#hal.device.affinity<@__device_1>) %128 : tensor<10xf32> in !stream.resource<*>{%127} -> tensor<1x10xf32> in !stream.resource<*>{%129}
    %131 = stream.async.transfer %130 : !stream.resource<*>{%129} from(#hal.device.affinity<@__device_1>) -> to(#hal.device.affinity<@__device_1>) !stream.resource<external>{%129}
    %132 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %131 : tensor<1x10xf32> in !stream.resource<external>{%129} -> !hal.buffer_view
    util.return %132 : !hal.buffer_view
  }
}

{-#

#-}


