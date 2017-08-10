#include <stdio.h>
#include <stdint.h>

#include <kernel/tty.h>

// Call the architecture specific code for initialisation
extern void init_arch();

void kernel_main(void)
{
	terminal_initialize();
	printf("Welcome to Caros!");
}
