# Demo program: Demonstration of ASCII data stored in memory (the data segment)
# Filename: DataTypes.s
# Video Lecture: MIPS #4: Data Segment ASCII
# z: null-terminates the string - puts 0 in memory
        # Data Segment
        .data

a1:                   .asciiz        "123"
a2:                   .asciiz        "5"
a3:                   .asciiz        "4"
name:                 .asciiz        "Jon"
course:               .asciiz        "CS 320"


        # Text Segment
        .text

        .globl my_main
my_main:
        # Main code goes here



        # Exit the program
        li        $v0, 10
        syscall
