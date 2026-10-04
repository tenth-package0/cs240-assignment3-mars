.data
fizz:     .asciiz "Fizz"
buzz:     .asciiz "Buzz"
fizzbuzz: .asciiz "FizzBuzz"
newline:  .asciiz "\n"

.text
.globl main
main:
    li $t0, 1
    li $t1, 100
    li $t2, 3
    li $t3, 5
fizzbuzz_loop:
    slt $t6, $t1, $t0
    bne $t6, $zero, done
    sll $zero, $zero, 0
    div $t0, $t2
    mfhi $t4
    div $t0, $t3
    mfhi $t5
    bne $t4, $zero, check_buzz
    sll $zero, $zero, 0
    bne $t5, $zero, print_fizz
    sll $zero, $zero, 0
    la $a0, fizzbuzz
    j print_word
    sll $zero, $zero, 0
print_fizz:
    la $a0, fizz
    j print_word
    sll $zero, $zero, 0
check_buzz:
    beq $t5, $zero, print_buzz
    sll $zero, $zero, 0
    move $a0, $t0
    li $v0, 1
    syscall
    j print_newline
    sll $zero, $zero, 0
print_buzz:
    la $a0, buzz
print_word:
    li $v0, 4
    syscall
print_newline:
    la $a0, newline
    li $v0, 4
    syscall
    addiu $t0, $t0, 1
    j fizzbuzz_loop
    sll $zero, $zero, 0
done:
    li $v0, 10
    syscall
