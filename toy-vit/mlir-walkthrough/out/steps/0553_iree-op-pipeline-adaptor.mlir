#executable_target_embedded_elf_riscv_32 = #hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>
#executable_target_embedded_elf_x86_64 = #hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#device_target_coralnpu = #hal.device.target<"coralnpu", [#executable_target_embedded_elf_riscv_32]> : !hal.device
#device_target_local = #hal.device.target<"local", [#executable_target_embedded_elf_x86_64]> : !hal.device
module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #device_target_local
  util.global private @__device_1 = #device_target_coralnpu
  util.global private @__hoisted_tensor_64xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<64xf32>
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
    %cst = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<17x32xf32>
    %1 = iree_tensor_ext.compute_barrier.start %0 : tensor<17x32xf32> -> tensor<17x32xf32>
    %2 = flow.dispatch.region -> (tensor<17x64xf32>) attributes {stream.affinity = #hal.device.affinity<@__device_1>} {
      %5 = tensor.empty() : tensor<17x64xf32>
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 1.000000e+00 : f32
      %cst_2 = arith.constant 0.797884523 : f32
      %cst_3 = arith.constant 4.471500e-02 : f32
      %cst_4 = arith.constant 3.000000e+00 : f32
      %cst_5 = arith.constant 0.000000e+00 : f32
      %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_5 : f32) outs(%5 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %7 = linalg.matmul indexing_maps = [#map, #map1, #map2] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%1, %cst : tensor<17x32xf32>, tensor<64x32xf32>) outs(%6 : tensor<17x64xf32>) -> tensor<17x64xf32>
      %8 = linalg.generic {indexing_maps = [#map3, #map4, #map3], iterator_types = ["parallel", "parallel"]} ins(%7, %__hoisted_tensor_64xf32 : tensor<17x64xf32>, tensor<64xf32>) outs(%5 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
      ^bb0(%in: f32, %in_6: f32, %out: f32):
        %9 = arith.addf %in, %in_6 : f32
        %10 = math.powf %9, %cst_4 : f32
        %11 = arith.mulf %10, %cst_3 : f32
        %12 = arith.addf %9, %11 : f32
        %13 = arith.mulf %12, %cst_2 : f32
        %14 = math.tanh %13 : f32
        %15 = arith.addf %14, %cst_1 : f32
        %16 = arith.mulf %9, %cst_0 : f32
        %17 = arith.mulf %16, %15 : f32
        linalg.yield %17 : f32
      } -> tensor<17x64xf32>
      flow.return %8 : tensor<17x64xf32>
    }
    %3 = iree_tensor_ext.compute_barrier.end %2 : tensor<17x64xf32> -> tensor<17x64xf32>
    %4 = hal.tensor.export %3 "output0" : tensor<17x64xf32> -> !hal.buffer_view
    util.return %4 : !hal.buffer_view
  }
}

{-#

#-}


