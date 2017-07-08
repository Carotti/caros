	.file	"kernel.cpp"
	.text
	.align 16
	.globl	_Z10make_color9vga_colorS_
	.type	_Z10make_color9vga_colorS_, @function
_Z10make_color9vga_colorS_:
.LFB0:
	.cfi_startproc
	movl	8(%esp), %eax
	sall	$4, %eax
	orb	4(%esp), %al
	ret
	.cfi_endproc
.LFE0:
	.size	_Z10make_color9vga_colorS_, .-_Z10make_color9vga_colorS_
	.align 16
	.globl	_Z13make_vgaentrych
	.type	_Z13make_vgaentrych, @function
_Z13make_vgaentrych:
.LFB1:
	.cfi_startproc
	movzbl	8(%esp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movsbw	4(%esp), %ax
	orl	%edx, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	_Z13make_vgaentrych, .-_Z13make_vgaentrych
	.align 16
	.globl	_Z6strlenPKc
	.type	_Z6strlenPKc, @function
_Z6strlenPKc:
.LFB2:
	.cfi_startproc
	movl	4(%esp), %edx
	xorl	%eax, %eax
	cmpb	$0, (%edx)
	je	.L7
	.align 16
.L6:
	addl	$1, %eax
	cmpb	$0, (%edx,%eax)
	jne	.L6
	rep ret
	.align 16
.L7:
	rep ret
	.cfi_endproc
.LFE2:
	.size	_Z6strlenPKc, .-_Z6strlenPKc
	.align 16
	.globl	_Z19terminal_initializev
	.type	_Z19terminal_initializev, @function
_Z19terminal_initializev:
.LFB3:
	.cfi_startproc
	movl	$0, terminal_row
	movl	$0, terminal_column
	movl	$753664, %eax
	movb	$7, terminal_color
	movl	$753664, terminal_buffer
	.align 16
.L11:
	leal	160(%eax), %edx
	.align 16
.L10:
	movl	$1824, %ecx
	addl	$2, %eax
	movw	%cx, -2(%eax)
	cmpl	%eax, %edx
	jne	.L10
	cmpl	$757504, %edx
	jne	.L11
	rep ret
	.cfi_endproc
.LFE3:
	.size	_Z19terminal_initializev, .-_Z19terminal_initializev
	.align 16
	.globl	_Z17terminal_setcolorh
	.type	_Z17terminal_setcolorh, @function
_Z17terminal_setcolorh:
.LFB4:
	.cfi_startproc
	movl	4(%esp), %eax
	movb	%al, terminal_color
	ret
	.cfi_endproc
.LFE4:
	.size	_Z17terminal_setcolorh, .-_Z17terminal_setcolorh
	.align 16
	.globl	_Z19terminal_putentryatchmm
	.type	_Z19terminal_putentryatchmm, @function
_Z19terminal_putentryatchmm:
.LFB5:
	.cfi_startproc
	movzbl	8(%esp), %edx
	movl	16(%esp), %eax
	leal	(%eax,%eax,4), %eax
	movl	%edx, %ecx
	movsbw	4(%esp), %dx
	sall	$8, %ecx
	sall	$4, %eax
	addl	12(%esp), %eax
	orl	%ecx, %edx
	movl	terminal_buffer, %ecx
	movw	%dx, (%ecx,%eax,2)
	ret
	.cfi_endproc
.LFE5:
	.size	_Z19terminal_putentryatchmm, .-_Z19terminal_putentryatchmm
	.align 16
	.globl	_Z16terminal_putcharc
	.type	_Z16terminal_putcharc, @function
_Z16terminal_putcharc:
.LFB6:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movzbl	terminal_color, %ebx
	movl	terminal_row, %ecx
	movl	terminal_column, %edx
	leal	(%ecx,%ecx,4), %eax
	movl	%ebx, %esi
	movsbw	12(%esp), %bx
	sall	$8, %esi
	sall	$4, %eax
	addl	%edx, %eax
	addl	$1, %edx
	orl	%esi, %ebx
	movl	terminal_buffer, %esi
	cmpl	$80, %edx
	movw	%bx, (%esi,%eax,2)
	je	.L17
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	movl	%edx, terminal_column
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L17:
	.cfi_restore_state
	addl	$1, %ecx
	movl	$0, %eax
	movl	$0, terminal_column
	cmpl	$24, %ecx
	cmove	%eax, %ecx
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	movl	%ecx, terminal_row
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z16terminal_putcharc, .-_Z16terminal_putcharc
	.align 16
	.globl	_Z20terminal_writestringPKc
	.type	_Z20terminal_writestringPKc, @function
_Z20terminal_writestringPKc:
.LFB7:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %ecx
	movsbl	(%ecx), %eax
	testb	%al, %al
	je	.L22
	xorl	%edx, %edx
	.align 16
.L24:
	addl	$1, %edx
	cmpb	$0, (%ecx,%edx)
	jne	.L24
	leal	1(%ecx), %ebx
	leal	(%ecx,%edx), %esi
	jmp	.L25
	.align 16
.L31:
	movsbl	(%ebx), %eax
	addl	$1, %ebx
.L25:
	pushl	%eax
	.cfi_def_cfa_offset 16
	call	_Z16terminal_putcharc
	cmpl	%ebx, %esi
	popl	%eax
	.cfi_def_cfa_offset 12
	jne	.L31
.L22:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE7:
	.size	_Z20terminal_writestringPKc, .-_Z20terminal_writestringPKc
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"wellcome to my first operating system!"
	.text
	.align 16
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB8:
	.cfi_startproc
	movl	$0, terminal_row
	movl	$0, terminal_column
	movl	$753664, %eax
	movb	$7, terminal_color
	movl	$753664, terminal_buffer
	.align 16
.L34:
	leal	160(%eax), %edx
	.align 16
.L33:
	movl	$1824, %ecx
	addl	$2, %eax
	movw	%cx, -2(%eax)
	cmpl	%eax, %edx
	jne	.L33
	cmpl	$757504, %edx
	jne	.L34
	pushl	$.LC0
	.cfi_def_cfa_offset 8
	call	_Z20terminal_writestringPKc
	popl	%eax
	.cfi_def_cfa_offset 4
.L35:
	jmp	.L35
	.cfi_endproc
.LFE8:
	.size	kernel_main, .-kernel_main
	.globl	terminal_buffer
	.section	.bss
	.align 4
	.type	terminal_buffer, @object
	.size	terminal_buffer, 4
terminal_buffer:
	.zero	4
	.globl	terminal_color
	.type	terminal_color, @object
	.size	terminal_color, 1
terminal_color:
	.zero	1
	.globl	terminal_column
	.align 4
	.type	terminal_column, @object
	.size	terminal_column, 4
terminal_column:
	.zero	4
	.globl	terminal_row
	.align 4
	.type	terminal_row, @object
	.size	terminal_row, 4
terminal_row:
	.zero	4
	.ident	"GCC: (GNU) 7.1.0"
