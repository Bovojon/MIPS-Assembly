# Demo
# Filename: LoadImmediate

        .data


        .text
        # Load some values into 32-bit registers
        li        $t0, 0x0        # Load Immediate
        li        $t1, 0x1        # Load Immediate
        li        $t2, 0x2        # Load Immediate
        li        $t3, 0x3        # Load Immediate
        li        $t4, 0x4        # Load Immediate
        li        $t5, 0x5        # Load Immediate
        li        $t6, 0x6        # Load Immediate
        li        $t7, 0x7        # Load Immediate
        li        $t8, 0x8        # Load Immediate
        li        $t9, 0x9        # Load Immediate


        # Load 16 bits into 32-bit registers
        li        $t0, 0x0000        # Load Immediate
        li        $t1, 0x1111        # Load Immediate
        li        $t2, 0x2222        # Load Immediate
        li        $t3, 0x3333        # Load Immediate
        li        $t4, 0x4444        # Load Immediate
        li        $t5, 0x5555        # Load Immediate
        li        $t6, 0x6666        # Load Immediate
        li        $t7, 0x7777        # Load Immediate
        li        $t8, 0x8888        # Load Immediate
        li        $t9, 0x9999        # Load Immediate


        # Load 32 bits into 32-bit registers
        li        $t0, 0x00000000        # Load Immediate
        li        $t1, 0x11111111        # Load Immediate
        li        $t2, 0x22222222        # Load Immediate
        li        $t3, 0x33333333        # Load Immediate
        li        $t4, 0x44444444        # Load Immediate
        li        $t5, 0x55555555        # Load Immediate
        li        $t6, 0x66666666        # Load Immediate
        li        $t7, 0x77777777        # Load Immediate
        li        $t8, 0x88888888        # Load Immediate
        li        $t9, 0x99999999        # Load Immediate


        # If n bits (n>32) are loaded, the first n-32 bits are eliminated.



        # Exit the program
        li        $v0, 10
        syscall
