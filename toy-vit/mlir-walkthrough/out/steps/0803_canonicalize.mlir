util.initializer {
  %c0 = arith.constant 0 : index
  %c0_i64 = arith.constant 0 : i64
  %0 = stream.timepoint.immediate => !stream.timepoint
  %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
  %c8448 = arith.constant 8448 : index
  %did_map, %result = stream.resource.try_map on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0] : !util.buffer -> i1, !stream.resource<constant>{%c8448}
  cf.cond_br %did_map, ^bb2(%0, %result : !stream.timepoint, !stream.resource<constant>), ^bb1
^bb1:  // pred: ^bb0
  %1 = stream.resource.alloc uninitialized on(#hal.device.affinity<@__device_1>) : !stream.resource<constant>{%c8448}
  %file = stream.file.constant on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0 for %c8448] : !util.buffer{%c8448} -> !stream.file
  %2 = stream.file.read on(#hal.device.affinity<@__device_1>) await(%0) => %file[%c0_i64], %1[%c0], %c8448 : !stream.file -> !stream.resource<constant>{%c8448} => !stream.timepoint
  cf.br ^bb2(%2, %1 : !stream.timepoint, !stream.resource<constant>)
^bb2(%3: !stream.timepoint, %4: !stream.resource<constant>):  // 2 preds: ^bb0, ^bb1
  %5 = stream.timepoint.await sync %3 => %4 : !stream.resource<constant>{%c8448}
  util.global.store %5, @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.return
}

