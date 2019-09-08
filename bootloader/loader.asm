MAGIC equ 0xe85250d6
ARCH equ 0x0

section .multiboot_header
header_start:
align 4
    dd MAGIC
    dd ARCH                         ; architecture 0 (protected mode i386)
    dd header_end - header_start ; header length
    ; checksum
    dd 0x100000000 - (MAGIC + ARCH + (header_end - header_start))
    ; insert optional multiboot tags here

    ; required end tag
    dw 0    ; type
    dw 0    ; flags
    dd 8    ; size
header_end: