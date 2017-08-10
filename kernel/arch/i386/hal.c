#include <arch/i386/gdt.h>

void hal_init()
{
    gdt_install();
}
