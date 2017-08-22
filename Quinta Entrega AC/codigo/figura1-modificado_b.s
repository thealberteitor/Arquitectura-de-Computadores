	.file	"figura1-modificado_b.c"
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
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r11d, %r10d
	movl	$s, %eax
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %ecx
	addq	$80, %rax
	leal	(%r10,%rcx,2), %r13d
	movl	-76(%rax), %ecx
	addl	%esi, %r13d
	leal	(%rcx,%rcx,2), %esi
	movl	-72(%rax), %ecx
	subl	%r10d, %esi
	addl	%esi, %edx
	leal	(%r10,%rcx,2), %esi
	movl	-68(%rax), %ecx
	addl	%esi, %r13d
	leal	(%rcx,%rcx,2), %ecx
	subl	%r10d, %ecx
	leal	(%rcx,%rdx), %esi
	movl	-64(%rax), %edx
	leal	(%r10,%rdx,2), %edx
	addl	%edx, %r13d
	movl	-60(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%r10d, %edx
	leal	(%rdx,%rsi), %ecx
	movl	-56(%rax), %edx
	leal	(%r10,%rdx,2), %r9d
	movl	-52(%rax), %edx
	addl	%r9d, %r13d
	leal	(%rdx,%rdx,2), %r9d
	subl	%r10d, %r9d
	leal	(%r9,%rcx), %edx
	movl	-48(%rax), %ecx
	leal	(%r10,%rcx,2), %r9d
	movl	-44(%rax), %ecx
	addl	%r9d, %r13d
	leal	(%rcx,%rcx,2), %r8d
	subl	%r10d, %r8d
	leal	(%r8,%rdx), %r9d
	movl	-40(%rax), %edx
	leal	(%r10,%rdx,2), %r8d
	movl	-36(%rax), %edx
	addl	%r8d, %r13d
	leal	(%rdx,%rdx,2), %edi
	movl	-32(%rax), %edx
	subl	%r10d, %edi
	leal	(%rdi,%r9), %r8d
	leal	(%r10,%rdx,2), %r9d
	movl	-28(%rax), %edx
	addl	%r13d, %r9d
	leal	(%rdx,%rdx,2), %esi
	movl	-24(%rax), %edx
	subl	%r10d, %esi
	leal	(%rsi,%r8), %edi
	leal	(%r10,%rdx,2), %r8d
	movl	-20(%rax), %edx
	addl	%r9d, %r8d
	leal	(%rdx,%rdx,2), %ecx
	movl	-16(%rax), %edx
	subl	%r10d, %ecx
	leal	(%rcx,%rdi), %esi
	leal	(%r10,%rdx,2), %edi
	movl	-12(%rax), %edx
	addl	%r8d, %edi
	leal	(%rdx,%rdx,2), %edx
	subl	%r10d, %edx
	leal	(%rdx,%rsi), %ecx
	movl	-8(%rax), %edx
	leal	(%r10,%rdx,2), %edx
	leal	(%rdx,%rdi), %esi
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%r10d, %edx
	addl	%ecx, %edx
	cmpq	%rax, %r12
	jne	.L4
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	movl	%edx, (%rbx,%r11,4)
	addq	$1, %r11
	cmpq	$40000, %r11
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
	jne	.L13
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L13:
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
