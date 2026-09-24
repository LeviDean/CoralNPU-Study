util.func private @__main_memoize_apply_11() -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
  %c-1_i64 = arith.constant -1 : i64
  %c4 = arith.constant 4 : index
  %c45184_i32 = arith.constant 45184 : i32
  %c2304_i32 = arith.constant 2304 : i32
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %c2176 = arith.constant 2176 : index
  %c94336 = arith.constant 94336 : index
  %c4352 = arith.constant 4352 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %__device_1 = util.global.load immutable @__device_1 : !hal.device
  %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !hal.buffer
  %__device_1_executable_7_main_dispatch_13 = util.global.load immutable @__device_1_executable_7_main_dispatch_13 : !hal.executable
  %__device_1_executable_8_main_dispatch_14 = util.global.load immutable @__device_1_executable_8_main_dispatch_14 : !hal.executable
  %cmd = hal.command_buffer.create device(%__device_1 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%c-1_i64) bindings(%c4) : !hal.command_buffer
  hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_7_main_dispatch_13 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) constants([%c45184_i32, %c2304_i32]) bindings([
    (%c0 : index)[%c0, %c2176], 
    (%__hoisted_tensor_32xf32 : !hal.buffer)[%c0, %c94336], 
    (%c3 : index)[%c0, %c4352]
  ]) flags("None")
  hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
  hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_1_executable_8_main_dispatch_14 : !hal.executable)[%c0] workgroups([%c2, %c1, %c1]) bindings([
    (%c3 : index)[%c0, %c4352], 
    (%__hoisted_tensor_32xf32 : !hal.buffer)[%c0, %c94336], 
    (%c1 : index)[%c0, %c2176], 
    (%c2 : index)[%c0, %c2176]
  ]) flags("None")
  hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None")
  hal.command_buffer.finalize<%cmd : !hal.command_buffer>
  util.return %cmd : !hal.command_buffer
}

