#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <kernel/tty.h>
#include <kernel/hal.h>

void kernel_main()
{
	terminal_initialize();
	hal_initialise();
	printf("Welcome to Caros!");
}
