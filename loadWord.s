# Demo program: Load Word
# Filename: loadWord.s
# This program demonstrates the "lw command"
# Video Lecture MIPS #9: Load Word

        # Data Segment
        .data

temp:               .ascii         "0123456789ABCDEF"
NT:                 .asciiz        "Normal Termination\n"


        # Text Segment
        .text

        .globl my_main
my_main:
        li        $s0, 0x10010000         # Our base address
        lw        $t1, 0($s0)       # Look at contents of $s0, add 0 and go to that location in that memory and grab the value there (32 bits) and store it in $t1
        lw        $t2, 4($s0)       # R[$t2] = M[R[$s0] + 4]
        lw        $t3, 8($s0)       # R[$t2] = M[R[$s0] + 8]
        lw        $t4, 12($s0)      # R[$t2] = M[R[$s0] + 12]
        lw        $t5, 0x0c($s0)    # R[$t2] = M[R[$s0] + 12]

        # Will cause an error since not word-aligned
        # lw        $t1, 1($s0)
        # lw        $t1, 2($s0)
        # lw        $t1, 3($s0)

        # Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall


        # Exit the program
        li        $v0, 10
        syscall
