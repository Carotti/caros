# Get x86 into a kernel usable mode

.global init_arch
.func init_arch
init_arch:
        cli
        # Uncomment if we aren't using Grub to stick us in protected mode
        # call enable_a20
        call load_gdt
        call load_idt
        ret
.endfunc
