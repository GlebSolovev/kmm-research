<kfun:#main(){}>:
               	pushq	%rbx
               	subq	$48, %rsp
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 32(%rsp)
               	movaps	%xmm0, 16(%rsp)
               	movq	$0, 8(%rsp)
               	leaq	231566(%rip), %rax      # 0x459090 <ktypeglobal:ChainableBenchmark#internal>
               	orq	$3, %rax
               	movq	%rax, (%rsp)
               	movq	%fs:0, %rax
               	movq	-64(%rax), %rbx
               	movq	288(%rbx), %rax
               	movq	%rax, 24(%rsp)
               	leaq	16(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 32(%rsp)
               	movb	263430(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420853 <kfun:#main(){}+0x73>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	%rsp, %rdi
               	movq	%rdi, 40(%rsp)
               	movl	$1000000, 8(%rsp)       # imm = 0xF4240
               	callq	0x4203d0 <kfun:ChainableBenchmark#testChainable(){}>
               	movq	24(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	addq	$48, %rsp
               	popq	%rbx
               	retq
               	nopw	(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263362(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420897 <kfun:#main(){}+0xb7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4208a6 <kfun:#main(){}+0xc6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258587(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263298(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4208d7 <kfun:#main(){}+0xf7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4208e6 <kfun:#main(){}+0x106>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258523(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263234(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420917 <kfun:#main(){}+0x137>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420926 <kfun:#main(){}+0x146>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258459(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263170(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420957 <kfun:#main(){}+0x177>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420966 <kfun:#main(){}+0x186>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258395(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263106(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420997 <kfun:#main(){}+0x1b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4209a6 <kfun:#main(){}+0x1c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258331(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	263042(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4209d7 <kfun:#main(){}+0x1f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4209e6 <kfun:#main(){}+0x206>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258267(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262978(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420a17 <kfun:#main(){}+0x237>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420a26 <kfun:#main(){}+0x246>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258203(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262914(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420a57 <kfun:#main(){}+0x277>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420a66 <kfun:#main(){}+0x286>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258139(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262850(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420a97 <kfun:#main(){}+0x2b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420aa6 <kfun:#main(){}+0x2c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258075(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262786(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420ad7 <kfun:#main(){}+0x2f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ae6 <kfun:#main(){}+0x306>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	258011(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262722(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420b17 <kfun:#main(){}+0x337>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420b26 <kfun:#main(){}+0x346>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257947(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262658(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420b57 <kfun:#main(){}+0x377>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420b66 <kfun:#main(){}+0x386>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257883(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262594(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420b97 <kfun:#main(){}+0x3b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ba6 <kfun:#main(){}+0x3c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257819(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262530(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420bd7 <kfun:#main(){}+0x3f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420be6 <kfun:#main(){}+0x406>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257755(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262466(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420c17 <kfun:#main(){}+0x437>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420c26 <kfun:#main(){}+0x446>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257691(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262402(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420c57 <kfun:#main(){}+0x477>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420c66 <kfun:#main(){}+0x486>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257627(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262338(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420c97 <kfun:#main(){}+0x4b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ca6 <kfun:#main(){}+0x4c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257563(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262274(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420cd7 <kfun:#main(){}+0x4f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ce6 <kfun:#main(){}+0x506>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257499(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262210(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420d17 <kfun:#main(){}+0x537>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420d26 <kfun:#main(){}+0x546>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257435(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262146(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420d57 <kfun:#main(){}+0x577>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420d66 <kfun:#main(){}+0x586>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257371(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262082(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420d97 <kfun:#main(){}+0x5b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420da6 <kfun:#main(){}+0x5c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257307(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	262018(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420dd7 <kfun:#main(){}+0x5f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420de6 <kfun:#main(){}+0x606>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257243(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261954(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420e17 <kfun:#main(){}+0x637>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420e26 <kfun:#main(){}+0x646>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257179(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261890(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420e57 <kfun:#main(){}+0x677>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420e66 <kfun:#main(){}+0x686>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257115(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261826(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420e97 <kfun:#main(){}+0x6b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ea6 <kfun:#main(){}+0x6c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	257051(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261762(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420ed7 <kfun:#main(){}+0x6f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420ee6 <kfun:#main(){}+0x706>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256987(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261698(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420f17 <kfun:#main(){}+0x737>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420f26 <kfun:#main(){}+0x746>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256923(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261634(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420f57 <kfun:#main(){}+0x777>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420f66 <kfun:#main(){}+0x786>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256859(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261570(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420f97 <kfun:#main(){}+0x7b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420fa6 <kfun:#main(){}+0x7c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256795(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261506(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x420fd7 <kfun:#main(){}+0x7f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x420fe6 <kfun:#main(){}+0x806>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256731(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261442(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421017 <kfun:#main(){}+0x837>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421026 <kfun:#main(){}+0x846>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256667(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261378(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421057 <kfun:#main(){}+0x877>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421066 <kfun:#main(){}+0x886>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256603(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261314(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421097 <kfun:#main(){}+0x8b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4210a6 <kfun:#main(){}+0x8c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256539(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261250(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4210d7 <kfun:#main(){}+0x8f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4210e6 <kfun:#main(){}+0x906>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256475(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261186(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421117 <kfun:#main(){}+0x937>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421126 <kfun:#main(){}+0x946>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256411(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261122(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421157 <kfun:#main(){}+0x977>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421166 <kfun:#main(){}+0x986>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256347(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	261058(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421197 <kfun:#main(){}+0x9b7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4211a6 <kfun:#main(){}+0x9c6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256283(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260994(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4211d7 <kfun:#main(){}+0x9f7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4211e6 <kfun:#main(){}+0xa06>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256219(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260930(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421217 <kfun:#main(){}+0xa37>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421226 <kfun:#main(){}+0xa46>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256155(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260866(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421257 <kfun:#main(){}+0xa77>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421266 <kfun:#main(){}+0xa86>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	256091(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	260801(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421298 <kfun:#main(){}+0xab8>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x4212c4 <kfun:#main(){}+0xae4>
               	testl	%ebx, %ebx
               	je	0x4212cc <kfun:#main(){}+0xaec>
               	movq	$0, 255969(%rip)        # 0x45fa90 <kvar:kotlin.native.MemoryModel.$VALUES#internal>
               	movq	$0, 255966(%rip)        # 0x45fa98 <kvar:kotlin.native.MemoryModel.$ENTRIES#internal>
               	movl	$0, 256012(%rip)        # 0x45fad0 <state_global$kotlin.native.MemoryModel>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	255989(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopw	(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260690(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421307 <kfun:#main(){}+0xb27>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421316 <kfun:#main(){}+0xb36>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255915(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260626(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421347 <kfun:#main(){}+0xb67>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421356 <kfun:#main(){}+0xb76>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255851(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260562(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421387 <kfun:#main(){}+0xba7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421396 <kfun:#main(){}+0xbb6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255787(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260498(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4213c7 <kfun:#main(){}+0xbe7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4213d6 <kfun:#main(){}+0xbf6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255723(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	260433(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421408 <kfun:#main(){}+0xc28>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421429 <kfun:#main(){}+0xc49>
               	testl	%ebx, %ebx
               	je	0x421431 <kfun:#main(){}+0xc51>
               	movq	$0, 255617(%rip)        # 0x45faa0 <kvar:kotlin.native.concurrent.UNINITIALIZED.$instance#internal>
               	movl	$0, 255659(%rip)        # 0x45fad4 <state_global$kotlin.native.concurrent.UNINITIALIZED>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	255632(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	260337(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421468 <kfun:#main(){}+0xc88>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421489 <kfun:#main(){}+0xca9>
               	testl	%ebx, %ebx
               	je	0x421491 <kfun:#main(){}+0xcb1>
               	movq	$0, 255529(%rip)        # 0x45faa8 <kvar:kotlin.native.concurrent.INITIALIZING.$instance#internal>
               	movl	$0, 255567(%rip)        # 0x45fad8 <state_global$kotlin.native.concurrent.INITIALIZING>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	255536(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260242(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4214c7 <kfun:#main(){}+0xce7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4214d6 <kfun:#main(){}+0xcf6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255467(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260178(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421507 <kfun:#main(){}+0xd27>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421516 <kfun:#main(){}+0xd36>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255403(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260114(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421547 <kfun:#main(){}+0xd67>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421556 <kfun:#main(){}+0xd76>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255339(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	260050(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421587 <kfun:#main(){}+0xda7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421596 <kfun:#main(){}+0xdb6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255275(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259986(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4215c7 <kfun:#main(){}+0xde7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4215d6 <kfun:#main(){}+0xdf6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255211(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	259921(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421608 <kfun:#main(){}+0xe28>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421629 <kfun:#main(){}+0xe49>
               	testl	%ebx, %ebx
               	je	0x421631 <kfun:#main(){}+0xe51>
               	movq	$0, 255121(%rip)        # 0x45fab0 <kvar:kotlin.native.internal.NativePtr.$companion#internal>
               	movl	$0, 255155(%rip)        # 0x45fadc <state_global$kotlin.native.internal.NativePtr>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	255120(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259826(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421667 <kfun:#main(){}+0xe87>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421676 <kfun:#main(){}+0xe96>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	255051(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259762(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4216a7 <kfun:#main(){}+0xec7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4216b6 <kfun:#main(){}+0xed6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254987(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	259697(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4216e8 <kfun:#main(){}+0xf08>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421709 <kfun:#main(){}+0xf29>
               	testl	%ebx, %ebx
               	je	0x421711 <kfun:#main(){}+0xf31>
               	movq	$0, 254905(%rip)        # 0x45fab8 <kvar:kotlin.native.internal.UnhandledExceptionHookHolder.$instance#internal>
               	movl	$0, 254935(%rip)        # 0x45fae0 <state_global$kotlin.native.internal.UnhandledExceptionHookHolder>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	254896(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259602(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421747 <kfun:#main(){}+0xf67>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421756 <kfun:#main(){}+0xf76>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254827(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259538(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421787 <kfun:#main(){}+0xfa7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421796 <kfun:#main(){}+0xfb6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254763(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259474(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4217c7 <kfun:#main(){}+0xfe7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4217d6 <kfun:#main(){}+0xff6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254699(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259410(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421807 <kfun:#main(){}+0x1027>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421816 <kfun:#main(){}+0x1036>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254635(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259346(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421847 <kfun:#main(){}+0x1067>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421856 <kfun:#main(){}+0x1076>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254571(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259282(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421887 <kfun:#main(){}+0x10a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421896 <kfun:#main(){}+0x10b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254507(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259218(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4218c7 <kfun:#main(){}+0x10e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4218d6 <kfun:#main(){}+0x10f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254443(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259154(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421907 <kfun:#main(){}+0x1127>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421916 <kfun:#main(){}+0x1136>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254379(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259090(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421947 <kfun:#main(){}+0x1167>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421956 <kfun:#main(){}+0x1176>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254315(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	259026(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421987 <kfun:#main(){}+0x11a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421996 <kfun:#main(){}+0x11b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254251(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258962(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4219c7 <kfun:#main(){}+0x11e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4219d6 <kfun:#main(){}+0x11f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254187(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258898(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421a07 <kfun:#main(){}+0x1227>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421a16 <kfun:#main(){}+0x1236>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254123(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258834(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421a47 <kfun:#main(){}+0x1267>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421a56 <kfun:#main(){}+0x1276>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	254059(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258770(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421a87 <kfun:#main(){}+0x12a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421a96 <kfun:#main(){}+0x12b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253995(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	258705(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421ac8 <kfun:#main(){}+0x12e8>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421adf <kfun:#main(){}+0x12ff>
               	testl	%ebx, %ebx
               	je	0x421ae7 <kfun:#main(){}+0x1307>
               	movq	$0, 247841(%rip)        # 0x45e300 <kvar:kotlin.collections.EmptyIterator.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	253914(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258610(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421b27 <kfun:#main(){}+0x1347>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421b36 <kfun:#main(){}+0x1356>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253835(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	258545(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421b68 <kfun:#main(){}+0x1388>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421b7f <kfun:#main(){}+0x139f>
               	testl	%ebx, %ebx
               	je	0x421b87 <kfun:#main(){}+0x13a7>
               	movq	$0, 247689(%rip)        # 0x45e308 <kvar:kotlin.collections.EmptySet.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	253754(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258450(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421bc7 <kfun:#main(){}+0x13e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421bd6 <kfun:#main(){}+0x13f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253675(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258386(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421c07 <kfun:#main(){}+0x1427>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421c16 <kfun:#main(){}+0x1436>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253611(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	258321(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421c48 <kfun:#main(){}+0x1468>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421c5f <kfun:#main(){}+0x147f>
               	testl	%ebx, %ebx
               	je	0x421c67 <kfun:#main(){}+0x1487>
               	movq	$0, 247473(%rip)        # 0x45e310 <kvar:kotlin.coroutines.EmptyCoroutineContext.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	253530(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258226(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421ca7 <kfun:#main(){}+0x14c7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421cb6 <kfun:#main(){}+0x14d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253451(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258162(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421ce7 <kfun:#main(){}+0x1507>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421cf6 <kfun:#main(){}+0x1516>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253387(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	258097(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421d28 <kfun:#main(){}+0x1548>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x421d49 <kfun:#main(){}+0x1569>
               	testl	%ebx, %ebx
               	je	0x421d51 <kfun:#main(){}+0x1571>
               	movq	$0, 253313(%rip)        # 0x45fac0 <kvar:kotlin.ranges.IntRange.$companion#internal>
               	movl	$0, 253339(%rip)        # 0x45fae4 <state_global$kotlin.ranges.IntRange>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	253296(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x4244e0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	258002(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421d87 <kfun:#main(){}+0x15a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421d96 <kfun:#main(){}+0x15b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253227(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257938(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421dc7 <kfun:#main(){}+0x15e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421dd6 <kfun:#main(){}+0x15f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253163(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257874(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421e07 <kfun:#main(){}+0x1627>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421e16 <kfun:#main(){}+0x1636>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253099(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257810(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421e47 <kfun:#main(){}+0x1667>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421e56 <kfun:#main(){}+0x1676>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	253035(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257746(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421e87 <kfun:#main(){}+0x16a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421e96 <kfun:#main(){}+0x16b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252971(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257682(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421ec7 <kfun:#main(){}+0x16e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421ed6 <kfun:#main(){}+0x16f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252907(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257618(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421f07 <kfun:#main(){}+0x1727>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421f16 <kfun:#main(){}+0x1736>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252843(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257554(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421f47 <kfun:#main(){}+0x1767>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421f56 <kfun:#main(){}+0x1776>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252779(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257490(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421f87 <kfun:#main(){}+0x17a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421f96 <kfun:#main(){}+0x17b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252715(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257426(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421fc7 <kfun:#main(){}+0x17e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x421fd6 <kfun:#main(){}+0x17f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252651(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257362(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422007 <kfun:#main(){}+0x1827>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422016 <kfun:#main(){}+0x1836>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252587(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257298(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422047 <kfun:#main(){}+0x1867>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422056 <kfun:#main(){}+0x1876>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252523(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257234(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422087 <kfun:#main(){}+0x18a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422096 <kfun:#main(){}+0x18b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252459(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257170(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4220c7 <kfun:#main(){}+0x18e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4220d6 <kfun:#main(){}+0x18f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252395(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257106(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422107 <kfun:#main(){}+0x1927>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422116 <kfun:#main(){}+0x1936>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252331(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	257042(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422147 <kfun:#main(){}+0x1967>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422156 <kfun:#main(){}+0x1976>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252267(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	256978(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422187 <kfun:#main(){}+0x19a7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422196 <kfun:#main(){}+0x19b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252203(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	256914(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4221c7 <kfun:#main(){}+0x19e7>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4221d6 <kfun:#main(){}+0x19f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252139(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	256850(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422207 <kfun:#main(){}+0x1a27>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422216 <kfun:#main(){}+0x1a36>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252075(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	256786(%rip), %al       # 0x460d50 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422247 <kfun:#main(){}+0x1a67>
               	callq	0x4242d0 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422256 <kfun:#main(){}+0x1a76>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	252011(%rip), %rsi      # 0x45fac8 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$5, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x4244e0 <AddTLSRecord>

