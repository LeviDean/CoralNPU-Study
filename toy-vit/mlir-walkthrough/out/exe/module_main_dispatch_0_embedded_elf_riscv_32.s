	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_f2p2_zicsr2p0_zmmul1p0_zfbfmin1p0_zve32f1p0_zve32x1p0_zvfbfmin1p0_zvfbfwma1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main_dispatch_0"
	.section	.text.main_dispatch_0_matmul_17x64x32_f32,"ax",@progbits
	.p2align	2
	.type	main_dispatch_0_matmul_17x64x32_f32,@function
main_dispatch_0_matmul_17x64x32_f32:
.Lfunc_begin0:
	.file	1 "/home/builder/work/walk/out/exe" "configured_module_main_dispatch_0.mlir"
	.loc	1 1 0
	.cfi_sections .debug_frame
	.cfi_startproc
	addi	sp, sp, -976
	.cfi_def_cfa_offset 976
	sw	ra, 972(sp)
	sw	s0, 968(sp)
	sw	s1, 964(sp)
	sw	s2, 960(sp)
	sw	s3, 956(sp)
	sw	s4, 952(sp)
	sw	s5, 948(sp)
	sw	s6, 944(sp)
	sw	s7, 940(sp)
	sw	s8, 936(sp)
	sw	s9, 932(sp)
	sw	s10, 928(sp)
	sw	s11, 924(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	.cfi_offset s6, -32
	.cfi_offset s7, -36
	.cfi_offset s8, -40
	.cfi_offset s9, -44
	.cfi_offset s10, -48
	.cfi_offset s11, -52
	addi	s0, sp, 976
	.cfi_def_cfa s0, 0
	csrr	a0, vlenb
	li	a3, 75
	mul	a0, a0, a3
	sub	sp, sp, a0
	andi	sp, sp, -64
.Ltmp0:
	.loc	1 26 8 prologue_end
	lw	a5, 0(a2)
	li	a0, 17
	slli	a2, a5, 4
	sw	a2, 92(sp)
	sub	a0, a0, a2
	li	a2, 16
	mv	s2, a0
	blt	a0, a2, .LBB0_2
	.loc	1 0 8 is_stmt 0
	li	s2, 16
.LBB0_2:
	.loc	1 26 8 is_stmt 1
	bgtz	a0, .LBB0_3
	j	.LBB0_33
.LBB0_3:
	.loc	1 0 8 is_stmt 0
	li	s4, 0
	lw	a0, 28(a1)
	addi	s5, sp, 672
	addi	a3, sp, 160
	.loc	1 26 8
	slli	a5, a5, 11
	vsetivli	zero, 8, e8, mf2, ta, ma
	vmset.m	v8
	addi	a1, sp, 912
	vs1r.v	v8, (a1)
	li	t5, 8
	li	t6, 128
	li	s1, 32
	lui	a1, 250738
	lui	a2, 259268
	lui	t4, 266239
	lui	a4, 790527
	lui	a6, 236827
	lui	t0, 173587
	lui	a7, 678386
	lui	t1, 715731
	lui	t2, 210368
	lui	t3, 260096
	fmv.w.x	fa5, t3
	lui	t3, 258048
	fmv.w.x	fa4, t3
	lui	t3, 227220
	addi	a1, a1, 1811
	fmv.w.x	fa3, a1
	lui	a1, 238193
	addi	a2, a2, 553
	fmv.w.x	fa2, a2
	lui	a2, 233353
	addi	a6, a6, 1815
	fmv.w.x	fa1, a6
	lui	a6, 219661
	addi	a7, a7, 1472
	addi	a6, a6, 984
	fmv.w.x	fa0, a7
	lw	a7, 0(a0)
	fmv.w.x	ft0, a6
	lw	s3, 4(a0)
	lw	a0, 8(a0)
	sw	a0, 84(sp)
	add	a7, a7, a5
	lui	a0, 241995
	addi	s6, t4, 1604
	addi	s7, a4, 1604
	addi	s8, t0, 894
	addi	s9, t1, 2047
	addi	s10, t2, 65
	addi	s11, t3, 842
	addi	ra, a1, -531
	addi	t4, a2, 1494
	addi	a0, a0, -1531
	fmv.w.x	ft1, s6
	fmv.w.x	ft2, s7
	lui	a4, 244230
	addi	a1, a3, 32
	sw	a1, 80(sp)
	addi	a1, a3, 64
	sw	a1, 76(sp)
	addi	a1, a3, 96
	sw	a1, 72(sp)
	addi	a1, a3, 128
	sw	a1, 68(sp)
	addi	a1, a3, 160
	sw	a1, 64(sp)
	addi	a1, a3, 192
	sw	a1, 60(sp)
	addi	t1, s5, 32
	addi	a1, s5, 64
	sw	a1, 124(sp)
	addi	a1, s5, 96
	sw	a1, 120(sp)
	addi	a1, s5, 128
	sw	a1, 116(sp)
	addi	a1, s5, 160
	sw	a1, 112(sp)
	addi	a1, s5, 192
	sw	a1, 108(sp)
	addi	a1, s3, 256
	sw	a1, 104(sp)
	mv	a1, s2
	sw	s2, 88(sp)
	sw	s3, 56(sp)
	sw	t1, 52(sp)
	j	.LBB0_5
.LBB0_4:
	.loc	1 0 8
	lw	s4, 100(sp)
	.loc	1 26 8
	addi	s4, s4, 8
	lw	a1, 96(sp)
	addi	a1, a1, -8
	addi	a7, a7, 1024
	lw	s2, 88(sp)
	blt	s4, s2, .LBB0_5
	j	.LBB0_33
.LBB0_5:
	.loc	1 0 8
	mv	t2, a1
	sw	a1, 96(sp)
	.loc	1 26 8
	bgtz	a1, .LBB0_6
	j	.LBB0_31
.LBB0_6:
	.loc	1 0 8
	li	a1, 8
	.loc	1 26 8
	blt	t2, a1, .LBB0_7
	j	.LBB0_32
.LBB0_7:
	sub	s2, s2, s4
	mv	t3, s2
	blt	s2, a1, .LBB0_9
.LBB0_8:
	.loc	1 0 8
	li	t3, 8
.LBB0_9:
	li	t0, 0
	.loc	1 25 8 is_stmt 1
	sgtz	a1, s2
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmv.v.x	v8, a1
	slti	a1, s2, 2
	xori	a1, a1, 1
	vmv.v.x	v9, a1
	slti	a1, s2, 3
	xori	a1, a1, 1
	vmv.v.x	v10, a1
	slti	a1, s2, 4
	xori	a1, a1, 1
	vmv.v.x	v11, a1
	slti	a1, s2, 5
	xori	a1, a1, 1
	vmv.v.x	v12, a1
	slti	a1, s2, 6
	xori	a1, a1, 1
	vmv.v.x	v13, a1
	slti	a1, s2, 7
	xori	a1, a1, 1
	vmv.v.x	v14, a1
	.loc	1 26 8
	slti	a1, s2, 8
	.loc	1 25 8
	xori	a1, a1, 1
	vmsne.vi	v8, v8, 0
	vmv.v.x	v15, a1
	addi	a1, sp, 912
	vl1r.v	v16, (a1)
	vmand.mm	v5, v8, v16
	vmsne.vi	v8, v9, 0
	.loc	1 9 8
	vmv1r.v	v0, v5
	vsetvli	zero, zero, e32, m2, ta, ma
	vmv.v.i	v18, 0
	addi	a2, sp, 128
	vse32.v	v18, (a2), v0.t
	.loc	1 25 8
	vmand.mm	v4, v8, v16
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmsne.vi	v8, v10, 0
	.loc	1 9 8
	vmv1r.v	v0, v4
	addi	a1, sp, 160
	vse32.v	v18, (a1), v0.t
	.loc	1 25 8
	vmand.mm	v3, v8, v16
	vmsne.vi	v8, v11, 0
	.loc	1 9 8
	vmv1r.v	v0, v3
	lw	a3, 80(sp)
	vse32.v	v18, (a3), v0.t
	.loc	1 25 8
	vmand.mm	v2, v8, v16
	vmsne.vi	v8, v12, 0
	.loc	1 9 8
	vmv1r.v	v0, v2
	lw	a5, 76(sp)
	vse32.v	v18, (a5), v0.t
	.loc	1 25 8
	vmand.mm	v1, v8, v16
	vmsne.vi	v8, v13, 0
	.loc	1 9 8
	vmv1r.v	v0, v1
	lw	a6, 72(sp)
	vse32.v	v18, (a6), v0.t
	.loc	1 25 8
	vmand.mm	v0, v8, v16
	vmsne.vi	v8, v14, 0
	sw	a0, 4(sp)
	csrr	a0, vlenb
	li	t1, 74
	mul	a0, a0, t1
	add	a0, sp, a0
	addi	a0, a0, 912
	vs1r.v	v0, (a0)
	lw	s5, 68(sp)
	.loc	1 9 8
	vse32.v	v18, (s5), v0.t
	.loc	1 25 8
	vmand.mm	v0, v8, v16
	vmsne.vi	v8, v15, 0
	csrr	a0, vlenb
	li	t1, 73
	mul	a0, a0, t1
	add	a0, sp, a0
	addi	a0, a0, 912
	vs1r.v	v0, (a0)
	lw	t1, 64(sp)
	.loc	1 9 8
	vse32.v	v18, (t1), v0.t
	.loc	1 25 8
	vmand.mm	v0, v8, v16
	csrr	a0, vlenb
	li	s3, 72
	mul	a0, a0, s3
	add	a0, sp, a0
	addi	a0, a0, 912
	vs1r.v	v0, (a0)
	lw	s3, 60(sp)
	.loc	1 9 8
	vse32.v	v18, (s3), v0.t
	vle32.v	v8, (a2)
	csrr	a2, vlenb
	slli	a0, a2, 4
	sub	a2, a0, a2
	lw	a0, 4(sp)
	add	a2, sp, a2
	addi	a2, a2, 912
	vs2r.v	v8, (a2)
	vle32.v	v8, (a1)
	csrr	a1, vlenb
	li	a2, 13
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (a3)
	csrr	a1, vlenb
	li	a2, 11
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (a5)
	csrr	a1, vlenb
	slli	a2, a1, 3
	add	a1, a2, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (a6)
	csrr	a1, vlenb
	slli	a2, a1, 3
	sub	a1, a2, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (s5)
	csrr	a1, vlenb
	slli	a2, a1, 2
	add	a1, a2, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (t1)
	csrr	a1, vlenb
	slli	a2, a1, 1
	add	a1, a2, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vle32.v	v8, (s3)
	csrr	a1, vlenb
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	lw	a1, 92(sp)
	sw	s4, 100(sp)
	.loc	1 26 8
	add	a1, s4, a1
	slli	a1, a1, 8
	lw	s4, 84(sp)
	add	s4, s4, a1
	csrr	a1, vlenb
	li	a2, 21
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs1r.v	v5, (a1)
	csrr	a1, vlenb
	li	a2, 20
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs1r.v	v4, (a1)
	csrr	a1, vlenb
	li	a2, 19
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs1r.v	v3, (a1)
	csrr	a1, vlenb
	li	a2, 18
	mul	a1, a1, a2
	add	a1, sp, a1
	addi	a1, a1, 912
	vs1r.v	v2, (a1)
	csrr	a1, vlenb
	slli	a2, a1, 4
	add	a1, a2, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vs1r.v	v1, (a1)
	lw	s3, 56(sp)
	lw	t1, 52(sp)
	j	.LBB0_12
.LBB0_10:
	.loc	1 0 8 is_stmt 0
	vmv1r.v	v0, v5
	addi	a1, sp, 384
	vse32.v	v30, (a1), v0.t
	vmv1r.v	v0, v4
	addi	a1, sp, 416
	vse32.v	v28, (a1), v0.t
	vmv1r.v	v0, v3
	addi	a1, sp, 448
	vse32.v	v26, (a1), v0.t
	vmv1r.v	v0, v2
	addi	a1, sp, 480
	vse32.v	v24, (a1), v0.t
	vmv1r.v	v0, v1
	addi	a1, sp, 512
	vse32.v	v22, (a1), v0.t
	csrr	a1, vlenb
	li	a3, 74
	mul	a1, a1, a3
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 544
	vse32.v	v20, (a1), v0.t
	csrr	a1, vlenb
	li	a3, 73
	mul	a1, a1, a3
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 576
	vse32.v	v18, (a1), v0.t
	csrr	a1, vlenb
	li	a3, 72
	mul	a1, a1, a3
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 608
	vse32.v	v16, (a1), v0.t
.LBB0_11:
	.loc	1 27 8 is_stmt 1
	addi	a1, sp, 640
	vle32.v	v8, (a1)
	addi	a1, sp, 672
	vle32.v	v10, (a1)
	vle32.v	v12, (t1)
	lw	a1, 124(sp)
	vle32.v	v14, (a1)
	lw	a1, 120(sp)
	vle32.v	v16, (a1)
	slli	a3, a2, 2
	add	a1, s3, a3
	vle32.v	v18, (a1)
	lw	a1, 116(sp)
	vle32.v	v20, (a1)
	lw	a1, 112(sp)
	vle32.v	v22, (a1)
	lw	a1, 108(sp)
	vle32.v	v24, (a1)
	.loc	1 29 10
	vfadd.vv	v28, v8, v18
	csrr	a1, vlenb
	slli	a1, a1, 6
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v28, (a1)
	vfadd.vv	v10, v10, v18
	vfadd.vv	v12, v12, v18
	vfadd.vv	v14, v14, v18
	csrr	a1, vlenb
	li	a5, 70
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v14, (a1)
	vfadd.vv	v0, v16, v18
	vfadd.vv	v2, v20, v18
	vfadd.vv	v4, v22, v18
	vfadd.vv	v6, v24, v18
	.loc	1 30 10
	vfmul.vv	v8, v28, v28
	vmv2r.v	v18, v10
	csrr	a1, vlenb
	li	a5, 66
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v10, (a1)
	vfmul.vv	v10, v10, v10
	vmv2r.v	v16, v12
	csrr	a1, vlenb
	li	a5, 68
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v12, (a1)
	vfmul.vv	v12, v12, v12
	vfmul.vv	v14, v14, v14
	vfmul.vv	v20, v0, v0
	vfmul.vv	v22, v2, v2
	vfmul.vv	v24, v4, v4
	vfmul.vv	v26, v6, v6
	vfmul.vv	v28, v28, v8
	vfmul.vv	v30, v18, v10
	vfmul.vv	v18, v16, v12
	csrr	a1, vlenb
	li	a5, 70
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfmul.vv	v16, v8, v14
	vfmul.vv	v14, v0, v20
	csrr	a1, vlenb
	li	a5, 44
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v0, (a1)
	csrr	a1, vlenb
	li	a5, 46
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v2, (a1)
	vfmul.vv	v12, v2, v22
	vfmul.vv	v10, v4, v24
	csrr	a1, vlenb
	li	a5, 48
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v4, (a1)
	vfmul.vv	v8, v6, v26
	csrr	a1, vlenb
	li	a5, 50
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v6, (a1)
	csrr	a1, vlenb
	slli	a1, a1, 6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	.loc	1 32 10
	vfmadd.vf	v28, fa3, v20
	csrr	a1, vlenb
	li	a5, 66
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmadd.vf	v30, fa3, v20
	csrr	a1, vlenb
	li	a5, 68
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmadd.vf	v18, fa3, v20
	csrr	a1, vlenb
	li	a5, 70
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmadd.vf	v16, fa3, v20
	vfmadd.vf	v14, fa3, v0
	vfmadd.vf	v12, fa3, v2
	vfmadd.vf	v10, fa3, v4
	vfmadd.vf	v8, fa3, v6
	.loc	1 33 10
	vfmul.vf	v20, v28, fa2
	csrr	a1, vlenb
	li	a5, 28
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v20, (a1)
	.loc	1 34 10
	vmfge.vf	v0, v20, ft1
	.loc	1 33 10
	vfmul.vf	v22, v30, fa2
	csrr	a1, vlenb
	li	a5, 34
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v22, (a1)
	.loc	1 34 10
	vmerge.vxm	v20, v20, s6, v0
	vmfge.vf	v0, v22, ft1
	.loc	1 33 10
	vfmul.vf	v24, v18, fa2
	.loc	1 34 10
	vmerge.vxm	v18, v22, s6, v0
	vmv2r.v	v22, v24
	csrr	a1, vlenb
	slli	a1, a1, 5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v24, (a1)
	vmfge.vf	v0, v24, ft1
	.loc	1 33 10
	vfmul.vf	v24, v16, fa2
	.loc	1 34 10
	vmerge.vxm	v16, v22, s6, v0
	vmv2r.v	v22, v24
	csrr	a1, vlenb
	li	a5, 30
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v24, (a1)
	vmfge.vf	v0, v24, ft1
	.loc	1 33 10
	vfmul.vf	v24, v14, fa2
	csrr	a1, vlenb
	li	a5, 36
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v24, (a1)
	.loc	1 34 10
	vmerge.vxm	v14, v22, s6, v0
	vmfge.vf	v0, v24, ft1
	.loc	1 33 10
	vfmul.vf	v22, v12, fa2
	csrr	a1, vlenb
	li	a5, 40
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v22, (a1)
	.loc	1 34 10
	vmerge.vxm	v12, v24, s6, v0
	vmfge.vf	v0, v22, ft1
	.loc	1 33 10
	vfmul.vf	v10, v10, fa2
	.loc	1 34 10
	vmerge.vxm	v22, v22, s6, v0
	csrr	a1, vlenb
	li	a5, 56
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v22, (a1)
	csrr	a1, vlenb
	li	a5, 38
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v10, (a1)
	vmfge.vf	v0, v10, ft1
	.loc	1 33 10
	vfmul.vf	v8, v8, fa2
	.loc	1 34 10
	vmerge.vxm	v10, v10, s6, v0
	csrr	a1, vlenb
	li	a5, 60
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v10, (a1)
	csrr	a1, vlenb
	li	a5, 42
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vmfge.vf	v0, v8, ft1
	vmerge.vxm	v8, v8, s6, v0
	csrr	a1, vlenb
	li	a5, 58
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vmfle.vf	v0, v20, ft2
	vmerge.vxm	v8, v20, s7, v0
	vmfle.vf	v0, v18, ft2
	vmerge.vxm	v18, v18, s7, v0
	vmfle.vf	v0, v16, ft2
	vmerge.vxm	v10, v16, s7, v0
	csrr	a1, vlenb
	li	a5, 24
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v10, (a1)
	vmfle.vf	v0, v14, ft2
	vmerge.vxm	v10, v14, s7, v0
	csrr	a1, vlenb
	li	a5, 26
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v10, (a1)
	addi	t0, a4, -1572
	addi	a1, a4, -1571
	vfmul.vv	v14, v8, v8
	vmv.v.x	v24, s8
	vmv2r.v	v16, v14
	vfmadd.vf	v16, fa0, v24
	vmv.v.x	v26, t4
	vmv2r.v	v10, v14
	vfmadd.vf	v10, ft0, v26
	vmv.v.x	v28, s9
	vfmadd.vv	v16, v14, v28
	vmv.v.x	v30, a0
	vfmadd.vv	v10, v14, v30
	vmv.v.x	v6, s10
	vfmadd.vv	v16, v14, v6
	vmv.v.x	v22, a1
	vfmadd.vv	v10, v14, v22
	vmv.v.x	v4, s11
	vfmadd.vv	v16, v14, v4
	vmv.v.x	v2, ra
	vfmadd.vv	v16, v14, v2
	vmfle.vf	v0, v12, ft2
	vmv.v.x	v20, t0
	vfmadd.vv	v16, v14, v20
	vmerge.vxm	v12, v12, s7, v0
	csrr	a1, vlenb
	li	a5, 62
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v12, (a1)
	vfmul.vv	v12, v8, v16
	csrr	a1, vlenb
	li	a5, 56
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v14, (a1)
	vmfle.vf	v0, v14, ft2
	vfdiv.vv	v10, v12, v10
	vmerge.vxm	v12, v14, s7, v0
	csrr	a1, vlenb
	li	a5, 56
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v12, (a1)
	csrr	a1, vlenb
	li	a5, 60
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v12, (a1)
	vmfle.vf	v0, v12, ft2
	vmerge.vxm	v12, v12, s7, v0
	csrr	a1, vlenb
	li	a5, 60
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v12, (a1)
	csrr	a1, vlenb
	li	a5, 58
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v12, (a1)
	vmfle.vf	v0, v12, ft2
	vmerge.vxm	v12, v12, s7, v0
	csrr	a1, vlenb
	li	a5, 58
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v12, (a1)
	csrr	a1, vlenb
	li	a5, 28
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v12, (a1)
	vfabs.v	v12, v12
	vmflt.vf	v0, v12, fa1
	csrr	a1, vlenb
	li	a5, 22
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v18, (a1)
	vfmul.vv	v12, v18, v18
	vmerge.vvm	v8, v10, v8, v0
	csrr	a1, vlenb
	li	a5, 28
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	vmv2r.v	v8, v12
	vfmadd.vf	v8, fa0, v24
	vmv2r.v	v10, v12
	vfmadd.vf	v10, ft0, v26
	vfmadd.vv	v8, v12, v28
	vfmadd.vv	v10, v12, v30
	vfmadd.vv	v8, v12, v6
	vmv2r.v	v0, v22
	csrr	a1, vlenb
	li	a5, 52
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v22, (a1)
	vfmadd.vv	v10, v12, v22
	vfmadd.vv	v8, v12, v4
	vfmadd.vv	v8, v12, v2
	csrr	a1, vlenb
	li	a5, 24
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v22, (a1)
	vfmul.vv	v14, v22, v22
	csrr	a1, vlenb
	li	a5, 54
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v20, (a1)
	vfmadd.vv	v8, v12, v20
	vmv2r.v	v12, v14
	vfmadd.vf	v12, fa0, v24
	vmv2r.v	v16, v14
	vfmadd.vf	v16, ft0, v26
	vfmadd.vv	v12, v14, v28
	vfmadd.vv	v16, v14, v30
	vfmadd.vv	v12, v14, v6
	vfmadd.vv	v16, v14, v0
	vfmadd.vv	v12, v14, v4
	vfmadd.vv	v12, v14, v2
	vfmadd.vv	v12, v14, v20
	vfmul.vv	v8, v18, v8
	csrr	a1, vlenb
	li	a5, 26
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v0, (a1)
	vfmul.vv	v14, v0, v0
	vfdiv.vv	v8, v8, v10
	vmv2r.v	v10, v14
	vfmadd.vf	v10, fa0, v24
	vmv2r.v	v18, v14
	vfmadd.vf	v18, ft0, v26
	vfmadd.vv	v10, v14, v28
	vfmadd.vv	v18, v14, v30
	vfmadd.vv	v10, v14, v6
	csrr	a1, vlenb
	li	a5, 52
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmadd.vv	v18, v14, v20
	vfmadd.vv	v10, v14, v4
	vfmadd.vv	v10, v14, v2
	csrr	a1, vlenb
	li	a5, 54
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmadd.vv	v10, v14, v20
	vfmul.vv	v12, v22, v12
	vfdiv.vv	v12, v12, v16
	vmv2r.v	v16, v0
	vfmul.vv	v10, v0, v10
	vfdiv.vv	v10, v10, v18
	csrr	a1, vlenb
	li	a5, 34
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v14, (a1)
	vfabs.v	v14, v14
	vmflt.vf	v0, v14, fa1
	csrr	a1, vlenb
	li	a5, 22
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v14, (a1)
	vmerge.vvm	v8, v8, v14, v0
	csrr	a1, vlenb
	li	a5, 22
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	csrr	a1, vlenb
	slli	a1, a1, 5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfabs.v	v8, v8
	vmflt.vf	v0, v8, fa1
	vmerge.vvm	v8, v12, v22, v0
	csrr	a1, vlenb
	slli	a1, a1, 5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	csrr	a1, vlenb
	li	a5, 30
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfabs.v	v8, v8
	vmflt.vf	v0, v8, fa1
	vmerge.vvm	v8, v10, v16, v0
	csrr	a1, vlenb
	li	a5, 34
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vs2r.v	v8, (a1)
	csrr	a1, vlenb
	li	a5, 62
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfmul.vv	v14, v8, v8
	csrr	a1, vlenb
	li	a5, 56
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfmul.vv	v18, v8, v8
	vmv2r.v	v10, v14
	vfmadd.vf	v10, fa0, v24
	vmv2r.v	v0, v18
	vfmadd.vf	v0, fa0, v24
	csrr	a1, vlenb
	li	a5, 60
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfmul.vv	v20, v8, v8
	vfmadd.vv	v10, v14, v28
	vmv2r.v	v8, v20
	vfmadd.vf	v8, fa0, v24
	csrr	a1, vlenb
	li	a5, 58
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v12, (a1)
	vfmul.vv	v16, v12, v12
	vfmacc.vf	v24, fa0, v16
	vfmadd.vv	v0, v18, v28
	vfmadd.vv	v8, v20, v28
	vfmacc.vv	v28, v16, v24
	vmv2r.v	v12, v14
	vfmadd.vf	v12, ft0, v26
	vmv2r.v	v22, v18
	vfmadd.vf	v22, ft0, v26
	vfmadd.vv	v12, v14, v30
	vmv2r.v	v24, v20
	vfmadd.vf	v24, ft0, v26
	vfmacc.vf	v26, ft0, v16
	vfmadd.vv	v22, v18, v30
	vfmadd.vv	v24, v20, v30
	vfmacc.vv	v30, v16, v26
	vfmadd.vv	v10, v14, v6
	vfmadd.vv	v0, v18, v6
	vfmadd.vv	v8, v20, v6
	vfmacc.vv	v6, v16, v28
	csrr	a1, vlenb
	li	a5, 52
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v26, (a1)
	vfmadd.vv	v12, v14, v26
	vfmadd.vv	v22, v18, v26
	vfmadd.vv	v24, v20, v26
	vfmacc.vv	v26, v16, v30
	vfmadd.vv	v10, v14, v4
	vfmadd.vv	v0, v18, v4
	vfmadd.vv	v8, v20, v4
	vfmacc.vv	v4, v16, v6
	vfmadd.vv	v10, v14, v2
	csrr	a1, vlenb
	li	a5, 54
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v28, (a1)
	vfmadd.vv	v10, v14, v28
	csrr	a1, vlenb
	li	a5, 62
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v30, (a1)
	vfmul.vv	v10, v30, v10
	vfdiv.vv	v10, v10, v12
	vfmadd.vv	v0, v18, v2
	vfmadd.vv	v8, v20, v2
	vfmacc.vv	v2, v16, v4
	vfmadd.vv	v0, v18, v28
	vfmadd.vv	v8, v20, v28
	csrr	a1, vlenb
	li	a5, 56
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v6, (a1)
	vfmul.vv	v12, v6, v0
	vfdiv.vv	v12, v12, v22
	csrr	a1, vlenb
	li	a5, 36
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v14, (a1)
	vfabs.v	v14, v14
	vmflt.vf	v0, v14, fa1
	vfmacc.vv	v28, v16, v2
	vmerge.vvm	v10, v10, v30, v0
	csrr	a1, vlenb
	li	a5, 60
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	vfmul.vv	v8, v20, v8
	vfdiv.vv	v8, v8, v24
	csrr	a1, vlenb
	li	a5, 58
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	vfmul.vv	v14, v18, v28
	vfdiv.vv	v16, v14, v26
	csrr	a1, vlenb
	li	a5, 40
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v14, (a1)
	vfabs.v	v14, v14
	vmflt.vf	v0, v14, fa1
	vmerge.vvm	v14, v12, v6, v0
	csrr	a1, vlenb
	li	a5, 38
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v12, (a1)
	vfabs.v	v12, v12
	vmflt.vf	v0, v12, fa1
	vmerge.vvm	v12, v8, v20, v0
	csrr	a1, vlenb
	li	a5, 42
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v8, (a1)
	vfabs.v	v8, v8
	vmflt.vf	v0, v8, fa1
	vmerge.vvm	v8, v16, v18, v0
	csrr	a1, vlenb
	slli	a1, a1, 6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	.loc	1 36 10
	vfmul.vf	v16, v16, fa4
	csrr	a1, vlenb
	li	a5, 28
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	.loc	1 35 10
	vfadd.vf	v18, v18, fa5
	.loc	1 37 10
	vfmul.vv	v16, v16, v18
	add	a3, s4, a3
	csrr	a1, vlenb
	li	a5, 21
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v5, (a1)
	vmv1r.v	v0, v5
	vse32.v	v16, (a3), v0.t
	csrr	a1, vlenb
	li	a5, 66
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	.loc	1 36 10
	vfmul.vf	v16, v16, fa4
	csrr	a1, vlenb
	li	a5, 22
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	.loc	1 35 10
	vfadd.vf	v18, v18, fa5
	.loc	1 37 10
	vfmul.vv	v16, v16, v18
	addi	a1, a3, 256
	csrr	a5, vlenb
	li	a6, 20
	mul	a5, a5, a6
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v4, (a5)
	vmv1r.v	v0, v4
	vse32.v	v16, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 68
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	.loc	1 36 10
	vfmul.vf	v16, v16, fa4
	csrr	a1, vlenb
	slli	a1, a1, 5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	.loc	1 35 10
	vfadd.vf	v18, v18, fa5
	.loc	1 37 10
	vfmul.vv	v16, v16, v18
	addi	a1, a3, 512
	csrr	a5, vlenb
	li	a6, 19
	mul	a5, a5, a6
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v3, (a5)
	vmv1r.v	v0, v3
	vse32.v	v16, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 70
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	.loc	1 36 10
	vfmul.vf	v16, v16, fa4
	csrr	a1, vlenb
	li	a5, 34
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	.loc	1 35 10
	vfadd.vf	v18, v18, fa5
	.loc	1 37 10
	vfmul.vv	v16, v16, v18
	addi	a1, a3, 768
	csrr	a5, vlenb
	li	a6, 18
	mul	a5, a5, a6
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v2, (a5)
	vmv1r.v	v0, v2
	vse32.v	v16, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 44
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	.loc	1 36 10
	vfmul.vf	v16, v16, fa4
	.loc	1 35 10
	vfadd.vf	v10, v10, fa5
	.loc	1 37 10
	vfmul.vv	v10, v16, v10
	addi	a1, a3, 1024
	csrr	a5, vlenb
	slli	a6, a5, 4
	add	a5, a6, a5
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v1, (a5)
	vmv1r.v	v0, v1
	vse32.v	v10, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 46
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v10, (a1)
	.loc	1 36 10
	vfmul.vf	v10, v10, fa4
	.loc	1 35 10
	vfadd.vf	v14, v14, fa5
	.loc	1 37 10
	vfmul.vv	v10, v10, v14
	addi	a1, a3, 1280
	csrr	a5, vlenb
	li	a6, 74
	mul	a5, a5, a6
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v0, (a5)
	vse32.v	v10, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 48
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v10, (a1)
	.loc	1 36 10
	vfmul.vf	v10, v10, fa4
	.loc	1 35 10
	vfadd.vf	v12, v12, fa5
	.loc	1 37 10
	vfmul.vv	v10, v10, v12
	addi	a1, a3, 1536
	csrr	a5, vlenb
	li	a6, 73
	mul	a5, a5, a6
	add	a5, sp, a5
	addi	a5, a5, 912
	vl1r.v	v0, (a5)
	vse32.v	v10, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 50
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v10, (a1)
	.loc	1 36 10
	vfmul.vf	v10, v10, fa4
	.loc	1 35 10
	vfadd.vf	v8, v8, fa5
	.loc	1 37 10
	vfmul.vv	v8, v10, v8
	addi	a1, a3, 1792
	csrr	a3, vlenb
	li	a5, 72
	mul	a3, a3, a5
	add	a3, sp, a3
	addi	a3, a3, 912
	vl1r.v	v0, (a3)
	vse32.v	v8, (a1), v0.t
	.loc	1 26 8
	addi	t0, a2, 8
	li	a1, 56
	bgeu	a2, a1, .LBB0_4
.LBB0_12:
	.loc	1 0 8 is_stmt 0
	li	a3, 0
	mv	a2, t0
	slli	t0, t0, 7
	lw	a1, 104(sp)
	add	t0, a1, t0
	mv	a5, a7
	csrr	a1, vlenb
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v16, (a1)
	csrr	a1, vlenb
	slli	a6, a1, 1
	add	a1, a6, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v18, (a1)
	csrr	a1, vlenb
	slli	a6, a1, 2
	add	a1, a6, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v20, (a1)
	csrr	a1, vlenb
	slli	a6, a1, 3
	sub	a1, a6, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v22, (a1)
	csrr	a1, vlenb
	slli	a6, a1, 3
	add	a1, a6, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v24, (a1)
	csrr	a1, vlenb
	li	a6, 11
	mul	a1, a1, a6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v26, (a1)
	csrr	a1, vlenb
	li	a6, 13
	mul	a1, a1, a6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v28, (a1)
	csrr	a1, vlenb
	slli	a6, a1, 4
	sub	a1, a6, a1
	add	a1, sp, a1
	addi	a1, a1, 912
	vl2r.v	v30, (a1)
	j	.LBB0_14
.LBB0_13:
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv1r.v	v0, v5
	.loc	1 26 8
	slli	a1, a3, 2
	add	a1, t0, a1
	vlse32.v	v10, (a1), t6
	vrgather.vi	v12, v8, 0
	vfmadd.vv	v12, v10, v30
	vmerge.vvm	v30, v30, v12, v0
	vrgather.vi	v12, v8, 1
	vfmadd.vv	v12, v10, v28
	vmv1r.v	v0, v4
	vmerge.vvm	v28, v28, v12, v0
	vrgather.vi	v12, v8, 2
	vfmadd.vv	v12, v10, v26
	vmv1r.v	v0, v3
	vmerge.vvm	v26, v26, v12, v0
	vrgather.vi	v12, v8, 3
	vfmadd.vv	v12, v10, v24
	vmv1r.v	v0, v2
	vmerge.vvm	v24, v24, v12, v0
	vrgather.vi	v12, v8, 4
	vfmadd.vv	v12, v10, v22
	vmv1r.v	v0, v1
	vmerge.vvm	v22, v22, v12, v0
	vrgather.vi	v12, v8, 5
	vrgather.vi	v14, v8, 6
	vrgather.vi	v6, v8, 7
	vfmadd.vv	v12, v10, v20
	vfmadd.vv	v14, v10, v18
	vfmadd.vv	v6, v10, v16
	addi	a3, a3, 1
	csrr	a1, vlenb
	li	a6, 74
	mul	a1, a1, a6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	vmerge.vvm	v20, v20, v12, v0
	csrr	a1, vlenb
	li	a6, 73
	mul	a1, a1, a6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	vmerge.vvm	v18, v18, v14, v0
	csrr	a1, vlenb
	li	a6, 72
	mul	a1, a1, a6
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	vmerge.vvm	v16, v16, v6, v0
	addi	a5, a5, 4
	beq	a3, s1, .LBB0_18
.LBB0_14:
	.loc	1 0 8
	li	a6, 0
	mv	s5, a5
	j	.LBB0_16
.LBB0_15:
	addi	a6, a6, 1
	.loc	1 26 8
	addi	s5, s5, 128
	beq	a6, t5, .LBB0_13
.LBB0_16:
	.loc	1 0 8
	vsetivli	zero, 8, e32, m2, ta, ma
	vid.v	v10
	vmslt.vx	v12, v10, t3
	.loc	1 26 8 is_stmt 1
	vsetvli	zero, zero, e8, mf2, ta, ma
	vmv.x.s	a1, v12
	srl	a1, a1, a6
	andi	a1, a1, 1
	beqz	a1, .LBB0_15
	flw	ft3, 0(s5)
	vsetvli	zero, zero, e32, m2, ta, ma
	vfmv.s.f	v10, ft3
	addi	a1, a6, 1
	vsetvli	zero, a1, e32, m2, tu, ma
	vslideup.vx	v8, v10, a6
	j	.LBB0_15
.LBB0_18:
	.loc	1 0 8 is_stmt 0
	blez	s2, .LBB0_10
	li	a3, 0
	addi	a1, sp, 384
	addi	a6, sp, 128
.LBB0_20:
	li	t0, 32
	mv	s5, a6
	mv	a5, a1
.LBB0_21:
	flw	ft3, 0(s5)
	addi	t0, t0, -4
	fsw	ft3, 0(a5)
	addi	a5, a5, 4
	addi	s5, s5, 4
	bnez	t0, .LBB0_21
	addi	a3, a3, 1
	addi	a1, a1, 32
	addi	a6, a6, 32
	bne	a3, t2, .LBB0_20
	vmv1r.v	v0, v5
	li	a3, 0
	addi	a1, sp, 384
	vse32.v	v30, (a1), v0.t
	addi	a6, sp, 640
	vmv1r.v	v0, v4
	addi	a1, sp, 416
	vse32.v	v28, (a1), v0.t
	vmv1r.v	v0, v3
	addi	a1, sp, 448
	vse32.v	v26, (a1), v0.t
	vmv1r.v	v0, v2
	addi	a1, sp, 480
	vse32.v	v24, (a1), v0.t
	vmv1r.v	v0, v1
	addi	a1, sp, 512
	vse32.v	v22, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 74
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 544
	vse32.v	v20, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 73
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 576
	vse32.v	v18, (a1), v0.t
	csrr	a1, vlenb
	li	a5, 72
	mul	a1, a1, a5
	add	a1, sp, a1
	addi	a1, a1, 912
	vl1r.v	v0, (a1)
	addi	a1, sp, 608
	vse32.v	v16, (a1), v0.t
	addi	a5, sp, 128
.LBB0_24:
	li	t0, 32
	mv	s5, a5
	mv	a1, a6
.LBB0_25:
	.loc	1 26 8 is_stmt 1
	flw	ft3, 0(s5)
	addi	t0, t0, -4
	fsw	ft3, 0(a1)
	addi	a1, a1, 4
	addi	s5, s5, 4
	bnez	t0, .LBB0_25
	addi	a3, a3, 1
	addi	a6, a6, 32
	addi	a5, a5, 32
	bne	a3, t2, .LBB0_24
	.loc	1 0 8 is_stmt 0
	li	a3, 0
	addi	a5, sp, 640
	addi	a6, sp, 384
.LBB0_28:
	li	t0, 32
	mv	s5, a6
	mv	a1, a5
.LBB0_29:
	.loc	1 26 8 is_stmt 1
	flw	ft3, 0(s5)
	addi	t0, t0, -4
	fsw	ft3, 0(a1)
	addi	a1, a1, 4
	addi	s5, s5, 4
	bnez	t0, .LBB0_29
	addi	a3, a3, 1
	addi	a5, a5, 32
	addi	a6, a6, 32
	bne	a3, t2, .LBB0_28
	j	.LBB0_11
.LBB0_31:
	.loc	1 0 8 is_stmt 0
	li	t2, 1
	li	a1, 8
	.loc	1 26 8
	bge	t2, a1, .LBB0_32
	j	.LBB0_7
.LBB0_32:
	.loc	1 0 8
	li	t2, 8
	.loc	1 26 8
	sub	s2, s2, s4
	mv	t3, s2
	blt	s2, a1, .LBB0_34
	j	.LBB0_8
.LBB0_34:
	j	.LBB0_9
.LBB0_33:
	.loc	1 41 8 is_stmt 1
	li	a0, 0
	.loc	1 41 8 epilogue_begin is_stmt 0
	addi	sp, s0, -976
	.cfi_def_cfa sp, 976
	lw	ra, 972(sp)
	lw	s0, 968(sp)
	lw	s1, 964(sp)
	lw	s2, 960(sp)
	lw	s3, 956(sp)
	lw	s4, 952(sp)
	lw	s5, 948(sp)
	lw	s6, 944(sp)
	lw	s7, 940(sp)
	lw	s8, 936(sp)
	lw	s9, 932(sp)
	lw	s10, 928(sp)
	lw	s11, 924(sp)
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	.cfi_restore s10
	.cfi_restore s11
	addi	sp, sp, 976
	.cfi_def_cfa_offset 0
	ret
.Ltmp1:
.Lfunc_end0:
	.size	main_dispatch_0_matmul_17x64x32_f32, .Lfunc_end0-main_dispatch_0_matmul_17x64x32_f32
	.cfi_endproc

	.section	.text.iree_hal_executable_library_query,"ax",@progbits
	.globl	iree_hal_executable_library_query
	.p2align	2
	.type	iree_hal_executable_library_query,@function
iree_hal_executable_library_query:
.Liree_hal_executable_library_query$local:
	.type	.Liree_hal_executable_library_query$local,@function
.Lfunc_begin1:
	.cfi_startproc
	addi	a0, a0, -6
.Lpcrel_hi0:
	auipc	a1, %pcrel_hi(iree_hal_executable_library_query_v0)
	snez	a0, a0
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi0)
	addi	a0, a0, -1
	and	a0, a0, a1
	ret
.Lfunc_end1:
	.size	iree_hal_executable_library_query, .Lfunc_end1-iree_hal_executable_library_query
	.size	.Liree_hal_executable_library_query$local, .Lfunc_end1-iree_hal_executable_library_query
	.cfi_endproc

	.section	.text.iree_h2f_ieee,"ax",@progbits
	.p2align	2
	.type	iree_h2f_ieee,@function
iree_h2f_ieee:
.Lfunc_begin2:
	.cfi_startproc
	li	a3, 31
	andi	a1, a0, 1023
	lui	a4, 8
	slli	a3, a3, 10
	and	a2, a0, a3
	and	a0, a0, a4
	slli	a0, a0, 16
	beqz	a2, .LBB2_4
	bne	a2, a3, .LBB2_5
	beqz	a1, .LBB2_6
	lui	a1, 523264
	or	a0, a0, a1
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB2_4:
	lui	a2, 210944
	or	a0, a0, a2
	fcvt.s.wu	fa5, a1
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.LBB2_5:
	add	a1, a2, a1
	lui	a2, 229376
	slli	a1, a1, 13
	add	a0, a0, a2
	add	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB2_6:
	lui	a1, 522240
	or	a0, a0, a1
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.Lfunc_end2:
	.size	iree_h2f_ieee, .Lfunc_end2-iree_h2f_ieee
	.cfi_endproc

	.section	.text.iree_f2h_ieee,"ax",@progbits
	.p2align	2
	.type	iree_f2h_ieee,@function
