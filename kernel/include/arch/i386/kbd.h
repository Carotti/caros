#ifndef _ARCH_I386_KBD_H
#define _ARCH_I386_KBD_H

void keyboard_install(void (*handler_press)(uint8_t scancode), void (*handler_release)(uint8_t scancode));

#endif
