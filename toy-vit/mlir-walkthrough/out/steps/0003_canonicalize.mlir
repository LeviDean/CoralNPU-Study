func.func @main(%arg0: tensor<17x32xf32>) -> tensor<17x64xf32> {
  %cst = stablehlo.constant dense_resource<torch_tensor_64_torch.float32> : tensor<64xf32>
  %cst_0 = stablehlo.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  %cst_1 = arith.constant dense<1> : tensor<1xi64>
  %cst_2 = arith.constant dense<5.000000e-01> : tensor<1xf64>
  %cst_3 = arith.constant dense<3> : tensor<1xi64>
  %cst_4 = arith.constant dense<4.471500e-02> : tensor<1xf64>
  %cst_5 = arith.constant dense<0.79788456080286541> : tensor<1xf64>
  %cst_6 = arith.constant dense<1.000000e+00> : tensor<1xf64>
  %0 = stablehlo.transpose %cst_0, dims = [1, 0] : (tensor<64x32xf32>) -> tensor<32x64xf32>
  %1 = stablehlo.dot_general %arg0, %0, contracting_dims = [1] x [0] : (tensor<17x32xf32>, tensor<32x64xf32>) -> tensor<17x64xf32>
  %2 = stablehlo.convert %cst_1 : (tensor<1xi64>) -> tensor<1xf32>
  %3 = stablehlo.reshape %2 : (tensor<1xf32>) -> tensor<f32>
  %4 = stablehlo.broadcast_in_dim %3, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %5 = stablehlo.multiply %1, %4 : tensor<17x64xf32>
  %6 = stablehlo.broadcast_in_dim %3, dims = [] : (tensor<f32>) -> tensor<64xf32>
  %7 = stablehlo.multiply %6, %cst : tensor<64xf32>
  %8 = stablehlo.broadcast_in_dim %7, dims = [1] : (tensor<64xf32>) -> tensor<17x64xf32>
  %9 = stablehlo.add %5, %8 : tensor<17x64xf32>
  %10 = stablehlo.convert %cst_2 : (tensor<1xf64>) -> tensor<1xf32>
  %11 = stablehlo.reshape %10 : (tensor<1xf32>) -> tensor<f32>
  %12 = stablehlo.broadcast_in_dim %11, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %13 = stablehlo.multiply %9, %12 : tensor<17x64xf32>
  %14 = stablehlo.convert %cst_3 : (tensor<1xi64>) -> tensor<1xf32>
  %15 = stablehlo.reshape %14 : (tensor<1xf32>) -> tensor<f32>
  %16 = stablehlo.broadcast_in_dim %15, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %17 = stablehlo.power %9, %16 : tensor<17x64xf32>
  %18 = stablehlo.convert %cst_4 : (tensor<1xf64>) -> tensor<1xf32>
  %19 = stablehlo.reshape %18 : (tensor<1xf32>) -> tensor<f32>
  %20 = stablehlo.broadcast_in_dim %19, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %21 = stablehlo.multiply %17, %20 : tensor<17x64xf32>
  %22 = stablehlo.add %9, %21 : tensor<17x64xf32>
  %23 = stablehlo.convert %cst_5 : (tensor<1xf64>) -> tensor<1xf32>
  %24 = stablehlo.reshape %23 : (tensor<1xf32>) -> tensor<f32>
  %25 = stablehlo.broadcast_in_dim %24, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %26 = stablehlo.multiply %22, %25 : tensor<17x64xf32>
  %27 = stablehlo.tanh %26 : tensor<17x64xf32>
  %28 = stablehlo.convert %cst_6 : (tensor<1xf64>) -> tensor<1xf32>
  %29 = stablehlo.reshape %28 : (tensor<1xf32>) -> tensor<f32>
  %30 = stablehlo.broadcast_in_dim %29, dims = [] : (tensor<f32>) -> tensor<17x64xf32>
  %31 = stablehlo.add %27, %30 : tensor<17x64xf32>
  %32 = stablehlo.multiply %13, %31 : tensor<17x64xf32>
  return %32 : tensor<17x64xf32>
}

