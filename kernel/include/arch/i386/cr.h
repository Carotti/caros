#ifndef _ARCH_I386_CR_H
#define _ARCH_I386_CR_H

extern int read_cr0();
extern void write_cr0(int val);

extern int read_cr3();
extern void write_cr3(int val);

#endif
