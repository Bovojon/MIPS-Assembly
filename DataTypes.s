# Demo program: Demonstration of ASCII data stored in memory (the data segment)
# Filename: DataTypes.s
# Video Lecture: MIPS #4: Data Segment ASCII

        # Data Segment
        .data

a1:                   .ascii        "123"
a2:                   .ascii        "5"
a3:                   .ascii        "4"
name:                 .ascii        "Jon"
course:               .ascii        "CS 320"


        # Text Segment
        .text

        .globl my_main
my_main:
        # Main code goes here



        # Exit the program
        li        $v0, 10
        syscall
