# Demo program: Store Word
# Filename: storeWord.s
# This program demonstrates storing a register to memory
# using the "sw command"
# Video Lecture MIPS #11: Store Word
#
# Note: Memory access must be on a 4-byte boundary
#
        # Data Segment
        .data

        # Text Segment
        .text

        .globl my_main
my_main:
        li        $t0, 0x30
        li        $t1, 0x10010000
        sw        $t0, 0($t1)

        # The following will cause an error:
        # sw        $t0, 1($t1)
        # sw        $t0, 2($t1)
        # sw        $t0, 3($t1)

        addi        $t0, $t0, 1       # takes contents of $t0 (2), adds 1 to it and stores it back in $t0 (1).
        sw          $t0, 4($t1)

        li        $t0, 0x12345678
        sw        $t0, 8($t1)

        li        $t0, 0xA5A5A5A5
        sw        $t0, 12($t1)


        # Exit the program
        li        $v0, 10
        syscall
