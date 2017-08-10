.extern gp

.section .text
.global gdt_flush
.func gdt_flush
gdt_flush:
    	lgdt gp

        mov $0x10, %ax
        mov %ax, %ds
        mov %ax, %es
        mov %ax, %fs
        mov %ax, %gs
        mov %ax, %ss

        ljmp flush2

    flush2:
        ret