iree_f2h_ieee:
.Lfunc_begin3:
	.cfi_startproc
	lui	a4, 522240
	and	a2, a0, a4
	srli	a1, a0, 16
	beqz	a2, .LBB3_6
	slli	a3, a0, 9
	srli	a3, a3, 9
	bne	a2, a4, .LBB3_4
	beqz	a3, .LBB3_5
	lui	a0, 8
	addi	a0, a0, -1
	or	a0, a1, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB3_4:
	lui	a4, 290816
	bgeu	a4, a2, .LBB3_7
.LBB3_5:
	li	a2, 31
	slli	a2, a2, 10
.LBB3_6:
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB3_7:
	srli	a2, a2, 23
	li	a4, 113
	bgeu	a2, a4, .LBB3_9
	lui	a0, 8
	and	a0, a1, a0
	mv	a0, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB3_9:
	lui	a4, 2
	and	a0, a0, a4
	lui	a4, 1
	add	a3, a3, a4
	li	a4, 15
	seqz	a0, a0
	sub	a3, a3, a0
	srli	a0, a3, 23
	srli	a3, a3, 13
	add	a2, a0, a2
	snez	a0, a0
	addi	a2, a2, -127
	addi	a0, a0, -1
	slli	a2, a2, 10
	and	a0, a0, a3
	add	a0, a0, a2
	slli	a2, a4, 10
	add	a2, a0, a2
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.Lfunc_end3:
	.size	iree_f2h_ieee, .Lfunc_end3-iree_f2h_ieee
	.cfi_endproc

	.section	.text.__gnu_h2f_ieee,"ax",@progbits
	.p2align	2
	.type	__gnu_h2f_ieee,@function
