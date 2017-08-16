#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <kernel/hal.h>
#include <kernel/tty.h>

#define KERNEL_TICK_FREQ 100

void kernel_tick()
{

}

void kernel_main()
{
	terminal_initialize();
	hal_initialise();

	timer_set_frequency(KERNEL_TICK_FREQ);
	timer_install(kernel_tick);

	printf("Welcome to Caros!");
}
