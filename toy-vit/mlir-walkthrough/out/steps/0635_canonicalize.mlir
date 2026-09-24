util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %c17 = arith.constant 17 : index
  %c32 = arith.constant 32 : index
  %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : !stream.resource<constant>
  %__constant_tensor_64x32xf32__size = util.global.load immutable @__constant_tensor_64x32xf32__size : index
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !stream.resource<constant>
  %__hoisted_tensor_64xf32__size = util.global.load immutable @__hoisted_tensor_64xf32__size : index
  %0 = stream.async.clone on(#hal.device.affinity<@__device_1>) %__constant_tensor_64x32xf32 : !stream.resource<constant>{%__constant_tensor_64x32xf32__size} -> !stream.resource<*>{%__constant_tensor_64x32xf32__size}
  %1 = stream.async.clone on(#hal.device.affinity<@__device_1>) %__hoisted_tensor_64xf32 : !stream.resource<constant>{%__hoisted_tensor_64xf32__size} -> !stream.resource<*>{%__hoisted_tensor_64xf32__size}
  %element_type_f32 = hal.element_type<f32> : i32
  %dense_row_major = hal.encoding_type<dense_row_major> : i32
  hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
  %2 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x32xf32> : index
  %3 = stream.tensor.import on(#hal.device.affinity<@__device_1>) %arg0 : !hal.buffer_view -> tensor<17x32xf32> in !stream.resource<external>{%2}
  %4 = stream.async.clone on(#hal.device.affinity<@__device_1>) %3 : !stream.resource<external>{%2} -> !stream.resource<*>{%2}
  %5 = stream.tensor.sizeof on(#hal.device.affinity<@__device_1>) tensor<17x64xf32> : index
  %6 = stream.tensor.dispatch on(#hal.device.affinity<@__device_1>) @main_dispatch_0::@main_dispatch_0_matmul_17x64x32_f32(%4, %0, %1) : (tensor<17x32xf32> in !stream.resource<*>{%2}, tensor<64x32xf32> in !stream.resource<*>{%__constant_tensor_64x32xf32__size}, tensor<64xf32> in !stream.resource<*>{%__hoisted_tensor_64xf32__size}) -> tensor<17x64xf32> in !stream.resource<*>{%5}
  %7 = stream.async.clone on(#hal.device.affinity<@__device_1>) %6 : !stream.resource<*>{%5} -> !stream.resource<external>{%5}
  %8 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %7 : tensor<17x64xf32> in !stream.resource<external>{%5} -> !hal.buffer_view
  util.return %8 : !hal.buffer_view
}

