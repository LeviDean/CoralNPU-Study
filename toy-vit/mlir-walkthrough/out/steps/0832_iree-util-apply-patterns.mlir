util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %c8448 = arith.constant 8448 : index
  %c17 = arith.constant 17 : index
  %c32 = arith.constant 32 : index
  %c2176 = arith.constant 2176 : index
  %c4352 = arith.constant 4352 : index
  %c0 = arith.constant 0 : index
  %c0_i32 = arith.constant 0 : i32
  %c256_i32 = arith.constant 256 : i32
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !stream.resource<constant>
  %element_type_f32 = hal.element_type<f32> : i32
  %dense_row_major = hal.encoding_type<dense_row_major> : i32
  hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
  %0 = stream.tensor.import on(#hal.device.affinity<@__device_1>) %arg0 : !hal.buffer_view -> tensor<17x32xf32> in !stream.resource<external>{%c2176}
  %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) : !stream.resource<external>{%c4352} => !stream.timepoint
  %1 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%result_timepoint) => with(%0 as %arg1: !stream.resource<external>{%c2176}, %__hoisted_tensor_64xf32 as %arg2: !stream.resource<constant>{%c8448}, %result as %arg3: !stream.resource<external>{%c4352}) {
    stream.cmd.dispatch @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%c0_i32, %c0_i32, %c256_i32, %c0_i32, %c0_i32, %c0_i32, %c0_i32, %c0_i32 : i32, i32, i32, i32, i32, i32, i32, i32) {
      ro %arg1[%c0 for %c2176] : !stream.resource<external>{%c2176},
      ro %arg2[%c0 for %c8448] : !stream.resource<constant>{%c8448},
      wo %arg3[%c0 for %c4352] : !stream.resource<external>{%c4352}
    }
  } => !stream.timepoint
  %2 = stream.timepoint.await %1 => %result : !stream.resource<external>{%c4352}
  %3 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %2 : tensor<17x64xf32> in !stream.resource<external>{%c4352} -> !hal.buffer_view
  util.return %3 : !hal.buffer_view
}

