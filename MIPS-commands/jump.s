# Demo program: Jump - an unconditional branch
# Filename: jump.s
# Video Lecture MIPS #18: Jump
#
#
        #################### Data Segment ###################
        .data
msg0:         .asciiz       "Demo: Jump \n\n"        # Starts at 0x1001000 offset by 0 in data memory
NT:           .asciiz       "Normal Termination"         # offset 16 bytes from 0x10010000
CR:           .asciiz       "\n"

        ##################### Text Segment ##################
        .text

        .globl my_main
my_main:
        li        $v0, 4                # Main starts here
        la        $a0, msg0
        syscall

        # Print 2 carriage returns to console
        li        $v0, 4
        la        $a0, cr
        syscall
        syscall

        li        $s0, 0x1111

        # Unconditional branch to label L1
        j         L1                # Jump instruction

        addi        $s1, $s0, 0x01
        addi        $s2, $s0, 0x02
        addi        $s3, $s0, 0x03
        addi        $s4, $s0, 0x04
        addi        $s5, $s0, 0x05
        addi        $s6, $s0, 0x06

L1:     # Label L1 is here

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall                 # Main ends here
