#include <arch/i386/gdt.h>
#include <arch/i386/idt.h>
#include <arch/i386/isrs.h>
#include <arch/i386/irqs.h>
#include <arch/i386/kbd.h>
#include <arch/i386/paging.h>

void hal_initialise()
{
    gdt_install();

    idt_install();
    isrs_install();

    irqs_install();
    enable_irqs();

    paging_init();
}
