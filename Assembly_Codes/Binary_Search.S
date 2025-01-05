.section .text
.global binsearch
binsearch:
    # a0 = int arr[]
    # a1 = int needle
    # a2 = int size
    # t0 = mid
    # t1 = left
    # t2 = right

    li      t1, 0        # left = 0
    addi    t2, a2, -1   # right = size - 1
1:  # while loop
    bgt     t1, t2, 2f   # if left > right, break

    add     t0, t1, t2   # mid = left + right
    srai    t0, t0, 1    # mid = (left + right) / 2

    # Get the element at the midpoint
    slli    t4, t0, 2    # Scale the midpoint by 4 (for word size)
    add     t4, a0, t4   # Get the memory address of arr[mid]
    lw      t4, 0(t4)    # Dereference arr[mid]

    # Check if needle == arr[mid]
    beq     a1, t4, 3f   # if needle == arr[mid], return mid

    # If needle < arr[mid], adjust right
    blt     a1, t4, 4f   # if needle < arr[mid], right = mid - 1
    # If needle > arr[mid], adjust left
    addi    t1, t0, 1    # left = mid + 1
    j       1b

4:  # right = mid - 1
    addi    t2, t0, -1   # right = mid - 1
    j       1b

3:  # If we get here, then needle == arr[mid]
    mv      a0, t0       # return mid index
    ret

2:  # If not found, return -1 or a signal indicating failure
    li      a0, -1       # return -1 if needle is not found
    ret
