# Get x86 into a kernel usable mode

.global init_arch
.func init_arch
init_arch:
        cli
        call load_gdt
        call load_idt
        call enable_a20
        ret
.endfunc
