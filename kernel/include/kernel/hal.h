#ifndef _KERNEL_HAL_H
#define _KERNEL_HAL_H

void hal_initialise();

// Timer functions
extern void timer_set_frequency(int hz);
extern void timer_install(void (*handler)());
extern void timer_set_frequency(int hz);

// Keyboard functions
void keyboard_install(void (*handler_press)(uint8_t scancode), void (*handler_release)(uint8_t scancode));

#endif
