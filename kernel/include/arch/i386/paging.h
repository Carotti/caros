#ifndef _ARCH_I386_PAGING_H
#define _ARCH_I386_PAGING_H

#define PAGE_DIRTY 0x40
#define PAGE_ACCESSED 0x20

#define PAGE_USER_LEVEL 0x4
#define PAGE_SUPERVISOR_LEVEL 0x0

#define PAGE_READ_WRITE 0x2
#define PAGE_READ_ONLY 0x0

#define PAGE_PRESENT 0x1
#define PAGE_NOT_PRESENT 0x0

uint32_t paging_entry(uint32_t addr, uint32_t flags);

void paging_init();

#endif
