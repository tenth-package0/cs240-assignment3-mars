# Assignment 3: MARS Fundamentals

Repository link: [https://github.com/tenth-package0/cs240-assignment3-mars](https://github.com/tenth-package0/cs240-assignment3-mars)

## Hello World (setup)

[Download 01_hello_world.asm](01_hello_world.asm)

```asm
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
```

![Hello World (setup) running in MARS](screenshots/01_hello_world.png)

## Program 1: Print 1 through 100

[Download 02_print_1_to_100.asm](02_print_1_to_100.asm)

```asm
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
```

![Program 1: Print 1 through 100 running in MARS](screenshots/02_print_1_to_100.png)

## Program 2: Sum of even integers

[Download 03_sum_even.asm](03_sum_even.asm)

```asm
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
```

![Program 2: Sum of even integers running in MARS](screenshots/03_sum_even.png)

## Program 3: Add integers from memory

[Download 04_add_from_memory.asm](04_add_from_memory.asm)

```asm
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
```

![Program 3: Add integers from memory running in MARS](screenshots/04_add_from_memory.png)

## Program 4: FizzBuzz

[Download 05_fizzbuzz.asm](05_fizzbuzz.asm)

```asm
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
```

![Program 4: FizzBuzz running in MARS](screenshots/05_fizzbuzz.png)

## Running the programs

Use [MARS 4.5](https://github.com/dpetersanderson/MARS/releases) with Java. Open one `.asm` file at a time, then choose **Run > Assemble** and **Run > Go**. Enable pseudo-instructions and use the Default memory configuration. Turn off **Assemble all files in directory**. Use **Run > Step** to trace registers and memory.

## Report and verification

[Assignment3_Report.pdf](Assignment3_Report.pdf) includes full output, recorded MARS register/memory traces, tests, and a reflection draft to personalize. The screenshots above show source code and captured Run I/O.

Verified results: Hello World; integers 1-100; even sum 2550; memory sum 8 + 7 = 15; FizzBuzz 1-100. Tests also covered loop bounds, zero and negative inputs, signed limits and expected overflow, and delayed branching on and off.

## Sources and collaboration

Instructor Dominic Dabish's CS240 Thursday examples `mips1.asm` through `mips15.asm` informed the memory, syscall, and loop patterns. MARS was developed by Pete Sanderson and Kenneth Vollmar. OpenAI Codex assisted with program preparation, testing, trace capture, report drafting, and repository organization. Execution screenshots were captured by the student. Review the work and follow the course collaboration policy before submission.
