#ifndef _KERNEL_KBD_H
#define _KERNEL_KBD_H

#include <stdint.h>

void kbd_key_pressed(uint8_t scancode);
void kbd_key_released(uint8_t scancode);

#endif