__gnu_h2f_ieee:
.Lfunc_begin4:
	.cfi_startproc
	li	a3, 31
	andi	a1, a0, 1023
	lui	a4, 8
	slli	a3, a3, 10
	and	a2, a0, a3
	and	a0, a0, a4
	slli	a0, a0, 16
	beqz	a2, .LBB4_4
	bne	a2, a3, .LBB4_5
	beqz	a1, .LBB4_6
	lui	a1, 523264
	or	a0, a0, a1
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB4_4:
	lui	a2, 210944
	or	a0, a0, a2
	fcvt.s.wu	fa5, a1
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.LBB4_5:
	add	a1, a2, a1
	lui	a2, 229376
	slli	a1, a1, 13
	add	a0, a0, a2
	add	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB4_6:
	lui	a1, 522240
	or	a0, a0, a1
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.Lfunc_end4:
	.size	__gnu_h2f_ieee, .Lfunc_end4-__gnu_h2f_ieee
	.cfi_endproc

	.section	.text.__extendhfsf2,"ax",@progbits
	.p2align	2
	.type	__extendhfsf2,@function
__extendhfsf2:
.Lfunc_begin5:
	.cfi_startproc
	andi	a2, a0, 1023
	srli	a1, a0, 15
	li	a3, 31
	slli	a3, a3, 10
	and	a4, a0, a3
	slli	a1, a1, 31
	beqz	a4, .LBB5_4
	bne	a4, a3, .LBB5_5
	beqz	a2, .LBB5_6
	lui	a0, 523264
	or	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB5_4:
	lui	a0, 210944
	or	a0, a1, a0
	fcvt.s.wu	fa5, a2
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.LBB5_5:
	slli	a0, a0, 17
	srli	a0, a0, 4
	add	a0, a0, a1
	lui	a1, 229376
	add	a0, a0, a1
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB5_6:
	lui	a0, 522240
	or	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.Lfunc_end5:
	.size	__extendhfsf2, .Lfunc_end5-__extendhfsf2
	.cfi_endproc

	.section	.text.__gnu_f2h_ieee,"ax",@progbits
	.p2align	2
	.type	__gnu_f2h_ieee,@function
