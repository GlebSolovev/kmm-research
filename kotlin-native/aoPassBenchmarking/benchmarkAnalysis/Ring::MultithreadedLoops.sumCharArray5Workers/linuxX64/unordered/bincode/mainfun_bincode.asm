<kfun:#main(){}>:
               	pushq	%rbp
               	pushq	%r15
               	pushq	%r14
               	pushq	%r13
               	pushq	%r12
               	pushq	%rbx
               	subq	$408, %rsp              # imm = 0x198
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 384(%rsp)
               	movaps	%xmm0, 368(%rsp)
               	movq	%fs:0, %rax
               	movq	%rax, 48(%rsp)
               	movq	-64(%rax), %rbx
               	movq	288(%rbx), %rax
               	movq	%rax, 376(%rsp)
               	leaq	368(%rsp), %rax
               	movq	%rax, 288(%rbx)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 384(%rsp)
               	movb	285326(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421a7b <kfun:#main(){}+0x7b>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	296(%rbx), %rdi
               	addq	$112, %rdi
               	movl	$40, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rdx
               	movq	$0, 8(%rax)
               	leaq	247885(%rip), %rcx      # 0x45e2f0 <ktypeglobal:MultithreadedLoopsBenchmark#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rdx, 360(%rsp)
               	movq	%rdx, 392(%rsp)
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 208(%rsp)
               	movaps	%xmm0, 192(%rsp)
               	movaps	%xmm0, 176(%rsp)
               	movaps	%xmm0, 160(%rsp)
               	movaps	%xmm0, 144(%rsp)
               	movq	288(%rbx), %rcx
               	movq	%rcx, 152(%rsp)
               	leaq	144(%rsp), %rcx
               	movq	%rcx, 288(%rbx)
               	movabsq	$42949672960, %rcx      # imm = 0xA00000000
               	movq	%rcx, 160(%rsp)
               	movl	$5, 40(%rax)
               	movq	%rax, 112(%rsp)
               	movl	40(%rax), %r14d
               	testl	%r14d, %r14d
               	js	0x422afc <kfun:#main(){}+0x10fc>
               	movq	%rbx, 40(%rsp)
               	movq	296(%rbx), %rdi
               	leaq	31(,%r14,8), %rsi
               	andq	$-8, %rsi
               	addq	$112, %rdi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	movq	%rax, %r12
               	leaq	16(%rax), %rcx
               	xorps	%xmm0, %xmm0
               	movups	%xmm0, 8(%rax)
               	movq	$0, 24(%rax)
               	leaq	234343(%rip), %rax      # 0x45aed0 <ktypeglobal:kotlin.Array#internal>
               	movq	%rax, 16(%r12)
               	movl	%r14d, 24(%r12)
               	movq	%rcx, 56(%rsp)
               	movq	%rcx, 176(%rsp)
               	xorl	%ebx, %ebx
               	cmpq	%r14, %rbx
               	je	0x421c58 <kfun:#main(){}+0x258>
               	nopl	(%rax,%rax)
               	movb	285034(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421b9f <kfun:#main(){}+0x19f>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	40(%rsp), %rax
               	movq	296(%rax), %rdi
               	addq	$112, %rdi
               	movl	$20024, %esi            # imm = 0x4E38
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	movq	%rax, %rbp
               	leaq	16(%rax), %r15
               	xorps	%xmm0, %xmm0
               	movups	%xmm0, 8(%rax)
               	movq	$0, 24(%rax)
               	leaq	234378(%rip), %rax      # 0x45af60 <ktypeglobal:kotlin.CharArray#internal>
               	movq	%rax, 16(%rbp)
               	movl	$10000, 24(%rbp)        # imm = 0x2710
               	movq	%r15, 184(%rsp)
               	xorl	%r13d, %r13d
               	cmpq	$10000, %r13            # imm = 0x2710
               	je	0x421c33 <kfun:#main(){}+0x233>
               	nopl	(%rax)
               	movzbl	284921(%rip), %eax      # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421c10 <kfun:#main(){}+0x210>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movl	24(%rbp), %eax
               	cmpq	%rax, %r13
               	jae	0x4229c7 <kfun:#main(){}+0xfc7>
               	movq	16(%rbp), %rax
               	movw	%r13w, 32(%rbp,%r13,2)
               	addq	$1, %r13
               	cmpq	$10000, %r13            # imm = 0x2710
               	jne	0x421c00 <kfun:#main(){}+0x200>
               	movl	24(%r12), %eax
               	cmpq	%rax, %rbx
               	jae	0x4229c7 <kfun:#main(){}+0xfc7>
               	movq	16(%r12), %rax
               	movq	%r15, 32(%r12,%rbx,8)
               	addq	$1, %rbx
               	cmpq	%r14, %rbx
               	jne	0x421b90 <kfun:#main(){}+0x190>
               	movq	112(%rsp), %rax
               	movq	56(%rsp), %rcx
               	movq	%rcx, 24(%rax)
               	movl	40(%rax), %r14d
               	testl	%r14d, %r14d
               	js	0x422b05 <kfun:#main(){}+0x1105>
               	movq	40(%rsp), %r15
               	movq	296(%r15), %rdi
               	leaq	31(,%r14,8), %rsi
               	movabsq	$68719476728, %rax      # imm = 0xFFFFFFFF8
               	andq	%rax, %rsi
               	addq	$112, %rdi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	movq	%rax, %rbp
               	leaq	16(%rax), %rcx
               	xorps	%xmm0, %xmm0
               	movups	%xmm0, 8(%rax)
               	movq	$0, 24(%rax)
               	leaq	234006(%rip), %rax      # 0x45aed0 <ktypeglobal:kotlin.Array#internal>
               	movq	%rax, 16(%rbp)
               	movl	%r14d, 24(%rbp)
               	movq	%rcx, 120(%rsp)
               	movq	%rcx, 200(%rsp)
               	xorl	%r12d, %r12d
               	movq	%r14, 56(%rsp)
               	cmpq	%r12, %r14
               	je	0x421e33 <kfun:#main(){}+0x433>
               	movzbl	284697(%rip), %eax      # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421cf0 <kfun:#main(){}+0x2f0>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	271897(%rip), %rax      # 0x464310 <kvar:kotlin.native.concurrent.Worker.$companion#internal>
               	movq	%rax, 208(%rsp)
               	callq	0x43a480 <(anonymous namespace)::theState()>
               	movq	%rax, %rdi
               	xorl	%esi, %esi
               	callq	0x43be90 <(anonymous namespace)::State::addWorkerUnlocked((anonymous namespace)::WorkerExceptionHandling, ObjHeader*, (anonymous namespace)::WorkerKind)>
               	testq	%rax, %rax
               	je	0x421d90 <kfun:#main(){}+0x390>
               	movq	%rax, %r13
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbx
               	movl	$1, %r14d
               	xchgl	%r14d, 328(%rbx)
               	movq	%r13, %rdi
               	addq	$240, %rdi
               	xorl	%esi, %esi
               	leaq	110062(%rip), %rdx      # 0x43cb30 <(anonymous namespace)::workerRoutine(void*)>
               	movq	%r13, %rcx
               	callq	0x413780 <pthread_create@plt>
               	testq	%rbx, %rbx
               	je	0x421d80 <kfun:#main(){}+0x380>
               	addq	$328, %rbx              # imm = 0x148
               	movl	%r14d, %eax
               	xchgl	%eax, (%rbx)
               	testl	%r14d, %r14d
               	jne	0x421d80 <kfun:#main(){}+0x380>
               	cmpl	$1, %eax
               	jne	0x421d80 <kfun:#main(){}+0x380>
               	movzbl	284560(%rip), %eax      # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421d80 <kfun:#main(){}+0x380>
               	movq	%rbx, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	movl	(%r13), %ebx
               	movq	40(%rsp), %r15
               	movq	56(%rsp), %r14
               	jmp	0x421d95 <kfun:#main(){}+0x395>
               	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 80(%rsp)
               	movaps	%xmm0, 64(%rsp)
               	movq	288(%r15), %rax
               	movq	%rax, 72(%rsp)
               	leaq	64(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 80(%rsp)
               	movq	296(%r15), %rdi
               	addq	$112, %rdi
               	movl	$24, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rcx
               	movq	$0, 8(%rax)
               	leaq	239551(%rip), %rdx      # 0x45c5b0 <ktypeglobal:kotlin.native.concurrent.Worker#internal>
               	movq	%rdx, 16(%rax)
               	movq	%rcx, 88(%rsp)
               	movl	%ebx, 24(%rax)
               	movq	%rcx, 216(%rsp)
               	movq	72(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movl	24(%rbp), %eax
               	cmpq	%rax, %r12
               	jae	0x4229c7 <kfun:#main(){}+0xfc7>
               	movq	16(%rbp), %rax
               	movq	%rcx, 32(%rbp,%r12,8)
               	addq	$1, %r12
               	cmpq	%r12, %r14
               	jne	0x421ce0 <kfun:#main(){}+0x2e0>
               	movq	112(%rsp), %rcx
               	movq	120(%rsp), %rax
               	movq	%rax, 32(%rcx)
               	movq	152(%rsp), %rax
               	movq	%rax, 288(%r15)
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 256(%rsp)
               	movaps	%xmm0, 240(%rsp)
               	movaps	%xmm0, 224(%rsp)
               	movaps	%xmm0, 208(%rsp)
               	movaps	%xmm0, 192(%rsp)
               	movaps	%xmm0, 176(%rsp)
               	movaps	%xmm0, 160(%rsp)
               	movaps	%xmm0, 144(%rsp)
               	movq	$0, 272(%rsp)
               	movq	288(%r15), %rax
               	movq	%rax, 152(%rsp)
               	leaq	144(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movabsq	$73014444032, %rax      # imm = 0x1100000000
               	movq	%rax, 160(%rsp)
               	movl	40(%rcx), %r14d
               	testl	%r14d, %r14d
               	js	0x422b40 <kfun:#main(){}+0x1140>
               	movq	296(%r15), %rdi
               	leaq	31(,%r14,8), %rsi
               	movabsq	$68719476728, %rax      # imm = 0xFFFFFFFF8
               	andq	%rax, %rsi
               	addq	$112, %rdi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	movq	%rax, %rbx
               	addq	$16, %rax
               	xorps	%xmm0, %xmm0
               	movups	%xmm0, 8(%rbx)
               	movq	$0, 24(%rbx)
               	leaq	233394(%rip), %rcx      # 0x45aed0 <ktypeglobal:kotlin.Array#internal>
               	movq	%rcx, 16(%rbx)
               	movl	%r14d, 24(%rbx)
               	movq	%rax, 176(%rsp)
               	xorl	%ebp, %ebp
               	movq	%rbx, 56(%rsp)
               	movq	%r14, 352(%rsp)
               	cmpq	%r14, %rbp
               	je	0x422682 <kfun:#main(){}+0xc82>
               	nopw	%cs:(%rax,%rax)
               	movb	284074(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x421f5f <kfun:#main(){}+0x55f>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	112(%rsp), %rax
               	movq	32(%rax), %rax
               	movl	8(%rax), %ecx
               	cmpq	%rcx, %rbp
               	jae	0x4229c7 <kfun:#main(){}+0xfc7>
               	movq	16(%rax,%rbp,8), %rax
               	movq	%rax, 184(%rsp)
               	movl	8(%rax), %r13d
               	movl	279285(%rip), %eax      # 0x466280 <state_global$kotlin.native.concurrent.TransferMode>
               	cmpl	$2, %eax
               	je	0x421fa3 <kfun:#main(){}+0x5a3>
               	leaq	279273(%rip), %rdi      # 0x466280 <state_global$kotlin.native.concurrent.TransferMode>
               	leaq	-33630(%rip), %rsi      # 0x419c40 <kfun:kotlin.native.concurrent.TransferMode.$init_global#internal>
               	callq	0x43c930 <CallInitGlobalPossiblyLock>
               	movq	279190(%rip), %rax      # 0x466240 <kvar:kotlin.native.concurrent.TransferMode.$VALUES#internal>
               	movq	16(%rax), %rbx
               	movq	%rbx, 192(%rsp)
               	movq	296(%r15), %rdi
               	addq	$112, %rdi
               	movl	$32, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rdi
               	movq	$0, 8(%rax)
               	leaq	246690(%rip), %rcx      # 0x45e380 <ktypeglobal:MultithreadedLoopsBenchmark.$runSumCharArrayWorkers$lambda$0$FUNCTION_REFERENCE$0#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rdi, 200(%rsp)
               	movq	360(%rsp), %rcx
               	movq	%rcx, 24(%rax)
               	movq	%rbp, 120(%rsp)
               	movl	%ebp, 32(%rax)
               	movl	20(%rbx), %eax
               	movl	%eax, 136(%rsp)
               	movq	$0, 312(%rsp)
               	movq	288(%r15), %rax
               	movq	%rax, 296(%rsp)
               	leaq	288(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 304(%rsp)
               	leaq	312(%rsp), %rsi
               	callq	0x4190e0 <WorkerLaunchpad>
               	movslq	%r13d, %r12
               	movq	312(%rsp), %rdi
               	callq	0x427120 <CreateStablePointer>
               	movq	%rax, 128(%rsp)
               	movq	$0, 312(%rsp)
               	callq	0x43a480 <(anonymous namespace)::theState()>
               	movq	%rax, %r14
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbx
               	movl	$1, %ebp
               	xchgl	%ebp, 328(%rbx)
               	movq	%r14, %rdi
               	callq	0x413760 <pthread_mutex_lock@plt>
               	testq	%rbx, %rbx
               	je	0x4220d0 <kfun:#main(){}+0x6d0>
               	addq	$328, %rbx              # imm = 0x148
               	movl	%ebp, %eax
               	xchgl	%eax, (%rbx)
               	testl	%ebp, %ebp
               	jne	0x4220d0 <kfun:#main(){}+0x6d0>
               	cmpl	$1, %eax
               	jne	0x4220d0 <kfun:#main(){}+0x6d0>
               	movb	283713(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4220d0 <kfun:#main(){}+0x6d0>
               	movq	%rbx, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	nop
               	movq	152(%r14), %rdi
               	movq	%r12, %rax
               	orq	%rdi, %rax
               	shrq	$32, %rax
               	je	0x422110 <kfun:#main(){}+0x710>
               	movq	%r12, %rax
               	xorl	%edx, %edx
               	divq	%rdi
               	movq	%rdx, %rcx
               	movq	144(%r14), %rax
               	movq	(%rax,%rcx,8), %rax
               	testq	%rax, %rax
               	jne	0x42212d <kfun:#main(){}+0x72d>
               	jmp	0x422230 <kfun:#main(){}+0x830>
               	nopl	(%rax,%rax)
               	movl	%r13d, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	movl	%edx, %ecx
               	movq	144(%r14), %rax
               	movq	(%rax,%rcx,8), %rax
               	testq	%rax, %rax
               	je	0x422230 <kfun:#main(){}+0x830>
               	movq	(%rax), %rbp
               	cmpl	%r13d, 8(%rbp)
               	jne	0x422154 <kfun:#main(){}+0x754>
               	testq	%rbp, %rbp
               	jne	0x42218e <kfun:#main(){}+0x78e>
               	jmp	0x422230 <kfun:#main(){}+0x830>
               	movl	%esi, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	cmpq	%rcx, %rdx
               	jne	0x422230 <kfun:#main(){}+0x830>
               	cmpl	%r13d, %esi
               	je	0x422185 <kfun:#main(){}+0x785>
               	movq	%rbp, %rbx
               	movq	(%rbp), %rbp
               	testq	%rbp, %rbp
               	je	0x422230 <kfun:#main(){}+0x830>
               	movl	8(%rbp), %esi
               	movslq	%esi, %rax
               	movq	%rax, %rdx
               	orq	%rdi, %rdx
               	shrq	$32, %rdx
               	je	0x422140 <kfun:#main(){}+0x740>
               	xorl	%edx, %edx
               	divq	%rdi
               	cmpq	%rcx, %rdx
               	je	0x42214f <kfun:#main(){}+0x74f>
               	jmp	0x422230 <kfun:#main(){}+0x830>
               	testq	%rbx, %rbx
               	je	0x422230 <kfun:#main(){}+0x830>
               	movq	16(%rbp), %r15
               	movl	$1, %edi
               	movl	$104, %esi
               	callq	0x413700 <calloc@plt>
               	testq	%rax, %rax
               	je	0x422238 <kfun:#main(){}+0x838>
               	movq	%rax, %r12
               	movl	260(%r14), %eax
               	leal	1(%rax), %ecx
               	movl	%ecx, 260(%r14)
               	movl	$1, (%r12)
               	movl	%eax, 4(%r12)
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbx
               	movl	$1, %ebp
               	xchgl	%ebp, 328(%rbx)
               	leaq	16(%r12), %rdi
               	xorl	%esi, %esi
               	callq	0x413790 <pthread_mutex_init@plt>
               	movq	%r12, %rdi
               	addq	$56, %rdi
               	xorl	%esi, %esi
               	callq	0x4137a0 <pthread_cond_init@plt>
               	testq	%rbx, %rbx
               	je	0x42223b <kfun:#main(){}+0x83b>
               	addq	$328, %rbx              # imm = 0x148
               	movl	%ebp, %eax
               	xchgl	%eax, (%rbx)
               	testl	%ebp, %ebp
               	jne	0x42223b <kfun:#main(){}+0x83b>
               	cmpl	$1, %eax
               	jne	0x42223b <kfun:#main(){}+0x83b>
               	movb	283365(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x42223b <kfun:#main(){}+0x83b>
               	movq	%rbx, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	jmp	0x42223b <kfun:#main(){}+0x83b>
               	xorl	%r12d, %r12d
               	jmp	0x42255d <kfun:#main(){}+0xb5d>
               	xorl	%r12d, %r12d
               	movl	4(%r12), %r13d
               	movslq	%r13d, %rax
               	movq	96(%r14), %rdi
               	movq	%rax, %rcx
               	orq	%rdi, %rcx
               	shrq	$32, %rcx
               	movq	%rax, 320(%rsp)
               	je	0x422275 <kfun:#main(){}+0x875>
               	xorl	%edx, %edx
               	divq	%rdi
               	movq	%rdx, %rbx
               	movq	88(%r14), %rax
               	movq	(%rax,%rbx,8), %rax
               	testq	%rax, %rax
               	jne	0x42228b <kfun:#main(){}+0x88b>
               	jmp	0x4222f7 <kfun:#main(){}+0x8f7>
               	movl	%r13d, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	movl	%edx, %ebx
               	movq	88(%r14), %rax
               	movq	(%rax,%rbx,8), %rax
               	testq	%rax, %rax
               	je	0x4222f7 <kfun:#main(){}+0x8f7>
               	movq	(%rax), %rbp
               	cmpl	8(%rbp), %r13d
               	jne	0x4222b0 <kfun:#main(){}+0x8b0>
               	testq	%rbp, %rbp
               	jne	0x4222df <kfun:#main(){}+0x8df>
               	jmp	0x4222f7 <kfun:#main(){}+0x8f7>
               	nop
               	movl	%ecx, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	cmpq	%rbx, %rdx
               	jne	0x4222f7 <kfun:#main(){}+0x8f7>
               	cmpl	%ecx, %r13d
               	je	0x4222da <kfun:#main(){}+0x8da>
               	movq	%rbp, %rsi
               	movq	(%rbp), %rbp
               	testq	%rbp, %rbp
               	je	0x4222f7 <kfun:#main(){}+0x8f7>
               	movl	8(%rbp), %ecx
               	movslq	%ecx, %rax
               	movq	%rax, %rdx
               	orq	%rdi, %rdx
               	shrq	$32, %rdx
               	je	0x4222a0 <kfun:#main(){}+0x8a0>
               	xorl	%edx, %edx
               	divq	%rdi
               	cmpq	%rbx, %rdx
               	je	0x4222ab <kfun:#main(){}+0x8ab>
               	jmp	0x4222f7 <kfun:#main(){}+0x8f7>
               	testq	%rsi, %rsi
               	je	0x4222f7 <kfun:#main(){}+0x8f7>
               	addq	$8, %rbp
               	movl	136(%rsp), %ecx
               	movq	128(%rsp), %rdx
               	jmp	0x422512 <kfun:#main(){}+0xb12>
               	movq	%r15, 344(%rsp)
               	movl	$1, %edi
               	movl	$24, %esi
               	callq	0x413700 <calloc@plt>
               	movq	%rax, 336(%rsp)
               	movl	%r13d, 8(%rax)
               	leaq	120(%r14), %rdi
               	movq	96(%r14), %rsi
               	movq	112(%r14), %rdx
               	movl	$1, %ecx
               	callq	0x440f5a <std::__detail::_Prime_rehash_policy::_M_need_rehash(unsigned long, unsigned long, unsigned long) const>
               	testb	$1, %al
               	movq	%r12, 328(%rsp)
               	jne	0x422345 <kfun:#main(){}+0x945>
               	movq	88(%r14), %r12
               	jmp	0x422475 <kfun:#main(){}+0xa75>
               	movq	%rdx, %r15
               	cmpq	$1, %rdx
               	je	0x422409 <kfun:#main(){}+0xa09>
               	movl	$8, %esi
               	movq	%r15, %rdi
               	callq	0x413700 <calloc@plt>
               	movq	%rax, %r12
               	leaq	(,%r15,8), %rdx
               	movq	%rax, %rdi
               	xorl	%esi, %esi
               	callq	0x413750 <memset@plt>
               	movq	104(%r14), %rbp
               	movq	$0, 104(%r14)
               	testq	%rbp, %rbp
               	je	0x422430 <kfun:#main(){}+0xa30>
               	leaq	104(%r14), %rdi
               	xorl	%ebx, %ebx
               	jmp	0x4223c6 <kfun:#main(){}+0x9c6>
               	nopw	%cs:(%rax,%rax)
               	nop
               	xorl	%edx, %edx
               	divl	%r15d
               	movq	(%r12,%rdx,8), %rax
               	testq	%rax, %rax
               	je	0x4223f0 <kfun:#main(){}+0x9f0>
               	movq	(%rax), %rax
               	movq	%rax, (%rsi)
               	movq	(%r12,%rdx,8), %rax
               	movq	%rsi, (%rax)
               	movq	%rbx, %rdx
               	movq	%rdx, %rbx
               	testq	%rbp, %rbp
               	je	0x422430 <kfun:#main(){}+0xa30>
               	movq	%rbp, %rsi
               	movq	(%rbp), %rbp
               	movl	8(%rsi), %eax
               	movslq	%eax, %rcx
               	movq	%rcx, %rdx
               	orq	%r15, %rdx
               	shrq	$32, %rdx
               	je	0x4223a0 <kfun:#main(){}+0x9a0>
               	movq	%rcx, %rax
               	xorl	%edx, %edx
               	divq	%r15
               	movq	(%r12,%rdx,8), %rax
               	testq	%rax, %rax
               	jne	0x4223ae <kfun:#main(){}+0x9ae>
               	movq	(%rdi), %rax
               	movq	%rax, (%rsi)
               	movq	%rsi, (%rdi)
               	movq	%rdi, (%r12,%rdx,8)
               	cmpq	$0, (%rsi)
               	je	0x4223be <kfun:#main(){}+0x9be>
               	movq	%rsi, (%r12,%rbx,8)
               	jmp	0x4223be <kfun:#main(){}+0x9be>
               	leaq	136(%r14), %r12
               	movq	$0, 136(%r14)
               	movq	104(%r14), %rbp
               	movq	$0, 104(%r14)
               	testq	%rbp, %rbp
               	jne	0x422389 <kfun:#main(){}+0x989>
               	movq	88(%r14), %rdi
               	leaq	136(%r14), %rax
               	cmpq	%rax, %rdi
               	je	0x422445 <kfun:#main(){}+0xa45>
               	callq	0x413710 <free@plt>
               	movq	%r15, 96(%r14)
               	movq	%r12, 88(%r14)
               	movq	320(%rsp), %rax
               	movq	%rax, %rcx
               	orq	%r15, %rcx
               	shrq	$32, %rcx
               	je	0x42246b <kfun:#main(){}+0xa6b>
               	xorl	%edx, %edx
               	divq	%r15
               	movq	%rdx, %rbx
               	jmp	0x422475 <kfun:#main(){}+0xa75>
               	movl	%r13d, %eax
               	xorl	%edx, %edx
               	divl	%r15d
               	movl	%edx, %ebx
               	movq	336(%rsp), %rsi
               	movq	%rsi, %rbp
               	addq	$8, %rbp
               	movq	(%r12,%rbx,8), %rax
               	testq	%rax, %rax
               	movq	344(%rsp), %r15
               	je	0x4224a4 <kfun:#main(){}+0xaa4>
               	movq	(%rax), %rax
               	movq	%rax, (%rsi)
               	movq	(%r12,%rbx,8), %rax
               	movq	%rsi, (%rax)
               	jmp	0x4224ef <kfun:#main(){}+0xaef>
               	movq	%r14, %rdi
               	addq	$104, %rdi
               	movq	104(%r14), %rax
               	movq	%rax, (%rsi)
               	movq	%rsi, 104(%r14)
               	movq	(%rsi), %rax
               	testq	%rax, %rax
               	je	0x4224eb <kfun:#main(){}+0xaeb>
               	movq	96(%r14), %r8
               	movl	8(%rax), %eax
               	movslq	%eax, %rcx
               	movq	%rcx, %rdx
               	orq	%r8, %rdx
               	shrq	$32, %rdx
               	je	0x4224de <kfun:#main(){}+0xade>
               	movq	%rcx, %rax
               	xorl	%edx, %edx
               	divq	%r8
               	jmp	0x4224e3 <kfun:#main(){}+0xae3>
               	xorl	%edx, %edx
               	divl	%r8d
               	movq	%rsi, (%r12,%rdx,8)
               	movq	88(%r14), %r12
               	movq	%rdi, (%r12,%rbx,8)
               	movq	112(%r14), %rax
               	addq	$1, %rax
               	movq	%rax, 112(%r14)
               	movl	136(%rsp), %ecx
               	movq	128(%rsp), %rdx
               	movq	328(%rsp), %r12
               	movq	%r12, 8(%rbp)
               	movl	$2, 64(%rsp)
               	leaq	-3253(%rip), %rax       # 0x421870 <kfun:MultithreadedLoopsBenchmark.$<bridge-BNNN>runSumCharArrayWorkers$lambda$1#static(kotlin.CharArray){}kotlin.Long#internal>
               	movq	%rax, 72(%rsp)
               	movq	%rdx, 80(%rsp)
               	movq	%r12, 88(%rsp)
               	movl	%ecx, 96(%rsp)
               	movq	96(%rsp), %rax
               	movq	%rax, 32(%rsp)
               	movups	64(%rsp), %xmm0
               	movups	80(%rsp), %xmm1
               	movups	%xmm1, 16(%rsp)
               	movups	%xmm0, (%rsp)
               	movq	%r15, %rdi
               	callq	0x43a780 <Worker::putJob((anonymous namespace)::Job, bool)>
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbx
               	movl	$1, %ebp
               	xchgl	%ebp, 328(%rbx)
               	movq	%r14, %rdi
               	callq	0x413770 <pthread_mutex_unlock@plt>
               	testq	%rbx, %rbx
               	je	0x4225b0 <kfun:#main(){}+0xbb0>
               	addq	$328, %rbx              # imm = 0x148
               	movl	%ebp, %eax
               	xchgl	%eax, (%rbx)
               	testl	%ebp, %ebp
               	jne	0x4225b0 <kfun:#main(){}+0xbb0>
               	cmpl	$1, %eax
               	jne	0x4225b0 <kfun:#main(){}+0xbb0>
               	movb	282465(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4225b0 <kfun:#main(){}+0xbb0>
               	movq	%rbx, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	nop
               	testq	%r12, %r12
               	movq	40(%rsp), %r15
               	movq	352(%rsp), %r14
               	je	0x422af7 <kfun:#main(){}+0x10f7>
               	movl	4(%r12), %ebx
               	movq	296(%rsp), %rax
               	movq	%rax, 288(%r15)
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 80(%rsp)
               	movaps	%xmm0, 64(%rsp)
               	movq	288(%r15), %rax
               	movq	%rax, 72(%rsp)
               	leaq	64(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 80(%rsp)
               	movq	296(%r15), %rdi
               	addq	$112, %rdi
               	movl	$24, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rcx
               	movq	$0, 8(%rax)
               	leaq	236282(%rip), %rdx      # 0x45c130 <ktypeglobal:kotlin.native.concurrent.Future#internal>
               	movq	%rdx, 16(%rax)
               	movq	%rcx, 88(%rsp)
               	movl	%ebx, 24(%rax)
               	movq	%rcx, 208(%rsp)
               	movq	72(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movq	56(%rsp), %rbx
               	movl	24(%rbx), %eax
               	movq	120(%rsp), %rbp
               	cmpq	%rax, %rbp
               	jae	0x4229c7 <kfun:#main(){}+0xfc7>
               	movq	16(%rbx), %rax
               	movq	%rcx, 32(%rbx,%rbp,8)
               	addq	$1, %rbp
               	cmpq	%r14, %rbp
               	jne	0x421f50 <kfun:#main(){}+0x550>
               	movl	24(%rbx), %eax
               	xorl	%ebp, %ebp
               	testl	%eax, %eax
               	cmovsl	%ebp, %eax
               	movq	%rax, 128(%rsp)
               	cmpq	128(%rsp), %rbp
               	je	0x4229a6 <kfun:#main(){}+0xfa6>
               	nopw	%cs:(%rax,%rax)
               	nopl	(%rax)
               	movb	282186(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4226bf <kfun:#main(){}+0xcbf>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	movq	%rbp, 120(%rsp)
               	movq	32(%rbx,%rbp,8), %rax
               	movq	%rax, 216(%rsp)
               	movl	8(%rax), %r13d
               	xorps	%xmm0, %xmm0
               	movaps	%xmm0, 80(%rsp)
               	movaps	%xmm0, 64(%rsp)
               	movq	288(%r15), %rax
               	movq	%rax, 72(%rsp)
               	leaq	64(%rsp), %rax
               	movq	%rax, 288(%r15)
               	movabsq	$17179869184, %rax      # imm = 0x400000000
               	movq	%rax, 80(%rsp)
               	movl	277349(%rip), %eax      # 0x466274 <state_global$kotlin.native.concurrent.FutureState>
               	cmpl	$2, %eax
               	je	0x422727 <kfun:#main(){}+0xd27>
               	leaq	277337(%rip), %rdi      # 0x466274 <state_global$kotlin.native.concurrent.FutureState>
               	leaq	-40114(%rip), %rsi      # 0x418a70 <kfun:kotlin.native.concurrent.FutureState.$init_global#internal>
               	callq	0x43c930 <CallInitGlobalPossiblyLock>
               	movslq	%r13d, %r15
               	movq	277231(%rip), %rdi      # 0x466220 <kvar:kotlin.native.concurrent.FutureState.$VALUES#internal>
               	leaq	88(%rsp), %rsi
               	callq	0x41b620 <kfun:kotlin.native.internal#valuesForEnum(kotlin.Array<0:0>){0§<kotlin.Enum<0:0>>}kotlin.Array<0:0>>
               	movq	%rax, 136(%rsp)
               	movq	%rax, 88(%rsp)
               	callq	0x43a480 <(anonymous namespace)::theState()>
               	movq	%rax, %r14
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbp
               	movl	$1, %ebx
               	xchgl	%ebx, 328(%rbp)
               	movq	%r14, %rdi
               	callq	0x413760 <pthread_mutex_lock@plt>
               	testq	%rbp, %rbp
               	je	0x4227a0 <kfun:#main(){}+0xda0>
               	addq	$328, %rbp              # imm = 0x148
               	movl	%ebx, %eax
               	xchgl	%eax, (%rbp)
               	testl	%ebx, %ebx
               	jne	0x4227a0 <kfun:#main(){}+0xda0>
               	cmpl	$1, %eax
               	jne	0x4227a0 <kfun:#main(){}+0xda0>
               	movb	281969(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4227a0 <kfun:#main(){}+0xda0>
               	movq	%rbp, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	nop
               	movq	96(%r14), %rdi
               	movq	%r15, %rax
               	orq	%rdi, %rax
               	shrq	$32, %rax
               	je	0x4227c0 <kfun:#main(){}+0xdc0>
               	movq	%r15, %rax
               	xorl	%edx, %edx
               	divq	%rdi
               	movq	%rdx, %rcx
               	jmp	0x4227c9 <kfun:#main(){}+0xdc9>
               	movl	%r13d, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	movl	%edx, %ecx
               	movq	88(%r14), %rax
               	movq	(%rax,%rcx,8), %rax
               	xorl	%r12d, %r12d
               	testq	%rax, %rax
               	je	0x4228f0 <kfun:#main(){}+0xef0>
               	movq	(%rax), %rbp
               	cmpl	%r13d, 8(%rbp)
               	jne	0x422804 <kfun:#main(){}+0xe04>
               	testq	%rbp, %rbp
               	jne	0x42283e <kfun:#main(){}+0xe3e>
               	jmp	0x4228f0 <kfun:#main(){}+0xef0>
               	movl	%esi, %eax
               	xorl	%edx, %edx
               	divl	%edi
               	cmpq	%rcx, %rdx
               	jne	0x4228f0 <kfun:#main(){}+0xef0>
               	cmpl	%r13d, %esi
               	je	0x422835 <kfun:#main(){}+0xe35>
               	movq	%rbp, %rbx
               	movq	(%rbp), %rbp
               	testq	%rbp, %rbp
               	je	0x4228f0 <kfun:#main(){}+0xef0>
               	movl	8(%rbp), %esi
               	movslq	%esi, %rax
               	movq	%rax, %rdx
               	orq	%rdi, %rdx
               	shrq	$32, %rdx
               	je	0x4227f0 <kfun:#main(){}+0xdf0>
               	xorl	%edx, %edx
               	divq	%rdi
               	cmpq	%rcx, %rdx
               	je	0x4227ff <kfun:#main(){}+0xdff>
               	jmp	0x4228f0 <kfun:#main(){}+0xef0>
               	testq	%rbx, %rbx
               	je	0x4228f0 <kfun:#main(){}+0xef0>
               	movq	16(%rbp), %r15
               	leaq	16(%r15), %rdi
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbp
               	movl	$1, %ebx
               	xchgl	%ebx, 328(%rbp)
               	movq	%rdi, 112(%rsp)
               	callq	0x413760 <pthread_mutex_lock@plt>
               	testq	%rbp, %rbp
               	je	0x4228a0 <kfun:#main(){}+0xea0>
               	addq	$328, %rbp              # imm = 0x148
               	movl	%ebx, %eax
               	xchgl	%eax, (%rbp)
               	testl	%ebx, %ebx
               	jne	0x4228a0 <kfun:#main(){}+0xea0>
               	cmpl	$1, %eax
               	jne	0x4228a0 <kfun:#main(){}+0xea0>
               	movb	281713(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4228a0 <kfun:#main(){}+0xea0>
               	movq	%rbp, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	nop
               	movl	(%r15), %r12d
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbp
               	movl	$1, %ebx
               	xchgl	%ebx, 328(%rbp)
               	movq	112(%rsp), %rdi
               	callq	0x413770 <pthread_mutex_unlock@plt>
               	testq	%rbp, %rbp
               	je	0x4228f0 <kfun:#main(){}+0xef0>
               	addq	$328, %rbp              # imm = 0x148
               	movl	%ebx, %eax
               	xchgl	%eax, (%rbp)
               	testl	%ebx, %ebx
               	jne	0x4228f0 <kfun:#main(){}+0xef0>
               	cmpl	$1, %eax
               	jne	0x4228f0 <kfun:#main(){}+0xef0>
               	movb	281628(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4228f0 <kfun:#main(){}+0xef0>
               	movq	%rbp, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %rbx
               	movl	$1, %ebp
               	xchgl	%ebp, 328(%rbx)
               	movq	%r14, %rdi
               	callq	0x413770 <pthread_mutex_unlock@plt>
               	testq	%rbx, %rbx
               	je	0x422940 <kfun:#main(){}+0xf40>
               	addq	$328, %rbx              # imm = 0x148
               	movl	%ebp, %eax
               	xchgl	%eax, (%rbx)
               	testl	%ebp, %ebp
               	jne	0x422940 <kfun:#main(){}+0xf40>
               	cmpl	$1, %eax
               	jne	0x422940 <kfun:#main(){}+0xf40>
               	movb	281554(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422940 <kfun:#main(){}+0xf40>
               	movq	%rbx, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	nop
               	movq	136(%rsp), %rcx
               	cmpl	%r12d, 8(%rcx)
               	movq	40(%rsp), %r15
               	jbe	0x4229c7 <kfun:#main(){}+0xfc7>
               	movslq	%r12d, %rax
               	movq	16(%rcx,%rax,8), %rax
               	movq	%rax, 224(%rsp)
               	movq	72(%rsp), %rcx
               	movq	%rcx, 288(%r15)
               	movl	16(%rax), %eax
               	leal	-1(%rax), %ecx
               	cmpl	$2, %ecx
               	movq	56(%rsp), %rbx
               	jae	0x4229cc <kfun:#main(){}+0xfcc>
               	movq	120(%rsp), %rbp
               	addq	$1, %rbp
               	movl	%r13d, %edi
               	leaq	232(%rsp), %rsi
               	callq	0x43ddc0 <Kotlin_Worker_consumeFuture>
               	cmpq	128(%rsp), %rbp
               	jne	0x4226b0 <kfun:#main(){}+0xcb0>
               	movq	376(%rsp), %rax
               	movq	%rax, 288(%r15)
               	addq	$408, %rsp              # imm = 0x198
               	popq	%rbx
               	popq	%r12
               	popq	%r13
               	popq	%r14
               	popq	%r15
               	popq	%rbp
               	retq
               	callq	0x41ac70 <ThrowArrayIndexOutOfBoundsException>
               	testl	%eax, %eax
               	je	0x422a42 <kfun:#main(){}+0x1042>
               	cmpl	$3, %eax
               	je	0x422a92 <kfun:#main(){}+0x1092>
               	cmpl	$4, %eax
               	jne	0x422af2 <kfun:#main(){}+0x10f2>
               	leaq	264(%rsp), %rsi
               	movl	%r13d, %edi
               	callq	0x43ddc0 <Kotlin_Worker_consumeFuture>
               	movq	40(%rsp), %rax
               	movq	296(%rax), %rdi
               	addq	$112, %rdi
               	movl	$56, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rbx
               	movq	$0, 8(%rax)
               	leaq	232289(%rip), %rcx      # 0x45b580 <ktypeglobal:kotlin.IllegalStateException#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rbx, 272(%rsp)
               	leaq	259566(%rip), %rsi      # 0x462020 <__unnamed_63>
               	movq	%rbx, %rdi
               	callq	0x415d50 <kfun:kotlin.RuntimeException#<init>(kotlin.String?){}>
               	movq	%rbx, %rdi
               	callq	0x43cb10 <ThrowException>
               	movq	40(%rsp), %rax
               	movq	296(%rax), %rdi
               	addq	$112, %rdi
               	movl	$56, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rbx
               	movq	$0, 8(%rax)
               	leaq	232209(%rip), %rcx      # 0x45b580 <ktypeglobal:kotlin.IllegalStateException#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rbx, 240(%rsp)
               	leaq	259342(%rip), %rsi      # 0x461f90 <__unnamed_31>
               	movq	%rbx, %rdi
               	callq	0x415d50 <kfun:kotlin.RuntimeException#<init>(kotlin.String?){}>
               	movq	%rbx, %rdi
               	callq	0x43cb10 <ThrowException>
               	leaq	248(%rsp), %rsi
               	movl	%r13d, %edi
               	callq	0x43ddc0 <Kotlin_Worker_consumeFuture>
               	movq	40(%rsp), %rax
               	movq	296(%rax), %rdi
               	addq	$112, %rdi
               	movl	$56, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rbx
               	movq	$0, 8(%rax)
               	leaq	232113(%rip), %rcx      # 0x45b580 <ktypeglobal:kotlin.IllegalStateException#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rbx, 256(%rsp)
               	leaq	259326(%rip), %rsi      # 0x461fe0 <__unnamed_64>
               	movq	%rbx, %rdi
               	callq	0x415d50 <kfun:kotlin.RuntimeException#<init>(kotlin.String?){}>
               	movq	%rbx, %rdi
               	callq	0x43cb10 <ThrowException>
               	callq	0x41b580 <kfun:kotlin.native.internal#ThrowNoWhenBranchMatchedException(){}kotlin.Nothing>
               	callq	0x418f40 <ThrowWorkerAlreadyTerminated>
               	movq	296(%rbx), %rdi
               	jmp	0x422b47 <kfun:#main(){}+0x1147>
               	movq	40(%rsp), %rax
               	movq	296(%rax), %rdi
               	addq	$112, %rdi
               	movl	$56, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rbx
               	movq	$0, 8(%rax)
               	leaq	231854(%rip), %rcx      # 0x45b4e0 <ktypeglobal:kotlin.IllegalArgumentException#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rbx, 192(%rsp)
               	jmp	0x422b74 <kfun:#main(){}+0x1174>
               	movq	296(%r15), %rdi
               	addq	$112, %rdi
               	movl	$56, %esi
               	callq	0x42a210 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
               	leaq	16(%rax), %rbx
               	movq	$0, 8(%rax)
               	leaq	231800(%rip), %rcx      # 0x45b4e0 <ktypeglobal:kotlin.IllegalArgumentException#internal>
               	movq	%rcx, 16(%rax)
               	movq	%rbx, 168(%rsp)
               	leaq	258229(%rip), %rsi      # 0x461c30 <__unnamed_54>
               	movq	%rbx, %rdi
               	callq	0x415d50 <kfun:kotlin.RuntimeException#<init>(kotlin.String?){}>
               	movq	%rbx, %rdi
               	callq	0x43cb10 <ThrowException>
               	jmp	0x422bde <kfun:#main(){}+0x11de>
               	movq	%rax, %rbx
               	movq	48(%rsp), %rax
               	movq	-64(%rax), %r15
               	movl	$1, %ebp
               	xchgl	%ebp, 328(%r15)
               	movq	%r14, %rdi
               	callq	0x413770 <pthread_mutex_unlock@plt>
               	testq	%r15, %r15
               	je	0x422be1 <kfun:#main(){}+0x11e1>
               	addq	$328, %r15              # imm = 0x148
               	movl	%ebp, %eax
               	xchgl	%eax, (%r15)
               	testl	%ebp, %ebp
               	jne	0x422be1 <kfun:#main(){}+0x11e1>
               	cmpl	$1, %eax
               	jne	0x422be1 <kfun:#main(){}+0x11e1>
               	movb	280880(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422be1 <kfun:#main(){}+0x11e1>
               	movq	%r15, %rdi
               	callq	0x426860 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
               	jmp	0x422be1 <kfun:#main(){}+0x11e1>
               	movq	%rax, %rbx
               	movq	296(%rsp), %rax
               	movq	40(%rsp), %rcx
               	movq	%rax, 288(%rcx)
               	movq	%rbx, %rdi
               	callq	0x413740 <_Unwind_Resume@plt>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280818(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422c17 <kfun:#main(){}+0x1217>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422c26 <kfun:#main(){}+0x1226>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	276027(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280754(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422c57 <kfun:#main(){}+0x1257>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422c66 <kfun:#main(){}+0x1266>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275963(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280690(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422c97 <kfun:#main(){}+0x1297>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422ca6 <kfun:#main(){}+0x12a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275899(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280626(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422cd7 <kfun:#main(){}+0x12d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422ce6 <kfun:#main(){}+0x12e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275835(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280562(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422d17 <kfun:#main(){}+0x1317>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422d26 <kfun:#main(){}+0x1326>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275771(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280498(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422d57 <kfun:#main(){}+0x1357>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422d66 <kfun:#main(){}+0x1366>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275707(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280434(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422d97 <kfun:#main(){}+0x1397>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422da6 <kfun:#main(){}+0x13a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275643(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280370(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422dd7 <kfun:#main(){}+0x13d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422de6 <kfun:#main(){}+0x13e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275579(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280306(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422e17 <kfun:#main(){}+0x1417>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422e26 <kfun:#main(){}+0x1426>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275515(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280242(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422e57 <kfun:#main(){}+0x1457>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422e66 <kfun:#main(){}+0x1466>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275451(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280178(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422e97 <kfun:#main(){}+0x1497>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422ea6 <kfun:#main(){}+0x14a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275387(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280114(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422ed7 <kfun:#main(){}+0x14d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422ee6 <kfun:#main(){}+0x14e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275323(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	280050(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422f17 <kfun:#main(){}+0x1517>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422f26 <kfun:#main(){}+0x1526>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275259(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279986(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422f57 <kfun:#main(){}+0x1557>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422f66 <kfun:#main(){}+0x1566>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275195(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279922(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422f97 <kfun:#main(){}+0x1597>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422fa6 <kfun:#main(){}+0x15a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275131(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279858(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x422fd7 <kfun:#main(){}+0x15d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x422fe6 <kfun:#main(){}+0x15e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275067(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279794(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423017 <kfun:#main(){}+0x1617>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423026 <kfun:#main(){}+0x1626>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	275003(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279730(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423057 <kfun:#main(){}+0x1657>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423066 <kfun:#main(){}+0x1666>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274939(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279666(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423097 <kfun:#main(){}+0x1697>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4230a6 <kfun:#main(){}+0x16a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274875(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279602(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4230d7 <kfun:#main(){}+0x16d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4230e6 <kfun:#main(){}+0x16e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274811(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279538(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423117 <kfun:#main(){}+0x1717>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423126 <kfun:#main(){}+0x1726>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274747(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279474(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423157 <kfun:#main(){}+0x1757>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423166 <kfun:#main(){}+0x1766>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274683(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279410(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423197 <kfun:#main(){}+0x1797>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4231a6 <kfun:#main(){}+0x17a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274619(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279346(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4231d7 <kfun:#main(){}+0x17d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4231e6 <kfun:#main(){}+0x17e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274555(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279282(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423217 <kfun:#main(){}+0x1817>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423226 <kfun:#main(){}+0x1826>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274491(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279218(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423257 <kfun:#main(){}+0x1857>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423266 <kfun:#main(){}+0x1866>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274427(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279154(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423297 <kfun:#main(){}+0x1897>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4232a6 <kfun:#main(){}+0x18a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274363(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279090(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4232d7 <kfun:#main(){}+0x18d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4232e6 <kfun:#main(){}+0x18e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274299(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	279026(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423317 <kfun:#main(){}+0x1917>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423326 <kfun:#main(){}+0x1926>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274235(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278962(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423357 <kfun:#main(){}+0x1957>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423366 <kfun:#main(){}+0x1966>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274171(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278898(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423397 <kfun:#main(){}+0x1997>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4233a6 <kfun:#main(){}+0x19a6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274107(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278834(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4233d7 <kfun:#main(){}+0x19d7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4233e6 <kfun:#main(){}+0x19e6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	274043(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278770(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423417 <kfun:#main(){}+0x1a17>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423426 <kfun:#main(){}+0x1a26>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273979(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278706(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423457 <kfun:#main(){}+0x1a57>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423466 <kfun:#main(){}+0x1a66>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273915(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278642(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423497 <kfun:#main(){}+0x1a97>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4234a6 <kfun:#main(){}+0x1aa6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273851(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278578(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4234d7 <kfun:#main(){}+0x1ad7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4234e6 <kfun:#main(){}+0x1ae6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273787(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278514(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423517 <kfun:#main(){}+0x1b17>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423526 <kfun:#main(){}+0x1b26>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273723(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278450(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423557 <kfun:#main(){}+0x1b57>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423566 <kfun:#main(){}+0x1b66>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273659(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278386(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423597 <kfun:#main(){}+0x1b97>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4235a6 <kfun:#main(){}+0x1ba6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273595(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278322(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4235d7 <kfun:#main(){}+0x1bd7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4235e6 <kfun:#main(){}+0x1be6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273531(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	278257(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423618 <kfun:#main(){}+0x1c18>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423644 <kfun:#main(){}+0x1c44>
               	testl	%ebx, %ebx
               	je	0x42364c <kfun:#main(){}+0x1c4c>
               	movq	$0, 273377(%rip)        # 0x466210 <kvar:kotlin.native.MemoryModel.$VALUES#internal>
               	movq	$0, 273374(%rip)        # 0x466218 <kvar:kotlin.native.MemoryModel.$ENTRIES#internal>
               	movl	$0, 273452(%rip)        # 0x466270 <state_global$kotlin.native.MemoryModel>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	273429(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278146(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423687 <kfun:#main(){}+0x1c87>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423696 <kfun:#main(){}+0x1c96>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273355(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278082(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4236c7 <kfun:#main(){}+0x1cc7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4236d6 <kfun:#main(){}+0x1cd6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273291(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	278018(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423707 <kfun:#main(){}+0x1d07>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423716 <kfun:#main(){}+0x1d16>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	273227(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277953(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423748 <kfun:#main(){}+0x1d48>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423774 <kfun:#main(){}+0x1d74>
               	testl	%ebx, %ebx
               	je	0x42377c <kfun:#main(){}+0x1d7c>
               	movq	$0, 273089(%rip)        # 0x466220 <kvar:kotlin.native.concurrent.FutureState.$VALUES#internal>
               	movq	$0, 273086(%rip)        # 0x466228 <kvar:kotlin.native.concurrent.FutureState.$ENTRIES#internal>
               	movl	$0, 273152(%rip)        # 0x466274 <state_global$kotlin.native.concurrent.FutureState>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	273125(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	(%rax,%rax)
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277841(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4237b8 <kfun:#main(){}+0x1db8>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x4237d9 <kfun:#main(){}+0x1dd9>
               	testl	%ebx, %ebx
               	je	0x4237e1 <kfun:#main(){}+0x1de1>
               	movq	$0, 272993(%rip)        # 0x466230 <kvar:kotlin.native.concurrent.UNINITIALIZED.$instance#internal>
               	movl	$0, 273055(%rip)        # 0x466278 <state_global$kotlin.native.concurrent.UNINITIALIZED>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	273024(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277745(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423818 <kfun:#main(){}+0x1e18>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423839 <kfun:#main(){}+0x1e39>
               	testl	%ebx, %ebx
               	je	0x423841 <kfun:#main(){}+0x1e41>
               	movq	$0, 272905(%rip)        # 0x466238 <kvar:kotlin.native.concurrent.INITIALIZING.$instance#internal>
               	movl	$0, 272963(%rip)        # 0x46627c <state_global$kotlin.native.concurrent.INITIALIZING>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	272928(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	277650(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423877 <kfun:#main(){}+0x1e77>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423886 <kfun:#main(){}+0x1e86>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272859(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277585(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4238b8 <kfun:#main(){}+0x1eb8>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x4238e4 <kfun:#main(){}+0x1ee4>
               	testl	%ebx, %ebx
               	je	0x4238ec <kfun:#main(){}+0x1eec>
               	movq	$0, 272753(%rip)        # 0x466240 <kvar:kotlin.native.concurrent.TransferMode.$VALUES#internal>
               	movq	$0, 272750(%rip)        # 0x466248 <kvar:kotlin.native.concurrent.TransferMode.$ENTRIES#internal>
               	movl	$0, 272796(%rip)        # 0x466280 <state_global$kotlin.native.concurrent.TransferMode>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	272757(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	(%rax,%rax)
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277473(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423928 <kfun:#main(){}+0x1f28>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x42393f <kfun:#main(){}+0x1f3f>
               	testl	%ebx, %ebx
               	je	0x423947 <kfun:#main(){}+0x1f47>
               	movq	$0, 264657(%rip)        # 0x464310 <kvar:kotlin.native.concurrent.Worker.$companion#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	272666(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	277378(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423987 <kfun:#main(){}+0x1f87>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423996 <kfun:#main(){}+0x1f96>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272587(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	277314(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4239c7 <kfun:#main(){}+0x1fc7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4239d6 <kfun:#main(){}+0x1fd6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272523(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277249(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423a08 <kfun:#main(){}+0x2008>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423a29 <kfun:#main(){}+0x2029>
               	testl	%ebx, %ebx
               	je	0x423a31 <kfun:#main(){}+0x2031>
               	movq	$0, 272433(%rip)        # 0x466250 <kvar:kotlin.native.internal.NativePtr.$companion#internal>
               	movl	$0, 272475(%rip)        # 0x466284 <state_global$kotlin.native.internal.NativePtr>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	272432(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	277154(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423a67 <kfun:#main(){}+0x2067>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423a76 <kfun:#main(){}+0x2076>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272363(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	277090(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423aa7 <kfun:#main(){}+0x20a7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423ab6 <kfun:#main(){}+0x20b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272299(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	277025(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423ae8 <kfun:#main(){}+0x20e8>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423b09 <kfun:#main(){}+0x2109>
               	testl	%ebx, %ebx
               	je	0x423b11 <kfun:#main(){}+0x2111>
               	movq	$0, 272217(%rip)        # 0x466258 <kvar:kotlin.native.internal.UnhandledExceptionHookHolder.$instance#internal>
               	movl	$0, 272255(%rip)        # 0x466288 <state_global$kotlin.native.internal.UnhandledExceptionHookHolder>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	272208(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276930(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423b47 <kfun:#main(){}+0x2147>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423b56 <kfun:#main(){}+0x2156>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272139(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276866(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423b87 <kfun:#main(){}+0x2187>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423b96 <kfun:#main(){}+0x2196>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272075(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276802(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423bc7 <kfun:#main(){}+0x21c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423bd6 <kfun:#main(){}+0x21d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	272011(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276738(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423c07 <kfun:#main(){}+0x2207>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423c16 <kfun:#main(){}+0x2216>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271947(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276674(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423c47 <kfun:#main(){}+0x2247>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423c56 <kfun:#main(){}+0x2256>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271883(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276610(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423c87 <kfun:#main(){}+0x2287>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423c96 <kfun:#main(){}+0x2296>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271819(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276546(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423cc7 <kfun:#main(){}+0x22c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423cd6 <kfun:#main(){}+0x22d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271755(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276482(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423d07 <kfun:#main(){}+0x2307>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423d16 <kfun:#main(){}+0x2316>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271691(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276418(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423d47 <kfun:#main(){}+0x2347>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423d56 <kfun:#main(){}+0x2356>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271627(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276354(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423d87 <kfun:#main(){}+0x2387>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423d96 <kfun:#main(){}+0x2396>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271563(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276290(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423dc7 <kfun:#main(){}+0x23c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423dd6 <kfun:#main(){}+0x23d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271499(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276226(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423e07 <kfun:#main(){}+0x2407>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423e16 <kfun:#main(){}+0x2416>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271435(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276162(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423e47 <kfun:#main(){}+0x2447>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423e56 <kfun:#main(){}+0x2456>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271371(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	276098(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423e87 <kfun:#main(){}+0x2487>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423e96 <kfun:#main(){}+0x2496>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271307(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	276033(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423ec8 <kfun:#main(){}+0x24c8>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423edf <kfun:#main(){}+0x24df>
               	testl	%ebx, %ebx
               	je	0x423ee7 <kfun:#main(){}+0x24e7>
               	movq	$0, 263225(%rip)        # 0x464318 <kvar:kotlin.collections.EmptyIterator.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	271226(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275938(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423f27 <kfun:#main(){}+0x2527>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423f36 <kfun:#main(){}+0x2536>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	271147(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	275873(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423f68 <kfun:#main(){}+0x2568>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x423f7f <kfun:#main(){}+0x257f>
               	testl	%ebx, %ebx
               	je	0x423f87 <kfun:#main(){}+0x2587>
               	movq	$0, 263073(%rip)        # 0x464320 <kvar:kotlin.collections.EmptySet.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	271066(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275778(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x423fc7 <kfun:#main(){}+0x25c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x423fd6 <kfun:#main(){}+0x25d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270987(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275714(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424007 <kfun:#main(){}+0x2607>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424016 <kfun:#main(){}+0x2616>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270923(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	275649(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424048 <kfun:#main(){}+0x2648>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x42405f <kfun:#main(){}+0x265f>
               	testl	%ebx, %ebx
               	je	0x424067 <kfun:#main(){}+0x2667>
               	movq	$0, 262857(%rip)        # 0x464328 <kvar:kotlin.coroutines.EmptyCoroutineContext.$instance#internal>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	270842(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopw	%cs:(%rax,%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275554(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4240a7 <kfun:#main(){}+0x26a7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4240b6 <kfun:#main(){}+0x26b6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270763(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275490(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4240e7 <kfun:#main(){}+0x26e7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4240f6 <kfun:#main(){}+0x26f6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270699(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%r14
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %r14
               	movl	%edi, %ebx
               	movb	275425(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424128 <kfun:#main(){}+0x2728>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	leal	-1(%rbx), %eax
               	cmpl	$2, %eax
               	jb	0x424149 <kfun:#main(){}+0x2749>
               	testl	%ebx, %ebx
               	je	0x424151 <kfun:#main(){}+0x2751>
               	movq	$0, 270625(%rip)        # 0x466260 <kvar:kotlin.ranges.IntRange.$companion#internal>
               	movl	$0, 270659(%rip)        # 0x46628c <state_global$kotlin.ranges.IntRange>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	retq
               	leaq	270608(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%r14, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%r14
               	jmp	0x426ca0 <AddTLSRecord>
               	nopl	(%rax)
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275330(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424187 <kfun:#main(){}+0x2787>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424196 <kfun:#main(){}+0x2796>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270539(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275266(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4241c7 <kfun:#main(){}+0x27c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4241d6 <kfun:#main(){}+0x27d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270475(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275202(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424207 <kfun:#main(){}+0x2807>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424216 <kfun:#main(){}+0x2816>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270411(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275138(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424247 <kfun:#main(){}+0x2847>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424256 <kfun:#main(){}+0x2856>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270347(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275074(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424287 <kfun:#main(){}+0x2887>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424296 <kfun:#main(){}+0x2896>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270283(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	275010(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4242c7 <kfun:#main(){}+0x28c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4242d6 <kfun:#main(){}+0x28d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270219(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274946(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424307 <kfun:#main(){}+0x2907>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424316 <kfun:#main(){}+0x2916>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270155(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274882(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424347 <kfun:#main(){}+0x2947>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424356 <kfun:#main(){}+0x2956>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270091(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274818(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424387 <kfun:#main(){}+0x2987>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424396 <kfun:#main(){}+0x2996>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	270027(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274754(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4243c7 <kfun:#main(){}+0x29c7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4243d6 <kfun:#main(){}+0x29d6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269963(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274690(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424407 <kfun:#main(){}+0x2a07>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424416 <kfun:#main(){}+0x2a16>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269899(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274626(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424447 <kfun:#main(){}+0x2a47>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424456 <kfun:#main(){}+0x2a56>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269835(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274562(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424487 <kfun:#main(){}+0x2a87>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424496 <kfun:#main(){}+0x2a96>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269771(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274498(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4244c7 <kfun:#main(){}+0x2ac7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4244d6 <kfun:#main(){}+0x2ad6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269707(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274434(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424507 <kfun:#main(){}+0x2b07>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424516 <kfun:#main(){}+0x2b16>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269643(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274370(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424547 <kfun:#main(){}+0x2b47>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424556 <kfun:#main(){}+0x2b56>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269579(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274306(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x424587 <kfun:#main(){}+0x2b87>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x424596 <kfun:#main(){}+0x2b96>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269515(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>
               	pushq	%rbp
               	pushq	%rbx
               	pushq	%rax
               	movq	%rsi, %rbx
               	movl	%edi, %ebp
               	movb	274242(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
               	testb	$1, %al
               	je	0x4245c7 <kfun:#main(){}+0x2bc7>
               	callq	0x426a50 <kotlin::mm::SuspendIfRequestedSlowPath()>
               	addl	$-1, %ebp
               	cmpl	$3, %ebp
               	jae	0x4245d6 <kfun:#main(){}+0x2bd6>
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	retq
               	leaq	269451(%rip), %rsi      # 0x466268 <__KonanTlsKey>
               	movq	%rbx, %rdi
               	movl	$3, %edx
               	addq	$8, %rsp
               	popq	%rbx
               	popq	%rbp
               	jmp	0x426ca0 <AddTLSRecord>

