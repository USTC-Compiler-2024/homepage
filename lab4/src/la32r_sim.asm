.text
_start:
random_init_0:
    lu12i.w $r0, -0x5dabc
    ori $r0, $r0, 0x351
    lu12i.w $r1, -0xaafa
    ori $r1, $r1, 0x72a
    lu12i.w $r2, -0xdb42
    ori $r2, $r2, 0x3f6
    lu12i.w $r3, -0x3b94
    ori $r3, $r3, 0xf67
    lu12i.w $r4, 0x1c9c2
    ori $r4, $r4, 0x53
    lu12i.w $r5, -0x67b73
    ori $r5, $r5, 0xd4e
    lu12i.w $r6, -0x3a439
    ori $r6, $r6, 0x8e7
    lu12i.w $r7, 0x6804d
    ori $r7, $r7, 0x850
    lu12i.w $r8, 0x76f6b
    ori $r8, $r8, 0x149
    lu12i.w $r9, -0x3a167
    ori $r9, $r9, 0xc08
    lu12i.w $r10, 0x5d7bd
    ori $r10, $r10, 0xb7d
    lu12i.w $r11, -0x7ce72
    ori $r11, $r11, 0x8
    lu12i.w $r12, 0x13c7e
    ori $r12, $r12, 0xcca
    lu12i.w $r13, 0xf280
    ori $r13, $r13, 0x20f
    lu12i.w $r14, 0x107fe
    ori $r14, $r14, 0xf2f
    lu12i.w $r15, -0x7136
    ori $r15, $r15, 0x78f
    lu12i.w $r16, -0x849
    ori $r16, $r16, 0xc7c
    lu12i.w $r17, 0x1063c
    ori $r17, $r17, 0x646
    lu12i.w $r18, 0x3a5ba
    ori $r18, $r18, 0x5fa
    lu12i.w $r19, -0x78657
    ori $r19, $r19, 0x66f
    lu12i.w $r20, -0x6d168
    ori $r20, $r20, 0x211
    lu12i.w $r21, 0x3480d
    ori $r21, $r21, 0x430
    lu12i.w $r22, -0x20315
    ori $r22, $r22, 0xf56
    lu12i.w $r23, 0x8c1c
    ori $r23, $r23, 0x2c3
    lu12i.w $r24, -0x26422
    ori $r24, $r24, 0xbc4
    lu12i.w $r25, -0x68a21
    ori $r25, $r25, 0xca6
    lu12i.w $r26, 0x13120
    ori $r26, $r26, 0x92
    lu12i.w $r27, 0x35780
    ori $r27, $r27, 0x355
    lu12i.w $r28, -0x29d37
    ori $r28, $r28, 0x665
    lu12i.w $r29, 0x52f
    ori $r29, $r29, 0x4ee
    lu12i.w $r30, -0x36946
    ori $r30, $r30, 0x471
    lu12i.w $r31, -0x3bc7a
    ori $r31, $r31, 0xf85
add_w_0_0:
    add.w $r0, $r7, $r24
    ori $r16, $r0, 0
    bne $r0, $r16, fail
add_w_0_1:
    add.w $r2, $r26, $r22
    lu12i.w $r9, -0xd1f5
    ori $r9, $r9, 0xfe8
    bne $r2, $r9, fail
add_w_0_2:
    add.w $r27, $r26, $r2
    lu12i.w $r14, 0x5f2c
    ori $r14, $r14, 0x7a
    bne $r27, $r14, fail
add_w_0_3:
    add.w $r22, $r1, $r14
    lu12i.w $r28, -0x4bce
    ori $r28, $r28, 0x7a4
    bne $r22, $r28, fail
add_w_0_4:
sub_w_1_0:
    sub.w $r13, $r16, $r29
    lu12i.w $r27, -0x530
    ori $r27, $r27, 0xb12
    bne $r13, $r27, fail
sub_w_1_1:
    sub.w $r3, $r5, $r20
    lu12i.w $r27, 0x55f5
    ori $r27, $r27, 0xb3d
    bne $r3, $r27, fail
sub_w_1_2:
    sub.w $r2, $r30, $r5
    lu12i.w $r16, 0x3122c
    ori $r16, $r16, 0x723
    bne $r2, $r16, fail
sub_w_1_3:
    sub.w $r18, $r7, $r14
    lu12i.w $r2, 0x62121
    ori $r2, $r2, 0x7d6
    bne $r18, $r2, fail
sub_w_1_4:
slt_2_0:
    slt $r14, $r25, $r16
    ori $r25, $r0, 0x1
    bne $r14, $r25, fail
slt_2_1:
    slt $r15, $r11, $r24
    ori $r18, $r0, 0x1
    bne $r15, $r18, fail
slt_2_2:
    slt $r23, $r17, $r6
    ori $r7, $r0, 0
    bne $r23, $r7, fail
slt_2_3:
    slt $r15, $r19, $r23
    ori $r22, $r0, 0x1
    bne $r15, $r22, fail
slt_2_4:
sltu_3_0:
    sltu $r29, $r24, $r1
    ori $r11, $r0, 0x1
    bne $r29, $r11, fail
sltu_3_1:
    sltu $r31, $r7, $r10
    ori $r19, $r0, 0x1
    bne $r31, $r19, fail
sltu_3_2:
    sltu $r5, $r4, $r2
    ori $r27, $r0, 0x1
    bne $r5, $r27, fail
sltu_3_3:
    sltu $r29, $r20, $r28
    ori $r19, $r0, 0x1
    bne $r29, $r19, fail
sltu_3_4:
and_4_0:
    and $r13, $r5, $r11
    ori $r17, $r0, 0x1
    bne $r13, $r17, fail
and_4_1:
    and $r10, $r7, $r16
    ori $r6, $r0, 0
    bne $r10, $r6, fail
