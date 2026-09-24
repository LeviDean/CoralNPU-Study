util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : !stream.resource<constant>
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !stream.resource<constant>
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
  %1 = stream.async.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%0[%c0 to %c2176 for %c2176], %__constant_tensor_64x32xf32[%c0 to %c8192 for %c8192], %__hoisted_tensor_64xf32[%c0 to %c256 for %c256]) : (!stream.resource<external>{%c2176}, !stream.resource<constant>{%c8192}, !stream.resource<constant>{%c256}) -> !stream.resource<external>{%c4352}
  %2 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %1 : tensor<17x64xf32> in !stream.resource<external>{%c4352} -> !hal.buffer_view
  util.return %2 : !hal.buffer_view
}

