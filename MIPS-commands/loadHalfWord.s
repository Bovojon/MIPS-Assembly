# Demo program: Use of loading (lhu) and storing half words (sh)
# Filename: loadHalfWord.s
# Video Lecture MIPS #21: Load Half Word
#
#
        #################### Data Segment ###################
        .data
msg0:                .asciiz       "Demo: Loading and Storing Half Words \n\n"        # Starts at 0x1001000 offset by 0 in data memory
test:                .asciiz       "0123456789ABCDEF"
NT:                  .asciiz       "\n Normal Termination \n"         # offset 16 bytes from 0x10010000

        ##################### Text Segment ##################
        .text

        .globl my_main
my_main:
        li        $v0, 4                # Main starts here
        la        $a0, msg0
        syscall

        # Program here
        li        $s0, 0x10010000

        lhu       $t0, 0x00($s0)        # Loading a half-word from memory to register
      # lhu       $t1, 0x01($s0)        # Error: Offset must be multiple of 2
        lhu       $t2, 0x02($s0)
        lhu       $t3, 0x04($s0)
        lhu       $t4, 0x06($s0)
        lhu       $t5, 0x08($s0)

        li        $s1, 0x10020000

        sh        $t0, 0($s1)         # Storing a half-word from Register to Memory
      # sh        $t1, 1($s1)         # Error: Offset must be multiple of 2
        sh        $t1, 2($s1)
        sh        $t2, 4($s1)
        sh        $t3, 6($s1)
        sh        $t4, 8($s1)

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall                 # Main ends here
