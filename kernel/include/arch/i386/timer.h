#ifndef _ARCH_I386_TIMER_H
#define _ARCH_I386_TIMER_H

void timer_set_frequency(int hz);
void timer_install(void (*handler)());
void timer_set_frequency(int hz);

#endif
