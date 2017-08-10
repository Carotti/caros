#include <stdio.h>
#include <stdint.h>

#include <kernel/tty.h>
#include <kernel/hal.h>

#include <string.h>

// Call the architecture specific code for initialisation
extern void init_arch();

void kernel_main(void)
{
	terminal_initialize();
	hal_initialise();
	printf("Welcome to Caros!");
}
