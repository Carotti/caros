#include <stdint.h>

#include <stdio.h>
#include <stdlib.h>

#include <arch/i386/cr.h>
#include <arch/i386/paging.h>

typedef uint32_t page_table[1024];

extern uint32_t paging_memory;

uint32_t* page_directory;
page_table* page_tables;

uint32_t paging_entry(uint32_t addr, uint32_t flags)
{
    return (addr & 0xfffff000) | (flags & 0xfff);
}

void page_tables_init()
{
    uint32_t flags = PAGE_SUPERVISOR_LEVEL | PAGE_READ_WRITE | PAGE_PRESENT;

    for (int i = 0; i < 1024; i++) {
        for (int j = 0; j < 1024; j++) {
            page_tables[i][j] = paging_entry(1024 * i + 4096 * j, flags);
        }
    }
}

void page_directory_init()
{
    uint32_t flags = PAGE_SUPERVISOR_LEVEL | PAGE_READ_WRITE | PAGE_PRESENT;

    for (int i = 0; i < 1024; i++) {
        page_directory[i] = paging_entry((uint32_t)&page_tables[i], flags);
    }
}

void paging_init()
{
    page_directory = &paging_memory;
    page_tables = (page_table*)(page_directory + 1024);

    page_tables_init();
    page_directory_init();

    write_cr3((uint32_t)page_directory); // Set page directory address
    write_cr0(read_cr0() | 0x80000000); // Enable paging
}