__gnu_f2h_ieee:
.Lfunc_begin6:
	.cfi_startproc
	lui	a4, 522240
	and	a2, a0, a4
	srli	a1, a0, 16
	beqz	a2, .LBB6_6
	slli	a3, a0, 9
	srli	a3, a3, 9
	bne	a2, a4, .LBB6_4
	beqz	a3, .LBB6_5
	lui	a0, 8
	addi	a0, a0, -1
	or	a0, a1, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB6_4:
	lui	a4, 290816
	bgeu	a4, a2, .LBB6_7
.LBB6_5:
	li	a2, 31
	slli	a2, a2, 10
.LBB6_6:
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB6_7:
	srli	a2, a2, 23
	li	a4, 113
	bgeu	a2, a4, .LBB6_9
	lui	a0, 8
	and	a0, a1, a0
	mv	a0, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.LBB6_9:
	lui	a4, 2
	and	a0, a0, a4
	lui	a4, 1
	add	a3, a3, a4
	li	a4, 15
	seqz	a0, a0
	sub	a3, a3, a0
	srli	a0, a3, 23
	srli	a3, a3, 13
	add	a2, a0, a2
	snez	a0, a0
	addi	a2, a2, -127
	addi	a0, a0, -1
	slli	a2, a2, 10
	and	a0, a0, a3
	add	a0, a0, a2
	slli	a2, a4, 10
	add	a2, a0, a2
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	slli	a0, a0, 16
	srai	a0, a0, 16
	ret
.Lfunc_end6:
	.size	__gnu_f2h_ieee, .Lfunc_end6-__gnu_f2h_ieee
	.cfi_endproc

	.section	.text.__truncsfhf2,"ax",@progbits
	.p2align	2
	.type	__truncsfhf2,@function
__truncsfhf2:
.Lfunc_begin7:
	.cfi_startproc
	lui	a4, 522240
	and	a2, a0, a4
	srli	a1, a0, 16
	beqz	a2, .LBB7_9
	slli	a3, a0, 9
	srli	a3, a3, 9
	bne	a2, a4, .LBB7_4
	beqz	a3, .LBB7_5
	lui	a0, 8
	addi	a0, a0, -1
	or	a0, a1, a0
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sh	a0, 12(sp)
	lw	a0, 12(sp)
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB7_4:
	lui	a4, 290816
	bgeu	a4, a2, .LBB7_6
.LBB7_5:
	li	a2, 31
	slli	a2, a2, 10
	j	.LBB7_9
.LBB7_6:
	srli	a2, a2, 23
	li	a4, 113
	bgeu	a2, a4, .LBB7_8
	li	a2, 0
	j	.LBB7_9
.LBB7_8:
	lui	a4, 2
	and	a0, a0, a4
	lui	a4, 1
	add	a3, a3, a4
	li	a4, 15
	seqz	a0, a0
	sub	a3, a3, a0
	srli	a0, a3, 23
	srli	a3, a3, 13
	add	a2, a0, a2
	snez	a0, a0
	addi	a2, a2, -127
	addi	a0, a0, -1
	slli	a2, a2, 10
	and	a0, a0, a3
	add	a0, a0, a2
	slli	a2, a4, 10
	add	a2, a0, a2
.LBB7_9:
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sh	a0, 12(sp)
	lw	a0, 12(sp)
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end7:
	.size	__truncsfhf2, .Lfunc_end7-__truncsfhf2
	.cfi_endproc

	.section	.text.__extendhfdf2,"ax",@progbits
	.p2align	2
	.type	__extendhfdf2,@function
__extendhfdf2:
.Lfunc_begin8:
	.cfi_startproc
	andi	a2, a0, 1023
	srli	a1, a0, 15
	li	a3, 31
	slli	a3, a3, 10
	and	a4, a0, a3
	slli	a1, a1, 31
	beqz	a4, .LBB8_4
	bne	a4, a3, .LBB8_5
	beqz	a2, .LBB8_6
	lui	a0, 523264
	j	.LBB8_7
.LBB8_4:
	lui	a0, 210944
	or	a0, a1, a0
	fcvt.s.wu	fa5, a2
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	j	.LBB8_9
.LBB8_5:
	slli	a0, a0, 17
	srli	a0, a0, 4
	add	a0, a0, a1
	lui	a1, 229376
	add	a0, a0, a1
	j	.LBB8_8
.LBB8_6:
	lui	a0, 522240
.LBB8_7:
	or	a0, a1, a0
.LBB8_8:
	fmv.w.x	fa5, a0
.LBB8_9:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	fmv.x.w	a0, fa5
	call	__extendsfdf2
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end8:
	.size	__extendhfdf2, .Lfunc_end8-__extendhfdf2
	.cfi_endproc

	.section	.text.__truncdfhf2,"ax",@progbits
	.p2align	2
	.type	__truncdfhf2,@function
__truncdfhf2:
.Lfunc_begin9:
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	.cfi_remember_state
	call	__truncdfsf2
	lui	a4, 522240
	and	a2, a0, a4
	srli	a1, a0, 16
	beqz	a2, .LBB9_9
	slli	a3, a0, 9
	srli	a3, a3, 9
	bne	a2, a4, .LBB9_4
	beqz	a3, .LBB9_5
	lui	a0, 8
	addi	a0, a0, -1
	or	a0, a1, a0
	sh	a0, 8(sp)
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB9_4:
	.cfi_restore_state
	lui	a4, 290816
	bgeu	a4, a2, .LBB9_6
.LBB9_5:
	li	a2, 31
	slli	a2, a2, 10
	j	.LBB9_9
