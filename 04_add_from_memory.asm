.data
first:   .word 8
second:  .word 7
result:  .word 0
newline: .asciiz "\n"

.text
.globl main
main:
    la $t3, first
    lw $t0, 0($t3)
    lw $t1, 4($t3)
    add $t2, $t0, $t1
    sw $t2, 8($t3)
    move $a0, $t2
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    li $v0, 10
    syscall
