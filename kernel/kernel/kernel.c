#include <stdio.h>
#include <stdint.h>

#include <kernel/tty.h>

// Call the architecture specific code for initialisation
extern void init_arch();

void kernel_main(void)
{
	terminal_initialize();
	init_arch();
	printf("Welcome to Caros!");
}

// CPU had a panic, give some sort of error message
void kernel_cpu_panic()
{
	register int i asm("eax");
	printf("Kernel panic! Err: %d", i);
}
