module attributes {iree.consteval, stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device
  util.func public @jit_eval(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<32xf32>) -> (%output0: tensor<32xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
  util.func public @jit_eval_0(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_0(%input0: tensor<1x1x32xf32>) -> (%output0: tensor<1x17x32xf32>)"}} {
    %c0 = arith.constant 0 : index
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x1x32xf32>
    %1 = flow.tensor.empty : tensor<1x17x32xf32>
    %2 = flow.tensor.update %0, %1[%c0, %c0, %c0] : tensor<1x1x32xf32> -> %1 as tensor<1x17x32xf32>
    %3 = hal.tensor.export %2 "output0" : tensor<1x17x32xf32> -> !hal.buffer_view
    util.return %3 : !hal.buffer_view
  }
  util.func public @jit_eval_1(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_1(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
  util.func public @jit_eval_2(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_2(%input0: tensor<32xf32>) -> (%output0: tensor<32xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
  util.func public @jit_eval_3(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_3(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
  util.func public @jit_eval_4(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_4(%input0: tensor<32xf32>) -> (%output0: tensor<32xf32>)"}} {
    util.return %arg0 : !hal.buffer_view
  }
  flow.executable private @jit_eval_5_dispatch_0 {
    flow.executable.export public @jit_eval_5_dispatch_0 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @jit_eval_5_dispatch_0(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<10x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32x10xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [10, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<10x32xf32>> -> tensor<10x32xf32>
        %1 = tensor.empty() : tensor<32x10xf32>
        %2 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%0 : tensor<10x32xf32>) outs(%1 : tensor<32x10xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<32x10xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0], sizes = [32, 10], strides = [1, 1] : tensor<32x10xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32x10xf32>>
        return
      }
    }
  }
  util.func public @jit_eval_5(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval_5(%input0: tensor<10x32xf32>) -> (%output0: tensor<32x10xf32>)"}} {
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<10x32xf32>
    %1 = flow.dispatch @jit_eval_5_dispatch_0::@jit_eval_5_dispatch_0(%0) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<10x32xf32>) -> tensor<32x10xf32>
    %2 = hal.tensor.export %1 "output0" : tensor<32x10xf32> -> !hal.buffer_view
    util.return %2 : !hal.buffer_view
  }
}

