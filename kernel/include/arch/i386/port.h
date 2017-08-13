#ifndef _ARCH_I386_PORT_H
#define _ARCH_I386_PORT_H

#include <stdint.h>

extern uint8_t inportb(uint16_t port);
extern void outportb(uint16_t port, uint8_t data);

#endif
