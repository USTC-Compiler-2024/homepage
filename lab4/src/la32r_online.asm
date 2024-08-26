.text
_start:
random_init_0:
    lu12i.w $r0, 0x20809
    ori $r0, $r0, 0xf7b
    lu12i.w $r1, 0x46283
    ori $r1, $r1, 0xb93
    lu12i.w $r2, -0x52c9e
    ori $r2, $r2, 0xcd3
    lu12i.w $r3, -0x4900e
    ori $r3, $r3, 0x272
    lu12i.w $r4, 0x3907e
    ori $r4, $r4, 0x253
    lu12i.w $r5, -0xc948
    ori $r5, $r5, 0x8cc
    lu12i.w $r6, 0x61734
    ori $r6, $r6, 0xee6
    lu12i.w $r7, 0x606c
    ori $r7, $r7, 0xbb2
    lu12i.w $r8, 0x2ef94
    ori $r8, $r8, 0x11b
    lu12i.w $r9, 0x151dc
    ori $r9, $r9, 0x16
    lu12i.w $r10, -0x5b77f
    ori $r10, $r10, 0xb1d
    lu12i.w $r11, 0x1c2e2
    ori $r11, $r11, 0xbc0
    lu12i.w $r12, 0x246bd
    ori $r12, $r12, 0xa53
    lu12i.w $r13, 0x20
    ori $r13, $r13, 0x174
    lu12i.w $r14, 0x7e062
    ori $r14, $r14, 0x4ad
    lu12i.w $r15, -0x5de06
    ori $r15, $r15, 0x4ae
    lu12i.w $r16, -0x7472d
    ori $r16, $r16, 0x5d2
    lu12i.w $r17, 0x5a962
    ori $r17, $r17, 0x41c
    lu12i.w $r18, -0x28511
    ori $r18, $r18, 0x288
    lu12i.w $r19, 0x2a607
    ori $r19, $r19, 0x209
    lu12i.w $r20, 0x38909
    ori $r20, $r20, 0xa6c
    lu12i.w $r21, 0x71acd
    ori $r21, $r21, 0x1b7
    lu12i.w $r22, 0x9f8f
    ori $r22, $r22, 0x9b5
    lu12i.w $r23, -0x1495e
    ori $r23, $r23, 0x62
    lu12i.w $r24, 0x1cce6
    ori $r24, $r24, 0xc05
    lu12i.w $r25, -0x6c64f
    ori $r25, $r25, 0x184
    lu12i.w $r26, 0x30624
    ori $r26, $r26, 0x88f
    lu12i.w $r27, 0x7fb43
    ori $r27, $r27, 0x339
    lu12i.w $r28, 0xf87a
    ori $r28, $r28, 0x14
    lu12i.w $r29, 0x7c8b6
    ori $r29, $r29, 0x7ac
    lu12i.w $r30, 0x5fb9a
    ori $r30, $r30, 0xb3c
    lu12i.w $r31, 0x302b7
    ori $r31, $r31, 0x252
add_w_0_0:
    add.w $r23, $r10, $r5
    lu12i.w $r30, -0x680c6
    ori $r30, $r30, 0x3e9
    bne $r23, $r30, fail
add_w_0_1:
    add.w $r3, $r4, $r30
    lu12i.w $r17, -0x2f048
    ori $r17, $r17, 0x63c
    bne $r3, $r17, fail
add_w_0_2:
sub_w_1_0:
    sub.w $r6, $r30, $r24
    lu12i.w $r20, 0x7b253
    ori $r20, $r20, 0x7e4
    bne $r6, $r20, fail
sub_w_1_1:
    sub.w $r21, $r21, $r3
    lu12i.w $r5, -0x5f4ec
    ori $r5, $r5, 0xb7b
    bne $r21, $r5, fail
sub_w_1_2:
slt_2_0:
    slt $r5, $r2, $r7
    ori $r24, $r0, 0x1
    bne $r5, $r24, fail
slt_2_1:
    slt $r17, $r0, $r25
    ori $r6, $r0, 0
    bne $r17, $r6, fail
slt_2_2:
sltu_3_0:
    sltu $r22, $r0, $r7
    ori $r1, $r0, 0x1
    bne $r22, $r1, fail
sltu_3_1:
    sltu $r31, $r3, $r16
    ori $r15, $r0, 0
    bne $r31, $r15, fail
sltu_3_2:
and_4_0:
    and $r10, $r2, $r28
    lu12i.w $r14, 0xd062
    ori $r14, $r14, 0x10
    bne $r10, $r14, fail
and_4_1:
    and $r20, $r9, $r24
    ori $r23, $r0, 0
    bne $r20, $r23, fail
and_4_2:
or_5_0:
    or $r15, $r29, $r29
    lu12i.w $r25, 0x7c8b6
    ori $r25, $r25, 0x7ac
    bne $r15, $r25, fail
or_5_1:
    or $r1, $r9, $r18
    lu12i.w $r14, -0x28401
    ori $r14, $r14, 0x29e
    bne $r1, $r14, fail
or_5_2:
xor_6_0:
    xor $r28, $r18, $r16
    lu12i.w $r2, 0x5c23c
    ori $r2, $r2, 0x75a
    bne $r28, $r2, fail
xor_6_1:
    xor $r1, $r23, $r21
    lu12i.w $r10, -0x5f4ec
    ori $r10, $r10, 0xb7b
    bne $r1, $r10, fail
xor_6_2:
sll_w_7_0:
    sll.w $r22, $r18, $r14
    ori $r4, $r0, 0
    bne $r22, $r4, fail
sll_w_7_1:
    sll.w $r29, $r9, $r29
    lu12i.w $r14, -0x23fea
    ori $r14, $r14, 0
    bne $r29, $r14, fail
sll_w_7_2:
srl_w_8_0:
    srl.w $r29, $r20, $r15
    ori $r24, $r0, 0
    bne $r29, $r24, fail
srl_w_8_1:
    srl.w $r9, $r19, $r11
    lu12i.w $r20, 0x2a607
    ori $r20, $r20, 0x209
    bne $r9, $r20, fail
srl_w_8_2:
sra_w_9_0:
    sra.w $r11, $r18, $r5
    lu12i.w $r23, -0x14289
    ori $r23, $r23, 0x944
    bne $r11, $r23, fail
sra_w_9_1:
    sra.w $r28, $r31, $r25
    ori $r16, $r0, 0
    bne $r28, $r16, fail
sra_w_9_2:
slli_w_10_0:
    slli.w $r1, $r24, 0x1
    ori $r29, $r0, 0
    bne $r1, $r29, fail
slli_w_10_1:
    slli.w $r25, $r15, 0x4
    lu12i.w $r11, -0x37499
    ori $r11, $r11, 0xac0
    bne $r25, $r11, fail
slli_w_10_2:
srli_w_11_0:
    srli.w $r12, $r7, 0x5
    lu12i.w $r22, 0x303
    ori $r22, $r22, 0x65d
    bne $r12, $r22, fail
srli_w_11_1:
    srli.w $r8, $r4, 0x1c
    ori $r14, $r0, 0
    bne $r8, $r14, fail
srli_w_11_2:
srai_w_12_0:
    srai.w $r8, $r28, 0x1d
    ori $r25, $r0, 0
    bne $r8, $r25, fail
srai_w_12_1:
    srai.w $r6, $r12, 0x14
    ori $r14, $r0, 0x3
    bne $r6, $r14, fail
srai_w_12_2:
slti_13_0:
    slti $r16, $r12, 0x49c
    ori $r22, $r0, 0
    bne $r16, $r22, fail
slti_13_1:
    slti $r10, $r13, -0x4db
    ori $r13, $r0, 0
    bne $r10, $r13, fail
slti_13_2:
sltui_14_0:
    sltui $r15, $r23, 0x471
    ori $r23, $r0, 0
    bne $r15, $r23, fail
sltui_14_1:
    sltui $r23, $r22, -0x7c1
    ori $r24, $r0, 0x1
    bne $r23, $r24, fail
sltui_14_2:
andi_15_0:
    andi $r15, $r20, 0xed8
    ori $r3, $r0, 0x208
    bne $r15, $r3, fail
andi_15_1:
    andi $r5, $r20, 0xdc0
    ori $r14, $r0, 0
    bne $r5, $r14, fail
andi_15_2:
ori_16_0:
    ori $r7, $r27, 0x7e6
    lu12i.w $r2, 0x7fb43
    ori $r2, $r2, 0x7ff
    bne $r7, $r2, fail
ori_16_1:
    ori $r10, $r27, 0x150
    lu12i.w $r31, 0x7fb43
    ori $r31, $r31, 0x379
    bne $r10, $r31, fail
ori_16_2:
xori_17_0:
    xori $r14, $r23, 0x9cb
    ori $r19, $r0, 0x9ca
    bne $r14, $r19, fail
