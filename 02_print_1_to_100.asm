.data
newline: .asciiz "\n"

.text
.globl main
main:
    li $t0, 1
    li $t1, 100
print_loop:
    slt $t2, $t1, $t0
    bne $t2, $zero, done
    sll $zero, $zero, 0
    move $a0, $t0
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    addiu $t0, $t0, 1
    j print_loop
    sll $zero, $zero, 0
done:
    li $v0, 10
    syscall
