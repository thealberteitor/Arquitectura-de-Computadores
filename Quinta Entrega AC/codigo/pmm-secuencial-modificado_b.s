	.file	"pmm-secuencialModificadoB.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Introduzca tama\303\261o de la matriz"
	.align 8
.LC1:
	.string	"Num debe ser divisible entre 10\n"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%f\t / Tama\303\261o:%u\t/ \n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	cmpl	$1, %edi
	jle	.L29
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$1717986919, %edx
	movq	%rax, %rcx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%ecx, %eax
	jne	.L30
	cmpl	$3000, %ecx
	movl	$3000, %eax
	cmovle	%ecx, %eax
	movslq	%eax, %rbp
	movl	%eax, %r15d
	movl	%eax, 4(%rsp)
	leaq	0(,%rbp,8), %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r12
	movq	%rax, matrizA(%rip)
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, matrizB(%rip)
	call	malloc
	testl	%r15d, %r15d
	movq	%rax, matrizC(%rip)
	jle	.L4
	leal	-1(%r15), %r14d
	salq	$2, %rbp
	xorl	%ebx, %ebx
	leaq	0(,%r14,8), %r13
	jmp	.L6
.L31:
	movq	matrizA(%rip), %r12
	addq	$8, %rbx
.L6:
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, (%r12,%rbx)
	movq	%rbx, %r12
	addq	matrizB(%rip), %r12
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, (%r12)
	movq	%rbx, %r12
	addq	matrizC(%rip), %r12
	call	malloc
	cmpq	%r13, %rbx
	movq	%rax, (%r12)
	jne	.L31
	xorl	%edi, %edi
	leaq	4(,%r14,4), %rbp
	xorl	%ebx, %ebx
	call	time
	movl	$274877907, %r13d
	movl	%eax, %edi
	call	srand
.L8:
	leaq	(%rbx,%rbx), %r12
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L7:
	call	rand
	movl	%eax, %ecx
	imull	%r13d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$6, %edx
	subl	%eax, %edx
	movq	matrizA(%rip), %rax
	imull	$1000, %edx, %edx
	movq	(%rax,%r12), %rax
	subl	%edx, %ecx
	movl	%ecx, (%rax,%r14)
	movq	matrizB(%rip), %rax
	movq	(%rax,%r14,2), %rax
	addq	$4, %r14
	cmpq	%r14, %rbp
	movl	%ecx, (%rax,%rbx)
	jne	.L7
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	jne	.L8
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	matrizA(%rip), %rax
	movq	$0, 32(%rsp)
	movq	%rax, 40(%rsp)
	movq	matrizB(%rip), %rax
	movq	%rax, 24(%rsp)
.L12:
	movq	40(%rsp), %rax
	movq	32(%rsp), %rbx
	movq	$0, 8(%rsp)
	movq	(%rax,%rbx,8), %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L15:
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	leaq	0(,%rax,4), %rcx
	movq	24(%rsp), %rax
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	%edi, (%rsp)
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rax), %rsi
	movl	(%rdx), %edi
	addl	$10, %r8d
	addq	$40, %rdx
	addq	$80, %rax
	imull	(%rsi,%rcx), %edi
	movq	-72(%rax), %rsi
	addl	%edi, (%rsp)
	movl	-36(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-64(%rax), %rsi
	addl	%edi, %r9d
	movl	-32(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-56(%rax), %rsi
	addl	%edi, %r10d
	movl	-28(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-48(%rax), %rsi
	addl	%edi, %r11d
	movl	-24(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-40(%rax), %rsi
	addl	%edi, %ebx
	movl	-20(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-32(%rax), %rsi
	addl	%edi, %ebp
	movl	-16(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-24(%rax), %rsi
	addl	%edi, %r12d
	movl	-12(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-16(%rax), %rsi
	addl	%edi, %r13d
	movl	-8(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	movq	-8(%rax), %rsi
	addl	%edi, %r14d
	movl	-4(%rdx), %edi
	imull	(%rsi,%rcx), %edi
	addl	%edi, %r15d
	cmpl	4(%rsp), %r8d
	jl	.L10
	movl	(%rsp), %edi
	movq	8(%rsp), %rax
	addl	%r9d, %edi
	addl	%edi, %r10d
	addl	%r10d, %r11d
	addl	%r11d, %ebx
	addl	%ebx, %ebp
	movq	16(%rsp), %rbx
	addl	%ebp, %r12d
	addl	%r12d, %r13d
	addl	%r13d, %r14d
	addl	%r14d, %r15d
	movl	%r15d, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, 4(%rsp)
	movq	%rax, 8(%rsp)
	jg	.L15
	addq	$1, 32(%rsp)
	movq	32(%rsp), %rax
	cmpl	%eax, 4(%rsp)
	jg	.L12
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	call	clock_gettime
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movl	$.LC3, %esi
	pxor	%xmm1, %xmm1
	movl	4(%rsp), %ebp
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movl	%ebp, %edx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
.L14:
	movq	matrizA(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	call	free
	movq	matrizB(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	call	free
	movq	matrizC(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, %ebp
	jg	.L14
.L16:
	movq	matrizA(%rip), %rdi
	call	free
	movq	matrizB(%rip), %rdi
	call	free
	movq	matrizC(%rip), %rdi
	call	free
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movl	$.LC3, %esi
	pxor	%xmm1, %xmm1
	movl	4(%rsp), %edx
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	jmp	.L16
.L30:
	movq	stderr(%rip), %rcx
	movl	$.LC1, %edi
	movl	$32, %edx
	movl	$1, %esi
	call	fwrite
	orl	$-1, %edi
	call	exit
.L29:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.comm	matrizC,8,8
	.comm	matrizB,8,8
	.comm	matrizA,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4"
	.section	.note.GNU-stack,"",@progbits
