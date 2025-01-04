.global diagonal_sum_entry

.extern matrix

diagonal_sum_entry:

    li t0, 0
    la a0, matrix

    lw t1, 0(a0)
    add t0, t0, t1

    lw t1, 4(a0)
    add t0, t0, t1

    lw t1, 8(a0)
    add t0, t0, t1

diagonal_sum_exit:
    nop
    nop
