#ifndef _ARCH_I386_REGS_H
#define _ARCH_I386_REGS_H

#include <stdint.h>

// Layout of the stack after an ISR
struct isr_regs
{
    uint32_t gs, fs, es, ds;
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax;
    uint32_t int_no, err_code;
    uint32_t eip, cs, eflags, useresp, ss;
} __attribute__((packed));

#endif
