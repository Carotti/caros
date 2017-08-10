#include <string.h>

#include <arch/i386/idt.h>

void idt_set_gate(uint8_t i, uint32_t base, uint16_t sel, uint8_t flags)
{
    idt[i].base_low = (base & 0xffff);
    idt[i].base_high = ((base >> 16) & 0xffff);

    idt[i].sel = sel;
    idt[i].flags = flags;

    idt[i].always0 = 0; // duh
}

void idt_install()
{
    idtp.limit = (sizeof(struct idt_entry) * IDT_SIZE) - 1;
    idtp.base = (uint32_t)&idt;

    // Zero out the IDT
    memset(&idt, 0, sizeof(struct idt_entry) * IDT_SIZE);

    //idt_set_gate();

    idt_load();
}
