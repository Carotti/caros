.extern idtp

.section .text
.global idt_load
.func idt_load
idt_load:
    lidt idtp
    ret
.endfunc
