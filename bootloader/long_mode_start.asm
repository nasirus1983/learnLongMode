global long_mode_start
extern kmain

section .text
bits 64
long_mode_start:

    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    extern kmain
    call kmain

    ; print `OKAY` to screen
    ; mov rax, 0x2f592f412f4b2f4f
    ; mov qword [0xb8000], rax
    ; mov qword [0xA0000], rax
    hlt