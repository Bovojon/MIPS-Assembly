# Demo program using PCSpim
# Filename: SubRegister.s
# Video Lecture: MIPS #3: Subtraction
# This program demonstrates the sub instruction
# Notes: .data, .text, .global, etc are preprocessor directives
# sub is an r-type instruction

        # Data Segment
        .data


        # Text Segment
        .text

        .globl my_main
my_main:
        # Main code goes here

        # Result is positive
        li        $t1, 0x2222
        li        $t2, 0x1111
        sub       $t3, $t1, $t2       # t3 = t1 - t2

        li        $t1, 0xFFFF
        li        $t2, 0x0001
        sub       $t3, $t1, $t2       # t3 = t1 - t2

        li        $t1, 0x7FFFFFFF     # Biggest positive number in terms of signed 32 bit
        li        $t2, 0x00000001
        sub       $t3, $t1, $t2       # t3 = t1 - t2


        # Result is negative (2's complement)
        li        $t2, 0x1111
        li        $t1, 0x2222
        sub       $t3, $t1, $t2       # t3 = t1 - t2

        li        $t1, 0x0001
        li        $t2, 0xFFFF
        sub       $t3, $t1, $t2       # t3 = t1 - t2

        li        $t1, 0x00000001
        li        $t2, 0x7FFFFFFF
        sub       $t3, $t1, $t2       # t3 = t1 - t2


        # Exit the program
        li        $v0, 10
        syscall
