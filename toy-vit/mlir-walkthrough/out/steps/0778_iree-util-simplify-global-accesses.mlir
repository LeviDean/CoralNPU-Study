util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %__hoisted_tensor_64xf32__timepoint = util.global.load immutable @__hoisted_tensor_64xf32__timepoint : !stream.timepoint
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !stream.resource<constant>
  %c8448 = arith.constant 8448 : index
  %c256 = arith.constant 256 : index
  %c8192 = arith.constant 8192 : index
  %c17 = arith.constant 17 : index
  %c32 = arith.constant 32 : index
  %c2176 = arith.constant 2176 : index
  %c4352 = arith.constant 4352 : index
  %c0 = arith.constant 0 : index
  %element_type_f32 = hal.element_type<f32> : i32
  %dense_row_major = hal.encoding_type<dense_row_major> : i32
  hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
  %0 = stream.tensor.import on(#hal.device.affinity<@__device_1>) %arg0 : !hal.buffer_view -> tensor<17x32xf32> in !stream.resource<external>{%c2176}
  %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%__hoisted_tensor_64xf32__timepoint) => !stream.resource<external>{%c4352} => !stream.timepoint
  %1 = stream.timepoint.join max(%__hoisted_tensor_64xf32__timepoint, %result_timepoint) => !stream.timepoint
  %2 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%1) => with(%0 as %arg1: !stream.resource<external>{%c2176}, %__hoisted_tensor_64xf32 as %arg2: !stream.resource<constant>{%c8448}, %result as %arg3: !stream.resource<external>{%c4352}) {
    stream.cmd.dispatch @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32 {
      ro %arg1[%c0 for %c2176] : !stream.resource<external>{%c2176},
      ro %arg2[%c256 for %c8192] : !stream.resource<constant>{%c8448},
      ro %arg2[%c0 for %c256] : !stream.resource<constant>{%c8448},
      wo %arg3[%c0 for %c4352] : !stream.resource<external>{%c4352}
    }
  } => !stream.timepoint
  %3 = stream.timepoint.await %2 => %result : !stream.resource<external>{%c4352}
  %4 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %3 : tensor<17x64xf32> in !stream.resource<external>{%c4352} -> !hal.buffer_view
  util.return %4 : !hal.buffer_view
}

