        .data   
        .align  2
inputn:  
        .asciiz "\nEnter number of integers in array>"
inputint:
        .asciiz "\nEnter integer>"
spc: 
        .asciiz " "
nwl:
        .asciiz "\n"

        .text
        .globl  main
main:
        j       READ

       # ### Read array ### #

READ:   
        li      $v0, 4                          # Print prompt for number of integers in array - N
        la      $a0, inputn
        syscall
        li      $v0, 5                          # Read N
        syscall  
        move    $s1, $v0                        # Save N in $s1
        mul     $a0, $s1, 4                     # 4N bytes for array
        li      $v0, 9                          # Allocate heap for array
        syscall
        move    $s0, $v0                        # Save address on heap
        li      $s2, 0                          # i = 0
READLOOP:
        sub     $t0, $s2, $s1                   # i - N 
        bgez    $t0, EREADLOOP                  # i - N >= 0 exit loop
        li      $v0, 4                          # Print prompt for integer
        la      $a0, inputint
        syscall
        li      $v0, 5                          # Read integer
        syscall
        li      $t1, 4
        mul     $t1, $s2, $t1                   # Compute array offset by 4 bytes
        add     $t2, $s0, $t1                   # Add to base adress
        sw      $v0, ($t2)                      # Save data
        addi    $s2, $s2, 1                     # i + 1
        j       READLOOP
EREADLOOP:
        j       BUBBLESORT

        # ### Print array ### #

PRINT:
        li      $v0, 4                          # Print new line
        la      $a0, nwl
        syscall
        li      $s2, 0                          # i = 0
PRINTLOOP:
        sub     $t0, $s2, $s1                   # i - N
        bgez    $t0, EPRINTLOOP                 # i - N >= 0 exit loop
        li      $t1, 4
        mul     $t1, $s2, $t1                   # Compute array offset by 4 bytes
        add     $t2, $s0, $t1                   # Add to base adress
        lw      $a0, ($t2)                      # load into a0
        li      $v0, 1                          # Print integer
        syscall
        li      $v0, 4                          # Print space
        la      $a0, spc
        syscall
        addi    $s2, $s2, 1                     # i + 1
        j       PRINTLOOP
EPRINTLOOP:
        li $v0, 10
        syscall

        # ### Sort Array ### #

BUBBLESORT:
        li      $s2, 0                          # i = 0
BUBSLOOPI:
        li      $s3, 0                          # j = 0
        sub     $t0, $s2, $s1                   # i - N
        bgez    $t0, EBUBSLOOPI                 # i - N >= 0 exit loop
        sub     $t3, $s1, 1                     # N - 1
        addi    $s2, $s2, 1                     # i + 1
        la      $t2, ($s0)                      # reset address
        BUBSLOOPJ:
                sub     $t0, $s3, $t3           # j - (N - 1)
                bgez    $t0, EBUBSLOOPJ         # j - (N - 1) >= 0 exit loop
                lw      $a0, 0($t2)             # load a[j]
                lw      $a1, 4($t2)             # load a[j + 1]
                ble     $a0, $a1, SKIP          # if a[j] <= a[j + 1] skip swap
                sw      $a1, 0($t2)             # a[j + 1] = a[j]
                sw      $a0, 4($t2)             # a[j] = a[j + 1]
        SKIP:
                addi    $s3, $s3, 1             # j + 1
                li      $t1, 4
                mul     $t1, $s3, $t1           # Compute array offset by 4 bytes
                add     $t2, $s0, $t1           # Add to base adress
                j       BUBSLOOPJ
        EBUBSLOOPJ:
        j BUBSLOOPI
EBUBSLOOPI:
        j       PRINT


