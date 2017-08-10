#include <arch/i386/gdt.h>

void gdt_set_gate(int i, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran)
{
    gdt[i].base_low = (base & 0xffff);
    gdt[i].base_middle = (base >> 16) & 0xff;
    gdt[i].base_high = (base >> 24) & 0xff;

    gdt[i].limit_low = (limit & 0xffff);
    gdt[i].granularity = ((limit >> 16) & 0x0f);

    gdt[i].granularity |= (gran & 0xf0);
    gdt[i].access = access;
}

void gdt_install()
{
    gp.limit = (sizeof(struct gdt_entry) * 3) - 1;
    gp.base = (uint32_t)&gdt;

    // NULL descriptor
    gdt_set_gate(0, 0, 0, 0, 0);

    // Code descriptor
    gdt_set_gate(1, 0, 0xffffffff, 0x9A, 0xcf);

    // Data descriptor
    gdt_set_gate(2, 0, 0xffffffff, 0x92, 0xcf);

    gdt_flush();
}