and_4_2:
    and $r21, $r17, $r28
    ori $r5, $r0, 0
    bne $r21, $r5, fail
and_4_3:
    and $r25, $r18, $r30
    ori $r19, $r0, 0x1
    bne $r25, $r19, fail
and_4_4:
or_5_0:
    or $r16, $r2, $r3
    lu12i.w $r19, 0x675f5
    ori $r19, $r19, 0xfff
    bne $r16, $r19, fail
or_5_1:
    or $r9, $r26, $r8
    lu12i.w $r25, 0x77f6b
    ori $r25, $r25, 0x1db
    bne $r9, $r25, fail
or_5_2:
    or $r22, $r29, $r24
    lu12i.w $r16, -0x26422
    ori $r16, $r16, 0xbc5
    bne $r22, $r16, fail
or_5_3:
    or $r9, $r25, $r29
    lu12i.w $r6, 0x77f6b
    ori $r6, $r6, 0x1db
    bne $r9, $r6, fail
or_5_4:
xor_6_0:
    xor $r18, $r20, $r9
    lu12i.w $r13, -0x1ae0d
    ori $r13, $r13, 0x3ca
    bne $r18, $r13, fail
xor_6_1:
    xor $r12, $r11, $r16
    lu12i.w $r28, -0x26422
    ori $r28, $r28, 0xbc4
    bne $r12, $r28, fail
xor_6_2:
    xor $r0, $r15, $r23
    ori $r13, $r0, 0
    bne $r0, $r13, fail
xor_6_3:
    xor $r16, $r7, $r18
    lu12i.w $r6, -0x1ae0d
    ori $r6, $r6, 0x3ca
    bne $r16, $r6, fail
xor_6_4:
sll_w_7_0:
    sll.w $r2, $r17, $r11
    ori $r14, $r0, 0x2
    bne $r2, $r14, fail
sll_w_7_1:
    sll.w $r7, $r23, $r4
    ori $r21, $r0, 0
    bne $r7, $r21, fail
sll_w_7_2:
    sll.w $r1, $r25, $r7
    lu12i.w $r27, 0x77f6b
    ori $r27, $r27, 0x1db
    bne $r1, $r27, fail
sll_w_7_3:
    sll.w $r12, $r13, $r5
    ori $r11, $r0, 0
    bne $r12, $r11, fail
sll_w_7_4:
srl_w_8_0:
    srl.w $r22, $r5, $r21
    ori $r13, $r0, 0
    bne $r22, $r13, fail
srl_w_8_1:
    srl.w $r1, $r18, $r12
    lu12i.w $r29, -0x1ae0d
    ori $r29, $r29, 0x3ca
    bne $r1, $r29, fail
srl_w_8_2:
    srl.w $r28, $r27, $r17
    lu12i.w $r4, 0x3bfb5
    ori $r4, $r4, 0x8ed
    bne $r28, $r4, fail
srl_w_8_3:
    srl.w $r5, $r29, $r2
    lu12i.w $r3, 0x3947c
    ori $r3, $r3, 0xcf2
    bne $r5, $r3, fail
srl_w_8_4:
sra_w_9_0:
    sra.w $r25, $r29, $r25
    lu12i.w $r9, -0x1
    ori $r9, $r9, 0xffc
    bne $r25, $r9, fail
sra_w_9_1:
    sra.w $r28, $r7, $r12
    ori $r13, $r0, 0
    bne $r28, $r13, fail
sra_w_9_2:
    sra.w $r12, $r16, $r10
    lu12i.w $r31, -0x1ae0d
    ori $r31, $r31, 0x3ca
    bne $r12, $r31, fail
sra_w_9_3:
    sra.w $r31, $r28, $r14
    ori $r17, $r0, 0
    bne $r31, $r17, fail
sra_w_9_4:
slli_w_10_0:
    slli.w $r12, $r21, 0x19
    ori $r17, $r0, 0
    bne $r12, $r17, fail
slli_w_10_1:
    slli.w $r16, $r13, 0x1
    ori $r21, $r0, 0
    bne $r16, $r21, fail
slli_w_10_2:
    slli.w $r24, $r28, 0
    ori $r8, $r0, 0
    bne $r24, $r8, fail
slli_w_10_3:
    slli.w $r7, $r3, 0x17
    lu12i.w $r3, 0x79000
    ori $r3, $r3, 0
    bne $r7, $r3, fail
slli_w_10_4:
srli_w_11_0:
    srli.w $r7, $r11, 0x1e
    ori $r18, $r0, 0
    bne $r7, $r18, fail
srli_w_11_1:
    srli.w $r31, $r27, 0x1b
    ori $r20, $r0, 0xe
    bne $r31, $r20, fail
srli_w_11_2:
    srli.w $r3, $r29, 0x2
    lu12i.w $r19, 0x3947c
    ori $r19, $r19, 0xcf2
    bne $r3, $r19, fail
srli_w_11_3:
    srli.w $r3, $r17, 0x11
    ori $r24, $r0, 0
    bne $r3, $r24, fail
srli_w_11_4:
srai_w_12_0:
    srai.w $r6, $r16, 0x8
    ori $r19, $r0, 0
    bne $r6, $r19, fail
srai_w_12_1:
    srai.w $r7, $r6, 0xc
    ori $r13, $r0, 0
    bne $r7, $r13, fail
srai_w_12_2:
    srai.w $r8, $r5, 0
    lu12i.w $r21, 0x3947c
    ori $r21, $r21, 0xcf2
    bne $r8, $r21, fail
srai_w_12_3:
    srai.w $r0, $r14, 0xf
    ori $r25, $r0, 0
    bne $r0, $r25, fail
srai_w_12_4:
slti_13_0:
    slti $r16, $r24, -0x214
    ori $r18, $r0, 0
    bne $r16, $r18, fail
