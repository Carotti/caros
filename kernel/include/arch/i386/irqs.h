#ifndef _ARCH_I386_IRQS_H
#define _ARCH_I386_IRQS_H

#define IRQS_SIZE 16

#include <arch/i386/regs.h>

void irqs_install();

void irqs_install_handler(int irq, void (*handler)(struct isr_regs *sp));
void irqs_uninstall_handler(int irq);

extern void enable_irqs();

#endif
