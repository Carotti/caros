#include <stdio.h>

#include <arch/i386/timer.h>
#include <arch/i386/irqs.h>
#include <arch/i386/regs.h>
#include <arch/i386/port.h>

int timer_ticks = 0;

void timer_set_frequency(int freq)
{
    int divisor = PIT_FREQUENCY / freq;
    outportb(PIT_COMMAND_REG, PIT_COUNTER_0 | PIT_RW_LSB_MSB | PIT_MODE_3 | PIT_16_BIT);
    outportb(PIT_DATA_REG_0, divisor & 0xff);
    outportb(PIT_DATA_REG_0, divisor >> 8);
}

void timer_handler(struct isr_regs* r)
{
    timer_ticks++;
    if (timer_ticks % 100 == 0) {
        printf("One second has passed! ");
    }
}
void timer_install()
{
    timer_set_frequency(100);
    irqs_install_handler(0, timer_handler);
}
