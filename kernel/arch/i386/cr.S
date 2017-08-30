.section .text

.global read_cr0
.func read_cr0
read_cr0:
    mov %cr0, %eax
    ret
.endfunc

.global write_cr0
.func write_cr0
write_cr0:
    mov 8(%esp), %eax
    mov %eax, %cr0
    ret
.endfunc

.global read_cr3
.func read_cr3
read_cr3:
    mov %cr3, %eax
    ret
.endfunc

.global write_cr3
.func write_cr3
write_cr3:
    mov 8(%esp), %eax
    mov %eax, %cr3
    ret
.endfunc
