gdt:
    .word  24    # Size of GDT in bytes minus 1
    .int   0x800  # Linear address of GDT

.global load_gdt
.func load_gdt
load_gdt:
        # Point es:di to the right memory section:
        mov     $0, %ax
        mov     %ax, %es
        mov     $0x800, %di

        # NULL Descriptor
        movw    $4, %cx
        rep     stosw

        # Code segment descriptor
        movw    $0xffff, %es:(%di)
        movw    $0x0000, %es:2(%di)
        movb    $0x0, %es:4(%di)
        movb    $0x9a, %es:5(%di)
        movb    $0xcf, %es:6(%di)
        movb    $0x0, %es:7(%di)

        add     $8, %di

        # Data segment descriptor
        movw    $0xffff, %es:(%di)
        movw    $0x0000, %es:2(%di)
        movb    $0x0, %es:4(%di)
        movb    $0x92, %es:5(%di)
        movb    $0xcf, %es:6(%di)
        movb    $0x0, %es:7(%di)
        lgdt gdt
.endfunc