.LBB9_6:
	srli	a2, a2, 23
	li	a4, 113
	bgeu	a2, a4, .LBB9_8
	li	a2, 0
	j	.LBB9_9
.LBB9_8:
	lui	a4, 2
	and	a0, a0, a4
	lui	a4, 1
	seqz	a0, a0
	sub	a3, a3, a0
	li	a0, 15
	add	a3, a3, a4
	srli	a4, a3, 23
	srli	a3, a3, 13
	add	a2, a4, a2
	snez	a4, a4
	addi	a2, a2, -127
	addi	a4, a4, -1
	slli	a2, a2, 10
	and	a3, a4, a3
	add	a2, a3, a2
	slli	a0, a0, 10
	add	a2, a2, a0
.LBB9_9:
	lui	a0, 8
	and	a0, a1, a0
	or	a0, a2, a0
	sh	a0, 8(sp)
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end9:
	.size	__truncdfhf2, .Lfunc_end9-__truncdfhf2
	.cfi_endproc

	.section	.text.fma,"ax",@progbits
	.p2align	2
	.type	fma,@function
fma:
.Lfunc_begin10:
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	mv	s0, a5
	mv	s1, a4
	call	__muldf3
	mv	a2, s1
	mv	a3, s0
	call	__adddf3
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	lw	s1, 4(sp)
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end10:
	.size	fma, .Lfunc_end10-fma
	.cfi_endproc

	.section	.text.__math_invalidf,"ax",@progbits
	.p2align	2
	.type	__math_invalidf,@function
__math_invalidf:
.Lfunc_begin11:
	.cfi_startproc
	fmv.w.x	fa5, a0
	fsub.s	fa5, fa5, fa5
	fdiv.s	fa5, fa5, fa5
	fmv.x.w	a0, fa5
	ret
.Lfunc_end11:
	.size	__math_invalidf, .Lfunc_end11-__math_invalidf
	.cfi_endproc

	.section	.text.__math_oflowf,"ax",@progbits
	.p2align	2
	.type	__math_oflowf,@function
__math_oflowf:
.Lfunc_begin12:
	.cfi_startproc
	lui	a1, 458752
	fmv.w.x	fa5, a1
	fmv.s	fa4, fa5
	beqz	a0, .LBB12_2
	lui	a0, 983040
	fmv.w.x	fa4, a0
.LBB12_2:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fa4, 12(sp)
	flw	fa4, 12(sp)
	fmul.s	fa5, fa4, fa5
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end12:
	.size	__math_oflowf, .Lfunc_end12-__math_oflowf
	.cfi_endproc

	.section	.text.__math_xflowf,"ax",@progbits
	.p2align	2
	.type	__math_xflowf,@function
__math_xflowf:
.Lfunc_begin13:
	.cfi_startproc
	fmv.w.x	fa5, a1
	fmv.s	fa4, fa5
	beqz	a0, .LBB13_2
	fneg.s	fa4, fa5
.LBB13_2:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fa4, 12(sp)
	flw	fa4, 12(sp)
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end13:
	.size	__math_xflowf, .Lfunc_end13-__math_xflowf
	.cfi_endproc

	.section	.text.__math_uflowf,"ax",@progbits
	.p2align	2
	.type	__math_uflowf,@function
__math_uflowf:
.Lfunc_begin14:
	.cfi_startproc
	lui	a1, 65536
	fmv.w.x	fa5, a1
	fmv.s	fa4, fa5
	beqz	a0, .LBB14_2
	lui	a0, 589824
	fmv.w.x	fa4, a0
.LBB14_2:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fa4, 12(sp)
	flw	fa4, 12(sp)
	fmul.s	fa5, fa4, fa5
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end14:
	.size	__math_uflowf, .Lfunc_end14-__math_uflowf
	.cfi_endproc

	.section	.text.ceilf,"ax",@progbits
	.p2align	2
	.type	ceilf,@function
ceilf:
.Lfunc_begin15:
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	slli	a1, a0, 1
	srli	a1, a1, 24
	li	a2, 149
	fmv.w.x	fa5, a0
	bltu	a2, a1, .LBB15_9
	li	a2, 127
	bltu	a1, a2, .LBB15_4
	addi	a1, a1, -127
	lui	a2, 2048
	addi	a2, a2, -1
	srl	a2, a2, a1
	and	a3, a2, a0
	beqz	a3, .LBB15_9
	lui	a3, 505856
	srli	a4, a0, 31
	fmv.w.x	fa4, a3
	lui	a3, 1046528
	sra	a1, a3, a1
	addi	a4, a4, -1
	fadd.s	fa5, fa5, fa4
	and	a2, a4, a2
	fsw	fa5, 8(sp)
	add	a0, a2, a0
	and	a0, a0, a1
	j	.LBB15_8
.LBB15_4:
	lui	a1, 505856
	fmv.w.x	fa4, a1
	fadd.s	fa4, fa5, fa4
	fsw	fa4, 12(sp)
	bltz	a0, .LBB15_7
	beqz	a0, .LBB15_9
	lui	a0, 260096
	j	.LBB15_8
.LBB15_7:
	lui	a0, 524288
.LBB15_8:
	fmv.w.x	fa5, a0
.LBB15_9:
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end15:
	.size	ceilf, .Lfunc_end15-ceilf
	.cfi_endproc

	.section	.text.expf,"ax",@progbits
	.p2align	2
	.type	expf,@function
expf:
.Lfunc_begin16:
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	.cfi_remember_state
	slli	a1, a0, 1
	srli	a1, a1, 21
	li	a2, 1067
	bgeu	a1, a2, .LBB16_2
.LBB16_1:
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB16_2:
	.cfi_restore_state
	.cfi_remember_state
	fmv.w.x	fa5, a0
	lui	a0, 1046528
	fmv.w.x	fa4, a0
	feq.s	a0, fa5, fa4
	beqz	a0, .LBB16_4
	fmv.w.x	fa5, zero
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB16_4:
	.cfi_restore_state
	.cfi_remember_state
	li	a0, 2040
	bgeu	a1, a0, .LBB16_7
	lui	a0, 273175
	addi	a0, a0, 535
	fmv.w.x	fa4, a0
	flt.s	a0, fa4, fa5
	beqz	a0, .LBB16_8
	lui	a0, 458752
	sw	a0, 8(sp)
	flw	fa5, 8(sp)
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB16_7:
	.cfi_restore_state
	.cfi_remember_state
	fadd.s	fa5, fa5, fa5
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB16_8:
	.cfi_restore_state
	lui	a0, 797951
	addi	a0, a0, 436
	fmv.w.x	fa4, a0
	flt.s	a0, fa5, fa4
	beqz	a0, .LBB16_1
	lui	a0, 65536
	sw	a0, 12(sp)
	flw	fa5, 12(sp)
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end16:
	.size	expf, .Lfunc_end16-expf
	.cfi_endproc

	.section	.text.feclearexcept,"ax",@progbits
	.p2align	2
	.type	feclearexcept,@function
feclearexcept:
.Lfunc_begin17:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end17:
	.size	feclearexcept, .Lfunc_end17-feclearexcept
	.cfi_endproc

	.section	.text.feraiseexcept,"ax",@progbits
	.p2align	2
	.type	feraiseexcept,@function
feraiseexcept:
.Lfunc_begin18:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end18:
	.size	feraiseexcept, .Lfunc_end18-feraiseexcept
	.cfi_endproc

	.section	.text.fetestexcept,"ax",@progbits
	.p2align	2
	.type	fetestexcept,@function
fetestexcept:
.Lfunc_begin19:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end19:
	.size	fetestexcept, .Lfunc_end19-fetestexcept
	.cfi_endproc

	.section	.text.fegetround,"ax",@progbits
	.p2align	2
	.type	fegetround,@function
fegetround:
.Lfunc_begin20:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end20:
	.size	fegetround, .Lfunc_end20-fegetround
	.cfi_endproc

	.section	.text.__fesetround,"ax",@progbits
	.p2align	2
	.type	__fesetround,@function
__fesetround:
.Lfunc_begin21:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end21:
	.size	__fesetround, .Lfunc_end21-__fesetround
	.cfi_endproc

	.section	.text.fegetenv,"ax",@progbits
	.p2align	2
	.type	fegetenv,@function
fegetenv:
.Lfunc_begin22:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end22:
	.size	fegetenv, .Lfunc_end22-fegetenv
	.cfi_endproc

	.section	.text.fesetenv,"ax",@progbits
	.p2align	2
	.type	fesetenv,@function
fesetenv:
.Lfunc_begin23:
	.cfi_startproc
	li	a0, 0
	ret
.Lfunc_end23:
	.size	fesetenv, .Lfunc_end23-fesetenv
	.cfi_endproc

	.section	.text.floorf,"ax",@progbits
	.p2align	2
	.type	floorf,@function
floorf:
.Lfunc_begin24:
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	.cfi_remember_state
	slli	a1, a0, 1
	srli	a1, a1, 24
	li	a2, 149
	fmv.w.x	fa5, a0
	bltu	a2, a1, .LBB24_5
	li	a2, 127
	bltu	a1, a2, .LBB24_6
	addi	a1, a1, -127
	lui	a2, 2048
	addi	a2, a2, -1
	srl	a2, a2, a1
	and	a3, a2, a0
	beqz	a3, .LBB24_5
	lui	a3, 505856
	fmv.w.x	fa4, a3
	lui	a3, 1046528
	sra	a1, a3, a1
	srai	a3, a0, 31
	and	a2, a3, a2
	fadd.s	fa5, fa5, fa4
	add	a0, a2, a0
	fsw	fa5, 8(sp)
	and	a0, a0, a1
.LBB24_4:
	fmv.w.x	fa5, a0
.LBB24_5:
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB24_6:
	.cfi_restore_state
	.cfi_remember_state
	lui	a1, 505856
	fmv.w.x	fa4, a1
	fadd.s	fa4, fa5, fa4
	fsw	fa4, 12(sp)
	bltz	a0, .LBB24_8
	fmv.w.x	fa5, zero
	fmv.x.w	a0, fa5
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.LBB24_8:
	.cfi_restore_state
	fmv.w.x	fa4, zero
	feq.s	a0, fa5, fa4
	bnez	a0, .LBB24_5
	lui	a0, 784384
	j	.LBB24_4
.Lfunc_end24:
	.size	floorf, .Lfunc_end24-floorf
	.cfi_endproc

	.section	.text.fmaf,"ax",@progbits
	.p2align	2
	.type	fmaf,@function
