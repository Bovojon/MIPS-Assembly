# Demo program: This program demonstrates a simple subroutine call using
#               the Jump and Link (jal) instruction with pushing and popping
#               on/off the stack
# Filename: jumpAndLink_Stack.s
# Video Lecture MIPS #20: Jump and Link Stack
#
#
        #################### Data Segment ###################
        .data
msg:                .asciiz       "Demo: Jump and Link with Stack \n\n"        # Starts at 0x1001000 offset by 0 in data memory
sub1Msg:            .asciiz       "Inside Sub1 \n"
NT:                 .asciiz       "Normal Termination"         # offset 16 bytes from 0x10010000

        ##################### Text Segment ##################
        .text

        .globl my_main
my_main:
        li        $v0, 4                # Main starts here
        la        $a0, msg
        syscall

        li        $s0, 0
        li        $s1, 1
        li        $s2, 2
        li        $s3, 3
        li        $s4, 4
        li        $s5, 5
        li        $s6, 6
        li        $s7, 7

        # Call subroutine #1
        jal       sub1

        # Call subroutine #1
        jal       sub1

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall                 # Main ends here
