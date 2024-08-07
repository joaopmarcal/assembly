; o minimo que um programa em assemble deve ter
; compilar - Transforma o programa para linguagem máquina
;  nasm -f elf64 minimal_program.asm
; Linkeditar - Transformar o programa em linguagem de máquina para um executavel
;  ld -s -o minimal_program minimal_program.o
section .data

section .text

global _start

_start:
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80