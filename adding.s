# Demo Program
# Filename: adding
# Addition of Registers
# Video lecture 4: MIPS #2: Add, Part 1

        # Data Section
        .data


        # Text Section
        .text

        .globl my_main
my_main:
        # Main code goes here

        li        $t1, 0x1111
        li        $t2, 0x2222
        add       $t3, $t1, $t2


        # Exit the program
        li        $v0, 10
        syscall
