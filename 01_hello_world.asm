.data
message: .asciiz "Hello World!\n"

.text
.globl main
main:
    la $a0, message
    li $v0, 4
    syscall
    li $v0, 10
    syscall
