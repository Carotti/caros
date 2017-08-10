#include <arch/i386/gdt.h>
#include <arch/i386/idt.h>

void hal_initialise()
{
    gdt_install();
    idt_install();
}
