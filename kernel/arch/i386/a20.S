# Code for testing and enabling the A20 address line

.func check_a20
check_a20:
        pushf
        push %es
        push %di
        push %si
        push %ds

        cli

        # es:di = 0000:0500
        xor %ax, %ax
        mov %ax, %es
        mov $0x0500, %di

        # ds:si = ffff:0500
        mov 0xffff, %ax
        mov %ax, %ds
        mov $0x0500, %si

        # Save es:di on stack
        movb %es:(%di), %al
        push %ax

        # Save ds:si on stack
        movb %ds:(%si), %al
        push %ax

        # es:di = 0x00
        movb $0x00, %es:(%di)

        # ds:di = 0xff
        movb $0xff, %ds:(%di)

        # Does memory wraparound?
        cmpb $0xff, %es:(%di)

        # Restore ds:si
        pop %ax
        movb %al, %ds:(%si)

        # Restore es:di
        pop %ax
        movb %al, %es:(%di)

        mov $0, %ax

        je check_a20__exit

        mov $1, %ax

    check_a20__exit:

        pop %ds
        pop %si
        pop %di
        pop %es
        popf

        ret
.endfunc

# Attempt to enable A20 through bios
.macro m_set_a20_bios
        mov $0x2401, %ax
        int $0x15
.endm

# Returns when the keyboard controller is ready to send data
.func wait_8042_data
wait_8042_data:
        # Read in from port 0x64
        in $0x64, %al

        # Return if input from port was 1, else loop
        test $1, %al
        jz wait_8042_data
        ret
.endfunc

# Returns when the keyboard controller is ready to receive a command
.func wait_8042_command
wait_8042_command:
        # Read in from port 0x64

        # Return if input from port was 2, else loop
        test $2, %al
        jz wait_8042_command
        ret
.endfunc

# Attempt to enable A20 through 8042 keyboard controller
.macro m_set_a20_keyboard
        cli

        call wait_8042_command

        # Disable keyboard
        mov $0xAD, %al
        out %al, $0x64

        call wait_8042_command

        # Send read from input command
        mov $0xd0, %al
        out %al, $0x64

        call wait_8042_data

        # Read input from keyboard
        in $0x60, %al
        push %eax

        call wait_8042_command

        # Write to output
        mov $0xd1, %al
        out %al, $0x64

        call wait_8042_command

        # Write input back with bit 2 set
        pop %eax
        or $2, %al
        out %al, $0x64

        call wait_8042_command

        # Re-enable keyboard
        mov $0xae, %al
        out %al, $0x64

        call wait_8042_command

        # Enable interrupts
        sti

.endm

.macro m_set_a20_fastgate
        in $0x92, %al
        or $2, %al
        out %al, $0x92
.endm


.global enable_a20
.func enable_a20
enable_a20:
        # Check if A20 is already enabled
        call check_a20

        ret

        cmp $0, %ax
        jne enable_a20__exit

        # Attempt to enable A20 using BIOS
        m_set_a20_bios
        call check_a20
        cmp $0, %ax
        jne enable_a20__exit

        # Attempt to enable A20 using keyboard driver
        m_set_a20_keyboard
        call check_a20
        cmp $0, %ax
        jne enable_a20__exit

        # Attempt to enable A20 using fastgate
        m_set_a20_fastgate
        call check_a20
        cmp $0, %ax
        jne enable_a20__exit

        # TODO: Handle not having a A20 line (bad bad bad bad)

        enable_a20__exit:
        ret
.endfunc
