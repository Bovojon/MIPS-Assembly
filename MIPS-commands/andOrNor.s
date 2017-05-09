# Demo program: And, Or, Andi, Ori and Nor
# Filename: andOrNor.s
# Video Lecture MIPS #14: And, Or, Nor
#
# Note: Memory access must be on a 4-byte boundary
#
#
        # Data Segment
        .data
Title:        .asciiz       "Logical Demo Program \n\n"
NT:           .asciiz       "Normal Termination"


        # Text Segment
        .text

        .globl my_main
my_main:

        li        $v0, 4
        la        $a0, Title
        syscall

        li        $t1, 0x5555aaaa
        li        $t2, 0xaaaa5555

        and       $t3, $t1, $t2
        or        $t4, $t1, $t2

        andi      $t5, $t1, 0x00FF
        ori       $t6, $t2, 0xFF00

        nor       $t7, $t5, $t6

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
