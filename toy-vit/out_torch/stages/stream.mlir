module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>, stream.topology = #hal.device.topology<links = [(@__device_0 -> @__device_1 = {unified_memory = true, transparent_access = true}), (@__device_1 -> @__device_0 = {unified_memory = true, transparent_access = true})]>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "westmere", cpu_features = "+64bit,-adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,-avx,-avx10.1,-avx10.2,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,-clflushopt,-clwb,-clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,-f16c,-fma,-fma4,-fsgsbase,+fxsr,-gfni,-hreset,-invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,-pku,+popcnt,-ppx,-prefetchi,-prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,-rdseed,-rtm,+sahf,-serialize,-sgx,-sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,-sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,-xsave,-xsavec,-xsaveopt,-xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device
  util.global private @__device_1 = #hal.device.target<"coralnpu", [#hal.executable.target<"coralnpu", "embedded-elf-riscv_32", {cpu = "", cpu_features = "+m,+f,+zvl128b,+zve32f,+zfbfmin,+zvfbfmin,+zvfbfwma", data_layout = "e-m:e-p:32:32-i64:64-n32-S128", debug_symbols = false, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_abi = "ilp32", target_triple = "riscv32-unknown-unknown-eabi-elf"}>]> : !hal.device
  util.global private @__hoisted_tensor_32xf32 : !stream.resource<constant>
  util.global private @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
  util.initializer {
    %c0 = arith.constant 0 : index
    %c94336 = arith.constant 94336 : index
    %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<94336xi8, [
    dense<[-0.0276905708, 0.0404898524, 0.0342440978, 0.0397716612, -0.0171744078, -0.0632004067, -0.0706610903, 0.00591342896, -0.0698182582, -0.0475731567, 0.0471620187, -0.0111102946, 0.0251884013, -0.0567760766, 0.0114396289, 0.0650301427, 0.0131203979, 1.272960e-02, -0.0445359237, -0.0521816611, 0.0420718938, -0.0646112487, -0.00442092866, -0.0578277633, 0.00507219881, -0.0707173571, 0.0238915309, 1.22800469E-4, -0.0474558026, -0.0268719755, -0.0288399979, -0.0323958099]> : tensor<32xf32>,
    dense<"0x42182E3CB71C6E3C80BD4ABCE59EC73BC170B3BBF3C530BCEED50BBC29B5C33C50FA843C4A50B83CB378C93B495CE03C509BD83B8752553DF7AC283C4F3DA93C89D52C3DF0B9BDBC8BC4703C9BF20F3DC21249BCFB3DA6BBBBAFE5BC9BB2693C20972ABDC7F8D53CD0051F3C4D7E9ABC16262BBC792DEABB7207103C304C2F3C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"> : tensor<1x17x32xf32>,
    dense<[-0.0784074887, 0.133701041, 0.0374686718, -0.158422261, 0.130385116, 0.145757273, -0.00937364995, 0.16273497, -0.159684181, 0.0142502487, 0.0222800821, 0.0433393121, 0.0852099806, 0.0597920865, 0.165532157, -0.0992107912, 0.033257544, 0.0742416829, -0.13994953, -0.0678704157, -1.399000e-01, -0.0653569475, -9.426210e-02, 0.134886906, -0.0863711535, 0.0479414463, -0.0776928663, 0.114026859, -0.00245939195, -0.120036267, -0.0585362837, -0.111347251, 0.058000803, 0.154466733, 0.0569904447, 0.0454519391, -0.138848573, 0.0174276978, 0.0797319859, 0.0079472512, -0.173067868, -0.111326642, -0.169811338, 0.029356584, 0.0564059466, 0.0901445895, 0.109597936, -0.11835935, 0.0541898608, 1.717100e-01, -0.0753134862, -0.176457703, -0.0500689149, -0.0760044828, 0.131950065, 0.134556964, 0.164986417, 0.120694682, 0.0108208507, -0.0929305106, 0.0313722789, -0.0333369076, -0.0782917141, -0.149090782]> : tensor<64xf32>,
    dense<[-0.112075552, -0.0255997777, -0.124581501, -0.0398785472, -0.0453947634, -0.115945354, 0.107957944, 0.0325788558, -0.0590812117, 0.12016806, 0.104247957, 0.0104369968, -0.0140919685, 0.0961571335, 0.0116656125, 0.0130360574, -0.0130532235, 0.0388890803, 0.0675139278, 0.109392256, -0.0826037675, 0.00360101461, 0.0288103074, 0.0478569418, 0.0760918557, 0.0768085271, -0.120889977, 4.285200e-02, 0.0012576431, 0.00353564322, -0.108476371, 0.0939218849]> : tensor<32xf32>,
    dense<[-0.175582215, -0.121136509, 0.0857552141, 0.115511701, -0.00239191949, 0.0847716779, -0.123038813, 0.0959124416, 0.052226007, -0.105357677, -7.668010e-02, 0.0772880465, -0.0730696768, -0.154912323, -0.082832314, 0.0665367246, 0.0786557943, 0.031330958, -0.173346281, 0.136475161, 0.171134785, -0.115252942, -0.0781469568, -0.00420203805, -0.0391709059, 0.130503163, -0.143010452, -0.0201214552, 0.140517965, 0.165210441, 0.117852256, 0.174726263, -0.111183636, 0.0413551182, -0.00620362163, -0.0760360137, -0.136114344, -0.109061882, -0.0432827473, 0.14210479, 0.176408991, 0.129393891, 0.0563398153, -0.00837628543, -0.103125602, -0.0894689932, -0.105814762, -0.0258170366, -0.176422283, -0.145310387, -0.0686581209, -0.166340157, 0.0928352326, -0.0701318085, 0.126490697, -0.0932266786, 0.122805193, 0.0952892452, 0.122049972, 0.0247520208, -0.121082947, -0.035901472, 0.0468119532, -0.105514973]> : tensor<64xf32>,
    dense<"0xAA61BB3DDEA6EC3D8245D4BDEE1506BE77BFDCBD108F6E3C8E4CC13D3CDC5C3DA2DF33BEEFA0313EFD122CBE4E5811BEAA5AA8BD88D85E3DCC1940BD7AE7EC3D9B690ABE00AF1CBCF47B25BDA24D02BE2C512EBDECAD0BBDE354323EC28BAB3D7E0129BEC89722BD3048693D80478EBC429DB93D46F5B03DA60319BEDF2E06BE4C6314BDE2CEE23DBBAD84BD32C999BD9024E5BD564FAA3D15D0053EBE04A03D0884183D1995C4BD100DC83C2FAA1DBE08CF6B3DBDB9303EA76B1F3E4874E0BCF00BA83CE0E19D3BC0700B3B98352A3D572123BE0C6633BD87ABF0BDE1A91ABE872E03BEFD2CE8BDDC4D113DBCCC4C3DE220963D3881DEBD18E3DE3C183684BCD0A202BD007A2DBDABF9233E9694E23DF6A1C93DB610A63DAC8682BDF56E0D3E3E53F93DD15186BD9CBE2D3D82F009BE6672B53DCC6AE7BD48489FBC0E5FFA3D4880C6BC7BB71EBE82E99F3D90B4A43C9B98293E0C1907BE1817F6BCC6ADAABD00D23E3A607730BC058E1F3E403C4BBD03DD1F3EB4C408BE7261A7BD054D253E6B38303E9372303EE0754CBC603FAB3C8A5AA23D285B28BEC03E4A3DB66E9F3D7E57ED3D3F6AFEBD2031AABDA44F623DA293CE3DC0087A3C7035B8BC198B273E4DDC103E42FDBA3DE05A01BD0D38073ED01528BC32F9A33D91B1233E5C8D8A3D98FBEFBCC09347BB5900C5BD10C8983C2A97B93D4EC6EBBDBC1D3F3DBF6A063E308EB3BCF0176F3D229C8EBDCEA6CE3DC0E07ABC8680A9BD8FB61E3ED9D6253E5297D13D427E8CBD7115223E0E679F3D67E71D3EF0524ABDE047D7BBBC32143D03040FBEC20718BE49510B3E5B28303E96B0B43DE89443BDA0CA82BC52FC7DBD8C9D0BBE502104BC67CE273E9CC83CBD70E528BE1858F3BD93B70B3E28BF803DC0F9693C9A12C83D887850BD4DC002BE7CCED3BD5FA3103E0C80213DA083373CC84F3A3D14570FBDF21B0BBE78B26C3D8CD9F2BD21462D3ECFF820BE048F20BE050C003EA88D02BEF08E8ABC15412F3E1B05123EC035633C4823D33CBE0A2BBE3C3197BD00EE2FBBCCB771BD858F0FBE35760B3ECE6A34BE45BE86BD36161DBE2324D1BD3501043EFCEF3BBDE460873D9CE4333D88BCA73CA0BD493D3885EABC2AD9EF3D80CAA5BB282E913CBC4249BD70A7C63CF6C6A23D00182D390041BE3A80D2B53AA042E5BC204F23BE7203B1BD6169DDBDF944223E921C7DBD287B9ABC10FB50BC9699E93DB5242D3E603B933D14FCD1BDF989173E0FA6083E01D52B3EA38133BE7318C4BD00FF7ABC26F608BE1C716DBDEF87273E984E1A3D8690A83D92D6D93D50BF373D88F12B3D802FECBA6CC527BE58577D3DB0F57F3DC7DCDABD80FD1EBE5867ED3CA542053EECEA19BD707C06BE9A26AA3D95C6E6BDE079DCBC304D7BBC02DAED3DB984313E06E52CBECE62C13D0690F63D70C11FBD6C009BBD7776013EECE7183D209D4ABD40393CBC2268E13D296E2E3EF7010BBEFB9B053E82CFB43DF099D03CD3DF2D3E50EA07BD8A94F6BD4C7CACBD7D78283E28A4A23C36B5F1BD3F3307BE686AD33C803EF6BDD037C7BC00A71F3DD3061B3E0060D337C0B21A3D132011BE42A1A23DC2ECFBBD604062BD4D7F053E13B4133E00FC0F3A904232BEE829063DFE9E29BEF07ABFBC929604BE31FB1E3EB84107BE1C870D3D3907D5BDC1801DBEF4183F3D90C069BC38698D3C8AA6F03DAED4F43D1CEE08BD0F2D343EB94EBBBD8F25123EB34620BEC2FFCE3DC4F9AABDB663E6BDF88F8D3C92179A3D8A8F2EBE6C3101BEAB56333E4213C73D04D934BDEF5430BE1A6FCB3D"> : tensor<32x10xf32>,
    dense_resource<torch_tensor_32_64_torch.float32_1> : tensor<32x64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32_1> : tensor<64x32xf32>,
    dense_resource<torch_tensor_32_32_torch.float32_1> : tensor<32x32xf32>,
    dense_resource<torch_tensor_96_32_torch.float32_1> : tensor<96x32xf32>,
    dense_resource<torch_tensor_32_64_torch.float32> : tensor<32x64xf32>,
    dense_resource<torch_tensor_64_32_torch.float32> : tensor<64x32xf32>,
    dense_resource<torch_tensor_32_32_torch.float32> : tensor<32x32xf32>,
    dense_resource<torch_tensor_96_32_torch.float32> : tensor<96x32xf32>,
    dense_resource<torch_tensor_32_192_torch.float32> : tensor<32x192xf32>,
]>
    %c0_i64 = arith.constant 0 : i64
    %0 = stream.timepoint.immediate => !stream.timepoint
    %buffer_cst_0 = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<2304xi8, [
    dense<[0.00459568202, 0.00643315911, -0.0611298531, -0.0455893874, 0.0906281769, 0.045181796, -0.0276100636, 0.00241969526, 0.0241953284, -0.029884696, 0.0962207317, 0.0695524663, -0.0998327285, 0.0599662662, 0.0694933831, -0.0958881974, 7.79435038E-4, 0.0299070776, -0.014811486, 0.0167751312, 0.0331965834, -0.108748183, -0.0932690352, 0.0484820455, 0.0683543831, -0.090707615, 0.0863049626, -0.0213013887, 0.0846708118, -0.0409181863, 0.0392677635, 0.0947141349]> : tensor<32xf32>,
    dense_resource<torch_tensor_1_17_32_torch.float32> : tensor<1x17x32xf32>,
]>
    %c2304 = arith.constant 2304 : index
    %did_map, %result = stream.resource.try_map on(#hal.device.affinity<@__device_0>) %buffer_cst_0[%c0] : !util.buffer -> i1, !stream.resource<constant>{%c2304}
    cf.cond_br %did_map, ^bb2(%0, %result : !stream.timepoint, !stream.resource<constant>), ^bb1
  ^bb1:  // pred: ^bb0
    %1 = stream.resource.alloc uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<constant>{%c2304}
    %file = stream.file.constant on(#hal.device.affinity<@__device_0>) %buffer_cst_0[%c0 for %c2304] : !util.buffer{%c2304} -> !stream.file
    %2 = stream.file.read on(#hal.device.affinity<@__device_0>) await(%0) => %file[%c0_i64], %1[%c0], %c2304 : !stream.file -> !stream.resource<constant>{%c2304} => !stream.timepoint
    cf.br ^bb2(%2, %1 : !stream.timepoint, !stream.resource<constant>)
  ^bb2(%3: !stream.timepoint, %4: !stream.resource<constant>):  // 2 preds: ^bb0, ^bb1
    %did_map_1, %result_2 = stream.resource.try_map on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0] : !util.buffer -> i1, !stream.resource<constant>{%c94336}
    cf.cond_br %did_map_1, ^bb4(%0, %result_2 : !stream.timepoint, !stream.resource<constant>), ^bb3
  ^bb3:  // pred: ^bb2
    %5 = stream.resource.alloc uninitialized on(#hal.device.affinity<@__device_1>) : !stream.resource<constant>{%c94336}
    %file_3 = stream.file.constant on(#hal.device.affinity<@__device_1>) %buffer_cst[%c0 for %c94336] : !util.buffer{%c94336} -> !stream.file
    %6 = stream.file.read on(#hal.device.affinity<@__device_1>) await(%0) => %file_3[%c0_i64], %5[%c0], %c94336 : !stream.file -> !stream.resource<constant>{%c94336} => !stream.timepoint
    cf.br ^bb4(%6, %5 : !stream.timepoint, !stream.resource<constant>)
  ^bb4(%7: !stream.timepoint, %8: !stream.resource<constant>):  // 2 preds: ^bb2, ^bb3
    %9 = stream.timepoint.await sync %3 => %4 : !stream.resource<constant>{%c2304}
    %10 = stream.timepoint.await sync %7 => %8 : !stream.resource<constant>{%c94336}
    util.global.store %10, @__hoisted_tensor_32xf32 : !stream.resource<constant>
    util.global.store %9, @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
    util.return
  }
  stream.executable private @main_dispatch_0 {
    stream.executable.export public @main_dispatch_0_transpose_4x8x4x24_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_0_transpose_4x8x4x24_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0, 0], sizes = [4, 8, 4, 24], strides = [1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x8x4x24xf32>> -> tensor<4x8x4x24xf32>
        %3 = tensor.empty() : tensor<4x4x8x24xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%2 : tensor<4x8x4x24xf32>) outs(%3 : tensor<4x4x8x24xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<4x4x8x24xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0, 0], sizes = [4, 4, 8, 24], strides = [1, 1, 1, 1] : tensor<4x4x8x24xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x4x8x24xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_1 {
    stream.executable.export public @main_dispatch_1_matmul_16x32x192_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_1_matmul_16x32x192_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %c69760 = arith.constant 69760 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>>
        %1 = stream.binding.subspan %arg1[%c69760] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>>
        %2 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %3 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x192xf32>> -> tensor<16x192xf32>
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 192], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x192xf32>> -> tensor<32x192xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %7 = tensor.empty() : tensor<16x32xf32>
        %8 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%7 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %9 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %5 : tensor<16x192xf32>, tensor<32x192xf32>) outs(%8 : tensor<16x32xf32>) -> tensor<16x32xf32>
        %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%9, %6 : tensor<16x32xf32>, tensor<32xf32>) outs(%7 : tensor<16x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %11 = arith.addf %in, %in_0 : f32
          linalg.yield %11 : f32
        } -> tensor<16x32xf32>
        iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [16, 32], strides = [1, 1] : tensor<16x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_2 {
    stream.executable.export public @main_dispatch_2_elementwise_544_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_2_elementwise_544_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}) {
        %c0 = arith.constant 0 : index
        %c128 = arith.constant 128 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>
        %1 = stream.binding.subspan %arg1[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0], sizes = [544], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<544xf32>> -> tensor<544xf32>
        %5 = tensor.empty() : tensor<544xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%3, %4 : tensor<544xf32>, tensor<544xf32>) outs(%5 : tensor<544xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.addf %in, %in_0 : f32
          linalg.yield %7 : f32
        } -> tensor<544xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [544], strides = [1] : tensor<544xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<544xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_3 {
    stream.executable.export public @main_dispatch_3_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_3_reduction_17x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.200000e+01 : f32
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = arith.addf %out, %in : f32
          linalg.yield %8 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6 : tensor<17x32xf32>, tensor<17xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_1: f32, %out: f32):
          %8 = arith.divf %in_1, %cst_0 : f32
          %9 = arith.subf %in, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_4 {
    stream.executable.export public @main_dispatch_4_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_4_reduction_17x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_1> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_2> : tensor<32xf32>
        %c0 = arith.constant 0 : index
        %c2176 = arith.constant 2176 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c2176] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_5 {
    stream.executable.export public @main_dispatch_5_matmul_17x96x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_5_matmul_17x96x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: i32, %arg4: i32) {
        %c0 = arith.constant 0 : index
        %cst = arith.constant 0.000000e+00 : f32
        %0 = arith.index_castui %arg3 : i32 to index
        %1 = arith.index_castui %arg4 : i32 to index
        %2:2 = util.assume.int 
            %0[<umin = 2176, umax = 2176, udiv = 2176>, <umin = 0, umax = 0>], 
            %1[<umin = 57472, umax = 57472, udiv = 57472>, <umin = 24704, umax = 24704, udiv = 24704>]
          : index, index
        %3 = stream.binding.subspan %arg0[%2#0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %4 = stream.binding.subspan %arg1[%2#1] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>>
        %5 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        %6 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %4, offsets = [0, 0], sizes = [96, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<96x32xf32>> -> tensor<96x32xf32>
        %8 = tensor.empty() : tensor<17x96xf32>
        %9 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%8 : tensor<17x96xf32>) -> tensor<17x96xf32>
        %10 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%6, %7 : tensor<17x32xf32>, tensor<96x32xf32>) outs(%9 : tensor<17x96xf32>) -> tensor<17x96xf32>
        iree_tensor_ext.dispatch.tensor.store %10, %5, offsets = [0, 0], sizes = [17, 96], strides = [1, 1] : tensor<17x96xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x96xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_6 {
    stream.executable.export public @main_dispatch_6_transpose_17x6x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_6_transpose_17x6x16_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %c0 = arith.constant 0 : index
        %c6528 = arith.constant 6528 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>>
        %1 = stream.binding.subspan %arg1[%c6528] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [17, 6, 16], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x6x16xf32>> -> tensor<17x6x16xf32>
        %3 = tensor.empty() : tensor<6x17x16xf32>
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%2 : tensor<17x6x16xf32>) outs(%3 : tensor<6x17x16xf32>) {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<6x17x16xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0], sizes = [6, 17, 16], strides = [1, 1, 1] : tensor<6x17x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<6x17x16xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_7 {
    stream.executable.export public @main_dispatch_7_batch_matmul_2x17x17x16_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_7_batch_matmul_2x17x17x16_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 4.000000e+00 : f32
        %c6528 = arith.constant 6528 : index
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c6528] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        %2 = tensor.empty() : tensor<2x17x17xf32>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [1, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %5 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%2 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %6 = linalg.batch_matmul indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%4, %3 : tensor<2x17x16xf32>, tensor<2x17x16xf32>) outs(%5 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%6 : tensor<2x17x17xf32>) outs(%2 : tensor<2x17x17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = arith.divf %in, %cst_0 : f32
          linalg.yield %8 : f32
        } -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_8 {
    stream.executable.export public @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %c0 = arith.constant 0 : index
        %c2368 = arith.constant 2368 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>
        %1 = stream.binding.subspan %arg1[%c2368] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %3 = tensor.empty() : tensor<2x17x17xf32>
        %4 = linalg.softmax dimension(2) ins(%2 : tensor<2x17x17xf32>) outs(%3 : tensor<2x17x17xf32>) -> tensor<2x17x17xf32>
        iree_tensor_ext.dispatch.tensor.store %4, %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : tensor<2x17x17xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x17x17xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_9 {
    stream.executable.export public @main_dispatch_9_batch_matmul_2x17x16x17_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_9_batch_matmul_2x17x16x17_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c6528 = arith.constant 6528 : index
        %c2368 = arith.constant 2368 : index
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c6528] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>>
        %1 = stream.binding.subspan %arg0[%c2368] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>>
        %2 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0], sizes = [2, 17, 17], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x17x17xf32>> -> tensor<2x17x17xf32>
        %4 = tensor.empty() : tensor<17x2x16xf32>
        %5 = tensor.empty() : tensor<2x17x16xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [2, 0, 0, 0, 0], sizes = [1, 1, 2, 17, 16], strides = [1, 1, 1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<3x1x2x17x16xf32>> -> tensor<2x17x16xf32>
        %7 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %8 = linalg.batch_matmul {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %6 : tensor<2x17x17xf32>, tensor<2x17x16xf32>) outs(%7 : tensor<2x17x16xf32>) -> tensor<2x17x16xf32>
        %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>], iterator_types = ["parallel", "parallel", "parallel"]} ins(%8 : tensor<2x17x16xf32>) outs(%4 : tensor<17x2x16xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          linalg.yield %in : f32
        } -> tensor<17x2x16xf32>
        iree_tensor_ext.dispatch.tensor.store %9, %2, offsets = [0, 0, 0], sizes = [17, 2, 16], strides = [1, 1, 1] : tensor<17x2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x2x16xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_10 {
    stream.executable.export public @main_dispatch_10_matmul_17x32x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_10_matmul_17x32x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: !stream.binding {stream.alignment = 64 : index}, %arg4: i32) {
        %c0 = arith.constant 0 : index
        %cst = arith.constant 0.000000e+00 : f32
        %0 = arith.index_castui %arg4 : i32 to index
        %1 = util.assume.int %0[<umin = 53376, umax = 53376, udiv = 53376>, <umin = 20608, umax = 20608, udiv = 20608>] : index
        %2 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %3 = stream.binding.subspan %arg1[%1] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>>
        %4 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %5 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0, 0], sizes = [32, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x32xf32>> -> tensor<32x32xf32>
        %8 = iree_tensor_ext.dispatch.tensor.load %4, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %9 = tensor.empty() : tensor<17x32xf32>
        %10 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%9 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %11 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%6, %7 : tensor<17x32xf32>, tensor<32x32xf32>) outs(%10 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8, %11 : tensor<17x32xf32>, tensor<17x32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %13 = arith.addf %in, %in_0 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %12, %5, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_12 {
    stream.executable.export public @main_dispatch_12_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_12_reduction_17x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_3> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_4> : tensor<32xf32>
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_13 {
    stream.executable.export public @main_dispatch_13_matmul_17x64x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_13_matmul_17x64x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: i32, %arg4: i32) {
        %c0 = arith.constant 0 : index
        %cst = arith.constant 0.000000e+00 : f32
        %cst_0 = arith.constant 3.000000e+00 : f32
        %cst_1 = arith.constant 4.471500e-02 : f32
        %cst_2 = arith.constant 0.797884523 : f32
        %cst_3 = arith.constant 1.000000e+00 : f32
        %cst_4 = arith.constant 5.000000e-01 : f32
        %0 = arith.index_castui %arg3 : i32 to index
        %1 = arith.index_castui %arg4 : i32 to index
        %2:2 = util.assume.int 
            %0[<umin = 45184, umax = 45184, udiv = 45184>, <umin = 12416, umax = 12416, udiv = 12416>], 
            %1[<umin = 2304, umax = 2304, udiv = 2304>, <umin = 2688, umax = 2688, udiv = 2688>]
          : index, index
        %3 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %4 = stream.binding.subspan %arg1[%2#0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>>
        %5 = stream.binding.subspan %arg1[%2#1] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>>
        %6 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        %7 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %8 = iree_tensor_ext.dispatch.tensor.load %4, offsets = [0, 0], sizes = [64, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64x32xf32>> -> tensor<64x32xf32>
        %9 = iree_tensor_ext.dispatch.tensor.load %5, offsets = [0], sizes = [64], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<64xf32>> -> tensor<64xf32>
        %10 = tensor.empty() : tensor<17x64xf32>
        %11 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%10 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %12 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%7, %8 : tensor<17x32xf32>, tensor<64x32xf32>) outs(%11 : tensor<17x64xf32>) -> tensor<17x64xf32>
        %13 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%12, %9 : tensor<17x64xf32>, tensor<64xf32>) outs(%10 : tensor<17x64xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %out: f32):
          %14 = arith.addf %in, %in_5 : f32
          %15 = math.powf %14, %cst_0 : f32
          %16 = arith.mulf %15, %cst_1 : f32
          %17 = arith.addf %14, %16 : f32
          %18 = arith.mulf %17, %cst_2 : f32
          %19 = math.tanh %18 : f32
          %20 = arith.addf %19, %cst_3 : f32
          %21 = arith.mulf %14, %cst_4 : f32
          %22 = arith.mulf %21, %20 : f32
          linalg.yield %22 : f32
        } -> tensor<17x64xf32>
        iree_tensor_ext.dispatch.tensor.store %13, %6, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : tensor<17x64xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x64xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_14 {
    stream.executable.export public @main_dispatch_14_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_14_matmul_17x32x64_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %c36992 = arith.constant 36992 : index
        %c2560 = arith.constant 2560 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>
        %1 = stream.binding.subspan %arg1[%c36992] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %3 = stream.binding.subspan %arg1[%c2560] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %4 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %5 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %8 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %9 = tensor.empty() : tensor<17x32xf32>
        %10 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%9 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %11 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%5, %6 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%10 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %12 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%7, %11, %8 : tensor<17x32xf32>, tensor<17x32xf32>, tensor<32xf32>) outs(%9 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %13 = arith.addf %in_0, %in_1 : f32
          %14 = arith.addf %in, %13 : f32
          linalg.yield %14 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %12, %4, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_16 {
    stream.executable.export public @main_dispatch_16_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_16_reduction_17x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_6> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_7> : tensor<32xf32>
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_24 {
    stream.executable.export public @main_dispatch_24_reduction_17x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_24_reduction_17x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %cst_1 = arith.constant 3.200000e+01 : f32
        %cst_2 = arith.constant 9.99999997E-7 : f32
        %cst_3 = arith.constant dense_resource<torch_tensor_32_torch.float32_8> : tensor<32xf32>
        %cst_4 = arith.constant dense_resource<torch_tensor_32_torch.float32_9> : tensor<32xf32>
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x32xf32>> -> tensor<17x32xf32>
        %3 = tensor.empty() : tensor<17x32xf32>
        %4 = tensor.empty() : tensor<17xf32>
        %5 = linalg.fill ins(%cst_0 : f32) outs(%4 : tensor<17xf32>) -> tensor<17xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<17x32xf32>) outs(%5 : tensor<17xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %8 = math.powf %in, %cst : f32
          %9 = arith.addf %out, %8 : f32
          linalg.yield %9 : f32
        } -> tensor<17xf32>
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_3, %cst_4 : tensor<17x32xf32>, tensor<17xf32>, tensor<32xf32>, tensor<32xf32>) outs(%3 : tensor<17x32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %out: f32):
          %8 = arith.divf %in_5, %cst_1 : f32
          %9 = arith.addf %8, %cst_2 : f32
          %10 = math.sqrt %9 : f32
          %11 = arith.divf %in, %10 : f32
          %12 = arith.mulf %11, %in_6 : f32
          %13 = arith.addf %12, %in_7 : f32
          linalg.yield %13 : f32
        } -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_26 {
    stream.executable.export public @main_dispatch_26_matmul_17x32x64_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_26_matmul_17x32x64_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %c4224 = arith.constant 4224 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>>
        %1 = stream.binding.subspan %arg1[%c4224] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [17, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<17x64xf32>> -> tensor<17x64xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 64], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x64xf32>> -> tensor<32x64xf32>
        %5 = tensor.empty() : tensor<17x32xf32>
        %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<17x32xf32>) -> tensor<17x32xf32>
        %7 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<17x64xf32>, tensor<32x64xf32>) outs(%6 : tensor<17x32xf32>) -> tensor<17x32xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0], sizes = [17, 32], strides = [1, 1] : tensor<17x32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<17x32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_27 {
    stream.executable.export public @main_dispatch_27_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_27_elementwise_32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}, %arg3: !stream.binding {stream.alignment = 64 : index}) {
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %3 = stream.binding.subspan %arg3[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %4 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %7 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0], sizes = [1, 1, 32], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x17x32xf32>> -> tensor<32xf32>
        %8 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%7, %6, %4 : tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
          %9 = arith.addf %in_0, %in_1 : f32
          %10 = arith.addf %in, %9 : f32
          linalg.yield %10 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %8, %3, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_28 {
    stream.executable.export public @main_dispatch_28_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_28_reduction_32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %c128 = arith.constant 128 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<f32>
        %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<f32>) -> tensor<f32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%2 : tensor<32xf32>) outs(%4 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = arith.addf %out, %in : f32
          linalg.yield %6 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %5, %1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_29 {
    stream.executable.export public @main_dispatch_29_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_29_elementwise_32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 3.200000e+01 : f32
        %c0 = arith.constant 0 : index
        %c128 = arith.constant 128 : index
        %c192 = arith.constant 192 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>
        %2 = stream.binding.subspan %arg1[%c192] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%3, %4 : tensor<32xf32>, tensor<f32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %7 = arith.divf %in_0, %cst : f32
          %8 = arith.subf %in, %7 : f32
          linalg.yield %8 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_30 {
    stream.executable.export public @main_dispatch_30_reduction_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_30_reduction_32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 2.000000e+00 : f32
        %cst_0 = arith.constant 0.000000e+00 : f32
        %c192 = arith.constant 192 : index
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c192] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %3 = tensor.empty() : tensor<f32>
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<f32>) -> tensor<f32>
        %5 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = ["reduction"]} ins(%2 : tensor<32xf32>) outs(%4 : tensor<f32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %out: f32):
          %6 = math.powf %in, %cst : f32
          %7 = arith.addf %out, %6 : f32
          linalg.yield %7 : f32
        } -> tensor<f32>
        iree_tensor_ext.dispatch.tensor.store %5, %1, offsets = [], sizes = [], strides = [] : tensor<f32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<f32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_31 {
    stream.executable.export public @main_dispatch_31_elementwise_32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_0>}
    builtin.module {
      func.func @main_dispatch_31_elementwise_32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 3.200000e+01 : f32
        %cst_0 = arith.constant 9.99999997E-7 : f32
        %cst_1 = arith.constant dense_resource<torch_tensor_32_torch.float32_11> : tensor<32xf32>
        %cst_2 = arith.constant dense_resource<torch_tensor_32_torch.float32_12> : tensor<32xf32>
        %c192 = arith.constant 192 : index
        %c0 = arith.constant 0 : index
        %0 = stream.binding.subspan %arg0[%c192] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>>
        %2 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [], sizes = [], strides = [] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<f32>> -> tensor<f32>
        %5 = tensor.empty() : tensor<32xf32>
        %6 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} ins(%3, %4, %cst_1, %cst_2 : tensor<32xf32>, tensor<f32>, tensor<32xf32>, tensor<32xf32>) outs(%5 : tensor<32xf32>) attrs =  {stream.affinity = #hal.device.affinity<@__device_0>} {
        ^bb0(%in: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
          %7 = arith.divf %in_3, %cst : f32
          %8 = arith.addf %7, %cst_0 : f32
          %9 = math.sqrt %8 : f32
          %10 = arith.divf %in, %9 : f32
          %11 = arith.mulf %10, %in_4 : f32
          %12 = arith.addf %11, %in_5 : f32
          linalg.yield %12 : f32
        } -> tensor<32xf32>
        iree_tensor_ext.dispatch.tensor.store %6, %2, offsets = [0], sizes = [32], strides = [1] : tensor<32xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<32xf32>>
        return
      }
    }
  }
  stream.executable private @main_dispatch_32 {
    stream.executable.export public @main_dispatch_32_vecmat_10x32_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      stream.return %x, %y, %z : index, index, index
    } attributes {stream.affinity = #hal.device.affinity<@__device_1>}
    builtin.module {
      func.func @main_dispatch_32_vecmat_10x32_f32(%arg0: !stream.binding {stream.alignment = 64 : index}, %arg1: !stream.binding {stream.alignment = 64 : index}, %arg2: !stream.binding {stream.alignment = 64 : index}) {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %c2944 = arith.constant 2944 : index
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>>
        %1 = stream.binding.subspan %arg1[%c2944] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>>
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0], sizes = [32], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32xf32>> -> tensor<32xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [32, 10], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<32x10xf32>> -> tensor<32x10xf32>
        %5 = tensor.empty() : tensor<10xf32>
        %6 = linalg.fill {stream.affinity = #hal.device.affinity<@__device_0>} ins(%cst : f32) outs(%5 : tensor<10xf32>) -> tensor<10xf32>
        %7 = linalg.vecmat {stream.affinity = #hal.device.affinity<@__device_1>} ins(%3, %4 : tensor<32xf32>, tensor<32x10xf32>) outs(%6 : tensor<10xf32>) -> tensor<10xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0], sizes = [10], strides = [1] : tensor<10xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<10xf32>>
        return
      }
    }
  }
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @main(%input0: tensor<1x32x32x3xf32>) -> (%output0: tensor<1x10xf32>)"}} {
    %c2688_i32 = arith.constant 2688 : i32
    %c12416_i32 = arith.constant 12416 : i32
    %c20608_i32 = arith.constant 20608 : i32
    %c24704_i32 = arith.constant 24704 : i32
    %c2304_i32 = arith.constant 2304 : i32
    %c45184_i32 = arith.constant 45184 : i32
    %c53376_i32 = arith.constant 53376 : i32
    %c57472_i32 = arith.constant 57472 : i32
    %c2176_i32 = arith.constant 2176 : i32
    %c0_i32 = arith.constant 0 : i32
    %c40 = arith.constant 40 : index
    %c4352 = arith.constant 4352 : index
    %c2176 = arith.constant 2176 : index
    %c128 = arith.constant 128 : index
    %c2048 = arith.constant 2048 : index
    %c0 = arith.constant 0 : index
    %c12288 = arith.constant 12288 : index
    %c3 = arith.constant 3 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c13056 = arith.constant 13056 : index
    %c320 = arith.constant 320 : index
    %c94336 = arith.constant 94336 : index
    %c2304 = arith.constant 2304 : index
    %__hoisted_tensor_32xf32 = util.global.load immutable @__hoisted_tensor_32xf32 : !stream.resource<constant>
    %__hoisted_tensor_32xf32_2 = util.global.load immutable @__hoisted_tensor_32xf32_2 : !stream.resource<constant>
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) : !stream.resource<transient>{%c2176} => !stream.timepoint
    %0 = stream.cmd.execute await(%result_timepoint) => with(%__hoisted_tensor_32xf32 as %arg1: !stream.resource<constant>{%c94336}, %result as %arg2: !stream.resource<transient>{%c2176}) {
      stream.cmd.copy %arg1[%c128], %arg2[%c0], %c2176 : !stream.resource<constant>{%c94336} -> !stream.resource<transient>{%c2176}
    } => !stream.timepoint
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c1, %c32, %c32, %c3]) type(%element_type_f32) encoding(%dense_row_major)
    %1 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<1x32x32x3xf32> in !stream.resource<external>{%c12288}
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) : !stream.resource<transient>{%c12288} => !stream.timepoint
    %2 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint_1) => with(%1 as %arg1: !stream.resource<external>{%c12288}, %result_0 as %arg2: !stream.resource<transient>{%c12288}) {
      stream.cmd.dispatch @main_dispatch_0::@main_dispatch_0_transpose_4x8x4x24_f32 {
        ro %arg1[%c0 for %c12288] : !stream.resource<external>{%c12288},
        wo %arg2[%c0 for %c12288] : !stream.resource<transient>{%c12288}
      }
    } => !stream.timepoint
    %result_2, %result_timepoint_3 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%2) => !stream.resource<transient>{%c2048} => !stream.timepoint
    %result_4, %result_timepoint_5 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%2) => !stream.resource<transient>{%c2048} => !stream.timepoint
    %3 = stream.timepoint.join max(%result_timepoint_3, %result_timepoint_5) => !stream.timepoint
    %4 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%3) => with(%result_0 as %arg1: !stream.resource<transient>{%c12288}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result_2 as %arg3: !stream.resource<transient>{%c2048}, %result_4 as %arg4: !stream.resource<transient>{%c2048}) {
      stream.cmd.dispatch @main_dispatch_1::@main_dispatch_1_matmul_16x32x192_f32 {
        ro %arg1[%c0 for %c12288] : !stream.resource<transient>{%c12288},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg4[%c0 for %c2048] : !stream.resource<transient>{%c2048}
      }
      stream.cmd.copy %arg4[%c0], %arg3[%c0], %c2048 : !stream.resource<transient>{%c2048} -> !stream.resource<transient>{%c2048}
    } => !stream.timepoint
    %5 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%4) => %result_0 : !stream.resource<transient>{%c12288} => !stream.timepoint
    %6 = stream.resource.dealloca on(#hal.device.affinity<@__device_1>) await(%4) => %result_4 : !stream.resource<transient>{%c2048} => !stream.timepoint
    %7 = stream.timepoint.join max(%0, %5, %6) => !stream.timepoint
    %result_6, %result_timepoint_7 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%7) => !stream.resource<transient>{%c4352} => !stream.timepoint
    %result_8, %result_timepoint_9 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%7) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %8 = stream.timepoint.join max(%result_timepoint_7, %result_timepoint_9) => !stream.timepoint
    %9 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%8) => with(%result as %arg1: !stream.resource<transient>{%c2176}, %result_2 as %arg2: !stream.resource<transient>{%c2048}, %__hoisted_tensor_32xf32_2 as %arg3: !stream.resource<constant>{%c2304}, %result_6 as %arg4: !stream.resource<transient>{%c4352}, %result_8 as %arg5: !stream.resource<transient>{%c2176}) {
      stream.cmd.copy %arg2[%c0], %arg1[%c128], %c2048 : !stream.resource<transient>{%c2048} -> !stream.resource<transient>{%c2176}
      stream.cmd.dispatch @main_dispatch_2::@main_dispatch_2_elementwise_544_f32 {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg3[%c0 for %c2304] : !stream.resource<constant>{%c2304},
        wo %arg4[%c0 for %c4352] : !stream.resource<transient>{%c4352}
      }
      stream.cmd.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32 {
        ro %arg4[%c0 for %c4352] : !stream.resource<transient>{%c4352},
        wo %arg5[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
      stream.cmd.dispatch @main_dispatch_4::@main_dispatch_4_reduction_17x32_f32 {
        ro %arg5[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg4[%c0 for %c4352] : !stream.resource<transient>{%c4352}
      }
    } => !stream.timepoint
    %10 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%9) => %result_2 : !stream.resource<transient>{%c2048} => !stream.timepoint
    %11 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%9) => %result_8 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %12 = stream.timepoint.join max(%10, %11) => !stream.timepoint
    %result_10, %result_timepoint_11 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%12) => !stream.resource<transient>{%c13056} => !stream.timepoint
    %13 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%result_timepoint_11) => with(%result_6 as %arg1: !stream.resource<transient>{%c4352}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result as %arg3: !stream.resource<transient>{%c2176}, %result_10 as %arg4: !stream.resource<transient>{%c13056}) {
      stream.cmd.dispatch @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%c2176_i32, %c57472_i32 : i32, i32) {
        ro %arg1[%c0 for %c4352] : !stream.resource<transient>{%c4352},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32 {
        ro %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32 {
        ro %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store {
        ro %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32 {
        ro %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%c53376_i32 : i32) {
        ro %arg4[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        ro %arg1[%c0 for %c4352] : !stream.resource<transient>{%c4352},
        wo %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %14 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%13) => %result_6 : !stream.resource<transient>{%c4352} => !stream.timepoint
    %15 = stream.resource.dealloca on(#hal.device.affinity<@__device_1>) await(%13) => %result_10 : !stream.resource<transient>{%c13056} => !stream.timepoint
    %16 = stream.timepoint.join max(%14, %15) => !stream.timepoint
    %result_12, %result_timepoint_13 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%16) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_14, %result_timepoint_15 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%16) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %17 = stream.timepoint.join max(%result_timepoint_13, %result_timepoint_15) => !stream.timepoint
    %18 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%17) => with(%result as %arg1: !stream.resource<transient>{%c2176}, %result_12 as %arg2: !stream.resource<transient>{%c2176}, %result_14 as %arg3: !stream.resource<transient>{%c2176}) {
      stream.cmd.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32 {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
      stream.cmd.dispatch @main_dispatch_12::@main_dispatch_12_reduction_17x32_f32 {
        ro %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg2[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %19 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%18) => %result_14 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_16, %result_timepoint_17 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%19) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_18, %result_timepoint_19 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%19) => !stream.resource<transient>{%c4352} => !stream.timepoint
    %20 = stream.timepoint.join max(%result_timepoint_17, %result_timepoint_19) => !stream.timepoint
    %21 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%20) => with(%result_12 as %arg1: !stream.resource<transient>{%c2176}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result as %arg3: !stream.resource<transient>{%c2176}, %result_16 as %arg4: !stream.resource<transient>{%c2176}, %result_18 as %arg5: !stream.resource<transient>{%c4352}) {
      stream.cmd.dispatch @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%c45184_i32, %c2304_i32 : i32, i32) {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg5[%c0 for %c4352] : !stream.resource<transient>{%c4352}
      }
      stream.cmd.dispatch @main_dispatch_14::@main_dispatch_14_matmul_17x32x64_f32 {
        ro %arg5[%c0 for %c4352] : !stream.resource<transient>{%c4352},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        ro %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg4[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %22 = stream.resource.dealloca on(#hal.device.affinity<@__device_1>) await(%21) => %result_18 : !stream.resource<transient>{%c4352} => !stream.timepoint
    %result_20, %result_timepoint_21 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%22) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %23 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint_21) => with(%result_16 as %arg1: !stream.resource<transient>{%c2176}, %result_12 as %arg2: !stream.resource<transient>{%c2176}, %result_20 as %arg3: !stream.resource<transient>{%c2176}) {
      stream.cmd.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32 {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
      stream.cmd.dispatch @main_dispatch_16::@main_dispatch_16_reduction_17x32_f32 {
        ro %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg2[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %24 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%23) => %result_20 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_22, %result_timepoint_23 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%24) => !stream.resource<transient>{%c13056} => !stream.timepoint
    %25 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%result_timepoint_23) => with(%result_12 as %arg1: !stream.resource<transient>{%c2176}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result_16 as %arg3: !stream.resource<transient>{%c2176}, %result as %arg4: !stream.resource<transient>{%c2176}, %result_22 as %arg5: !stream.resource<transient>{%c13056}) {
      stream.cmd.dispatch @main_dispatch_5::@main_dispatch_5_matmul_17x96x32_f32(%c0_i32, %c24704_i32 : i32, i32) {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_6::@main_dispatch_6_transpose_17x6x16_f32 {
        ro %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_7::@main_dispatch_7_batch_matmul_2x17x17x16_f32 {
        ro %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_8::@main_dispatch_8_softmax_2x17x17xf32_dispatch_tensor_store {
        ro %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_9::@main_dispatch_9_batch_matmul_2x17x16x17_f32 {
        ro %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        wo %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056}
      }
      stream.cmd.dispatch @main_dispatch_10::@main_dispatch_10_matmul_17x32x32_f32(%c20608_i32 : i32) {
        ro %arg5[%c0 for %c13056] : !stream.resource<transient>{%c13056},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        ro %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg4[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %26 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%25) => %result_16 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %27 = stream.resource.dealloca on(#hal.device.affinity<@__device_1>) await(%25) => %result_22 : !stream.resource<transient>{%c13056} => !stream.timepoint
    %28 = stream.timepoint.join max(%26, %27) => !stream.timepoint
    %result_24, %result_timepoint_25 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%28) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %29 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint_25) => with(%result as %arg1: !stream.resource<transient>{%c2176}, %result_12 as %arg2: !stream.resource<transient>{%c2176}, %result_24 as %arg3: !stream.resource<transient>{%c2176}) {
      stream.cmd.dispatch @main_dispatch_3::@main_dispatch_3_reduction_17x32_f32 {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
      stream.cmd.dispatch @main_dispatch_24::@main_dispatch_24_reduction_17x32_f32 {
        ro %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        wo %arg2[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %30 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%29) => %result_24 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_26, %result_timepoint_27 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%30) => !stream.resource<transient>{%c2176} => !stream.timepoint
    %result_28, %result_timepoint_29 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%30) => !stream.resource<transient>{%c4352} => !stream.timepoint
    %31 = stream.timepoint.join max(%result_timepoint_27, %result_timepoint_29) => !stream.timepoint
    %32 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%31) => with(%result_12 as %arg1: !stream.resource<transient>{%c2176}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result_26 as %arg3: !stream.resource<transient>{%c2176}, %result_28 as %arg4: !stream.resource<transient>{%c4352}) {
      stream.cmd.dispatch @main_dispatch_13::@main_dispatch_13_matmul_17x64x32_f32(%c12416_i32, %c2688_i32 : i32, i32) {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg4[%c0 for %c4352] : !stream.resource<transient>{%c4352}
      }
      stream.cmd.dispatch @main_dispatch_26::@main_dispatch_26_matmul_17x32x64_f32 {
        ro %arg4[%c0 for %c4352] : !stream.resource<transient>{%c4352},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg3[%c0 for %c2176] : !stream.resource<transient>{%c2176}
      }
    } => !stream.timepoint
    %33 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%32) => %result_12 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %34 = stream.resource.dealloca on(#hal.device.affinity<@__device_1>) await(%32) => %result_28 : !stream.resource<transient>{%c4352} => !stream.timepoint
    %35 = stream.timepoint.join max(%33, %34) => !stream.timepoint
    %result_30, %result_timepoint_31 = stream.resource.alloca uninitialized on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%35) => !stream.resource<transient>{%c128} => !stream.timepoint
    %result_32, %result_timepoint_33 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%35) => !stream.resource<transient>{%c320} => !stream.timepoint
    %36 = stream.timepoint.join max(%result_timepoint_31, %result_timepoint_33) => !stream.timepoint
    %37 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%36) => with(%result_26 as %arg1: !stream.resource<transient>{%c2176}, %result as %arg2: !stream.resource<transient>{%c2176}, %__hoisted_tensor_32xf32_2 as %arg3: !stream.resource<constant>{%c2304}, %result_30 as %arg4: !stream.resource<transient>{%c128}, %result_32 as %arg5: !stream.resource<transient>{%c320}) {
      stream.cmd.dispatch @main_dispatch_27::@main_dispatch_27_elementwise_32_f32 {
        ro %arg1[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg2[%c0 for %c2176] : !stream.resource<transient>{%c2176},
        ro %arg3[%c0 for %c2304] : !stream.resource<constant>{%c2304},
        wo %arg5[%c0 for %c320] : !stream.resource<transient>{%c320}
      }
      stream.cmd.dispatch @main_dispatch_28::@main_dispatch_28_reduction_32_f32 {
        ro %arg5[%c0 for %c320] : !stream.resource<transient>{%c320},
        wo %arg5[%c0 for %c320] : !stream.resource<transient>{%c320}
      }
      stream.cmd.dispatch @main_dispatch_29::@main_dispatch_29_elementwise_32_f32 {
        ro %arg5[%c0 for %c320] : !stream.resource<transient>{%c320},
        wo %arg5[%c0 for %c320] : !stream.resource<transient>{%c320}
      }
      stream.cmd.dispatch @main_dispatch_30::@main_dispatch_30_reduction_32_f32 {
        ro %arg5[%c0 for %c320] : !stream.resource<transient>{%c320},
        wo %arg5[%c0 for %c320] : !stream.resource<transient>{%c320}
      }
      stream.cmd.dispatch @main_dispatch_31::@main_dispatch_31_elementwise_32_f32 {
        ro %arg5[%c0 for %c320] : !stream.resource<transient>{%c320},
        wo %arg4[%c0 for %c128] : !stream.resource<transient>{%c128}
      }
    } => !stream.timepoint
    %38 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%37) => %result : !stream.resource<transient>{%c2176} => !stream.timepoint
    %39 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%37) => %result_26 : !stream.resource<transient>{%c2176} => !stream.timepoint
    %40 = stream.timepoint.join max(%38, %39) => !stream.timepoint
    %41 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%40) => %result_32 : !stream.resource<transient>{%c320} => !stream.timepoint
    %result_34, %result_timepoint_35 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_1>) await(%41) => !stream.resource<external>{%c40} => !stream.timepoint
    %42 = stream.cmd.execute on(#hal.device.affinity<@__device_1>) await(%result_timepoint_35) => with(%result_30 as %arg1: !stream.resource<transient>{%c128}, %__hoisted_tensor_32xf32 as %arg2: !stream.resource<constant>{%c94336}, %result_34 as %arg3: !stream.resource<external>{%c40}) {
      stream.cmd.dispatch @main_dispatch_32::@main_dispatch_32_vecmat_10x32_f32 {
        ro %arg1[%c0 for %c128] : !stream.resource<transient>{%c128},
        ro %arg2[%c0 for %c94336] : !stream.resource<constant>{%c94336},
        wo %arg3[%c0 for %c40] : !stream.resource<external>{%c40}
      }
    } => !stream.timepoint
    %43 = stream.resource.dealloca on(#hal.device.optimal<[#hal.device.affinity<@__device_0>, #hal.device.affinity<@__device_1>]>) await(%42) => %result_30 : !stream.resource<transient>{%c128} => !stream.timepoint
    %44 = stream.timepoint.await %43 => %result_34 : !stream.resource<external>{%c40}
    %45 = stream.tensor.export on(#hal.device.affinity<@__device_1>) %44 : tensor<1x10xf32> in !stream.resource<external>{%c40} -> !hal.buffer_view
    util.return %45 : !hal.buffer_view
  }
}