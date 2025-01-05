.section .text
.global stringcopy

stringcopy:
    # a0 = destination (dst)
    # a1 = source (src)
1:
    lb      t0, 0(a1)    # Load a byte from the source (src)
    sb      t0, 0(a0)    # Store the byte into the destination (dst)
    beqz    t0, end_loop # If byte is 0 (null terminator), break the loop

    addi    a0, a0, 1    # Advance destination pointer by 1 byte
    addi    a1, a1, 1    # Advance source pointer by 1 byte
    j       1b           # Jump back to the start of the loop

end_loop:
    ret                  # Return from the function
