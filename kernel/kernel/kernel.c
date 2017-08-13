#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <kernel/tty.h>
#include <kernel/hal.h>

#include <arch/i386/port.h>

#include <string.h>
void kernel_main()
{
	terminal_initialize();
	hal_initialise();
	printf("Welcome to Caros!");
}
