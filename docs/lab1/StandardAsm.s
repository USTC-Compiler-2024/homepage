    .text
    lu12i.w $fp, 0x24000
    lu12i.w $sp, 0x23fff
    ori $sp, $sp, 0xffc
    bl main
    halt
main:
    # prologue
    st.w $ra, $sp, -4
    st.w $fp, $sp, -8
    addi.w $fp, $sp, 0
    addi.w $sp, $sp, -20
main_label_entry:
    addi.w $t0, $fp, -16
    st.w $t0, $fp, -12
    ld.w $t0, $fp, -12
    addi.w $t1, $zero, 1
    st.w $t1, $t0, 0
    ld.w $t0, $fp, -12
    ld.w $t0, $t0, 0
    slli.w $t0, $t0, 31
    srai.w $t0, $t0, 31
    lu12i.w $t1, 0x80000
    srli.w $t1, $t1, 31
    beq $t0, $t1, fail
    b main_exit
main_exit:
    # epilogue
    addi.w $sp, $sp, 20
    ld.w $ra, $sp, -4
    ld.w $fp, $sp, -8
    jirl $zero, $ra, 0

fail:
    add.w $fp $zero $zero
    sub.w $sp $zero $fp
    and $ra, $zero, $ra
    halt