slti_13_1:
    slti $r19, $r18, -0x2a8
    ori $r24, $r0, 0
    bne $r19, $r24, fail
slti_13_2:
    slti $r22, $r27, 0x74
    ori $r31, $r0, 0
    bne $r22, $r31, fail
slti_13_3:
    slti $r20, $r28, 0x60d
    ori $r24, $r0, 0x1
    bne $r20, $r24, fail
slti_13_4:
sltui_14_0:
    sltui $r9, $r20, -0x111
    ori $r2, $r0, 0x1
    bne $r9, $r2, fail
sltui_14_1:
    sltui $r6, $r17, 0x76d
    ori $r23, $r0, 0x1
    bne $r6, $r23, fail
sltui_14_2:
    sltui $r13, $r19, -0x47c
    ori $r21, $r0, 0x1
    bne $r13, $r21, fail
sltui_14_3:
    sltui $r13, $r13, -0xfc
    ori $r27, $r0, 0x1
    bne $r13, $r27, fail
sltui_14_4:
andi_15_0:
    andi $r15, $r27, 0x639
    ori $r23, $r0, 0x1
    bne $r15, $r23, fail
andi_15_1:
    andi $r3, $r0, 0xb76
    ori $r13, $r0, 0
    bne $r3, $r13, fail
andi_15_2:
    andi $r22, $r3, 0xf75
    ori $r24, $r0, 0
    bne $r22, $r24, fail
andi_15_3:
    andi $r0, $r10, 0x519
    ori $r11, $r0, 0
    bne $r0, $r11, fail
andi_15_4:
ori_16_0:
    ori $r14, $r22, 0x414
    ori $r2, $r0, 0x414
    bne $r14, $r2, fail
ori_16_1:
    ori $r23, $r3, 0xaff
    ori $r7, $r0, 0xaff
    bne $r23, $r7, fail
ori_16_2:
    ori $r11, $r16, 0xa54
    ori $r15, $r0, 0xa54
    bne $r11, $r15, fail
ori_16_3:
    ori $r6, $r18, 0xdc5
    ori $r9, $r0, 0xdc5
    bne $r6, $r9, fail
ori_16_4:
xori_17_0:
    xori $r16, $r9, 0x55b
    ori $r24, $r0, 0x89e
    bne $r16, $r24, fail
xori_17_1:
    xori $r1, $r23, 0x33
    ori $r31, $r0, 0xacc
    bne $r1, $r31, fail
xori_17_2:
    xori $r13, $r20, 0x51b
    ori $r30, $r0, 0x51a
    bne $r13, $r30, fail
xori_17_3:
    xori $r28, $r4, 0x551
    lu12i.w $r16, 0x3bfb5
    ori $r16, $r16, 0xdbc
    bne $r28, $r16, fail
xori_17_4:
lu12i_w_18_0:
    lu12i.w $r9, -0xead
    lu12i.w $r21, -0xead
    ori $r21, $r21, 0
    bne $r9, $r21, fail
lu12i_w_18_1:
    lu12i.w $r12, -0x46860
    lu12i.w $r24, -0x46860
    ori $r24, $r24, 0
    bne $r12, $r24, fail
lu12i_w_18_2:
    lu12i.w $r1, 0x33003
    lu12i.w $r21, 0x33003
    ori $r21, $r21, 0
    bne $r1, $r21, fail
lu12i_w_18_3:
    lu12i.w $r7, -0x64016
    lu12i.w $r20, -0x64016
    ori $r20, $r20, 0
    bne $r7, $r20, fail
lu12i_w_18_4:
pcaddu12i_19_0:
    pcaddu12i $r14, -0x47eb0
    lu12i.w $r8, -0x2beb0
    ori $r8, $r8, 0x500
    bne $r14, $r8, fail
pcaddu12i_19_1:
    pcaddu12i $r9, -0x2e680
    lu12i.w $r24, -0x12680
    ori $r24, $r24, 0x510
    bne $r9, $r24, fail
pcaddu12i_19_2:
    pcaddu12i $r8, 0x7f0bc
    lu12i.w $r30, -0x64f44
    ori $r30, $r30, 0x520
    bne $r8, $r30, fail
pcaddu12i_19_3:
    pcaddu12i $r31, 0x21fd5
    lu12i.w $r9, 0x3dfd5
    ori $r9, $r9, 0x530
    bne $r31, $r9, fail
