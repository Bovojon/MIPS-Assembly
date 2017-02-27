# Demo
# Filename: LoadImmediate

.data


.text
# Load some registers
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


# Exit the program
li        $v0, 10
syscall