xori_17_1:
    xori $r9, $r21, 0xd7c
    lu12i.w $r21, -0x5f4ec
    ori $r21, $r21, 0x607
    bne $r9, $r21, fail
xori_17_2:
lu12i_w_18_0:
    lu12i.w $r25, 0x865f
    lu12i.w $r20, 0x865f
    ori $r20, $r20, 0
    bne $r25, $r20, fail
lu12i_w_18_1:
    lu12i.w $r3, -0x2587e
    lu12i.w $r28, -0x2587e
    ori $r28, $r28, 0
    bne $r3, $r28, fail
lu12i_w_18_2:
pcaddu12i_19_0:
    pcaddu12i $r30, -0x2c2d4
    lu12i.w $r3, -0x102d4
    ori $r3, $r3, 0x314
    bne $r30, $r3, fail
pcaddu12i_19_1:
    pcaddu12i $r29, 0x26a4c
    lu12i.w $r30, 0x42a4c
    ori $r30, $r30, 0x324
    bne $r29, $r30, fail
pcaddu12i_19_2:
ld_w_20_0:
    lu12i.w $r6, 0x1c800
    ori $r6, $r6, 0x4f3
    ld.w $r27, $r6, 0xf9
    ori $r8, $r0, 0
    bne $r27, $r8, fail
ld_w_20_1:
    lu12i.w $r27, 0x1c7ff
    ori $r27, $r27, 0xd0c
    ld.w $r4, $r27, 0x638
    ori $r30, $r0, 0
    bne $r4, $r30, fail
ld_w_20_2:
ld_h_21_0:
    lu12i.w $r4, 0x1c800
    ori $r4, $r4, 0x7c5
    ld.h $r2, $r4, -0x6e7
    ori $r11, $r0, 0
    bne $r2, $r11, fail
ld_h_21_1:
    lu12i.w $r6, 0x1c800
    ori $r6, $r6, 0x4fe
    ld.h $r24, $r6, -0x320
    ori $r17, $r0, 0
    bne $r24, $r17, fail
ld_h_21_2:
ld_b_22_0:
    lu12i.w $r20, 0x1c7ff
    ori $r20, $r20, 0xf7c
    ld.b $r28, $r20, 0x220
    ori $r24, $r0, 0
    bne $r28, $r24, fail
ld_b_22_1:
    lu12i.w $r11, 0x1c7ff
    ori $r11, $r11, 0xdea
    ld.b $r25, $r11, 0x711
    ori $r30, $r0, 0
    bne $r25, $r30, fail
ld_b_22_2:
ld_hu_23_0:
    lu12i.w $r9, 0x1c800
    ori $r9, $r9, 0x341
    ld.hu $r6, $r9, 0x7f
    ori $r2, $r0, 0
    bne $r6, $r2, fail
ld_hu_23_1:
    lu12i.w $r10, 0x1c800
    ori $r10, $r10, 0x84a
    ld.hu $r21, $r10, -0xaa
    ori $r26, $r0, 0
    bne $r21, $r26, fail
ld_hu_23_2:
ld_bu_24_0:
    lu12i.w $r6, 0x1c800
    ori $r6, $r6, 0x1b7
    ld.bu $r3, $r6, 0x4b1
    ori $r22, $r0, 0
    bne $r3, $r22, fail
ld_bu_24_1:
    lu12i.w $r30, 0x1c800
    ori $r30, $r30, 0x776
    ld.bu $r15, $r30, 0x23
    ori $r24, $r0, 0
    bne $r15, $r24, fail
ld_bu_24_2:
st_w_25_0:
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x36a
    st.w $r23, $r18, -0x3e
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x36a
    ld.w $r28, $r18, -0x3e
    ori $r27, $r0, 0x1
    bne $r28, $r27, fail
    lu12i.w $r18, 0x1c800
    ori $r18, $r18, 0x36a
    ld.w $r28, $r18, -0x3e
    ori $r27, $r0, 0x1
    bne $r28, $r27, fail
st_w_25_1:
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x6b8
    st.w $r18, $r16, -0x540
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x6b8
    ld.w $r29, $r16, -0x540
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x36a
    bne $r29, $r24, fail
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x6b8
    ld.w $r29, $r16, -0x540
    lu12i.w $r24, 0x1c800
    ori $r24, $r24, 0x36a
    bne $r29, $r24, fail
