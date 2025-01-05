.section .text
.global strncpy

strncpy:
    li t0, 0            # t0 = 0 (counter/index)
1: 
    bge t0, a2, 2f      # If t0 >= n (a2), go to padding part
    add t1, a1, t0      # t1 = a1 + t0 (source string address)
    lb t1, 0(t1)        # Load byte from source string
    beqz t1, 2f         # If byte is zero (null terminator), go to padding part
    add t2, a0, t0      # t2 = a0 + t0 (destination string address)
    sb t1, 0(t2)        # Store byte into destination string
    addi t0, t0, 1      # Increment index t0
    j 1b                # Jump to the next iteration of copying

2: 
    bge t0, a2, 3f      # If t0 >= n (a2), exit
    add t1, a0, t0      # t1 = a0 + t0 (destination string address)
    sb zero, 0(t1)      # Store null byte (padding)
    addi t0, t0, 1      # Increment index t0
    j 2b                # Jump to the next iteration of padding

3: 
    ret                 # Return from the function
