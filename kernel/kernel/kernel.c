#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#include <kernel/hal.h>
#include <kernel/tty.h>
#include <kernel/kbd.h>

extern uint32_t kernel_start;
extern uint32_t kernel_end;

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

	keyboard_install(kbd_key_pressed, kbd_key_released);

	printf("Welcome to Caros!\n");

	char num_buf[33];

	printf("Kernel starts at: ");
	memset(num_buf, 0, 33);
	itoa(&kernel_start, num_buf, 16);
	printf(num_buf);
	printf("\n");
}
