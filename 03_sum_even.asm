.data
sum:     .word 0
newline: .asciiz "\n"

.text
.globl main
main:
    li $t0, 2
    li $t1, 100
    addu $t2, $zero, $zero
sum_loop:
    slt $t3, $t1, $t0
    bne $t3, $zero, finish_sum
    sll $zero, $zero, 0
    add $t2, $t2, $t0
    addiu $t0, $t0, 2
    j sum_loop
    sll $zero, $zero, 0
finish_sum:
    la $t4, sum
    sw $t2, 0($t4)
    move $a0, $t2
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    li $v0, 10
    syscall
