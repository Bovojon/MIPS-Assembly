# Demo Program
# Filename: adding
# Addition of Registers
# Video lecture 4: MIPS #2: Add, Part 2
# Notes: li is a sudo command

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

        li        $t1, 0x0000FFFF
        li        $t2, 0x00000001
        add       $t3, $t1, $t2

        li        $t1, 0xFFFFFFFF       # -1
        li        $t2, 0x00000002       # +2
        add       $t3, $t1, $t2

        li        $t1, 0xFFFFFFFC       # -4
        li        $t2, 0xFFFFFFFD       # -3
        add       $t3, $t1, $t2


        # Exit the program
        li        $v0, 10
        syscall
