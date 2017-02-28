# Demo program: Syscall Print Integer - how to print out an integer to the console
# Filename: syscallPrintInteger.s
# Video Lecture MIPS #7: Syscall Print Interger
# Put integer 4 into control register v0 for printing a string using syscall
# Put integer 10 into control register v0 and syscall will terminate the program
# syscall always looks at v0 to figure out to do.
# li is sudo so it is converted to ori
# move is sudo so it is converted to addu (add unsigned)


        # Data Segment
        .data

Title:                .asciiz         "Printing Int to console \n\n"
CR:                   .asciiz         "\n"
NT:                   .asciiz         "Normal Termination\n"


        # Text Segment
        .text

        .globl my_main
my_main:
        # Print Title to Console
        li        $v0, 4             # li puts value 4 into v0 register
        la        $a0, Title         # la - Load Address
        syscall

        # Print the contents of Register $s0 to Console
        li        $s0, 1234

        li        $v0, 1            # load v0 with 1 to print integer
        move      $a0, $s0          # move contents of $s0 to $a0
        syscall

        # Print CR
        li        $v0, 4
        la        $a0, CR
        syscall
        syscall

        # Print Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall


        # Exit the program
        li        $v0, 10         # Loading v0 with 10 tells syscall to terminate
        syscall
