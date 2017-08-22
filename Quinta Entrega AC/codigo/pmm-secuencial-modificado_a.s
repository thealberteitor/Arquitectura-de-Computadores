	.file	"pmm-secuencialModificadoA.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Introduzca tama\303\261o de la matriz"
	.align 8
.LC2:
	.string	"Tiempo(seg.):%f\t / Tama\303\261o:%u\t/ \n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$1, %edi
	jle	.L28
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3000, %ebx
	call	strtol
	cmpl	$3000, %eax
	cmovle	%eax, %ebx
	movslq	%ebx, %r12
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r13
	movq	%rax, matrizA(%rip)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, matrizB(%rip)
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, matrizC(%rip)
	jle	.L3
	leal	-1(%rbx), %r15d
	salq	$2, %r12
	xorl	%ebp, %ebp
	leaq	0(,%r15,8), %r14
	jmp	.L5
.L29:
	movq	matrizA(%rip), %r13
	addq	$8, %rbp
.L5:
	movq	%r12, %rdi
	call	malloc
	movq	%rax, 0(%r13,%rbp)
	movq	%rbp, %r13
	addq	matrizB(%rip), %r13
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, 0(%r13)
	movq	%rbp, %r13
	addq	matrizC(%rip), %r13
	call	malloc
	cmpq	%r14, %rbp
	movq	%rax, 0(%r13)
	jne	.L29
	xorl	%edi, %edi
	leaq	4(,%r15,4), %r12
	xorl	%ebp, %ebp
	call	time
	movl	$274877907, %r14d
	movl	%eax, %edi
	call	srand
.L7:
	leaq	(%rbp,%rbp), %r13
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L6:
	call	rand
	movl	%eax, %ecx
	imull	%r14d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$6, %edx
	subl	%eax, %edx
	movq	matrizA(%rip), %rax
	imull	$1000, %edx, %edx
	movq	(%rax,%r13), %rax
	subl	%edx, %ecx
	movl	%ecx, (%rax,%r15)
	movq	matrizB(%rip), %rax
	movq	(%rax,%r15,2), %rax
	addq	$4, %r15
	cmpq	%r15, %r12
	movl	%ecx, (%rax,%rbp)
	jne	.L6
	addq	$4, %rbp
	cmpq	%r12, %rbp
	jne	.L7
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	matrizC(%rip), %rbp
	movq	matrizA(%rip), %r11
	xorl	%r10d, %r10d
	movq	matrizB(%rip), %r9
.L11:
	movq	0(%rbp,%r10,8), %rsi
	movq	(%r11,%r10,8), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L14:
	movq	(%r9,%rdi,8), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	movl	(%r8,%rdi,4), %ecx
	imull	(%rdx,%rax,4), %ecx
	addl	%ecx, (%rsi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L9
	addq	$1, %rdi
	cmpl	%edi, %ebx
	jg	.L14
	addq	$1, %r10
	cmpl	%r10d, %ebx
	jg	.L11
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	call	clock_gettime
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebx, %edx
	pxor	%xmm1, %xmm1
	movl	$.LC2, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
.L13:
	movq	matrizA(%rip), %rax
	movq	(%rax,%rbp,8), %rdi
	call	free
	movq	matrizB(%rip), %rax
	movq	(%rax,%rbp,8), %rdi
	call	free
	movq	matrizC(%rip), %rax
	movq	(%rax,%rbp,8), %rdi
	addq	$1, %rbp
	call	free
	cmpl	%ebp, %ebx
	jg	.L13
.L15:
	movq	matrizA(%rip), %rdi
	call	free
	movq	matrizB(%rip), %rdi
	call	free
	movq	matrizC(%rip), %rdi
	call	free
	addq	$40, %rsp
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
.L3:
	.cfi_restore_state
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebx, %edx
	pxor	%xmm1, %xmm1
	movl	$.LC2, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	jmp	.L15
.L28:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	matrizC,8,8
	.comm	matrizB,8,8
	.comm	matrizA,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4"
	.section	.note.GNU-stack,"",@progbits
