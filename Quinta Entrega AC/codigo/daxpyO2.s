	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Tama\303\261o: %f"
.LC4:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%edi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%r13d, %r13d
	movl	$274877907, %ebp
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	call	time
	movl	%eax, %edi
	call	srand
	movl	$800000000, %edi
	call	malloc
	movl	$800000000, %edi
	movq	%rax, %rbx
	call	malloc
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%ebp
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$6, %edx
	subl	%eax, %edx
	imull	$1000, %edx, %edx
	subl	%edx, %ecx
	cvtsi2sd	%ecx, %xmm0
	movsd	%xmm0, (%rbx,%r13,8)
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%ebp
	movl	%ecx, %eax
	sarl	$31, %eax
	movsd	.LC0(%rip), %xmm2
	sarl	$6, %edx
	subl	%eax, %edx
	leal	1(%r13), %eax
	imull	$1000, %edx, %edx
	subl	%edx, %ecx
	cvtsi2sd	%ecx, %xmm0
	movsd	%xmm0, (%r12,%r13,8)
	pxor	%xmm0, %xmm0
	addq	$1, %r13
	cvtsi2sd	%eax, %xmm0
	ucomisd	%xmm0, %xmm2
	ja	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movsd	.LC1(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	(%rbx,%rax,8), %xmm0
	leal	1(%rax), %edx
	movsd	.LC0(%rip), %xmm3
	mulsd	%xmm1, %xmm0
	addsd	(%r12,%rax,8), %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	pxor	%xmm0, %xmm0
	addq	$1, %rax
	cvtsi2sd	%edx, %xmm0
	ucomisd	%xmm0, %xmm3
	ja	.L4
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$.LC3, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm1, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm1
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	movapd	%xmm1, %xmm0
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1100470148
	.align 8
.LC1:
	.long	0
	.long	1076101120
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4"
	.section	.note.GNU-stack,"",@progbits
