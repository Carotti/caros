#include <arch/i386/timer.h>
#include <arch/i386/irqs.h>
#include <arch/i386/port.h>

#include <stdio.h>

#define PIT_FREQUENCY 1193180

#define PIT_DATA_REG_0 0x40
#define PIT_DATA_REG_1 0x41
#define PIT_DATA_REG_2 0x42
#define PIT_COMMAND_REG 0x43

#define PIT_COUNTER_0 0x0
#define PIT_COUNTER_1 0x40
#define PIT_COUNTER_2 0x80

#define PIT_RW_LSB 0x10
#define PIT_RW_MSB 0x20
#define PIT_RW_LSB_MSB 0x30

#define PIT_MODE_0 0x0 // Interrupt on terminal count
#define PIT_MODE_1 0x2 // Hardware retriggerable one shot
#define PIT_MODE_2 0x4 // Rate generator
#define PIT_MODE_3 0x6 // Square wave mode
#define PIT_MODE_4 0x8 // Software strobe
#define PIT_MODE_6 0xa // Hardware strobe

#define PIT_16_BIT 0x0
#define PIT_BCD 0x1

void (*timer_tick)() = 0;


void timer_handler(struct isr_regs* sp)
{
    (void)sp;
    if (timer_tick) timer_tick();
}

void timer_install(void (*handler)())
{
    timer_tick = handler;
    irqs_install_handler(0, timer_handler);
}

void timer_set_frequency(int hz)
{
    int divisor = PIT_FREQUENCY / hz;
    outportb(PIT_COMMAND_REG, 0x36);
    outportb(PIT_COUNTER_1, divisor & 0xFF);
    outportb(PIT_COUNTER_1, divisor >> 8);
}
