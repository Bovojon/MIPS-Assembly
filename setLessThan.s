# Demo program: Set Less Than
# Filename: setLessThan.s
# Video Lecture MIPS #16: Set Less Than
# slt vs. sltu
#
        # Data Segment
        .data                 # Preprocessor directive
Title:        .asciiz       "Demo: slt, sltu \n\n"        # Starts at 0x1001000 offset by 0 in data memory
NT:           .asciiz       "Normal Termination"         # offset 16 bytes from 0x10010000
CR:           .asciiz       "\n\n"


        # Text Segment
        .text                 # Preprocessor directive

        .globl my_main        # Preprocessor directive
my_main:
        li        $s3, 0x1                # $s3 = 1
        li        $s4, 0x2                # $s4 = 2
        slt       $t0, $s3, $s4           # Set Less Than - set $t0 to 1 if $s3<$s4

        li        $s3, 0x4                # $s3 = 4
        li        $s4, 0x3                # $s4 = 3
        slt       $t0, $s3, $s4           # $t0 = 0

        li        $s0, 0xFFFFFFFF         # $s0 =  -1
        li        $s1, 0x00000001         # $s1 = 1
        slt       $t0, $s0, $s1           # signed so $t0  = 1

        li        $s0, 0xFFFFFFFF         # $s0 = biggest positive number for unsigned data
        li        $s1, 0x00000001         # $s1 = 1
        sltu      $t0, $s0, $s1           # Set Less Than Unsigned - so $t0 = 0

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
