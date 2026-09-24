util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %c0 = arith.constant 0 : index
  %c4352 = arith.constant 4352 : index
  %c2176 = arith.constant 2176 : index
  %c32 = arith.constant 32 : index
  %c17 = arith.constant 17 : index
  %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : !stream.resource<constant>
  %__constant_tensor_64x32xf32__size = util.global.load immutable @__constant_tensor_64x32xf32__size : index
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !stream.resource<constant>
  %__hoisted_tensor_64xf32__size = util.global.load immutable @__hoisted_tensor_64xf32__size : index
  %0 = stream.async.clone on(#hal.device.affinity<@__device_1>) %__constant_tensor_64x32xf32 : !stream.resource<constant>{%__constant_tensor_64x32xf32__size} -> !stream.resource<*>{%__constant_tensor_64x32xf32__size}
  %1 = stream.async.clone on(#hal.device.affinity<@__device_1>) %__hoisted_tensor_64xf32 : !stream.resource<constant>{%__hoisted_tensor_64xf32__size} -> !stream.resource<*>{%__hoisted_tensor_64xf32__size}
  %element_type_f32 = hal.element_type<f32> : i32
  %dense_row_major = hal.encoding_type<dense_row_major> : i32
  hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
  %2 = stream.tensor.import on(#hal.device.affinity<@__device_1>) %arg0 : !hal.buffer_view -> tensor<17x32xf32> in !stream.resource<external>{%c2176}
  %3 = stream.async.clone on(#hal.device.affinity<@__device_1>) %2 : !stream.resource<external>{%c2176} -> !stream.resource<*>{%c2176}
  %4 = stream.async.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%3[%c0 to %c2176 for %c2176], %0[%c0 to %__constant_tensor_64x32xf32__size for %__constant_tensor_64x32xf32__size], %1[%c0 to %__hoisted_tensor_64xf32__size for %__hoisted_tensor_64xf32__size]) : (!stream.resource<*>{%c2176}, !stream.resource<*>{%__constant_tensor_64x32xf32__size}, !stream.resource<*>{%__hoisted_tensor_64xf32__size}) -> !stream.resource<*>{%c4352}
  %5 = stream.async.clone on(#hal.device.affinity<@__device_1>) %4 : !stream.resource<*>{%c4352} -> !stream.resource<external>{%c4352}
  %6 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %5 : tensor<17x64xf32> in !stream.resource<external>{%c4352} -> !hal.buffer_view
  util.return %6 : !hal.buffer_view
}

