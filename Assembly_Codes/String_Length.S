.section .text
.global strlen 

strlen:

    #a0 = const char *str

    li t0, 0    #i = 0
1: #start of "for loop"

    add t1, t0, a0
    lb t1, 0(t1)
    beqz t1, 1f
    addi t0, t0, 1
    j 1b

1: #End of "for loop"

    mv a0, t0
    ret 