pcaddu12i_19_4:
random_init_20:
    lu12i.w $r0, 0x2ee73
    ori $r0, $r0, 0xa16
    lu12i.w $r1, -0x6fc3c
    ori $r1, $r1, 0xd15
    lu12i.w $r2, 0x7ae0b
    ori $r2, $r2, 0xa2f
    lu12i.w $r3, -0x33f82
    ori $r3, $r3, 0x6bf
    lu12i.w $r4, 0x6de46
    ori $r4, $r4, 0xdb1
    lu12i.w $r5, -0x69d9f
    ori $r5, $r5, 0x2c7
    lu12i.w $r6, 0x51df4
    ori $r6, $r6, 0x85c
    lu12i.w $r7, 0x21b2
    ori $r7, $r7, 0x198
    lu12i.w $r8, -0x38abd
    ori $r8, $r8, 0x58d
    lu12i.w $r9, 0x45da9
    ori $r9, $r9, 0x5bf
    lu12i.w $r10, 0x64b
    ori $r10, $r10, 0x614
    lu12i.w $r11, -0x4a54a
    ori $r11, $r11, 0xb13
    lu12i.w $r12, 0x48160
    ori $r12, $r12, 0xc65
    lu12i.w $r13, 0x22502
    ori $r13, $r13, 0xfa0
    lu12i.w $r14, -0x229f4
    ori $r14, $r14, 0x45e
    lu12i.w $r15, -0x27825
    ori $r15, $r15, 0x98
    lu12i.w $r16, 0x258c3
    ori $r16, $r16, 0xe0
    lu12i.w $r17, 0xd135
    ori $r17, $r17, 0xb98
    lu12i.w $r18, -0x686d4
    ori $r18, $r18, 0x8d0
    lu12i.w $r19, 0x62aa
    ori $r19, $r19, 0x9ff
    lu12i.w $r20, -0x5c8d9
    ori $r20, $r20, 0x9b7
    lu12i.w $r21, -0x4b81b
    ori $r21, $r21, 0xf04
    lu12i.w $r22, -0xcbf5
    ori $r22, $r22, 0x2e7
    lu12i.w $r23, 0x67366
    ori $r23, $r23, 0xde3
    lu12i.w $r24, 0x294ea
    ori $r24, $r24, 0x7e6
    lu12i.w $r25, 0x160b7
    ori $r25, $r25, 0x120
    lu12i.w $r26, -0x31cc
    ori $r26, $r26, 0xd79
    lu12i.w $r27, -0x58609
    ori $r27, $r27, 0x8f0
    lu12i.w $r28, -0x16fd
    ori $r28, $r28, 0x52d
    lu12i.w $r29, -0x276b4
    ori $r29, $r29, 0xc33
    lu12i.w $r30, 0x3b235
    ori $r30, $r30, 0x5eb
    lu12i.w $r31, 0x48cac
    ori $r31, $r31, 0x37
ld_w_20_0:
    lu12i.w $r12, 0x1c800
    ori $r12, $r12, 0xa2f
    ld.w $r2, $r12, -0x44b
    ori $r23, $r0, 0
    bne $r2, $r23, fail
ld_w_20_1:
    lu12i.w $r13, 0x1c800
    ori $r13, $r13, 0x78a
    ld.w $r6, $r13, -0x2ae
    ori $r9, $r0, 0
    bne $r6, $r9, fail
ld_w_20_2:
    lu12i.w $r30, 0x1c800
    ori $r30, $r30, 0xfa
    ld.w $r11, $r30, 0x14a
    ori $r31, $r0, 0
    bne $r11, $r31, fail
ld_w_20_3:
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0xa0
    ld.w $r14, $r10, 0x2dc
    ori $r2, $r0, 0
    bne $r14, $r2, fail
ld_w_20_4:
    lu12i.w $r14, 0x1c7ff
    ori $r14, $r14, 0xb20
    ld.w $r13, $r14, 0x704
    ori $r5, $r0, 0
    bne $r13, $r5, fail
ld_w_20_5:
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0x2e8
    ld.w $r28, $r14, 0x28
    ori $r2, $r0, 0
    bne $r28, $r2, fail
ld_w_20_6:
    lu12i.w $r2, 0x1c800
    ori $r2, $r2, 0x2b9
    ld.w $r20, $r2, 0x97
    ori $r29, $r0, 0
    bne $r20, $r29, fail
ld_w_20_7:
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x502
    ld.w $r5, $r16, 0xfa
    ori $r13, $r0, 0
    bne $r5, $r13, fail
ld_w_20_8:
ld_h_21_0:
    lu12i.w $r27, 0x1c800
    ori $r27, $r27, 0xd1b
    ld.h $r23, $r27, -0x6bd
    ori $r17, $r0, 0
    bne $r23, $r17, fail
ld_h_21_1:
    lu12i.w $r31, 0x1c800
    ori $r31, $r31, 0x175
    ld.h $r13, $r31, 0x2fd
    ori $r18, $r0, 0
    bne $r13, $r18, fail
ld_h_21_2:
    lu12i.w $r27, 0x1c800
    ori $r27, $r27, 0x3d9
    ld.h $r1, $r27, -0x39b
    ori $r15, $r0, 0
    bne $r1, $r15, fail
ld_h_21_3:
    lu12i.w $r18, 0x1c7ff
    ori $r18, $r18, 0xf26
    ld.h $r1, $r18, 0x348
    ori $r3, $r0, 0
    bne $r1, $r3, fail
ld_h_21_4:
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0x8e1
    ld.h $r20, $r28, -0x5ff
    ori $r1, $r0, 0
    bne $r20, $r1, fail
ld_h_21_5:
    lu12i.w $r26, 0x1c7ff
    ori $r26, $r26, 0x933
    ld.h $r20, $r26, 0x755
    ori $r18, $r0, 0
    bne $r20, $r18, fail
ld_h_21_6:
    lu12i.w $r6, 0x1c7ff
    ori $r6, $r6, 0xc6b
    ld.h $r12, $r6, 0x67f
    ori $r22, $r0, 0
    bne $r12, $r22, fail
ld_h_21_7:
    lu12i.w $r30, 0x1c7ff
    ori $r30, $r30, 0xb7a
    ld.h $r23, $r30, 0x6c6
    ori $r9, $r0, 0
    bne $r23, $r9, fail
ld_h_21_8:
ld_b_22_0:
    lu12i.w $r20, 0x1c800
    ori $r20, $r20, 0x191
    ld.b $r21, $r20, -0xb6
    ori $r31, $r0, 0
    bne $r21, $r31, fail
ld_b_22_1:
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0x21a
    ld.b $r9, $r14, 0x3f
    ori $r13, $r0, 0
    bne $r9, $r13, fail
ld_b_22_2:
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x279
    ld.b $r9, $r9, 0x13f
    ori $r30, $r0, 0
    bne $r9, $r30, fail
ld_b_22_3:
    lu12i.w $r7, 0x1c800
    ori $r7, $r7, 0xe04
    ld.b $r4, $r7, -0x7df
    ori $r27, $r0, 0
    bne $r4, $r27, fail
ld_b_22_4:
    lu12i.w $r31, 0x1c800
    ori $r31, $r31, 0xa6
    ld.b $r18, $r31, 0x109
    ori $r25, $r0, 0
    bne $r18, $r25, fail
ld_b_22_5:
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0xb1e
    ld.b $r23, $r28, -0x668
    ori $r3, $r0, 0
    bne $r23, $r3, fail
ld_b_22_6:
    lu12i.w $r8, 0x1c7ff
    ori $r8, $r8, 0xc5f
    ld.b $r30, $r8, 0x3df
    ori $r16, $r0, 0
    bne $r30, $r16, fail
ld_b_22_7:
    lu12i.w $r17, 0x1c800
    ori $r17, $r17, 0x131
    ld.b $r15, $r17, 0x4a4
    ori $r4, $r0, 0
    bne $r15, $r4, fail
ld_b_22_8:
ld_hu_23_0:
    lu12i.w $r13, 0x1c800
    ori $r13, $r13, 0x1e3
    ld.hu $r18, $r13, -0x8d
    ori $r30, $r0, 0
    bne $r18, $r30, fail
ld_hu_23_1:
    lu12i.w $r25, 0x1c7ff
    ori $r25, $r25, 0xee6
    ld.hu $r18, $r25, 0x2a6
    ori $r17, $r0, 0
    bne $r18, $r17, fail
ld_hu_23_2:
    lu12i.w $r1, 0x1c800
    ori $r1, $r1, 0xaed
    ld.hu $r21, $r1, -0x325
    ori $r22, $r0, 0
    bne $r21, $r22, fail
ld_hu_23_3:
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0x2f8
    ld.hu $r28, $r14, -0x1cc
    ori $r6, $r0, 0
    bne $r28, $r6, fail
ld_hu_23_4:
    lu12i.w $r27, 0x1c7ff
    ori $r27, $r27, 0xa12
    ld.hu $r30, $r27, 0x662
    ori $r4, $r0, 0
    bne $r30, $r4, fail
ld_hu_23_5:
    lu12i.w $r19, 0x1c800
    ori $r19, $r19, 0xa2b
    ld.hu $r3, $r19, -0x4a3
    ori $r28, $r0, 0
    bne $r3, $r28, fail
ld_hu_23_6:
    lu12i.w $r3, 0x1c800
    ori $r3, $r3, 0x768
    ld.hu $r8, $r3, 0x42
    ori $r22, $r0, 0
    bne $r8, $r22, fail
ld_hu_23_7:
    lu12i.w $r5, 0x1c800
    ori $r5, $r5, 0x26
    ld.hu $r3, $r5, 0x450
    ori $r5, $r0, 0
    bne $r3, $r5, fail
ld_hu_23_8:
ld_bu_24_0:
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x8f0
    ld.bu $r3, $r9, -0x1a8
    ori $r17, $r0, 0
    bne $r3, $r17, fail
ld_bu_24_1:
    lu12i.w $r2, 0x1c800
    ori $r2, $r2, 0x609
    ld.bu $r8, $r2, -0xd4
    ori $r26, $r0, 0
    bne $r8, $r26, fail
ld_bu_24_2:
    lu12i.w $r6, 0x1c800
    ori $r6, $r6, 0x24b
    ld.bu $r30, $r6, -0x19b
    ori $r14, $r0, 0
    bne $r30, $r14, fail
ld_bu_24_3:
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0x41e
    ld.bu $r18, $r28, -0x26
    ori $r23, $r0, 0
    bne $r18, $r23, fail
ld_bu_24_4:
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0xc3d
    ld.bu $r2, $r24, -0x64b
    ori $r20, $r0, 0
    bne $r2, $r20, fail
ld_bu_24_5:
    lu12i.w $r11, 0x1c800
    ori $r11, $r11, 0x8aa
    ld.bu $r11, $r11, -0x70c
    ori $r6, $r0, 0
    bne $r11, $r6, fail
ld_bu_24_6:
    lu12i.w $r29, 0x1c800
    ori $r29, $r29, 0x2cc
    ld.bu $r24, $r29, -0x38
    ori $r18, $r0, 0
    bne $r24, $r18, fail
ld_bu_24_7:
    lu12i.w $r4, 0x1c800
    ori $r4, $r4, 0x6cb
    ld.bu $r4, $r4, -0x5d7
    ori $r15, $r0, 0
    bne $r4, $r15, fail
ld_bu_24_8:
st_w_25_0:
    lu12i.w $r28, 0x1c7ff
    ori $r28, $r28, 0xe66
    st.w $r29, $r28, 0x3e2
    lu12i.w $r28, 0x1c7ff
    ori $r28, $r28, 0xe66
    ld.w $r21, $r28, 0x3e2
    lu12i.w $r1, 0x1c800
    ori $r1, $r1, 0x2cc
    bne $r21, $r1, fail
    lu12i.w $r28, 0x1c7ff
    ori $r28, $r28, 0xe66
    ld.w $r21, $r28, 0x3e2
    lu12i.w $r1, 0x1c800
    ori $r1, $r1, 0x2cc
    bne $r21, $r1, fail
st_w_25_1:
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0xdf1
    st.w $r6, $r8, -0x63d
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0xdf1
    ld.w $r27, $r8, -0x63d
    ori $r3, $r0, 0
    bne $r27, $r3, fail
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0xdf1
    ld.w $r27, $r8, -0x63d
    ori $r3, $r0, 0
    bne $r27, $r3, fail
st_w_25_2:
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0xdff
    st.w $r8, $r14, -0x657
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0xdff
    ld.w $r12, $r14, -0x657
    lu12i.w $r30, 0x1c800
    ori $r30, $r30, 0xdf1
    bne $r12, $r30, fail
    lu12i.w $r14, 0x1c800
    ori $r14, $r14, 0xdff
    ld.w $r12, $r14, -0x657
    lu12i.w $r30, 0x1c800
    ori $r30, $r30, 0xdf1
    bne $r12, $r30, fail
