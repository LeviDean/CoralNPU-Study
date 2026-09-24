vm.func private @__main_memoize_apply() -> !vm.ref<!hal.command_buffer> attributes {inlining_policy = #util.inline.never} {
  %c13 = vm.const.i32 13
  %c28 = vm.const.i32 28
  %null = vm.const.ref.zero : !vm.ref<!hal.buffer>
  %c1 = vm.const.i32 1
  %c2 = vm.const.i32 2
  %c3 = vm.const.i32 3
  %zero = vm.const.i32.zero
  %c4352 = vm.const.i64 4352
  %c8448 = vm.const.i64 8448
  %c2176 = vm.const.i64 2176
  %zero_0 = vm.const.i64.zero
  %c-1 = vm.const.i64 -1
  %__device_1 = vm.global.load.ref immutable @__device_1 : !vm.ref<!hal.device>
  %__hoisted_tensor_64xf32 = vm.global.load.ref immutable @__hoisted_tensor_64xf32 : !vm.ref<!hal.buffer>
  %__device_1_executable_0_main_dispatch_0 = vm.global.load.ref immutable @__device_1_executable_0_main_dispatch_0 : !vm.ref<!hal.executable>
  %ref = vm.call @hal.command_buffer.create(%__device_1, %zero, %c3, %c-1, %c2) : (!vm.ref<!hal.device>, i32, i32, i64, i32) -> !vm.ref<!hal.command_buffer>
  vm.call.variadic @hal.command_buffer.dispatch(%ref, %__device_1_executable_0_main_dispatch_0, %zero, %c2, %c1, %c1, %zero_0, [], [(%zero, %zero, %null, %zero_0, %c2176), (%zero, %zero, %__hoisted_tensor_64xf32, %zero_0, %c8448), (%zero, %c1, %null, %zero_0, %c4352)]) : (!vm.ref<!hal.command_buffer>, !vm.ref<!hal.executable>, i32, i32, i32, i32, i64, i32 ..., tuple<i32, i32, !vm.ref<!hal.buffer>, i64, i64> ...)
  vm.call @hal.command_buffer.execution_barrier(%ref, %c28, %c13, %zero_0) : (!vm.ref<!hal.command_buffer>, i32, i32, i64) -> ()
  vm.call @hal.command_buffer.finalize(%ref) : (!vm.ref<!hal.command_buffer>) -> ()
  vm.return %ref : !vm.ref<!hal.command_buffer>
}

