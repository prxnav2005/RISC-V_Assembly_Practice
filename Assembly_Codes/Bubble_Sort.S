.global bubble_sort_entry

.extern array

bubble_sort_entry:

    li t2, 6
    li s1, 0

outer_loop_start:

    la a0, array
    sub s2, t2, s1

inner_loop_start:

    lw t0, 0(a0)
    lw t1, 4(a0)

    blt t0, t1, no_swap

    sw t1, 0(a0)
    sw t0, 4(a0)

no_swap:

    addi a0, a0, 4
    addi s2, s2, -1
    bne s2, zero, inner_loop_start

inner_loop_end:

    addi s1, s1, 1
    blt s1, t2, outer_loop_start

bubble_sort_exit:
    nop
    nop
