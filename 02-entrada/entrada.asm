segment .data
    LF          equ 0xA     ;Line Feed
    NULL        equ 0xD     ;Final da String
    SYS_CALL    equ 0x80    ;Envia Informação ao SO
    ;   EAX
    SYS_EXIT    equ 0x1     ;Código de chamada para finalizar
    SYS_READ    equ 0x3     ;Operação de leitura
    SYS_WRITE   equ 0x4     ;Operação de escrita
    ;   EBX
    RET_EXIT    equ 0x0     ;Operação realizada com sucesso
    STD_IN      equ 0x0     ;Entrada Padrão
    STD_OUT     equ 0x1     ;Saída Padrão

section .data
    msg db "Entre com seu nome:", LF, NULL
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg
    mov EDX, tam
    int SYS_CALL

    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, nome
    mov EDX, 0xA
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL