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
/APP
/  4 "tmp.c" 1
inb %dx, %al
/  0 "" 2
/NO_APP
movb	%al, -1(%ebp)
movzbl	-1(%ebp), %eax
leave
.cfi_restore 5
.cfi_def_cfa 4, 4
ret
.cfi_endproc

.global outportb
outportb:
        mov 4(%esp), %dx
        mov 8(%esp), %al
        out %al, %dx
        ret
