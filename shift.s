# Demo program: Shifting Left and Right
# Filename: shifting.s
# Video Lecture MIPS #13: Shifting
# Each command is 32 bits long
#
#
        # Data Segment
        .data                 # Preprocessor directive
Title:        .ascii       "Demo: Shifting \n\n"        # Starts at 0x1001000 offset by 0 in data memory
NT:           .ascii       "Normal Termination"         # offset 16 bytes from 0x10010000


        # Text Segment
        .text                 # Preprocessor directive

        .globl my_main        # Preprocessor directive
my_main:
        li        $t0, 0xFFFFFFFF       # li is a sudo command - lui of register (FFFF) and ori of remaining 16 bits (FFFF)

        # Shift Left Logic -  sll    destination, source, 1
        sll       $t0, $t0, 1           # 0xFFFFFFFE
        sll       $t0, $t0, 1           # 0xFFFFFFFC
        sll       $t0, $t0, 1           # 0xFFFFFFF8
        sll       $t0, $t0, 1           # 0xFFFFFFF0
        sll       $t0, $t0, 1           # 0xFFFFFFE0
        sll       $t0, $t0, 1           # 0xFFFFFFC0
        sll       $t0, $t0, 1           # 0xFFFFFF80

        li        $t1, 0xFFFFFFFF

        # Shift Right Logic
        srl       $t1, $t1, 1           # 0x7FFFFFFF
        srl       $t1, $t1, 1           # 0x3FFFFFFF
        srl       $t1, $t1, 1           # 0x1FFFFFFF
        srl       $t1, $t1, 1           # 0xFFFFFFF
        srl       $t1, $t1, 1           # 0x7FFFFFF
        srl       $t1, $t1, 1           # 0x3FFFFFF
        srl       $t1, $t1, 1           # 0x1FFFFFF
        srl       $t1, $t1, 1           # 0xFFFFFF
        srl       $t1, $t1, 1           # 0x7FFFFF

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
