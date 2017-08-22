	.file	"daxpy.c"
	.section	.rodata
.LC5:
	.string	"Tama\303\261o: %f"
.LC6:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$112, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movabsq	$4726483295884279808, %rax
	movq	%rax, -88(%rbp)
	movabsq	$4621819117588971520, %rax
	movq	%rax, -80(%rbp)
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movsd	-88(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	ucomisd	.LC3(%rip), %xmm0
	jnb	.L2
	cvttsd2siq	%xmm0, %rax
	jmp	.L3
.L2:
	movsd	.LC3(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L3:
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movsd	-88(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	ucomisd	.LC3(%rip), %xmm0
	jnb	.L4
	cvttsd2siq	%xmm0, %rax
	jmp	.L5
.L4:
	movsd	.LC3(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L5:
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$0, %ebx
	jmp	.L6
.L7:
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %r12
	call	rand
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$1000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	pxor	%xmm3, %xmm3
	cvtsi2sd	%eax, %xmm3
	movq	%xmm3, %rax
	movq	%rax, (%r12)
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	leaq	(%rdx,%rax), %r12
	call	rand
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$1000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	pxor	%xmm4, %xmm4
	cvtsi2sd	%eax, %xmm4
	movq	%xmm4, %rax
	movq	%rax, (%r12)
	addl	$1, %ebx
.L6:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ebx, %xmm0
	movsd	-88(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L7
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, %ebx
	jmp	.L8
.L9:
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rax), %xmm1
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rax), %xmm0
	mulsd	-80(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, (%rdx)
	addl	$1, %ebx
.L8:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ebx, %xmm0
	movsd	-88(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L9
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -56(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movq	-56(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	addq	$112, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1075838976
	.align 8
.LC3:
	.long	0
	.long	1138753536
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4"
	.section	.note.GNU-stack,"",@progbits
