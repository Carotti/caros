#include <stdio.h>
#include <stdint.h>

#include <kernel/tty.h>
#include <kernel/hal.h>

#include <string.h>

void kernel_main()
{
	terminal_initialize();
	hal_initialise();
	printf("Welcome to Caros!");
	__asm("int $0");
}
