.file	"tmp.c"
.text
.globl	inportb
.type	inportb, @function
inportb:
.LFB0:
.cfi_startproc
pushl	%ebp
.cfi_def_cfa_offset 8
.cfi_offset 5, -8
movl	%esp, %ebp
.cfi_def_cfa_register 5
subl	$20, %esp
movl	8(%ebp), %eax
movw	%ax, -20(%ebp)
movzwl	-20(%ebp), %eax
movl	%eax, %edx
#APP
# 4 "tmp.c" 1
inb %dx, %al
# 0 "" 2
#NO_APP
movb	%al, -1(%ebp)
movzbl	-1(%ebp), %eax
leave
.cfi_restore 5
.cfi_def_cfa 4, 4
ret
.cfi_endproc
.LFE0:
.size	inportb, .-inportb
.globl	outportb
.type	outportb, @function
outportb:
.LFB1:
.cfi_startproc
pushl	%ebp
.cfi_def_cfa_offset 8
.cfi_offset 5, -8
movl	%esp, %ebp
.cfi_def_cfa_register 5
subl	$8, %esp
movl	8(%ebp), %edx
movl	12(%ebp), %eax
movw	%dx, -4(%ebp)
movb	%al, -8(%ebp)
movzwl	-4(%ebp), %edx
movzbl	-8(%ebp), %eax
#APP
# 10 "tmp.c" 1
outb %al, %dx
# 0 "" 2
#NO_APP
nop
leave
.cfi_restore 5
.cfi_def_cfa 4, 4
ret
.cfi_endproc
.LFE1:
.size	outportb, .-outportb
.ident	"GCC: (GNU) 7.1.1 20170528"
.section	.note.GNU-stack,"",@progbits
