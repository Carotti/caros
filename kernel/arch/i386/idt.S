idt:
    .word 2048 # Size of the IDT (256 bytes)
    .int 0x0 # Linear address of IDT

.global load_idt
.func load_idt
load_idt:
        lidt idt
        ret
.endfunc