st_w_25_3:
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x865
    st.w $r27, $r9, -0x5d9
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x865
    ld.w $r4, $r9, -0x5d9
    ori $r25, $r0, 0
    bne $r4, $r25, fail
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x865
    ld.w $r4, $r9, -0x5d9
    ori $r25, $r0, 0
    bne $r4, $r25, fail
st_w_25_4:
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x31c
    st.w $r0, $r24, -0x224
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x31c
    ld.w $r13, $r24, -0x224
    ori $r12, $r0, 0
    bne $r13, $r12, fail
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x31c
    ld.w $r13, $r24, -0x224
    ori $r12, $r0, 0
    bne $r13, $r12, fail
st_w_25_5:
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x777
    st.w $r23, $r15, -0xf
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x777
    ld.w $r31, $r15, -0xf
    ori $r24, $r0, 0
    bne $r31, $r24, fail
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x777
    ld.w $r31, $r15, -0xf
    ori $r24, $r0, 0
    bne $r31, $r24, fail
st_w_25_6:
    lu12i.w $r17, 0x1c800
    ori $r17, $r17, 0xa01
    st.w $r29, $r17, -0x299
    lu12i.w $r17, 0x1c800
    ori $r17, $r17, 0xa01
    ld.w $r24, $r17, -0x299
    lu12i.w $r3, 0x1c800
    ori $r3, $r3, 0x2cc
    bne $r24, $r3, fail
    lu12i.w $r17, 0x1c800
    ori $r17, $r17, 0xa01
    ld.w $r24, $r17, -0x299
    lu12i.w $r3, 0x1c800
    ori $r3, $r3, 0x2cc
    bne $r24, $r3, fail
st_w_25_7:
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x484
    st.w $r10, $r9, 0x2e0
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x484
    ld.w $r21, $r9, 0x2e0
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0xa0
    bne $r21, $r18, fail
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x484
    ld.w $r21, $r9, 0x2e0
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0xa0
    bne $r21, $r18, fail
st_w_25_8:
st_h_26_0:
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x18d
    st.h $r13, $r18, -0xa7
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x18d
    ld.hu $r16, $r18, -0xa7
    ori $r10, $r0, 0
    bne $r16, $r10, fail
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x18d
    ld.w $r16, $r18, -0xa9
    ori $r10, $r0, 0
    bne $r16, $r10, fail
st_h_26_1:
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x896
    st.h $r24, $r10, -0x4f4
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x896
    ld.hu $r13, $r10, -0x4f4
    ori $r6, $r0, 0x2cc
    bne $r13, $r6, fail
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x896
    ld.w $r13, $r10, -0x4f6
    lu12i.w $r6, 0x2cc0
    ori $r6, $r6, 0
    bne $r13, $r6, fail
st_h_26_2:
    lu12i.w $r18, 0x1c7ff
    ori $r18, $r18, 0xb6d
    st.h $r10, $r18, 0x76f
    lu12i.w $r18, 0x1c7ff
    ori $r18, $r18, 0xb6d
    ld.hu $r30, $r18, 0x76f
    ori $r2, $r0, 0x896
    bne $r30, $r2, fail
    lu12i.w $r18, 0x1c7ff
    ori $r18, $r18, 0xb6d
    ld.w $r30, $r18, 0x76f
    ori $r2, $r0, 0x896
    bne $r30, $r2, fail
st_h_26_3:
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0x465
    st.h $r30, $r8, 0x2fb
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0x465
    ld.hu $r28, $r8, 0x2fb
    ori $r26, $r0, 0x896
    bne $r28, $r26, fail
    lu12i.w $r8, 0x1c800
    ori $r8, $r8, 0x465
    ld.w $r28, $r8, 0x2fb
    ori $r26, $r0, 0x896
    bne $r28, $r26, fail
st_h_26_4:
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x79b
    st.h $r22, $r24, -0x649
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x79b
    ld.hu $r11, $r24, -0x649
    ori $r30, $r0, 0
    bne $r11, $r30, fail
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x79b
    ld.w $r11, $r24, -0x64b
    ori $r30, $r0, 0
    bne $r11, $r30, fail
st_h_26_5:
    lu12i.w $r25, 0x1c800
    ori $r25, $r25, 0x8ed
    st.h $r15, $r25, -0x1ab
    lu12i.w $r25, 0x1c800
    ori $r25, $r25, 0x8ed
    ld.hu $r2, $r25, -0x1ab
    ori $r24, $r0, 0x777
    bne $r2, $r24, fail
    lu12i.w $r25, 0x1c800
    ori $r25, $r25, 0x8ed
    ld.w $r2, $r25, -0x1ad
    lu12i.w $r24, 0x7770
    ori $r24, $r24, 0
    bne $r2, $r24, fail
st_h_26_6:
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0x56a
    st.h $r6, $r28, -0x226
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0x56a
    ld.hu $r26, $r28, -0x226
    ori $r2, $r0, 0
    bne $r26, $r2, fail
    lu12i.w $r28, 0x1c800
    ori $r28, $r28, 0x56a
    ld.w $r26, $r28, -0x226
    ori $r2, $r0, 0
    bne $r26, $r2, fail
st_h_26_7:
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x5c5
    st.h $r12, $r15, 0x147
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x5c5
    ld.hu $r5, $r15, 0x147
    ori $r2, $r0, 0
    bne $r5, $r2, fail
    lu12i.w $r15, 0x1c800
    ori $r15, $r15, 0x5c5
    ld.w $r5, $r15, 0x147
    ori $r2, $r0, 0
    bne $r5, $r2, fail
