util.initializer {
  %c-1_i32 = arith.constant -1 : i32
  %c0_i32 = arith.constant 0 : i32
  %c-1_i64 = arith.constant -1 : i64
  %c0 = arith.constant 0 : index
  %c0_i64 = arith.constant 0 : i64
  %0 = util.null : !hal.fence
  %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
  %c8448 = arith.constant 8448 : index
  %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage|SharingImmutable"> : i32
  %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %allocator = hal.device.allocator<%__device_1 : !hal.device> : !hal.allocator
  %did_import, %mapped = hal.allocator.import<%allocator : !hal.allocator> source(%buffer_cst : !util.buffer)[%c0, %c8448] affinity(%c-1_i64) type(%memory_type) usage(%buffer_usage) : i1, !hal.buffer
  cf.cond_br %did_import, ^bb2(%0, %mapped : !hal.fence, !hal.buffer), ^bb1
^bb1:  // pred: ^bb0
  %memory_types, %buffer_usage_0 = hal.allocator.resolve_memory_properties for(#hal.device.affinity<@__device_1>) lifetime(constant) : i32, i32
  %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%c-1_i64) type(%memory_types) usage(%buffer_usage_0) : !hal.buffer{%c8448}
  %memory_file = hal.ex.file.from_memory device(%__device_1 : !hal.device) affinity(%c-1_i64) access(Read) buffer(%buffer_cst : !util.buffer)[%c0 for %c8448] flags(%c0_i32) : !hal.file
  %fence = hal.fence.create device(%__device_1 : !hal.device) flags("None") : !hal.fence
  hal.device.queue.read<%__device_1 : !hal.device> affinity(%c-1_i64) wait(%0) signal(%fence) source(%memory_file : !hal.file)[%c0_i64] target(%buffer : !hal.buffer)[%c0] length(%c8448) flags("None")
  cf.br ^bb2(%fence, %buffer : !hal.fence, !hal.buffer)
^bb2(%1: !hal.fence, %2: !hal.buffer):  // 2 preds: ^bb0, ^bb1
  %status = hal.fence.await until([%1]) timeout_millis(%c-1_i32) flags("None") : i32
  util.status.check_ok %status, "failed to wait on timepoint"
  util.global.store %2, @__hoisted_tensor_64xf32 : !hal.buffer
  util.return
}