fmaf:
.Lfunc_begin25:
	.cfi_startproc
.Lfunc_end25:
	.size	fmaf, .Lfunc_end25-fmaf
	.cfi_endproc

	.section	.text.fmodf,"ax",@progbits
	.p2align	2
	.type	fmodf,@function
fmodf:
.Lfunc_begin26:
	.cfi_startproc
	fmv.w.x	fa4, a1
	slli	a4, a1, 1
	fmv.w.x	fa5, a0
	beqz	a4, .LBB26_8
	fmv.x.w	a2, fa4
	slli	a2, a2, 1
	srli	a2, a2, 1
	lui	a3, 522240
	bltu	a3, a2, .LBB26_8
	slli	a3, a0, 1
	srli	a2, a3, 24
	li	a5, 255
	beq	a2, a5, .LBB26_8
	bgeu	a4, a3, .LBB26_9
	srli	a4, a4, 24
	lui	a3, 2048
	addi	a5, a3, -1
	beqz	a2, .LBB26_11
	and	a6, a0, a5
	or	a3, a6, a3
	beqz	a4, .LBB26_14
.LBB26_6:
	and	a1, a1, a5
	lui	a5, 2048
	or	a1, a1, a5
	blt	a4, a2, .LBB26_18
.LBB26_7:
	sub	a1, a3, a1
	bgez	a1, .LBB26_21
	j	.LBB26_22
.LBB26_8:
	fmul.s	fa5, fa5, fa4
	fdiv.s	fa5, fa5, fa5
	fmv.x.w	a0, fa5
	ret
.LBB26_9:
	beq	a3, a4, .LBB26_26
	fmv.x.w	a0, fa5
	ret
.LBB26_11:
	li	a2, 0
	slli	a3, a0, 9
	bltz	a3, .LBB26_13
.LBB26_12:
	slli	a3, a3, 1
	addi	a2, a2, -1
	bgez	a3, .LBB26_12
.LBB26_13:
	li	a3, 1
	sub	a3, a3, a2
	sll	a3, a0, a3
	bnez	a4, .LBB26_6
.LBB26_14:
	li	a4, 0
	slli	a5, a1, 9
	bltz	a5, .LBB26_16
.LBB26_15:
	slli	a5, a5, 1
	addi	a4, a4, -1
	bgez	a5, .LBB26_15
.LBB26_16:
	li	a5, 1
	sub	a5, a5, a4
	sll	a1, a1, a5
	blt	a4, a2, .LBB26_18
	j	.LBB26_7
.LBB26_17:
	addi	a2, a2, -1
	slli	a3, a3, 1
	bge	a4, a2, .LBB26_20
.LBB26_18:
	sub	a5, a3, a1
	bltz	a5, .LBB26_17
	mv	a3, a5
	bnez	a5, .LBB26_17
	j	.LBB26_26
.LBB26_20:
	mv	a2, a4
	sub	a1, a3, a1
	bltz	a1, .LBB26_22
.LBB26_21:
	mv	a3, a1
	beqz	a1, .LBB26_26
.LBB26_22:
	srli	a4, a3, 23
	lui	a1, 524288
	bnez	a4, .LBB26_24
.LBB26_23:
	srli	a4, a3, 22
	slli	a3, a3, 1
	addi	a2, a2, -1
	beqz	a4, .LBB26_23
.LBB26_24:
	and	a0, a0, a1
	blez	a2, .LBB26_27
	lui	a1, 1046528
	add	a1, a3, a1
	slli	a2, a2, 23
	or	a1, a1, a2
	or	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB26_26:
	fmv.w.x	fa4, zero
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.LBB26_27:
	li	a1, 1
	sub	a1, a1, a2
	srl	a1, a3, a1
	or	a0, a1, a0
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.Lfunc_end26:
	.size	fmodf, .Lfunc_end26-fmodf
	.cfi_endproc

	.section	.text.frexpf,"ax",@progbits
	.p2align	2
	.type	frexpf,@function
frexpf:
.Lfunc_begin27:
	.cfi_startproc
	srli	a2, a0, 23
	zext.b	a2, a2
	li	a3, 255
	fmv.w.x	fa5, a0
	beq	a2, a3, .LBB27_5
	bnez	a2, .LBB27_4
	fmv.w.x	fa4, zero
	feq.s	a0, fa5, fa4
	bnez	a0, .LBB27_6
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	lui	a0, 391168
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	mv	s0, a1
	call	frexpf
	mv	a1, s0
	lw	a2, 0(s0)
	fmv.w.x	fa5, a0
	addi	a0, a2, -64
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	sw	a0, 0(a1)
	fmv.x.w	a0, fa5
	ret
.LBB27_4:
	addi	a2, a2, -126
	sw	a2, 0(a1)
	lui	a1, 526336
	addi	a1, a1, -1
	and	a0, a0, a1
	lui	a1, 258048
	or	a0, a0, a1
	fmv.w.x	fa5, a0
.LBB27_5:
	fmv.x.w	a0, fa5
	ret
.LBB27_6:
	sw	zero, 0(a1)
	fmv.x.w	a0, fa5
	ret
.Lfunc_end27:
	.size	frexpf, .Lfunc_end27-frexpf
	.cfi_endproc

	.section	.text.ldexpf,"ax",@progbits
	.p2align	2
	.type	ldexpf,@function
ldexpf:
.Lfunc_begin28:
	.cfi_startproc
	li	a2, 128
	fmv.w.x	fa5, a0
	blt	a1, a2, .LBB28_5
	lui	a0, 520192
	fmv.w.x	fa4, a0
	li	a0, 255
	fmul.s	fa5, fa5, fa4
	bltu	a1, a0, .LBB28_10
	li	a0, 381
	bltu	a1, a0, .LBB28_4
	li	a1, 381
.LBB28_4:
	fmul.s	fa5, fa5, fa4
	addi	a1, a1, -254
	j	.LBB28_12
.LBB28_5:
	li	a0, -127
	blt	a0, a1, .LBB28_12
	lui	a0, 51200
	fmv.w.x	fa4, a0
	li	a0, -229
	fmul.s	fa5, fa5, fa4
	bltu	a0, a1, .LBB28_11
	li	a0, -330
	bltu	a0, a1, .LBB28_9
	li	a1, -330
.LBB28_9:
	fmul.s	fa5, fa5, fa4
	addi	a1, a1, 204
	j	.LBB28_12
.LBB28_10:
	addi	a1, a1, -127
	j	.LBB28_12
.LBB28_11:
	addi	a1, a1, 102
.LBB28_12:
	slli	a1, a1, 23
	lui	a0, 260096
	add	a0, a1, a0
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.Lfunc_end28:
	.size	ldexpf, .Lfunc_end28-ldexpf
	.cfi_endproc

	.section	.text.scalbnf,"ax",@progbits
	.p2align	2
	.type	scalbnf,@function
scalbnf:
.Lfunc_begin29:
	.cfi_startproc
	li	a2, 128
	fmv.w.x	fa5, a0
	blt	a1, a2, .LBB29_5
	lui	a0, 520192
	fmv.w.x	fa4, a0
	li	a0, 255
	fmul.s	fa5, fa5, fa4
	bltu	a1, a0, .LBB29_10
	li	a0, 381
	bltu	a1, a0, .LBB29_4
	li	a1, 381
.LBB29_4:
	fmul.s	fa5, fa5, fa4
	addi	a1, a1, -254
	j	.LBB29_12
.LBB29_5:
	li	a0, -127
	blt	a0, a1, .LBB29_12
	lui	a0, 51200
	fmv.w.x	fa4, a0
	li	a0, -229
	fmul.s	fa5, fa5, fa4
	bltu	a0, a1, .LBB29_11
	li	a0, -330
	bltu	a0, a1, .LBB29_9
	li	a1, -330
.LBB29_9:
	fmul.s	fa5, fa5, fa4
	addi	a1, a1, 204
	j	.LBB29_12
.LBB29_10:
	addi	a1, a1, -127
	j	.LBB29_12
.LBB29_11:
	addi	a1, a1, 102
.LBB29_12:
	slli	a1, a1, 23
	lui	a0, 260096
	add	a0, a1, a0
	fmv.w.x	fa4, a0
	fmul.s	fa5, fa5, fa4
	fmv.x.w	a0, fa5
	ret
.Lfunc_end29:
	.size	scalbnf, .Lfunc_end29-scalbnf
	.cfi_endproc

	.section	.text.powf,"ax",@progbits
	.p2align	2
	.type	powf,@function
powf:
.Lfunc_begin30:
	.cfi_startproc
	fmv.w.x	fa4, a0
	lui	a2, 526336
	add	a2, a0, a2
	srli	a3, a2, 24
	li	a4, 128
	slli	a2, a1, 1
	bgeu	a4, a3, .LBB30_11
.LBB30_1:
	lui	a3, 260096
	fmv.w.x	fa5, a3
	beq	a0, a3, .LBB30_14
	beqz	a2, .LBB30_14
	slli	a0, a0, 1
	lui	a3, 1044480
	fmv.w.x	fa5, a1
	bltu	a3, a0, .LBB30_7
	addi	a3, a3, 1
	bgeu	a2, a3, .LBB30_7
	lui	a2, 520192
	bne	a0, a2, .LBB30_8
	lui	a0, 260096
	fmv.w.x	fa5, a0
	fmv.x.w	a0, fa5
	ret
.LBB30_7:
	fadd.s	fa5, fa4, fa5
	fmv.x.w	a0, fa5
	ret
.LBB30_8:
	srli	a0, a0, 24
	sltiu	a0, a0, 127
	srli	a1, a1, 31
	bne	a0, a1, .LBB30_10
	fmul.s	fa5, fa5, fa5
	fmv.x.w	a0, fa5
	ret
.LBB30_10:
	fmv.w.x	fa5, zero
	fmv.x.w	a0, fa5
	ret
.LBB30_11:
	addi	a4, a2, -1
	lui	a3, 1044480
	addi	a3, a3, -1
	bgeu	a4, a3, .LBB30_1
	slli	a4, a0, 1
	addi	a4, a4, -1
	bgeu	a4, a3, .LBB30_15
	fsub.s	fa5, fa4, fa4
	fdiv.s	fa5, fa5, fa5
.LBB30_14:
	fmv.x.w	a0, fa5
	ret