st_h_26_8:
st_b_27_0:
    lu12i.w $r9, 0x1c7ff
    ori $r9, $r9, 0xe9d
    st.b $r24, $r9, 0x3e5
    lu12i.w $r9, 0x1c7ff
    ori $r9, $r9, 0xe9d
    ld.bu $r26, $r9, 0x3e5
    ori $r28, $r0, 0
    bne $r26, $r28, fail
    lu12i.w $r9, 0x1c7ff
    ori $r9, $r9, 0xe9d
    ld.w $r26, $r9, 0x3e3
    ori $r28, $r0, 0
    bne $r26, $r28, fail
st_b_27_1:
    lu12i.w $r19, 0x1c800
    ori $r19, $r19, 0x30b
    st.b $r28, $r19, -0x2d9
    lu12i.w $r19, 0x1c800
    ori $r19, $r19, 0x30b
    ld.bu $r15, $r19, -0x2d9
    ori $r18, $r0, 0
    bne $r15, $r18, fail
    lu12i.w $r19, 0x1c800
    ori $r19, $r19, 0x30b
    ld.w $r15, $r19, -0x2db
    ori $r18, $r0, 0
    bne $r15, $r18, fail
st_b_27_2:
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x94
    st.b $r0, $r10, 0x366
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x94
    ld.bu $r7, $r10, 0x366
    ori $r17, $r0, 0
    bne $r7, $r17, fail
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x94
    ld.w $r7, $r10, 0x364
    ori $r17, $r0, 0
    bne $r7, $r17, fail
st_b_27_3:
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x221
    st.b $r26, $r16, 0x197
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x221
    ld.bu $r18, $r16, 0x197
    ori $r31, $r0, 0
    bne $r18, $r31, fail
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x221
    ld.w $r18, $r16, 0x197
    ori $r31, $r0, 0
    bne $r18, $r31, fail
st_b_27_4:
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x5c0
    st.b $r6, $r10, -0x39
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x5c0
    ld.bu $r28, $r10, -0x39
    ori $r23, $r0, 0
    bne $r28, $r23, fail
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x5c0
    ld.w $r28, $r10, -0x3c
    ori $r23, $r0, 0
    bne $r28, $r23, fail
st_b_27_5:
    lu12i.w $r12, 0x1c800
    ori $r12, $r12, 0xdf
    st.b $r19, $r12, 0x661
    lu12i.w $r12, 0x1c800
    ori $r12, $r12, 0xdf
    ld.bu $r10, $r12, 0x661
    ori $r18, $r0, 0xb
    bne $r10, $r18, fail
    lu12i.w $r12, 0x1c800
    ori $r12, $r12, 0xdf
    ld.w $r10, $r12, 0x661
    lu12i.w $r18, 0x7770
    ori $r18, $r18, 0xb
    bne $r10, $r18, fail
st_b_27_6:
    lu12i.w $r3, 0x1c7ff
    ori $r3, $r3, 0xffe
    st.b $r0, $r3, 0x682
    lu12i.w $r3, 0x1c7ff
    ori $r3, $r3, 0xffe
    ld.bu $r21, $r3, 0x682
    ori $r18, $r0, 0
    bne $r21, $r18, fail
    lu12i.w $r3, 0x1c7ff
    ori $r3, $r3, 0xffe
    ld.w $r21, $r3, 0x682
    ori $r18, $r0, 0
    bne $r21, $r18, fail
st_b_27_7:
    lu12i.w $r21, 0x1c800
    ori $r21, $r21, 0xcd7
    st.b $r17, $r21, -0x7c4
    lu12i.w $r21, 0x1c800
    ori $r21, $r21, 0xcd7
    ld.bu $r17, $r21, -0x7c4
    ori $r31, $r0, 0
    bne $r17, $r31, fail
    lu12i.w $r21, 0x1c800
    ori $r21, $r21, 0xcd7
    ld.w $r17, $r21, -0x7c7
    ori $r31, $r0, 0
    bne $r17, $r31, fail
st_b_27_8:
jirl_28_0:
    lu12i.w $r15, 0x1c000
    ori $r15, $r15, 0xe6c
    jirl $r7, $r15, 0x10
    b fail
    lu12i.w $r13, 0x1c000
    ori $r13, $r13, 0xe78
    bne $r7, $r13, fail
jirl_28_1:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xe88
    jirl $r19, $r2, 0x10
    b fail
    lu12i.w $r13, 0x1c000
    ori $r13, $r13, 0xe94
    bne $r19, $r13, fail
jirl_28_2:
    lu12i.w $r15, 0x1c000
    ori $r15, $r15, 0xea4
    jirl $r24, $r15, 0x10
    b fail
    lu12i.w $r26, 0x1c000
    ori $r26, $r26, 0xeb0
    bne $r24, $r26, fail
jirl_28_3:
    lu12i.w $r30, 0x1c000
    ori $r30, $r30, 0xec0
    jirl $r1, $r30, 0x10
    b fail
    lu12i.w $r9, 0x1c000
    ori $r9, $r9, 0xecc
    bne $r1, $r9, fail
jirl_28_4:
    lu12i.w $r21, 0x1c000
    ori $r21, $r21, 0xedc
    jirl $r14, $r21, 0x10
    b fail
    lu12i.w $r13, 0x1c000
    ori $r13, $r13, 0xee8
    bne $r14, $r13, fail
jirl_28_5:
    lu12i.w $r7, 0x1c000
    ori $r7, $r7, 0xef8
    jirl $r21, $r7, 0x10
    b fail
    lu12i.w $r16, 0x1c000
    ori $r16, $r16, 0xf04
    bne $r21, $r16, fail
