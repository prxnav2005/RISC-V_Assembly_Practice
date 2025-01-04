.global fibonacci_entry;

.equiv SEQ_LEN, 5
.equiv MEM_ADDR, 0x80001000

fibonacci_entry:

li t0, 0
li t1, 1

li a0, SEQ_LEN
li a1, MEM_ADDR

blez a0, fibonacci_exit

    /* Fibonacci seq len is greater than 0 */
 
    sw t0, 0(a1)
    addi a0, a0, -1
    addi a1, a1, 4

blez a0, fibonacci_exit

    /* Fibonacci seq len is greater than 1 */

    sw t1, 0(a1)
    addi a1, a1, 4
    addi a0, a0, -1

loop_start:

    add t2, t1, 0
    sw t2 , 0(a1)
    addi a0, a0, -1

    addi a1, a1, 4

    mv t0, t1
    mv t1, t2

    bnez a0, loop_start
 

fibonacci_exit:
nop 
addi x0, x0, 0