# Demo program: Demonstration of branching using the bne command.
# Filename: branch.s
# Video Lecture MIPS #14: And, Or, Nor
# Note: Using register $zero as a comparison for a loop is more efficient
#
#
        # Data Segment
        .data
NT:           .asciiz       "Normal Termination"


        # Text Segment
        .text

        .globl my_main
my_main:
        li        $t0, 5

L1:     addi      $t0, $t0, -1        # L1
        nop
        nop       # Body of Loop
        nop
        bne       $t0, $zero, L1

        li        $t0, 0
        li        $t1, 5

L2:     addi      $t0, $t0, 1         # L2
        nop
        nop       # Body of Loop
        nop
        bne       $t0, $t1, L2

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
