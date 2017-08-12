#ifndef _ARCH_I386_IDT_H
#define _ARCH_I386_IDT_H

#include <stdint.h>

#define IDT_SIZE 256

#define IRQ_OFFSET 32
#define IRQ_OFFSET_SLAVE 40

struct idt_entry
{
    uint16_t base_low;
    uint16_t sel;
    uint8_t always0;
    uint8_t flags;
    uint16_t base_high;
} __attribute__((packed));

struct idt_ptr
{
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));

struct idt_entry idt[IDT_SIZE];
struct idt_ptr idtp;

extern void idt_load();

void idt_set_gate(uint8_t i, uint32_t base, uint16_t sel, uint8_t flags);
void idt_install();

#endif
