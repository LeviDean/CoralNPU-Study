#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#device_target_coralnpu = #hal.device.target<"coralnpu", [#executable_target_embedded_elf_riscv_32]> : !hal.device
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_x86_64]> : !hal.device
module attributes {iree.fixedpoint.iteration = 0 : index, stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #device_target_local
  util.global private @__device_1 = #device_target_coralnpu
  util.global private @__hoisted_tensor_64xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<64xf32>
  flow.executable private @main_dispatch_0 {
    flow.executable.export public @main_dispatch_0_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_0_matmul_17x64x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
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
        %5 = linalg.matmul indexing_maps = [#map, #map1, #map2] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %6 = linalg.generic {indexing_maps = [#map3, #map4, #map3], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
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
  util.global private @__constant_tensor_64x32xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : tensor<64x32xf32>
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
    %1 = flow.dispatch @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%0, %__constant_tensor_64x32xf32, %__hoisted_tensor_64xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
    %2 = hal.tensor.export %1 "output0" : tensor<17x64xf32> -> !hal.buffer_view
    util.return %2 : !hal.buffer_view
  }
}

{-#

#-}


