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
  flow.executable private @main_dispatch_0 {
    flow.executable.export public @main_dispatch_0_transpose_4x8x4x24_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_0_transpose_4x8x4x24_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0, 0], sizes = [4, 8, 4, 24], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>> -> tensor<4x8x4x24xf32>
        %1 = tensor.empty() : tensor<4x4x8x24xf32>
        %2 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%0 : tensor<4x8x4x24xf32>) outs(%1 : tensor<4x4x8x24xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<4x4x8x24xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0, 0], sizes = [4, 4, 8, 24], strides = [1, 1, 1, 1] : tensor<4x4x8x24xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_1 {
    flow.executable.export public @main_dispatch_1_matmul_16x32x192_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_1_matmul_16x32x192_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>> -> tensor<16x192xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>> -> tensor<32x192xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<16x32xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %5 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%4 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<16x32xf32>, tensor<32xf32>) outs(%3 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<16x32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [16, 32], strides = [1, 1] : tensor<16x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_2 {
    flow.executable.export public @main_dispatch_2_elementwise_544_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_2_elementwise_544_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %2 = tensor.empty() : tensor<544xf32>
        %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%0, %1 : tensor<544xf32>, tensor<544xf32>) outs(%2 : tensor<544xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %4 = arith.addf %in, %in_0 : f32
          linalg.yield %4 : f32
        } -> tensor<544xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [544], strides = [1] : tensor<544xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_3 {
    flow.executable.export public @main_dispatch_3_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_3_reduction_17x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<17x32xf32>, tensor<17xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %6 = arith.divf %in_1, %cst_0 : f32
          %7 = arith.subf %in, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_4 {
    flow.executable.export public @main_dispatch_4_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_4_reduction_17x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_5 {
    flow.executable.export public @main_dispatch_5_matmul_17x96x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_5_matmul_17x96x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [96, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>> -> tensor<96x32xf32>
        %2 = tensor.empty() : tensor<17x96xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<17x96xf32>) -> tensor<17x96xf32>
        %4 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%3 : tensor<17x96xf32>) -> tensor<17x96xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0], sizes = [17, 96], strides = [1, 1] : tensor<17x96xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_6 {
    flow.executable.export public @main_dispatch_6_transpose_17x6x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_6_transpose_17x6x16_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [17, 6, 16], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>> -> tensor<17x6x16xf32>
        %1 = tensor.empty() : tensor<6x17x16xf32>
        %2 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<17x6x16xf32>) outs(%1 : tensor<6x17x16xf32>) {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<6x17x16xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [6, 17, 16], strides = [1, 1, 1] : tensor<6x17x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_7 {
    flow.executable.export public @main_dispatch_7_batch_matmul_2x17x17x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_7_batch_matmul_2x17x17x16_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 4.000000e+00 : f32
        %0 = tensor.empty() : tensor<2x17x17xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [1, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%0 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %4 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%2, %1 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%3 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%4 : tensor<2x17x17xf32>) outs(%0 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.divf %in, %cst_0 : f32
          linalg.yield %6 : f32
        } -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_8 {
    flow.executable.export public @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<2x17x17xf32>
        %2 = linalg.softmax dimension(2) ins(%0 : tensor<2x17x17xf32>) outs(%1 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %2, %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_9 {
    flow.executable.export public @main_dispatch_9_batch_matmul_2x17x16x17_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_9_batch_matmul_2x17x16x17_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %1 = tensor.empty() : tensor<17x2x16xf32>
        %2 = tensor.empty() : tensor<2x17x16xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [2, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %5 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %3 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%4 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<2x17x16xf32>) outs(%1 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<17x2x16xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg2, offsets = [0, 0, 0], sizes = [17, 2, 16], strides = [1, 1, 1] : tensor<17x2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_10 {
    flow.executable.export public @main_dispatch_10_matmul_17x32x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_10_matmul_17x32x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>> -> tensor<32x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %5 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%4 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %5 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_12 {
    flow.executable.export public @main_dispatch_12_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_12_reduction_17x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_13 {
    flow.executable.export public @main_dispatch_13_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_13_matmul_17x64x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.000000e+00 : f32
        %cst_1 = arith.constant 4.471500e-02 : f32
        %cst_2 = arith.constant 0.797884523 : f32
        %cst_3 = arith.constant 1.000000e+00 : f32
        %cst_4 = arith.constant 5.000000e-01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
        %3 = tensor.empty() : tensor<17x64xf32>
        %4 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%3 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %5 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%4 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %2 : tensor<17x64xf32>, tensor<64xf32>) outs(%3 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %out: f32):
          %7 = arith.addf %in, %in_5 : f32
          %8 = math.powf %7, %cst_0 : f32
          %9 = arith.mulf %8, %cst_1 : f32
          %10 = arith.addf %7, %9 : f32
          %11 = arith.mulf %10, %cst_2 : f32
          %12 = math.tanh %11 : f32
          %13 = arith.addf %12, %cst_3 : f32
          %14 = arith.mulf %7, %cst_4 : f32
          %15 = arith.mulf %14, %13 : f32
          linalg.yield %15 : f32
        } -> tensor<17x64xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %arg3, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_14 {
    flow.executable.export public @main_dispatch_14_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_14_matmul_17x32x64_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg4: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg3, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = tensor.empty() : tensor<17x32xf32>
        %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%4 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %6 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%5 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %3 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%4 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %8 = arith.addf %in_0, %in_1 : f32
          %9 = arith.addf %in, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %arg4, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_16 {
    flow.executable.export public @main_dispatch_16_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_16_reduction_17x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_24 {
    flow.executable.export public @main_dispatch_24_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_24_reduction_17x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %1 = tensor.empty() : tensor<17x32xf32>
        %2 = tensor.empty() : tensor<17xf32>
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<17xf32>) -> tensor<17xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<17x32xf32>) outs(%3 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<17xf32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %6 = arith.divf %in_5, %cst_1 : f32
          %7 = arith.addf %6, %cst_2 : f32
          %8 = math.sqrt %7 : f32
          %9 = arith.divf %in, %8 : f32
          %10 = arith.mulf %9, %in_6 : f32
          %11 = arith.addf %10, %in_7 : f32
          linalg.yield %11 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_26 {
    flow.executable.export public @main_dispatch_26_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_26_matmul_17x32x64_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %2 = tensor.empty() : tensor<17x32xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %4 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%3 : tensor<17x32xf32>) -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_27 {
    flow.executable.export public @main_dispatch_27_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_27_elementwise_32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<32xf32>
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%3, %2, %0 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%1 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %5 = arith.addf %in_0, %in_1 : f32
          %6 = arith.addf %in, %5 : f32
          linalg.yield %6 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg3, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_28 {
    flow.executable.export public @main_dispatch_28_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_28_reduction_32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<f32>
        %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<f32>) -> tensor<f32>
        %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%0 : tensor<32xf32>) outs(%2 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %4 = arith.addf %out, %in : f32
          linalg.yield %4 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_29 {
    flow.executable.export public @main_dispatch_29_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_29_elementwise_32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %cst = arith.constant 3.200000e+01 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %2 = tensor.empty() : tensor<32xf32>
        %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%0, %1 : tensor<32xf32>, tensor<f32>) outs(%2 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %4 = arith.divf %in_0, %cst : f32
          %5 = arith.subf %in, %4 : f32
          linalg.yield %5 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_30 {
    flow.executable.export public @main_dispatch_30_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_30_reduction_32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = tensor.empty() : tensor<f32>
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<f32>) -> tensor<f32>
        %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%0 : tensor<32xf32>) outs(%2 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %4 = math.powf %in, %cst : f32
          %5 = arith.addf %out, %4 : f32
          linalg.yield %5 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_31 {
    flow.executable.export public @main_dispatch_31_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_31_elementwise_32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>) {
        %cst = arith.constant 3.200000e+01 : f32
        %cst_0 = arith.constant 9.99999997E-7 : f32
        %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
        %cst_2 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %2 = tensor.empty() : tensor<32xf32>
        %3 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%0, %1, %cst_1, %cst_2 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%2 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
          %4 = arith.divf %in_3, %cst : f32
          %5 = arith.addf %4, %cst_0 : f32
          %6 = math.sqrt %5 : f32
          %7 = arith.divf %in, %6 : f32
          %8 = arith.mulf %7, %in_4 : f32
          %9 = arith.addf %8, %in_5 : f32
          linalg.yield %9 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %3, %arg2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  flow.executable private @main_dispatch_32 {
    flow.executable.export public @main_dispatch_32_vecmat_10x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      flow.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_32_vecmat_10x32_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>, %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>>, %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>) {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [32, 10], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>> -> tensor<32x10xf32>
        %2 = tensor.empty() : tensor<10xf32>
        %3 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<10xf32>) -> tensor<10xf32>
        %4 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%0, %1 : tensor<32xf32>, tensor<32x10xf32>) outs(%3 : tensor<10xf32>) -> tensor<10xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0], sizes = [10], strides = [1] : tensor<10xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        return
      }
    }
  }
  util.global private @__constant_tensor_32x64xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>
  util.global private @__constant_tensor_64x32xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>
  util.global private @__constant_tensor_32x32xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>
  util.global private @__constant_tensor_96x32xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>
  util.global private @__constant_tensor_32x64xf32_0 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>
  util.global private @__constant_tensor_64x32xf32_1 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>
  util.global private @__constant_tensor_32x32xf32_2 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>
  util.global private @__constant_tensor_96x32xf32_3 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>
  util.global private @__constant_tensor_1x17x32xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>
  util.global private @__constant_tensor_32x192xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %__constant_tensor_32x64xf32 = util.global.load immutable @__constant_tensor_32x64xf32 : tensor<32x64xf32>
    %__constant_tensor_64x32xf32 = util.global.load immutable @__constant_tensor_64x32xf32 : tensor<64x32xf32>
    %__constant_tensor_32x32xf32 = util.global.load immutable @__constant_tensor_32x32xf32 : tensor<32x32xf32>
    %__constant_tensor_96x32xf32 = util.global.load immutable @__constant_tensor_96x32xf32 : tensor<96x32xf32>
    %__constant_tensor_32x64xf32_0 = util.global.load immutable @__constant_tensor_32x64xf32_0 : tensor<32x64xf32>
    %__constant_tensor_64x32xf32_1 = util.global.load immutable @__constant_tensor_64x32xf32_1 : tensor<64x32xf32>
    %__constant_tensor_32x32xf32_2 = util.global.load immutable @__constant_tensor_32x32xf32_2 : tensor<32x32xf32>
    %__constant_tensor_96x32xf32_3 = util.global.load immutable @__constant_tensor_96x32xf32_3 : tensor<96x32xf32>
    %__constant_tensor_1x17x32xf32 = util.global.load immutable @__constant_tensor_1x17x32xf32 : tensor<1x17x32xf32>
    %__constant_tensor_32x192xf32 = util.global.load immutable @__constant_tensor_32x192xf32 : tensor<32x192xf32>
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : tensor<32xf32>
    %__hoisted_tensor_1x17x32xf32 = util.global.load immutable @__hoisted_tensor_1x17x32xf32 : tensor<1x17x32xf32>
    %__hoisted_tensor_64xf32 = util.global.load immutable @__hoisted_tensor_64xf32 : tensor<64xf32>
    %__hoisted_tensor_32xf32_0 = util.global.load immutable @__hoisted_tensor_32xf32_0 : tensor<32xf32>
    %__hoisted_tensor_64xf32_1 = util.global.load immutable @__hoisted_tensor_64xf32_1 : tensor<64xf32>
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : tensor<32xf32>
    %__hoisted_tensor_32x10xf32 = util.global.load immutable @__hoisted_tensor_32x10xf32 : tensor<32x10xf32>
    %0 = hal.tensor.import %arg0 "input0" : !hal.buffer_view -> tensor<1x32x32x3xf32>
    %1 = flow.tensor.reshape %0 : tensor<1x32x32x3xf32> -> tensor<4x8x4x24xf32>
    %2 = flow.dispatch @main_dispatch_0::@main_dispatch_0_transpose_4x8x4x24_f32(%1) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<4x8x4x24xf32>) -> tensor<4x4x8x24xf32>
    %3 = flow.tensor.reshape %2 : tensor<4x4x8x24xf32> -> tensor<16x192xf32>
    %4 = flow.dispatch @main_dispatch_1::@main_dispatch_1_matmul_16x32x192_f32(%3, %__constant_tensor_32x192xf32, %__hoisted_tensor_32xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<16x192xf32>, tensor<32x192xf32>, tensor<32xf32>) -> tensor<16x32xf32>
    %5 = flow.tensor.reshape %4 : tensor<16x32xf32> -> tensor<1x16x32xf32>
    %6 = flow.tensor.update %5, %__hoisted_tensor_1x17x32xf32[%c0, %c1, %c0] : tensor<1x16x32xf32> -> %__hoisted_tensor_1x17x32xf32 as tensor<1x17x32xf32>
    %7 = flow.tensor.reshape %6 : tensor<1x17x32xf32> -> tensor<544xf32>
    %8 = flow.tensor.reshape %__constant_tensor_1x17x32xf32 : tensor<1x17x32xf32> -> tensor<544xf32>
    %9 = flow.dispatch @main_dispatch_2::@main_dispatch_2_elementwise_544_f32(%7, %8) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<544xf32>, tensor<544xf32>) -> tensor<544xf32>
    %10 = flow.tensor.reshape %9 : tensor<544xf32> -> tensor<17x32xf32>
    %11 = flow.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%10) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %12 = flow.dispatch @main_dispatch_4::@main_dispatch_4_reduction_17x32_f32(%11) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %13 = flow.dispatch @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%12, %__constant_tensor_96x32xf32_3) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<96x32xf32>) -> tensor<17x96xf32>
    %14 = flow.tensor.reshape %13 : tensor<17x96xf32> -> tensor<17x6x16xf32>
    %15 = flow.dispatch @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32(%14) : (tensor<17x6x16xf32>) -> tensor<6x17x16xf32>
    %16 = flow.tensor.reshape %15 : tensor<6x17x16xf32> -> tensor<3x1x2x17x16xf32>
    %17 = flow.dispatch @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32(%16) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>) -> tensor<2x17x17xf32>
    %18 = flow.dispatch @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%17) : (tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %19 = flow.dispatch @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32(%16, %18) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>, tensor<2x17x17xf32>) -> tensor<17x2x16xf32>
    %20 = flow.tensor.reshape %19 : tensor<17x2x16xf32> -> tensor<17x32xf32>
    %21 = flow.dispatch @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%20, %__constant_tensor_32x32xf32_2, %10) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<32x32xf32>, tensor<17x32xf32>) -> tensor<17x32xf32>
    %22 = flow.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%21) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %23 = flow.dispatch @main_dispatch_12::@main_dispatch_12_reduction_17x32_f32(%22) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %24 = flow.dispatch @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%23, %__constant_tensor_64x32xf32_1, %__hoisted_tensor_64xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
    %25 = flow.dispatch @main_dispatch_14::@main_dispatch_14_matmul_17x32x64_f32(%24, %__constant_tensor_32x64xf32_0, %21, %__hoisted_tensor_32xf32_0) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x64xf32>, tensor<32x64xf32>, tensor<17x32xf32>, tensor<32xf32>) -> tensor<17x32xf32>
    %26 = flow.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%25) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %27 = flow.dispatch @main_dispatch_16::@main_dispatch_16_reduction_17x32_f32(%26) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %28 = flow.dispatch @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%27, %__constant_tensor_96x32xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<96x32xf32>) -> tensor<17x96xf32>
    %29 = flow.tensor.reshape %28 : tensor<17x96xf32> -> tensor<17x6x16xf32>
    %30 = flow.dispatch @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32(%29) : (tensor<17x6x16xf32>) -> tensor<6x17x16xf32>
    %31 = flow.tensor.reshape %30 : tensor<6x17x16xf32> -> tensor<3x1x2x17x16xf32>
    %32 = flow.dispatch @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32(%31) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>) -> tensor<2x17x17xf32>
    %33 = flow.dispatch @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%32) : (tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
    %34 = flow.dispatch @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32(%31, %33) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<3x1x2x17x16xf32>, tensor<2x17x17xf32>) -> tensor<17x2x16xf32>
    %35 = flow.tensor.reshape %34 : tensor<17x2x16xf32> -> tensor<17x32xf32>
    %36 = flow.dispatch @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%35, %__constant_tensor_32x32xf32, %25) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<32x32xf32>, tensor<17x32xf32>) -> tensor<17x32xf32>
    %37 = flow.tensor.reshape %36 : tensor<17x32xf32> -> tensor<1x17x32xf32>
    %38 = flow.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32(%36) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %39 = flow.dispatch @main_dispatch_24::@main_dispatch_24_reduction_17x32_f32(%38) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<17x32xf32>) -> tensor<17x32xf32>
    %40 = flow.dispatch @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%39, %__constant_tensor_64x32xf32, %__hoisted_tensor_64xf32_1) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x32xf32>, tensor<64x32xf32>, tensor<64xf32>) -> tensor<17x64xf32>
    %41 = flow.dispatch @main_dispatch_26::@main_dispatch_26_matmul_17x32x64_f32(%40, %__constant_tensor_32x64xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<17x64xf32>, tensor<32x64xf32>) -> tensor<17x32xf32>
    %42 = flow.tensor.reshape %41 : tensor<17x32xf32> -> tensor<1x17x32xf32>
    %43 = flow.dispatch @main_dispatch_27::@main_dispatch_27_elementwise_32_f32(%42, %37, %__hoisted_tensor_32xf32_2) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<1x17x32xf32>, tensor<1x17x32xf32>, tensor<32xf32>) -> tensor<32xf32>
    %44 = flow.dispatch @main_dispatch_28::@main_dispatch_28_reduction_32_f32(%43) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>) -> tensor<f32>
    %45 = flow.dispatch @main_dispatch_29::@main_dispatch_29_elementwise_32_f32(%43, %44) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>, tensor<f32>) -> tensor<32xf32>
    %46 = flow.dispatch @main_dispatch_30::@main_dispatch_30_reduction_32_f32(%45) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>) -> tensor<f32>
    %47 = flow.dispatch @main_dispatch_31::@main_dispatch_31_elementwise_32_f32(%45, %46) {stream.affinity = #hal.device.affinity<@__device_0>} : (tensor<32xf32>, tensor<f32>) -> tensor<32xf32>
    %48 = flow.dispatch @main_dispatch_32::@main_dispatch_32_vecmat_10x32_f32(%47, %__hoisted_tensor_32x10xf32) {stream.affinity = #hal.device.affinity<@__device_1>} : (tensor<32xf32>, tensor<32x10xf32>) -> tensor<10xf32>
    %49 = flow.tensor.reshape %48 : tensor<10xf32> -> tensor<1x10xf32>
    %50 = hal.tensor.export %49 "output0" : tensor<1x10xf32> -> !hal.buffer_view
    util.return %50 : !hal.buffer_view
  }
}