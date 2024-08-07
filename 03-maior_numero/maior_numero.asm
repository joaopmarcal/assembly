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
    x dd 50
    y dd 60
    msg1 db 'X maior que Y', LF, NULL
    tam1 equ $- msg1
    msg2 db 'Y maior que X', LF, NULL
    tam2 equ $- msg2

section .text

global _start

_start:
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
    cmp EAX,EBX
    jge maior
    mov ECX, msg2
    mov EDX, tam2
    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    xor EBX, EBX    ;mov EBX, RET_EXIT
    int SYS_CALL