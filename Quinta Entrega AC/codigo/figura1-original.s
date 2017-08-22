	.file	"figura1-original.c"
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movl	$s+40000, %r12d
	movl	$s, %r14d
	movl	$1759218605, %r13d
	subq	$48, %rsp
	subq	$160016, %rsp
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	call	time
	movl	%eax, %edi
	call	srand
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	movl	%eax, %ecx
	addq	$8, %r14
	imull	%r13d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$11, %edx
	subl	%eax, %edx
	imull	$5000, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, -8(%r14)
	call	rand
	movl	%eax, %ecx
	imull	%r13d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$11, %edx
	subl	%eax, %edx
	imull	$5000, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, -4(%r14)
	cmpq	$s+40000, %r14
	jne	.L2
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r8d, %edi
	movl	$s, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %esi
	cmpq	%rax, %r12
	jne	.L4
	movl	$s+4, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %ecx
	cmpq	$s+40004, %rax
	jne	.L5
	cmpl	%esi, %ecx
	cmovg	%esi, %ecx
	movl	%ecx, (%rbx,%r8,4)
	addq	$1, %r8
	cmpq	$40000, %r8
	jne	.L3
	leaq	-64(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	-64(%rbp), %rax
	subq	-80(%rbp), %rax
	movl	$.LC1, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm1
	movq	-56(%rbp), %rax
	subq	-72(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movq	-40(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L15
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L15:
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
