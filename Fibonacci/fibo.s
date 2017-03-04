# Demo program: Fibonacci in MIPS
# Filename: fibonacci.s


# Fibonacci function in C:
#
# int fib(int n) {
#   if (n==0) {
#     return 0;
#   }
#   if (n==1) {
#     return 1;
#   }
#   return fib(n-1) + fib(n-2);
# }
#
#
############### Data Segment ###############
        .data
prompt:               .asciiz         "Enter an integer number (>=0): "
printF:               .asciiz         "F"
printEqual:           .asciiz         " = "
CR:                   .asciiz         "\n"

############### Text Segment ###############
        .text
        .globl my_main

my_main:
        # Prompt the user to input a non-negative n
        la        $a0,        prompt
        li        $v0,        4
        syscall

        # Read input integer n
        li        $v0, 5
        syscall

        # Move integer n to register t2
        move      $t2, $v0


# In a loop calculate the first n Fibonacci numbers

        # Must Calculate the ith Fibonacci numbers
        move      $a0, $t2
        move      $v0, $t2
        jal       fib                 #call fib(n)
        move      $t3,$v0             #result is in $t3

        # Must Output to console the message and i
        # Print F
        la        $a0, printF
        li        $v0, 4
        syscall
        #Must Print i
        move      $a0, $t2
        li        $v0, 1
        syscall
        # Print =
        la        $a0, printEqual
        li        $v0, 4
        syscall
        #Print the ith Fibonacci number
        move      $a0, $t3
        li        $v0, 1
        syscall
        #Print a new line
        la        $a0, CR
        li        $v0, 4
        syscall

        # End program
        li $v0,10
        syscall



# Fibonacci function to calculate and return respective Fibonacci number
#
fib:
        # if n=0 return 0
        beqz      $a0, zero
        # if n=1 return 1
        beq       $a0, 1, one

        # If n>1, then recursively call fib(n-1) and fib(n-2)

        # Call fib(n-1):
        sub       $sp, $sp, 4       # Keep the returned address on stack
        sw        $ra,0($sp)

        sub       $a0, $a0, 1       # calculate n-1
        jal       fib               # Call fib(n-1)
        add       $a0, $a0, 1

        lw        $ra, 0($sp)       # Restore returned address from stack
        add       $sp, $sp, 4

        sub       $sp, $sp, 4       # Push the returned value to stack
        sw        $v0, 0($sp)


        # Call fib(n-2):
        sub       $sp, $sp, 4       # Keep the returned address on stack
        sw        $ra, 0($sp)

        sub       $a0, $a0, 2       # calculate n-2
        jal       fib               # Call fib(n-2)
        add       $a0, $a0, 2

        lw        $ra, 0($sp)       # Restore returned address from stack
        add       $sp, $sp, 4


        # Calculate fib(n-1) + f(n-2)
        lw        $s7, 0($sp)       # Pop the returned value from stack
        add       $sp, $sp, 4

        add       $v0, $v0, $s7     # fib(n-1) + f(n-2)
        jr        $ra               # Decrement the stack
#
#
# If n = 1 or n = 0
#
zero:
        li        $v0, 0            # Return 0
        jr        $ra
one:
        li        $v0, 1            # Return 1
        jr        $ra
