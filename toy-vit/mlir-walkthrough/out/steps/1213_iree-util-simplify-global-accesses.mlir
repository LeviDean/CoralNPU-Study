util.func private @__main_memoize_apply() -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : !hal.buffer
  %__device_1_executable_0_main_dispatch_0 = util.global.load immutable @__device_1_executable_0_main_dispatch_0 : !hal.executable
  %c-1_i64 = arith.constant -1 : i64
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2176 = arith.constant 2176 : index
  %c8448 = arith.constant 8448 : index
  %c4352 = arith.constant 4352 : index
  %cmd = hal.command_buffer.create device(%__device_1 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%c-1_i64) bindings(%c2) : !hal.command_buffer
  hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_0_main_dispatch_0 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
    (%c0 : index)[%c0, %c2176], 
    (%__hoisted_tensor_64xf32 : !hal.buffer)[%c0, %c8448], 
    (%c1 : index)[%c0, %c4352]
  ]) flags("None")
  hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
  hal.command_buffer.finalize<%cmd : !hal.command_buffer>
  util.return %cmd : !hal.command_buffer
}