st_w_25_2:
st_h_26_0:
    lu12i.w $r23, 0x1c800
    ori $r23, $r23, 0x3db
    st.h $r29, $r23, 0x25f
    lu12i.w $r23, 0x1c800
    ori $r23, $r23, 0x3db
    ld.hu $r8, $r23, 0x25f
    ori $r16, $r0, 0x36a
    bne $r8, $r16, fail
    lu12i.w $r23, 0x1c800
    ori $r23, $r23, 0x3db
    ld.w $r8, $r23, 0x25d
    lu12i.w $r16, 0x36a0
    ori $r16, $r16, 0
    bne $r8, $r16, fail
st_h_26_1:
    lu12i.w $r22, 0x1c800
    ori $r22, $r22, 0x938
    st.h $r13, $r22, -0x56a
    lu12i.w $r22, 0x1c800
    ori $r22, $r22, 0x938
    ld.hu $r26, $r22, -0x56a
    ori $r24, $r0, 0
    bne $r26, $r24, fail
    lu12i.w $r22, 0x1c800
    ori $r22, $r22, 0x938
    ld.w $r26, $r22, -0x56c
    ori $r24, $r0, 0
    bne $r26, $r24, fail
st_h_26_2:
st_b_27_0:
    lu12i.w $r20, 0x1c800
    ori $r20, $r20, 0x7ea
    st.b $r8, $r20, -0x6ab
    lu12i.w $r20, 0x1c800
    ori $r20, $r20, 0x7ea
    ld.bu $r23, $r20, -0x6ab
    ori $r4, $r0, 0
    bne $r23, $r4, fail
    lu12i.w $r20, 0x1c800
    ori $r20, $r20, 0x7ea
    ld.w $r23, $r20, -0x6ae
    ori $r4, $r0, 0
    bne $r23, $r4, fail
st_b_27_1:
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x7e3
    st.b $r19, $r16, -0x498
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x7e3
    ld.bu $r9, $r16, -0x498
    ori $r26, $r0, 0xca
    bne $r9, $r26, fail
    lu12i.w $r16, 0x1c800
    ori $r16, $r16, 0x7e3
    ld.w $r9, $r16, -0x49b
    lu12i.w $r26, -0x36000
    ori $r26, $r26, 0
    bne $r9, $r26, fail
st_b_27_2:
jirl_28_0:
    lu12i.w $r27, 0x1c000
    ori $r27, $r27, 0x544
    jirl $r11, $r27, 0x10
    b fail
    lu12i.w $r22, 0x1c000
    ori $r22, $r22, 0x550
    bne $r11, $r22, fail
jirl_28_1:
    lu12i.w $r30, 0x1c000
    ori $r30, $r30, 0x560
    jirl $r16, $r30, 0x10
    b fail
    lu12i.w $r30, 0x1c000
    ori $r30, $r30, 0x56c
    bne $r16, $r30, fail
jirl_28_2:
b_29_0:
    b b_29_1
    b fail
b_29_1:
    b b_29_2
    b fail
b_29_2:
bl_30_0:
    bl bl_30_0_
    b fail
    bl_30_0_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0x590
    bne $r1, $r2, fail
bl_30_1:
    bl bl_30_1_
    b fail
    bl_30_1_:
    lu12i.w $r2, 0x1c000
    ori $r2, $r2, 0x5a4
    bne $r1, $r2, fail
bl_30_2:
beq_31_0:
    beq $r0, $r12, fail
beq_31_1:
    beq $r5, $r1, fail
beq_31_2:
bne_32_0:
    bne $r20, $r30, bne_32_1
    b fail
bne_32_1:
    bne $r24, $r16, bne_32_2
    b fail
bne_32_2:
blt_33_0:
    blt $r7, $r19, fail
blt_33_1:
    blt $r23, $r7, blt_33_2
    b fail
blt_33_2:
bge_34_0:
    bge $r27, $r4, bge_34_1
    b fail
bge_34_1:
    bge $r8, $r8, bge_34_2
    b fail
bge_34_2:
bltu_35_0:
    bltu $r4, $r28, bltu_35_1
    b fail
bltu_35_1:
    bltu $r9, $r19, fail
bltu_35_2:
bgeu_36_0:
    bgeu $r19, $r5, bgeu_36_1
    b fail
bgeu_36_1:
    bgeu $r5, $r29, fail
bgeu_36_2:
win:
    ori $r4, $r0, 0
    halt
fail:
    lu12i.w $r4, -0x1
    ori $r4, $r4, 0xfff
    halt
