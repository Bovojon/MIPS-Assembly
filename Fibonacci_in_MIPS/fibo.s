# Demo program: Fibonacci in MIPS
# Filename: fibo.s
#
#
# Fibonacci function in C used:
#
#     int fib(int n) {
#       if (n==0) {
#         return 0;
#       }
#       if (n==1) {
#         return 1;
#       }
#       return fib(n-1) + fib(n-2);
#     }
#
#     int main () {
#       int i, n;
#       print_string(Enter an integer number (>=0): );
#       n = read_int();
#       for(i=0; i<=n; i++) {
#         print_str("F%d = ", i);
#         print_int(Fibonacci(i));
#       }
#       return 0;
#     }



############### Data Segment ###############
        .data
prompt:               .asciiz         "Enter an integer number (>=0): "
CR:                   .asciiz         "\n"
openParan:            .asciiz         "F("
closeParan:           .asciiz         ") = "

############### Text Segment ###############
        .text
        .globl my_main
#
# The main function will be called my_main so that there will be no confusion with the inbuilt main function for MIPS
#
my_main:
        # Prompt the user to input a non-negative n
        la        $a0, prompt
        li        $v0, 4
        syscall

        # Read input integer n
        li        $v0, 5
        syscall

        # Move integer n from $v0 to register t2
        move      $t2, $v0

        # Load 0 into register t7
        li        $t7, 0              # $t7 = 0
        # Add 1 to $t2 and store result in $t6
        addi      $t6, $t2, 1         # $t6 = $t2 + 1
#
#
# The below block calls the Fibonacci function on i where 0<=i<=n and prints out the results neatly as F(i) = ith_Fibonacci
#
decrease:
        move      $a0, $t7            # Move content of $t7 to $a0 in order to call fib on the content
        jal       fib                 # call fib on what was in $t7
        move      $t3, $v0            # Store the result in $t3

        # Print 'F('
        li $v0, 4                     # Load 4 into $v0 to print a string
        la $a0, openParan
        syscall

        # Print i
        move      $a0, $t7
        li        $v0, 1
        syscall

        # Print ') = '
        li $v0,4
        la $a0, closeParan
        syscall

        # Print the ith Fibonacci term
        move      $a0, $t3
        li        $v0, 1
        syscall

        # Print Carriage Return
        li $v0,4
        la $a0, CR
        syscall

        # Increment value in $t7 by 1
        addi      $t7, $t7, 1

        # Loop will end if value in $t7 = value in $t6 = n
        bne       $t6, $t7, decrease

        # End program
        li $v0,10
        syscall
#
#
# The below block is the Fibonacci function used to calculate and return respective Fibonacci numbers
#
fib:
        beqz      $a0, zero         # if n=0 return 0. beqz means branch if equal to zero
        beq       $a0, 1, one       # if n=1 return 1

    # If n>1, then recursively call fib(n-1) and fib(n-2)

        # Call fib(n-1):
        sub       $sp, $sp, 4       # Keep the returned address on stack
        sw        $ra,0($sp)

        sub       $a0, $a0, 1       # calculate n-1
        jal       fib               # Call fib(n-1)
        addi      $a0, $a0, 1       # Increment $a0 by 1

        lw        $ra, 0($sp)       # Restore returned address from stack
        addi      $sp, $sp, 4       # Increment $sp by 4

        sub       $sp, $sp, 4       # Push the returned value to stack
        sw        $v0, 0($sp)


        # Call fib(n-2):
        sub       $sp, $sp, 4       # Keep the returned address on stack
        sw        $ra, 0($sp)

        sub       $a0, $a0, 2       # calculate n-2
        jal       fib               # Call fib(n-2)
        addi      $a0, $a0, 2       # Increment $a0 by 2

        lw        $ra, 0($sp)       # Restore returned address from stack
        addi      $sp, $sp, 4       # Increment $sp by 4


        # Calculate fib(n-1) + f(n-2)
        lw        $s7, 0($sp)       # Pop the returned value from stack
        addi      $sp, $sp, 4       # Increment $sp by 4

        add       $v0, $v0, $s7     # fib(n-1) + f(n-2)
        jr        $ra               # Decrement the stack
#
#
# If n = 1 or n = 0
#
zero:
        li        $v0, 0            # Return 0
        jr        $ra               # Decrement the stack
one:
        li        $v0, 1            # Return 1
        jr        $ra               # Decrement the stack
