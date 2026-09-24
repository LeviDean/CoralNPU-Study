util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<17x32xf32>) -> (%output0: tensor<17x64xf32>)"}} {
  %c64 = arith.constant 64 : index
  %c-1_i32 = arith.constant -1 : i32
  %c0_i64 = arith.constant 0 : i64
  %0 = util.null : !hal.fence
  %c-1_i64 = arith.constant -1 : i64
  %c17 = arith.constant 17 : index
  %c32 = arith.constant 32 : index
  %c2176 = arith.constant 2176 : index
  %c4352 = arith.constant 4352 : index
  %c0 = arith.constant 0 : index
  %element_type_f32 = hal.element_type<f32> : i32
  %dense_row_major = hal.encoding_type<dense_row_major> : i32
  hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c17, %c32]) type(%element_type_f32) encoding(%dense_row_major)
  %buffer = hal.buffer_view.buffer<%arg0 : !hal.buffer_view> : !hal.buffer
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
  hal.buffer.assert<%buffer : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c2176) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage")
  %memory_types, %buffer_usage = hal.allocator.resolve_memory_properties for(#hal.device.affinity<@__device_1>) lifetime(external) : i32, i32
  %__device_1_0 = util.global.load immutable @__device_1 : !hal.device
  %fence = hal.fence.create device(%__device_1_0 : !hal.device) flags("None") : !hal.fence
  %transient_buffer = hal.device.queue.alloca<%__device_1_0 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) pool(%c0_i64) type(%memory_types) usage(%buffer_usage) flags("None") : !hal.buffer{%c4352}
  %__device_1_1 = util.global.load immutable @__device_1 : !hal.device
  %1 = util.call @__main_memoize_lookup(%__device_1_1, %c-1_i64) : (!hal.device, i64) -> !hal.command_buffer
  %fence_2 = hal.fence.create device(%__device_1_1 : !hal.device) flags("None") : !hal.fence
  hal.device.queue.execute.indirect<%__device_1_1 : !hal.device> affinity(%c-1_i64) wait(%fence) signal(%fence_2) commands(%1) bindings([
    (%buffer : !hal.buffer)[%c0, %c2176], 
    (%transient_buffer : !hal.buffer)[%c0, %c4352]
  ]) flags("None")
  %status = hal.fence.await until([%fence_2]) timeout_millis(%c-1_i32) flags("None") : i32
  util.status.check_ok %status, "failed to wait on timepoint"
  %dense_row_major_3 = hal.encoding_type<dense_row_major> : i32
  %element_type_f32_4 = hal.element_type<f32> : i32
  %view = hal.buffer_view.create buffer(%transient_buffer : !hal.buffer)[%c0, %c4352] shape([%c17, %c64]) type(%element_type_f32_4) encoding(%dense_row_major_3) : !hal.buffer_view
  util.return %view : !hal.buffer_view
}

