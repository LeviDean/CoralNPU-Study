util.initializer {
  %0 = stream.timepoint.immediate => !stream.timepoint
  %c8192 = arith.constant 8192 : index
  %c256 = arith.constant 256 : index
  %1 = stream.timepoint.immediate => !stream.timepoint
  %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<8448xi8, [
    dense_resource<__elided__> : tensor<64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
]>
  %c8448 = arith.constant 8448 : index
  %c0 = arith.constant 0 : index
  %did_map, %result = stream.resource.try_map on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0] : !util.buffer -> i1, !stream.resource<constant>{%c8448}
  %c0_i64 = arith.constant 0 : i64
  %2:2 = scf.if %did_map -> (!stream.timepoint, !stream.resource<constant>) {
    scf.yield %1, %result : !stream.timepoint, !stream.resource<constant>
  } else {
    %8 = stream.resource.alloc uninitialized on(#hal.device.affinity<@__device_1>) : !stream.resource<constant>{%c8448}
    %file = stream.file.constant on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0 for %c8448] : !util.buffer{%c8448} -> !stream.file
    %9 = stream.file.read on(#hal.device.affinity<@__device_1>) await(%1) => %file[%c0_i64], %8[%c0], %c8448 : !stream.file -> !stream.resource<constant>{%c8448} => !stream.timepoint
    scf.yield %9, %8 : !stream.timepoint, !stream.resource<constant>
  }
  %3 = stream.resource.subview %2#1[%c0] : !stream.resource<constant>{%c8448} -> !stream.resource<constant>{%c256}
  %4 = stream.resource.subview %2#1[%c256] : !stream.resource<constant>{%c8448} -> !stream.resource<constant>{%c8192}
  %5 = stream.cmd.execute once on(#hal.device.affinity<@__device_1>) with() {
  } => !stream.timepoint
  %6 = stream.timepoint.join max(%2#0, %5) => !stream.timepoint
  %7:2 = stream.timepoint.await sync %6 => %4, %3 : !stream.resource<constant>{%c8192}, !stream.resource<constant>{%c256}
  util.global.store %7#0, @__constant_tensor_64x32xf32 : !stream.resource<constant>
  util.global.store %7#1, @__hoisted_tensor_64xf32 : !stream.resource<constant>
  util.global.store %0, @__hoisted_tensor_64xf32__timepoint : !stream.timepoint
  util.return
}