jirl_28_6:
    lu12i.w $r28, 0x1c000
    ori $r28, $r28, 0xf14
    jirl $r18, $r28, 0x10
    b fail
    lu12i.w $r31, 0x1c000
    ori $r31, $r31, 0xf20
    bne $r18, $r31, fail
jirl_28_7:
    lu12i.w $r7, 0x1c000
    ori $r7, $r7, 0xf30
    jirl $r28, $r7, 0x10
    b fail
    lu12i.w $r3, 0x1c000
    ori $r3, $r3, 0xf3c
    bne $r28, $r3, fail
jirl_28_8:
b_29_0:
    b b_29_1
    b fail
b_29_1:
    b b_29_2
    b fail
b_29_2:
    b b_29_3
    b fail
b_29_3:
    b b_29_4
    b fail
b_29_4:
    b b_29_5
    b fail
b_29_5:
    b b_29_6
    b fail
b_29_6:
    b b_29_7
    b fail
b_29_7:
    b b_29_8
    b fail
b_29_8:
bl_30_0:
    bl bl_30_0_
    b fail
    bl_30_0_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xf90
    bne $r1, $r2, fail
bl_30_1:
    bl bl_30_1_
    b fail
    bl_30_1_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xfa4
    bne $r1, $r2, fail
bl_30_2:
    bl bl_30_2_
    b fail
    bl_30_2_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xfb8
    bne $r1, $r2, fail
bl_30_3:
    bl bl_30_3_
    b fail
    bl_30_3_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xfcc
    bne $r1, $r2, fail
bl_30_4:
    bl bl_30_4_
    b fail
    bl_30_4_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xfe0
    bne $r1, $r2, fail
bl_30_5:
    bl bl_30_5_
    b fail
    bl_30_5_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0xff4
    bne $r1, $r2, fail
bl_30_6:
    bl bl_30_6_
    b fail
    bl_30_6_:
    lu12i.w $r2, 0x1c001
    ori $r2, $r2, 0x8
    bne $r1, $r2, fail
bl_30_7:
    bl bl_30_7_
    b fail
    bl_30_7_:
    lu12i.w $r2, 0x1c001
    ori $r2, $r2, 0x1c
    bne $r1, $r2, fail
bl_30_8:
beq_31_0:
    beq $r19, $r2, fail
beq_31_1:
    beq $r22, $r31, fail
beq_31_2:
    beq $r2, $r23, fail
beq_31_3:
    beq $r1, $r17, fail
beq_31_4:
    beq $r18, $r3, fail
beq_31_5:
    beq $r0, $r13, fail
beq_31_6:
    beq $r2, $r14, fail
beq_31_7:
    beq $r12, $r16, fail
beq_31_8:
bne_32_0:
    bne $r29, $r20, bne_32_1
    b fail
bne_32_1:
    bne $r2, $r27, bne_32_2
    b fail
bne_32_2:
    bne $r1, $r10, bne_32_3
    b fail
bne_32_3:
    bne $r2, $r7, bne_32_4
    b fail
bne_32_4:
    bne $r15, $r19, bne_32_5
    b fail
bne_32_5:
    bne $r22, $r10, bne_32_6
    b fail
bne_32_6:
    bne $r30, $r24, bne_32_7
    b fail
bne_32_7:
    bne $r11, $r13, bne_32_8
    b fail
bne_32_8:
blt_33_0:
    blt $r13, $r0, fail
blt_33_1:
    blt $r19, $r23, fail
blt_33_2:
    blt $r8, $r27, fail
blt_33_3:
    blt $r28, $r20, fail
blt_33_4:
    blt $r21, $r15, fail
blt_33_5:
    blt $r19, $r4, fail
blt_33_6:
    blt $r29, $r19, fail
blt_33_7:
    blt $r3, $r2, blt_33_8
    b fail
blt_33_8:
bge_34_0:
    bge $r6, $r7, fail
bge_34_1:
    bge $r31, $r16, bge_34_2
    b fail
bge_34_2:
    bge $r4, $r5, bge_34_3
    b fail
bge_34_3:
    bge $r11, $r29, fail
bge_34_4:
    bge $r2, $r23, bge_34_5
    b fail
bge_34_5:
    bge $r19, $r17, bge_34_6
    b fail
bge_34_6:
    bge $r11, $r10, fail
bge_34_7:
    bge $r17, $r5, bge_34_8
    b fail
bge_34_8:
bltu_35_0:
    bltu $r2, $r3, fail
bltu_35_1:
    bltu $r11, $r27, fail
bltu_35_2:
    bltu $r22, $r12, bltu_35_3
    b fail
bltu_35_3:
    bltu $r10, $r0, fail
bltu_35_4:
    bltu $r23, $r25, bltu_35_5
    b fail
bltu_35_5:
    bltu $r17, $r18, bltu_35_6
    b fail
bltu_35_6:
    bltu $r13, $r0, fail
bltu_35_7:
    bltu $r24, $r29, bltu_35_8
    b fail
bltu_35_8:
bgeu_36_0:
    bgeu $r29, $r11, bgeu_36_1
    b fail
bgeu_36_1:
    bgeu $r7, $r12, fail
bgeu_36_2:
    bgeu $r23, $r23, bgeu_36_3
    b fail
bgeu_36_3:
    bgeu $r26, $r5, bgeu_36_4
    b fail
bgeu_36_4:
    bgeu $r27, $r11, bgeu_36_5
    b fail
bgeu_36_5:
    bgeu $r1, $r20, bgeu_36_6
    b fail
bgeu_36_6:
    bgeu $r13, $r9, bgeu_36_7
    b fail
bgeu_36_7:
    bgeu $r29, $r7, bgeu_36_8
    b fail
bgeu_36_8:
win:
    ori $r4, $r0, 0
    halt
fail:
    lu12i.w $r4, -0x1
    ori $r4, $r4, 0xfff
    halt
