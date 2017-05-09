# Demo program: Loading and Storing bytes
# Filename: loadStoreByte.s
# Video Lecture MIPS #17: Load Byte, Store Byte
#
#
        #################### Data Segment ###################
        .data                 # Preprocessor directive
msg0:         .asciiz       "Demo: Loading and Storing bytes \n\n"        # Starts at 0x1001000 offset by 0 in data memory
NT:           .asciiz       "Normal Termination"         # offset 16 bytes from 0x10010000


        ##################### Text Segment ##################
        .text                 # Preprocessor directive

        li        $v0, 4
        la        $a0, msg0
        syscall

        #################### Program ##################

        .globl my_main        # Preprocessor directive
my_main:

        li        $s0, 0x10010000

        lb        $t0, 0x00($s0)        # Loading a byte from memory to register
        lb        $t1, 0x01($s0)
        lb        $t2, 0x02($s0)
        lb        $t3, 0x03($s0)


        li        $s0, 0x10010000

        sb        $t0, 0($s1)       # Storing a byte from Register to memory
        sb        $t1, 1($s1)
        sb        $t2, 2($s1)
        sb        $t3, 3($s1)


        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
