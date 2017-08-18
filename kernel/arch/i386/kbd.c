#include <stdint.h>
#include <stdio.h>

#include <arch/i386/regs.h>
#include <arch/i386/irqs.h>
#include <arch/i386/port.h>

#define KBD_DATA_BUF 0x60

#define KBD_KEY_RELEASED_MASK 0x80

#define KBD_IRQ_INDEX 1

void (*key_pressed)(uint8_t scancode) = 0;
void (*key_released)(uint8_t scancode) = 0;

void keyboard_handler(struct isr_regs* sp)
{
    (void)sp;

    uint8_t scancode;

    scancode = inportb(KBD_DATA_BUF);

    if (scancode & KBD_KEY_RELEASED_MASK) {
        //if (key_released) key_released(scancode);
    } else {
        if (key_pressed) key_pressed(scancode);
    }
}

void keyboard_install(void (*handler_press)(uint8_t scancode), void (*handler_release)(uint8_t scancode))
{
    key_pressed = handler_press;
    key_released = handler_release;
    irqs_install_handler(KBD_IRQ_INDEX, keyboard_handler);
}
