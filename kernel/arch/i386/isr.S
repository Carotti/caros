.global isr0
.global isr1
.global isr2
.global isr3
.global isr4
.global isr5
.global isr6
.global isr7
.global isr8
.global isr9
.global isr10
.global isr11
.global isr12
.global isr13
.global isr14
.global isr15
.global isr16
.global isr17
.global isr18
.global isr19
.global isr20
.global isr21
.global isr22
.global isr23
.global isr24
.global isr25
.global isr26
.global isr27
.global isr28
.global isr29
.global isr30
.global isr31
.global isr32

# ISR 0: Divide By Zero Exception
isr0:
        cli
        push $0
        push $0
        jmp isr_common_stub

# ISR 1: Debug Exception
isr1:
        cli
        push $0
        push $1
        jmp isr_common_stub

# ISR 2: Non Maskable Interrupt Exception
isr2:
        cli
        push $0
        push $2
        jmp isr_common_stub

# ISR 3: Breakpoint Exception
isr3:
        cli
        push $0
        push $3
        jmp isr_common_stub

# ISR 4: Into Detected Overflow Exception
isr4:
        cli
        push $0
        push $4
        jmp isr_common_stub

# ISR 5: Out of Bounds Exception
isr5:
        cli
        push $0
        push $5
        jmp isr_common_stub

# ISR 6: Invalid Opcode Exception
isr6:
        cli
        push $0
        push $6
        jmp isr_common_stub

# ISR 7: No Coprocessor Exception
isr7:
        cli
        push $0
        push $7
        jmp isr_common_stub

# ISR 8: Double Fault Exception
isr8:
        cli
        push $8
        jmp isr_common_stub

# ISR 9: Coprocessor Segment Overrun Exception
isr9:
        cli
        push $0
        push $9
        jmp isr_common_stub

# ISR 10: Bad TSS Exception
isr10:
        cli
        push $10
        jmp isr_common_stub

# ISR 11: Segment Not Present Exception
isr11:
        cli
        push $11
        jmp isr_common_stub

# ISR 12: Stack Fault Exception
isr12:
        cli
        push $12
        jmp isr_common_stub

# ISR 13: General Protection Fault Exception
isr13:
        cli
        push $13
        jmp isr_common_stub

# ISR 14: Page Fault Exception
isr14:
        cli
        push $14
        jmp isr_common_stub

# ISR 15: Unknown Interrupt Exception
isr15:
        cli
        push $0
        push $15
        jmp isr_common_stub

# ISR 16: Coprocessor Fault Exception
isr16:
        cli
        push $0
        push $16
        jmp isr_common_stub

# ISR 17: Alignment Check Exception
isr17:
        cli
        push $0
        push $17
        jmp isr_common_stub

# ISR 18: Machine Check Exception
isr18:
        cli
        push $0
        push $18
        jmp isr_common_stub

# ISR 19: Reserved Exception
isr19:
        cli
        push $0
        push $19
        jmp isr_common_stub

# ISR 20: Reserved Exception
isr20:
        cli
        push $0
        push $20
        jmp isr_common_stub

# ISR 21: Reserved Exception
isr21:
        cli
        push $0
        push $21
        jmp isr_common_stub

# ISR 22: Reserved Exception
isr22:
        cli
        push $0
        push $22
        jmp isr_common_stub

# ISR 23: Reserved Exception
isr23:
        cli
        push $0
        push $23
        jmp isr_common_stub

# ISR 24: Reserved Exception
isr24:
        cli
        push $0
        push $24
        jmp isr_common_stub

# ISR 25: Reserved Exception
isr25:
        cli
        push $0
        push $25
        jmp isr_common_stub

# ISR 26: Reserved Exception
isr26:
        cli
        push $0
        push $26
        jmp isr_common_stub

# ISR 27: Reserved Exception
isr27:
        cli
        push $0
        push $27
        jmp isr_common_stub

# ISR 28: Reserved Exception
isr28:
        cli
        push $0
        push $28
        jmp isr_common_stub

# ISR 29: Reserved Exception
isr29:
        cli
        push $0
        push $29
        jmp isr_common_stub

# ISR 30: Reserved Exception
isr30:
        cli
        push $0
        push $30
        jmp isr_common_stub

# ISR 31: Reserved Exception
isr31:
        cli
        push $0
        push $31
        jmp isr_common_stub

.extern exception_handler

isr_common_stub:
        pusha
        push %ds
        push %es
        push %fs
        push %gs

        # Kernel Data Segment Descriptor
        mov $0x10, %ax
        mov %ax, %ds
        mov %ax, %es
        mov %ax, %fs
        mov %ax, %gs

        push %esp
        call exception_handler

        pop %eax
        pop %gs
        pop %fs
        pop %es
        pop %ds
        popa

        # Clean up the stack
        add $8, %esp
        iret
