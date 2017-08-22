	.file	"figura1-modificado_a.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%edi, %edi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-64(%rbp), %rsi
	subq	$56, %rsp
	.cfi_offset 3, -24
	subq	$160016, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	call	clock_gettime
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%r8d, %edi
	movl	$s, %eax
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %esi
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %ecx
	cmpq	$s+40000, %rax
	jne	.L3
	cmpl	%esi, %ecx
	cmovg	%esi, %ecx
	movl	%ecx, (%rbx,%r8,4)
	addq	$1, %r8
	cmpq	$40000, %r8
	jne	.L2
	leaq	-48(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	-48(%rbp), %rax
	subq	-64(%rbp), %rax
	movl	$.LC1, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm1
	movq	-40(%rbp), %rax
	subq	-56(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L11
	movq	-8(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.comm	s,40000,64
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4"
	.section	.note.GNU-stack,"",@progbits
