module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device
  util.global private @__device_1 = #hal.device.target<"coralnpu", [#hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>]> : !hal.device
  util.global private @__hoisted_tensor_32xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<[-0.0276905708, 0.0404898524, 0.0342440978, 0.0397716612, -0.0171744078, -0.0632004067, -0.0706610903, 0.00591342896, -0.0698182582, -0.0475731567, 0.0471620187, -0.0111102946, 0.0251884013, -0.0567760766, 0.0114396289, 0.0650301427, 0.0131203979, 1.272960e-02, -0.0445359237, -0.0521816611, 0.0420718938, -0.0646112487, -0.00442092866, -0.0578277633, 0.00507219881, -0.0707173571, 0.0238915309, 1.22800469E-4, -0.0474558026, -0.0268719755, -0.0288399979, -0.0323958099]> : tensor<32xf32>
  util.global private @__hoisted_tensor_1x17x32xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<"0x42182E3CB71C6E3C80BD4ABCE59EC73BC170B3BBF3C530BCEED50BBC29B5C33C50FA843C4A50B83CB378C93B495CE03C509BD83B8752553DF7AC283C4F3DA93C89D52C3DF0B9BDBC8BC4703C9BF20F3DC21249BCFB3DA6BBBBAFE5BC9BB2693C20972ABDC7F8D53CD0051F3C4D7E9ABC16262BBC792DEABB7207103C304C2F3C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"> : tensor<1x17x32xf32>
  util.global private @__hoisted_tensor_64xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<[-0.0784074887, 0.133701041, 0.0374686718, -0.158422261, 0.130385116, 0.145757273, -0.00937364995, 0.16273497, -0.159684181, 0.0142502487, 0.0222800821, 0.0433393121, 0.0852099806, 0.0597920865, 0.165532157, -0.0992107912, 0.033257544, 0.0742416829, -0.13994953, -0.0678704157, -1.399000e-01, -0.0653569475, -9.426210e-02, 0.134886906, -0.0863711535, 0.0479414463, -0.0776928663, 0.114026859, -0.00245939195, -0.120036267, -0.0585362837, -0.111347251, 0.058000803, 0.154466733, 0.0569904447, 0.0454519391, -0.138848573, 0.0174276978, 0.0797319859, 0.0079472512, -0.173067868, -0.111326642, -0.169811338, 0.029356584, 0.0564059466, 0.0901445895, 0.109597936, -0.11835935, 0.0541898608, 1.717100e-01, -0.0753134862, -0.176457703, -0.0500689149, -0.0760044828, 0.131950065, 0.134556964, 0.164986417, 0.120694682, 0.0108208507, -0.0929305106, 0.0313722789, -0.0333369076, -0.0782917141, -0.149090782]> : tensor<64xf32>
  util.global private @__hoisted_tensor_32xf32_0 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<[-0.112075552, -0.0255997777, -0.124581501, -0.0398785472, -0.0453947634, -0.115945354, 0.107957944, 0.0325788558, -0.0590812117, 0.12016806, 0.104247957, 0.0104369968, -0.0140919685, 0.0961571335, 0.0116656125, 0.0130360574, -0.0130532235, 0.0388890803, 0.0675139278, 0.109392256, -0.0826037675, 0.00360101461, 0.0288103074, 0.0478569418, 0.0760918557, 0.0768085271, -0.120889977, 4.285200e-02, 0.0012576431, 0.00353564322, -0.108476371, 0.0939218849]> : tensor<32xf32>
  util.global private @__hoisted_tensor_64xf32_1 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<[-0.175582215, -0.121136509, 0.0857552141, 0.115511701, -0.00239191949, 0.0847716779, -0.123038813, 0.0959124416, 0.052226007, -0.105357677, -7.668010e-02, 0.0772880465, -0.0730696768, -0.154912323, -0.082832314, 0.0665367246, 0.0786557943, 0.031330958, -0.173346281, 0.136475161, 0.171134785, -0.115252942, -0.0781469568, -0.00420203805, -0.0391709059, 0.130503163, -0.143010452, -0.0201214552, 0.140517965, 0.165210441, 0.117852256, 0.174726263, -0.111183636, 0.0413551182, -0.00620362163, -0.0760360137, -0.136114344, -0.109061882, -0.0432827473, 0.14210479, 0.176408991, 0.129393891, 0.0563398153, -0.00837628543, -0.103125602, -0.0894689932, -0.105814762, -0.0258170366, -0.176422283, -0.145310387, -0.0686581209, -0.166340157, 0.0928352326, -0.0701318085, 0.126490697, -0.0932266786, 0.122805193, 0.0952892452, 0.122049972, 0.0247520208, -0.121082947, -0.035901472, 0.0468119532, -0.105514973]> : tensor<64xf32>
  util.global private @__hoisted_tensor_32xf32_2 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<[0.00459568202, 0.00643315911, -0.0611298531, -0.0455893874, 0.0906281769, 0.045181796, -0.0276100636, 0.00241969526, 0.0241953284, -0.029884696, 0.0962207317, 0.0695524663, -0.0998327285, 0.0599662662, 0.0694933831, -0.0958881974, 7.79435038E-4, 0.0299070776, -0.014811486, 0.0167751312, 0.0331965834, -0.108748183, -0.0932690352, 0.0484820455, 0.0683543831, -0.090707615, 0.0863049626, -0.0213013887, 0.0846708118, -0.0409181863, 0.0392677635, 0.0947141349]> : tensor<32xf32>
  util.global private @__hoisted_tensor_32x10xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense<"0xAA61BB3DDEA6EC3D8245D4BDEE1506BE77BFDCBD108F6E3C8E4CC13D3CDC5C3DA2DF33BEEFA0313EFD122CBE4E5811BEAA5AA8BD88D85E3DCC1940BD7AE7EC3D9B690ABE00AF1CBCF47B25BDA24D02BE2C512EBDECAD0BBDE354323EC28BAB3D7E0129BEC89722BD3048693D80478EBC429DB93D46F5B03DA60319BEDF2E06BE4C6314BDE2CEE23DBBAD84BD32C999BD9024E5BD564FAA3D15D0053EBE04A03D0884183D1995C4BD100DC83C2FAA1DBE08CF6B3DBDB9303EA76B1F3E4874E0BCF00BA83CE0E19D3BC0700B3B98352A3D572123BE0C6633BD87ABF0BDE1A91ABE872E03BEFD2CE8BDDC4D113DBCCC4C3DE220963D3881DEBD18E3DE3C183684BCD0A202BD007A2DBDABF9233E9694E23DF6A1C93DB610A63DAC8682BDF56E0D3E3E53F93DD15186BD9CBE2D3D82F009BE6672B53DCC6AE7BD48489FBC0E5FFA3D4880C6BC7BB71EBE82E99F3D90B4A43C9B98293E0C1907BE1817F6BCC6ADAABD00D23E3A607730BC058E1F3E403C4BBD03DD1F3EB4C408BE7261A7BD054D253E6B38303E9372303EE0754CBC603FAB3C8A5AA23D285B28BEC03E4A3DB66E9F3D7E57ED3D3F6AFEBD2031AABDA44F623DA293CE3DC0087A3C7035B8BC198B273E4DDC103E42FDBA3DE05A01BD0D38073ED01528BC32F9A33D91B1233E5C8D8A3D98FBEFBCC09347BB5900C5BD10C8983C2A97B93D4EC6EBBDBC1D3F3DBF6A063E308EB3BCF0176F3D229C8EBDCEA6CE3DC0E07ABC8680A9BD8FB61E3ED9D6253E5297D13D427E8CBD7115223E0E679F3D67E71D3EF0524ABDE047D7BBBC32143D03040FBEC20718BE49510B3E5B28303E96B0B43DE89443BDA0CA82BC52FC7DBD8C9D0BBE502104BC67CE273E9CC83CBD70E528BE1858F3BD93B70B3E28BF803DC0F9693C9A12C83D887850BD4DC002BE7CCED3BD5FA3103E0C80213DA083373CC84F3A3D14570FBDF21B0BBE78B26C3D8CD9F2BD21462D3ECFF820BE048F20BE050C003EA88D02BEF08E8ABC15412F3E1B05123EC035633C4823D33CBE0A2BBE3C3197BD00EE2FBBCCB771BD858F0FBE35760B3ECE6A34BE45BE86BD36161DBE2324D1BD3501043EFCEF3BBDE460873D9CE4333D88BCA73CA0BD493D3885EABC2AD9EF3D80CAA5BB282E913CBC4249BD70A7C63CF6C6A23D00182D390041BE3A80D2B53AA042E5BC204F23BE7203B1BD6169DDBDF944223E921C7DBD287B9ABC10FB50BC9699E93DB5242D3E603B933D14FCD1BDF989173E0FA6083E01D52B3EA38133BE7318C4BD00FF7ABC26F608BE1C716DBDEF87273E984E1A3D8690A83D92D6D93D50BF373D88F12B3D802FECBA6CC527BE58577D3DB0F57F3DC7DCDABD80FD1EBE5867ED3CA542053EECEA19BD707C06BE9A26AA3D95C6E6BDE079DCBC304D7BBC02DAED3DB984313E06E52CBECE62C13D0690F63D70C11FBD6C009BBD7776013EECE7183D209D4ABD40393CBC2268E13D296E2E3EF7010BBEFB9B053E82CFB43DF099D03CD3DF2D3E50EA07BD8A94F6BD4C7CACBD7D78283E28A4A23C36B5F1BD3F3307BE686AD33C803EF6BDD037C7BC00A71F3DD3061B3E0060D337C0B21A3D132011BE42A1A23DC2ECFBBD604062BD4D7F053E13B4133E00FC0F3A904232BEE829063DFE9E29BEF07ABFBC929604BE31FB1E3EB84107BE1C870D3D3907D5BDC1801DBEF4183F3D90C069BC38698D3C8AA6F03DAED4F43D1CEE08BD0F2D343EB94EBBBD8F25123EB34620BEC2FFCE3DC4F9AABDB663E6BDF88F8D3C92179A3D8A8F2EBE6C3101BEAB56333E4213C73D04D934BDEF5430BE1A6FCB3D"> : tensor<32x10xf32>
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %cst = arith.constant dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
    %cst_0 = arith.constant dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
    %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
    %cst_2 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
    %cst_3 = arith.constant dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
    %cst_4 = arith.constant dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
    %cst_5 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
    %cst_6 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
    %cst_7 = arith.constant dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
    %cst_8 = arith.constant dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
    %cst_9 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
    %cst_10 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
    %cst_11 = arith.constant dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
    %cst_12 = arith.constant dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
    %cst_13 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
    %cst_14 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
    %cst_15 = arith.constant dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
    %cst_16 = arith.constant dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
    %cst_17 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
    %cst_18 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
    %cst_19 = arith.constant 0.000000e+00 : f32
    %cst_20 = arith.constant 9.99999997E-7 : f32
    %cst_21 = arith.constant 4.471500e-02 : f32
    %cst_22 = arith.constant 0.797884523 : f32
    %cst_23 = arith.constant 1.000000e+00 : f32
    %cst_24 = arith.constant 3.200000e+01 : f32
    %cst_25 = arith.constant 2.000000e+00 : f32
    %cst_26 = arith.constant 4.000000e+00 : f32
    %cst_27 = arith.constant 5.000000e-01 : f32
    %cst_28 = arith.constant 3.000000e+00 : f32
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x32x32x3xf32>
    %expanded = tensor.expand_shape %0 [[0], [1, 2], [3, 4], [5]] output_shape [1, 4, 8, 4, 8, 3] : tensor<1x32x32x3xf32> into tensor<1x4x8x4x8x3xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3], [4], [5]] : tensor<1x4x8x4x8x3xf32> into tensor<4x8x4x8x3xf32>
    %1 = iree_tensor_ext.compute_barrier.start %collapsed : tensor<4x8x4x8x3xf32> -> tensor<4x8x4x8x3xf32>
    %2 = tensor.empty() : tensor<4x4x8x8x3xf32>
    %3 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d1, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<4x8x4x8x3xf32>) outs(%2 : tensor<4x4x8x8x3xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<4x4x8x8x3xf32>
    %collapsed_29 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4]] : tensor<4x4x8x8x3xf32> into tensor<16x192xf32>
    %4 = tensor.empty() : tensor<16x32xf32>
    %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %6 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_29, %cst : tensor<16x192xf32>, tensor<32x192xf32>) outs(%5 : tensor<16x32xf32>) -> tensor<16x32xf32>
    %7 = tensor.empty() : tensor<f32>
    %8 = linalg.fill ins(%cst_23 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8 : tensor<f32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%6, %9 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<16x32xf32>
    %11 = tensor.empty() : tensor<32xf32>
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : tensor<32xf32>
    %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%__hoisted_tensor_32xf32 : tensor<32xf32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<16x32xf32>
    %13 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%10, %12 : tensor<16x32xf32>, tensor<16x32xf32>) outs(%4 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<16x32xf32>
    %__hoisted_tensor_1x17x32xf32 = util.global.load immutable @__hoisted_tensor_1x17x32xf32 : tensor<1x17x32xf32>
    %inserted_slice = tensor.insert_slice %13 into %__hoisted_tensor_1x17x32xf32[0, 1, 0] [1, 16, 32] [1, 1, 1] : tensor<16x32xf32> into tensor<1x17x32xf32>
    %collapsed_30 = tensor.collapse_shape %inserted_slice [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %collapsed_31 = tensor.collapse_shape %cst_0 [[0, 1], [2]] : tensor<1x17x32xf32> into tensor<17x32xf32>
    %14 = tensor.empty() : tensor<17x32xf32>
    %15 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%collapsed_30, %collapsed_31 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %16 = tensor.empty() : tensor<17xf32>
    %17 = linalg.fill ins(%cst_19 : f32) outs(%16 : tensor<17xf32>) -> tensor<17xf32>
    %18 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%15 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %19 = linalg.fill ins(%cst_24 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %20 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%19 : tensor<f32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17xf32>
    %21 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%18, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %22 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%21 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %23 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %22 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.subf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %24 = linalg.fill ins(%cst_25 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %25 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%24 : tensor<f32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %26 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%23, %25 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %27 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%26 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %28 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%27, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %29 = linalg.fill ins(%cst_20 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %30 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%29 : tensor<f32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17xf32>
    %31 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%28, %30 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %32 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%31 : tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.sqrt %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %33 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%32 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %34 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%23, %33 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_1 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%34, %35 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %37 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_2 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %38 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%36, %37 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %39 = tensor.empty() : tensor<17x96xf32>
    %40 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%39 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %41 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%38, %cst_3 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%40 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_32 = tensor.expand_shape %41 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
    %42 = tensor.empty() : tensor<3x1x2x17x16xf32>
    %43 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d3, d0, d1, d2, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_32 : tensor<17x3x1x2x16xf32>) outs(%42 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice = tensor.extract_slice %43[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %extracted_slice_33 = tensor.extract_slice %43[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %extracted_slice_34 = tensor.extract_slice %43[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %44 = tensor.empty() : tensor<2x17x17xf32>
    %45 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%44 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %46 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice, %extracted_slice_33 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%45 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %47 = linalg.fill ins(%cst_26 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %48 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%47 : tensor<f32>) outs(%44 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<2x17x17xf32>
    %49 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%46, %48 : tensor<2x17x17xf32>, tensor<2x17x17xf32>) outs(%44 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<2x17x17xf32>
    %50 = linalg.softmax dimension(2) ins(%49 : tensor<2x17x17xf32>) outs(%44 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %51 = tensor.empty() : tensor<2x17x16xf32>
    %52 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%51 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %53 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%50, %extracted_slice_34 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%52 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %54 = tensor.empty() : tensor<17x2x16xf32>
    %55 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%53 : tensor<2x17x16xf32>) outs(%54 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x2x16xf32>
    %collapsed_35 = tensor.collapse_shape %55 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
    %56 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%14 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %57 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_35, %cst_4 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%56 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %58 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%15, %57 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %59 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%58 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %60 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%59, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %61 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%60 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %62 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%58, %61 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.subf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %63 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%62, %25 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %64 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%63 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %65 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%64, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %66 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%65, %30 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %67 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%66 : tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.sqrt %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %68 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%67 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %69 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%62, %68 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %70 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_5 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %71 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%69, %70 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %72 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_6 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %73 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%71, %72 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %74 = tensor.empty() : tensor<17x64xf32>
    %75 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%74 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %76 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%73, %cst_7 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%75 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %77 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8 : tensor<f32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %78 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%76, %77 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
    %79 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%__hoisted_tensor_64xf32 : tensor<64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %80 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%78, %79 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %81 = linalg.fill ins(%cst_27 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %82 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%81 : tensor<f32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %83 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%80, %82 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %84 = linalg.fill ins(%cst_28 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %85 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%84 : tensor<f32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %86 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%80, %85 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %87 = linalg.fill ins(%cst_21 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %88 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%87 : tensor<f32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %89 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%86, %88 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %90 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%80, %89 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %91 = linalg.fill ins(%cst_22 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %92 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%91 : tensor<f32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %93 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%90, %92 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %94 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%93 : tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.tanh %in : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %95 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%94, %77 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %96 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%83, %95 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %97 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%96, %cst_8 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%56 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %98 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8 : tensor<f32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %99 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%97, %98 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %__hoisted_tensor_32xf32_0 = util.global.load immutable @__hoisted_tensor_32xf32_0 : tensor<32xf32>
    %100 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%__hoisted_tensor_32xf32_0 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %101 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%99, %100 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %102 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%58, %101 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %103 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%102 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %104 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%103, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %105 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%104 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %106 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%102, %105 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.subf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %107 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%106, %25 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %108 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%107 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %109 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%108, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %110 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%109, %30 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %111 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%110 : tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.sqrt %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %112 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%111 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %113 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%106, %112 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %114 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_9 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %115 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%113, %114 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %116 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_10 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %117 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%115, %116 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %118 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%117, %cst_11 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%40 : tensor<17x96xf32>) -> tensor<17x96xf32>
    %expanded_36 = tensor.expand_shape %118 [[0], [1, 2, 3, 4]] output_shape [17, 3, 1, 2, 16] : tensor<17x96xf32> into tensor<17x3x1x2x16xf32>
    %119 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d3, d0, d1, d2, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%expanded_36 : tensor<17x3x1x2x16xf32>) outs(%42 : tensor<3x1x2x17x16xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x2x17x16xf32>
    %extracted_slice_37 = tensor.extract_slice %119[0, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %extracted_slice_38 = tensor.extract_slice %119[1, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %extracted_slice_39 = tensor.extract_slice %119[2, 0, 0, 0, 0] [1, 1, 2, 17, 16] [1, 1, 1, 1, 1] : tensor<3x1x2x17x16xf32> to tensor<2x17x16xf32>
    %120 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%extracted_slice_37, %extracted_slice_38 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%45 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %121 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%120, %48 : tensor<2x17x17xf32>, tensor<2x17x17xf32>) outs(%44 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<2x17x17xf32>
    %122 = linalg.softmax dimension(2) ins(%121 : tensor<2x17x17xf32>) outs(%44 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %123 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%122, %extracted_slice_39 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%52 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
    %124 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%123 : tensor<2x17x16xf32>) outs(%54 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x2x16xf32>
    %collapsed_40 = tensor.collapse_shape %124 [[0], [1, 2]] : tensor<17x2x16xf32> into tensor<17x32xf32>
    %125 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%collapsed_40, %cst_12 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%56 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %126 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%102, %125 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %127 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%126 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %128 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%127, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %129 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%128 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %130 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%126, %129 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.subf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %131 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%130, %25 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %132 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%131 : tensor<17x32xf32>) outs(%17 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %133 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%132, %20 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %134 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%133, %30 : tensor<17xf32>, tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %135 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%134 : tensor<17xf32>) outs(%16 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.sqrt %in : f32
      linalg.yield %179 : f32
    } -> tensor<17xf32>
    %136 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%135 : tensor<17xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %137 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%130, %136 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %138 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_13 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %139 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%137, %138 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %140 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%cst_14 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %141 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%139, %140 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %142 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%141, %cst_15 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%75 : tensor<17x64xf32>) -> tensor<17x64xf32>
    %143 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%142, %77 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %__hoisted_tensor_64xf32_1 = util.global.load immutable @__hoisted_tensor_64xf32_1 : tensor<64xf32>
    %144 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%__hoisted_tensor_64xf32_1 : tensor<64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x64xf32>
    %145 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%143, %144 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %146 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%145, %82 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %147 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%145, %85 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %148 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%147, %88 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %149 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%145, %148 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %150 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%149, %92 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %151 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%150 : tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.tanh %in : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %152 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%151, %77 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %153 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%146, %152 : tensor<17x64xf32>, tensor<17x64xf32>) outs(%74 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x64xf32>
    %154 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%153, %cst_16 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%56 : tensor<17x32xf32>) -> tensor<17x32xf32>
    %155 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%154, %98 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : tensor<32xf32>
    %156 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%__hoisted_tensor_32xf32_2 : tensor<32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<17x32xf32>
    %157 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%155, %156 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %158 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%126, %157 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%14 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<17x32xf32>
    %expanded_41 = tensor.expand_shape %158 [[0, 1], [2]] output_shape [1, 17, 32] : tensor<17x32xf32> into tensor<1x17x32xf32>
    %extracted_slice_42 = tensor.extract_slice %expanded_41[0, 0, 0] [1, 1, 32] [1, 1, 1] : tensor<1x17x32xf32> to tensor<32xf32>
    %159 = linalg.fill ins(%cst_19 : f32) outs(%7 : tensor<f32>) -> tensor<f32>
    %160 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%extracted_slice_42 : tensor<32xf32>) outs(%159 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %161 = linalg.generic {indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>, affine_map<() -> ()>], iterator_types = []} ins(%160, %19 : tensor<f32>, tensor<f32>) outs(%7 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %162 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%161 : tensor<f32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32xf32>
    %163 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%extracted_slice_42, %162 : tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.subf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<32xf32>
    %164 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%24 : tensor<f32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32xf32>
    %165 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%163, %164 : tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = math.powf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<32xf32>
    %166 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%165 : tensor<32xf32>) outs(%159 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = arith.addf %out, %in : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %167 = linalg.generic {indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>, affine_map<() -> ()>], iterator_types = []} ins(%166, %19 : tensor<f32>, tensor<f32>) outs(%7 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %168 = linalg.generic {indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>, affine_map<() -> ()>], iterator_types = []} ins(%167, %29 : tensor<f32>, tensor<f32>) outs(%7 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %169 = linalg.generic {indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>], iterator_types = []} ins(%168 : tensor<f32>) outs(%7 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      %179 = math.sqrt %in : f32
      linalg.yield %179 : f32
    } -> tensor<f32>
    %170 = linalg.generic {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%169 : tensor<f32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32xf32>
    %171 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%163, %170 : tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.divf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<32xf32>
    %172 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%171, %cst_17 : tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.mulf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<32xf32>
    %173 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%172, %cst_18 : tensor<32xf32>, tensor<32xf32>) outs(%11 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
    ^bb0(%in: f32, %in_44: f32, %out: f32):
      %179 = arith.addf %in, %in_44 : f32
      linalg.yield %179 : f32
    } -> tensor<32xf32>
    %__hoisted_tensor_32x10xf32 = util.global.load immutable @__hoisted_tensor_32x10xf32 : tensor<32x10xf32>
    %174 = tensor.empty() : tensor<10xf32>
    %175 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst_19 : f32) outs(%174 : tensor<10xf32>) -> tensor<10xf32>
    %176 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%173, %__hoisted_tensor_32x10xf32 : tensor<32xf32>, tensor<32x10xf32>) outs(%175 : tensor<10xf32>) -> tensor<10xf32>
    %177 = iree_tensor_ext.compute_barrier.end %176 : tensor<10xf32> -> tensor<10xf32>
    %expanded_43 = tensor.expand_shape %177 [[0, 1]] output_shape [1, 10] : tensor<10xf32> into tensor<1x10xf32>
    %178 = hal.tensor.export %expanded_43 "output0" : tensor<1x10xf32> -> !hal.buffer_view
    util.return %178 : !hal.buffer_view
  }
}