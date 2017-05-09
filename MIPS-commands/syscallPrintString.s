# Demo program: Syscall Print String - how to print out a character string to the console
# Filename: syscallPrintString.s
# Video Lecture MIPS #6: Syscall Print String
# Put integer 4 into control register v0 for printing a string using syscall
# Put integer 10 into control register v0 and syscall will terminate the program

        # Data Segment
        .data

Name:               .asciiz         "Jon Aullaev \n\n"
Course:             .asciiz         "EEng 460\n"
Lab:                .asciiz         "Lab #0: Test Lab"
CR:                 .asciiz         "\n"
Date:               .asciiz         "MM/DD/YYYY\n\n"
NT:                 .asciiz         "Normal Termination\n"


        # Text Segment
        .text

        .globl my_main
my_main:
        # Print Name to Console
        li        $v0, 4            # li puts value 4 into v0 register
        la        $a0, Name         # la - Load Address
        syscall

        # Print Course to Console
        li        $v0, 4
        la        $a0, Course
        syscall

        # Print Lab to Console
        li        $v0, 4
        la        $a0, Lab
        syscall

        # Print CR (Carriage Return) to Console
        li        $v0, 4
        la        $a0, CR
        syscall

        # Print Date to Console
        li        $v0, 4
        la        $a0, Date
        syscall

        # Normal Termination
        li        $v0, 4
        la        $a0, NT
        syscall


        # Exit the program
        li        $v0, 10
        syscall
