# Demo program: Swaps the kth element with the k+1 element of an array
# Filename: swap.s
# Video Lecture MIPS #22: Swap
#
#
        #################### Data Segment ###################
        .data
CR:                 .asciiz       "\n"
NT:                 .asciiz       "\n Normal Termination \n"

        ##################### Text Segment ##################
        .text
        .globl my_main
#
#    C Program:
#        void swap( int *v, int k){
#          int temp;
#          temp = v[k];
#          v[k] = v[k+];
#          v[k+1] = temp;
#        }
#
# This is the main procedure - Address of v[0] is the global pointer, $gp
my_main:
        # Load some data into memory using global pointer
        li        $t0, 0x1
        sw        $t0, 0($gp)

        li        $t0, 0x2
        sw        $t0, 4($gp)

        li        $t0, 0x3
        sw        $t0, 8($gp)

        li        $t0, 0x4
        sw        $t0, 12($gp)

        li        $t0, 0x5
        sw        $t0, 16($gp)

        li        $t0, 0x6
        sw        $t0, 20($gp)


        # swap(v, 3);
        move      $a0, $gp
        li        $a1, 3
        jal       swap

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall

        # Exit the program
        li        $v0, 10
        syscall
#
#        Swap: This procedure swaps 2 integers in an array
#
#        $a0 contains the address of the array v[]
#        $a1 contains the index of the element to swap 'k'
#
swap:
        sll       $t1, $a1, 2           # t1 = k*4
        add       $t1, $a0, $t1         # t1 = &v[k] = v + k

        lw        $t0, 0($t1)           # t0 = v[k]
        lw        $t2, 4($t1)           # t2 = v[k+1]

        sw        $t2, 0($t1)           # v[k] = t2
        sw        $t0, 4($t1)           # v[k+1] = t0

        jr        $ra
