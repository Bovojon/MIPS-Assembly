# Demo program: Add Word
# Filename: addWord.s
# This program demonstrates add immediate
# Video Lecture MIPS #12: Add Immediate
#
# Note: Memory access must be on a 4-byte boundary
#
        # Data Segment
        .data
Title:        .asciiz       "\n\n Add Immediate Demo Program \n\n"
NT:           .asciiz       "Normal Termination"


        # Text Segment
        .text

        .globl my_main
my_main:

        # Print Title
        li        $v0, 4
        la        $a0, Title        # la - load address of title in a0
        syscall

        # Add register is an r-type command - operates on 3 registers: source, target, destination
        li        $s0, 0x1111
        li        $s1, 0x2222
        add       $s2, $s1, $s0       # s2 = $s1 + s0

        # Add Immediate is an i-type command - has target and destination reg - for adding constant to a register
        li        $s0, 0x0000FFFF
        addi      $s1, $s0, 1         # s1 = s0 + 1

        li        $s0, 0xFFFFFFFF
        addi      $s1, $s0, 5         # s1 = s0 + 5

        li        $s0, 0xFFFFFFFF
        addi      $s1, $s0, -5         # s1 = s0 + (-5)

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