.LBB30_15:
	fmul.s	fa5, fa4, fa4
	bgez	a0, .LBB30_19
	srli	a2, a2, 24
	addi	a0, a2, -151
	li	a3, -24
	bltu	a0, a3, .LBB30_19
	li	a0, 150
	sub	a0, a0, a2
	li	a2, 1
	sll	a0, a2, a0
	addi	a2, a0, -1
	and	a0, a0, a1
	and	a2, a2, a1
	snez	a2, a2
	seqz	a0, a0
	or	a0, a0, a2
	bnez	a0, .LBB30_19
	fneg.s	fa5, fa5
.LBB30_19:
	bgez	a1, .LBB30_14
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	lui	a0, 260096
	fmv.w.x	fa4, a0
	fdiv.s	fa5, fa4, fa5
	fsw	fa5, 12(sp)
	flw	fa5, 12(sp)
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	fmv.x.w	a0, fa5
	ret
.Lfunc_end30:
	.size	powf, .Lfunc_end30-powf
	.cfi_endproc

	.section	.text.rintf,"ax",@progbits
	.p2align	2
	.type	rintf,@function
rintf:
.Lfunc_begin31:
	.cfi_startproc
	lui	a1, 520192
	and	a1, a0, a1
	lui	a2, 305152
	fmv.w.x	fa5, a0
	bltu	a2, a1, .LBB31_3
	lui	a1, 831488
	fmv.w.x	fa4, a1
	lui	a1, 307200
	fmv.w.x	fa3, a1
	bgez	a0, .LBB31_4
	fadd.s	fa5, fa5, fa4
	fadd.s	fa5, fa5, fa3
	fmv.w.x	fa4, zero
	feq.s	a1, fa5, fa4
	bnez	a1, .LBB31_5
.LBB31_3:
	fmv.x.w	a0, fa5
	ret
.LBB31_4:
	fadd.s	fa5, fa5, fa3
	fadd.s	fa5, fa5, fa4
	fmv.w.x	fa4, zero
	feq.s	a1, fa5, fa4
	beqz	a1, .LBB31_3
.LBB31_5:
	bgez	a0, .LBB31_7
	lui	a0, 524288
	fmv.w.x	fa4, a0
.LBB31_7:
	fmv.x.w	a0, fa4
	ret
.Lfunc_end31:
	.size	rintf, .Lfunc_end31-rintf
	.cfi_endproc

	.section	.text.roundf,"ax",@progbits
	.p2align	2
	.type	roundf,@function
roundf:
.Lfunc_begin32:
	.cfi_startproc
	slli	a1, a0, 1
	srli	a1, a1, 24
	li	a2, 149
	fmv.w.x	fa5, a0
	bgeu	a2, a1, .LBB32_2
.LBB32_1:
	fmv.x.w	a0, fa5
	ret
.LBB32_2:
	fabs.s	fa4, fa5
	lui	a2, 307200
	fmv.w.x	fa3, a2
	li	a2, 125
	fadd.s	fa3, fa4, fa3
	bltu	a2, a1, .LBB32_4
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fa3, 12(sp)
	fmv.w.x	fa4, zero
	fmul.s	fa5, fa5, fa4
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	fmv.x.w	a0, fa5
	ret
.LBB32_4:
	lui	a1, 831488
	fmv.w.x	fa5, a1
	lui	a1, 258048
	fadd.s	fa5, fa3, fa5
	fsub.s	fa5, fa5, fa4
	fmv.w.x	fa3, a1
	flt.s	a1, fa3, fa5
	beqz	a1, .LBB32_6
	fadd.s	fa5, fa4, fa5
	lui	a1, 784384
	j	.LBB32_8
.LBB32_6:
	lui	a1, 782336
	fmv.w.x	fa3, a1
	fle.s	a1, fa5, fa3
	fadd.s	fa5, fa4, fa5
	beqz	a1, .LBB32_9
	lui	a1, 260096
.LBB32_8:
	fmv.w.x	fa4, a1
	fadd.s	fa5, fa5, fa4
.LBB32_9:
	bgez	a0, .LBB32_1
	fneg.s	fa5, fa5
	fmv.x.w	a0, fa5
	ret
.Lfunc_end32:
	.size	roundf, .Lfunc_end32-roundf
	.cfi_endproc

	.type	__unnamed_1,@object
	.section	.rodata.__unnamed_1,"a",@progbits
__unnamed_1:
	.asciz	"main_dispatch_0"
	.size	__unnamed_1, 16

	.type	iree_hal_executable_library_query_v0_header,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_header,"aw",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_header:
	.word	6
	.word	__unnamed_1
	.word	0
	.word	0
	.size	iree_hal_executable_library_query_v0_header, 16

	.type	iree_hal_executable_library_query_v0_funcs,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_funcs,"aw",@progbits
	.p2align	2, 0x0
iree_hal_executable_library_query_v0_funcs:
	.word	main_dispatch_0_matmul_17x64x32_f32
	.size	iree_hal_executable_library_query_v0_funcs, 4

	.type	iree_hal_executable_library_query_v0_attrs,@object
	.section	.rodata.iree_hal_executable_library_query_v0_attrs,"a",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_attrs:
	.quad	0
	.half	0
	.byte	0
	.byte	3
	.word	1
	.word	1
	.half	1
	.half	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.size	iree_hal_executable_library_query_v0_attrs, 64

	.type	iree_hal_executable_library_query_v0,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0:
	.word	iree_hal_executable_library_query_v0_header
	.zero	8
	.word	1
	.word	iree_hal_executable_library_query_v0_funcs
	.word	iree_hal_executable_library_query_v0_attrs
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.zero	4
	.zero	8
	.size	iree_hal_executable_library_query_v0, 64

	.type	__exp2f_data,@object
	.section	.rodata.__exp2f_data,"a",@progbits
	.p2align	3, 0x0
__exp2f_data:
	.word	0
	.word	3541402996
	.word	1828292879
	.word	3490863953
	.word	1014845819
	.word	828946858
	.word	1853186616
	.word	4112506593
	.word	171030293
	.word	926591435
	.word	1276261410
	.word	1617004845
	.word	3577096743
	.word	1453150082
	.word	3712504873
	.word	2956612997
	.word	1719614413
	.word	3907805044
	.word	1944781191
	.word	2571947539
	.word	1110089947
	.word	2966275557
	.word	2191782032
	.word	2990417245
	.word	2572866477
	.word	4076559943
	.word	3716502172
	.word	3706687593
	.word	3707479175
	.word	863738719
	.word	2728693978
	.word	1533953344
	.quad	0x42e8000000000000
	.quad	0x3fac6af84b912394
	.quad	0x3fcebfce50fac4f3
	.quad	0x3fe62e42ff0c52d6
	.quad	0x4338000000000000
	.quad	0x40471547652b82fe
	.quad	0x3ebc6af84b912394
	.quad	0x3f2ebfce50fac4f3
	.quad	0x3f962e42ff0c52d6
	.size	__exp2f_data, 200

	.type	__powf_log2_data,@object
	.section	.rodata.__powf_log2_data,"a",@progbits
	.p2align	3, 0x0
__powf_log2_data:
	.quad	0x3ff661ec79f8f3be
	.quad	0xbfdefec65b963019
	.quad	0x3ff571ed4aaf883d
	.quad	0xbfdb0b6832d4fca4
	.quad	0x3ff49539f0f010b0
	.quad	0xbfd7418b0a1fb77b
	.quad	0x3ff3c995b0b80385
	.quad	0xbfd39de91a6dcf7b
	.quad	0x3ff30d190c8864a5
	.quad	0xbfd01d9bf3f2b631
	.quad	0x3ff25e227b0b8ea0
	.quad	0xbfc97c1d1b3b7af0
	.quad	0x3ff1bb4a4a1a343f
	.quad	0xbfc2f9e393af3c9f
	.quad	0x3ff12358f08ae5ba
	.quad	0xbfb960cbbf788d5c
	.quad	0x3ff0953f419900a7
	.quad	0xbfaa6f9db6475fce
	.quad	0x3ff0000000000000
	.quad	0x0000000000000000
	.quad	0x3fee608cfd9a47ac
	.quad	0x3fb338ca9f24f53d
	.quad	0x3feca4b31f026aa0
	.quad	0x3fc476a9543891ba
	.quad	0x3feb2036576afce6
	.quad	0x3fce840b4ac4e4d2
	.quad	0x3fe9c2d163a1aa2d
	.quad	0x3fd40645f0c6651c
	.quad	0x3fe886e6037841ed
	.quad	0x3fd88e9c2c1b9ff8
	.quad	0x3fe767dcf5534862
	.quad	0x3fdce0a44eb17bcc
	.quad	0x3fd27616c9496e0b
	.quad	0xbfd71969a075c67a
	.quad	0x3fdec70a6ca7badd
	.quad	0xbfe7154748bef6c8
	.quad	0x3ff71547652ab82b
	.size	__powf_log2_data, 296

	.section	.debug_abbrev,"",@progbits
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.ascii	"\264B"
	.byte	25
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0
.Ldebug_info_start0:
	.half	4
	.word	.debug_abbrev
	.byte	4
	.byte	1
	.word	.Linfo_string0
	.half	44
	.word	.Linfo_string1
	.word	.Lline_table_start0
	.word	.Linfo_string2

	.word	.Lfunc_begin0
	.word	.Lfunc_end0-.Lfunc_begin0
	.byte	2
	.word	.Lfunc_begin0
	.word	.Lfunc_end0-.Lfunc_begin0
	.byte	1
	.byte	88
	.word	.Linfo_string3
	.word	.Linfo_string3
	.byte	1
	.byte	1
	.word	63

	.byte	3
	.word	.Linfo_string4
	.byte	5
	.byte	4
	.byte	0
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"IREE"
.Linfo_string1:
	.asciz	"configured_module_main_dispatch_0.mlir"
.Linfo_string2:
	.asciz	"/home/builder/work/walk/out/exe"
.Linfo_string3:
	.asciz	"main_dispatch_0_matmul_17x64x32_f32"
.Linfo_string4:
	.asciz	"int"
	.section	.debug_pubnames,"",@progbits
	.word	.LpubNames_end0-.LpubNames_start0
.LpubNames_start0:
	.half	2
	.word	.Lcu_begin0
	.word	71
	.word	38
	.asciz	"main_dispatch_0_matmul_17x64x32_f32"
	.word	0
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.word	.LpubTypes_end0-.LpubTypes_start0
.LpubTypes_start0:
	.half	2
	.word	.Lcu_begin0
	.word	71
	.word	63
	.asciz	"int"
	.word	0
.LpubTypes_end0:
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
