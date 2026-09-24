util.initializer {
  %0 = stream.timepoint.immediate => !stream.timepoint
  %c8192 = arith.constant 8192 : index
  %c256 = arith.constant 256 : index
  %results:2, %result_timepoint = stream.async.execute on(#hal.device.affinity<@__device_1>) with() -> (!stream.resource<constant>{%c256}, !stream.resource<constant>{%c8192}) {
    %cst = stream.async.constant : !stream.resource<constant>{%c256} = dense_resource<__elided__> : tensor<64xf32>
    %cst_0 = stream.async.constant : !stream.resource<constant>{%c8192} = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    stream.yield %cst, %cst_0 : !stream.resource<constant>{%c256}, !stream.resource<constant>{%c8192}
  } => !stream.timepoint
  %1:2 = stream.timepoint.await sync %result_timepoint => %results#1, %results#0 : !stream.resource<constant>{%c8192}, !stream.resource<constant>{%c256}
  util.global.store %1#0, @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global.store %0, @__constant_tensor_64x32xf32__timepoint : !stream.timepoint
  util.global.store %1#1, @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.global.store %0, @__hoisted_tensor_64xf32__timepoint : !stream.timepoint
  util.return
}

