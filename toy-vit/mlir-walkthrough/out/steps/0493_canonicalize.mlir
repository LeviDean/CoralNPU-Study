module attributes {iree.consteval, vm.toplevel} {
  vm.module public @module {
    vm.func private @jit_eval(%arg0: !vm.ref<!hal.buffer_view>) -> !vm.ref<!hal.buffer_view> attributes {iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}} {
      vm.return %arg0 : !vm.ref<!hal.buffer_view>
    }
    vm.export @jit_eval attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @jit_eval(%input0: tensor<64xf32>) -> (%output0: tensor<64xf32>)"}}
    vm.export @__init
    vm.func private @__init() {
      vm.return
    }
    vm.export @__deinit
    vm.func private @__deinit() {
      vm.return
    }
  }
}

