<kfun:#main(){}>:
               	pushq	%r15
               	pushq	%r14
               	pushq	%rbx
               	subq	$80, %rsp
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 32(%rsp)
               	movaps	%xmm0, 16(%rsp)
               	leaq	236995(%rip), %rax      # 0x45a680 <ktypeglobal:LambdaBenchmark#internal>
               	orq	$3, %rax
               	movq	%rax, 8(%rsp)
               	movq	%fs:0, %rax
               	movq	%rax, %r14
               	movq	-64(%rax), %rbx
               	movq	288(%rbx), %rax
               	movq	%rax, 24(%rsp)
               	leaq	16(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	movabsq	$17179869184, %r15      # imm = 0x400000000
               	movq	%r15, 32(%rsp)
               	movb	273367(%rip), %al       # 0x4634e0 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420912 <kfun:#main(){}+0x72>
               	callq	0x424910 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leaq	8(%rsp), %rax
               	movq	%rax, 40(%rsp)
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 64(%rsp)
               	movaps	%xmm0, 48(%rsp)
               	movq	288(%rbx), %rax
               	movq	%rax, 56(%rsp)
               	leaq	48(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	movq	%r15, 64(%rsp)
               	movq	%r14, %rax
               	cmpl	$2, -68(%r14)
               	je	0x420966 <kfun:#main(){}+0xc6>
               	leaq	-68(%r14), %rdi
               	leaq	127(%rip), %rsi         # 0x4209e0 <kfun:Random.$init_thread_local#internal>
               	callq	0x43a840 <CallInitThreadLocal>
               	movl	$3, %edi
               	callq	0x424ed0 <LookupTLS>
               	movq	(%rax), %rax
               	movq	%rax, 72(%rsp)
               	movl	16(%rax), %ecx
               	leal	(%rcx,%rcx,2), %ecx
               	addl	$11, %ecx
               	movslq	%ecx, %rcx
               	imulq	$1717986919, %rcx, %rdx # imm = 0x66666667
               	movq	%rdx, %rsi
               	shrq	$63, %rsi
               	sarq	$35, %rdx
               	addl	%esi, %edx
               	shll	$2, %edx
               	leal	(%rdx,%rdx,4), %edx
               	subl	%edx, %ecx
               	movl	%ecx, 16(%rax)
               	movl	16(%rax), %eax
               	movl	%eax, 268444(%rip)      # 0x462248 <kvar:globalAddendum#internal>
               	movq	56(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	callq	0x420770 <kfun:LambdaBenchmark#capturingLambdaNoInline(){}kotlin.Int>
               	movq	24(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	addq	$80, %rsp
               	popq	%rbx
               	popq	%r14
               	popq	%r15
               	retq
               	nopw	%cs:(%rax,%rax)

