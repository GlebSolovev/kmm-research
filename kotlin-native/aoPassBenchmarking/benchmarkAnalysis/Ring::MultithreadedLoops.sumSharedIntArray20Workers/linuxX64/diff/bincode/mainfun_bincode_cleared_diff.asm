--- ../../benchmarkAnalysis/Ring::MultithreadedLoops.sumSharedIntArray20Workers/linuxX64/baseline/bincode/mainfun_bincode.asm	2023-07-19 02:52:17.900560486 +0200
+++ ../../benchmarkAnalysis/Ring::MultithreadedLoops.sumSharedIntArray20Workers/linuxX64/unordered/bincode/mainfun_bincode.asm	2023-07-19 03:03:50.630346681 +0200

@@ -44,76 +44,80 @@
@@@[(3, 4), (5, 9), (11, 13), (14, 17), (25, 27), (29, 37), (49, 55), (58, 64), (67, 71), (75, 83), (88, 94)]@@@
-               	movq	%rax, 136(%rsp)
@@@@
+               	movq	%rax, 112(%rsp)
+               	movl	44(%rax), %r15d
+               	testl	%r15d, %r15d
+               	js	0x422a0f <kfun:#main(){}+0x103f>
@@@@
+               	leaq	31(,%r15,4), %rsi
+               	andq	$-8, %rsi
@@@@
-               	movl	$40024, %esi            # imm = 0x9C58
-               	callq	0x4298d0 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
+               	callq	0x42a120 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
@@@@
-               	movl	$10000, 24(%rbx)        # imm = 0x2710
+               	movl	%r15d, 24(%rbx)
@@@@
-               	cmpq	$10000, %rbp            # imm = 0x2710
-               	je	0x421971 <kfun:#main(){}+0x1b1>
-               	nopl	(%rax)
-               	movzbl	283697(%rip), %eax      # 0x466d78 <kotlin::mm::internal::gSuspensionRequested>
+               	cmpq	%rbp, %r15
+               	je	0x421b7d <kfun:#main(){}+0x1ad>
+               	nop
+               	movzbl	285097(%rip), %eax      # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
@@@@
-               	cmpq	$10000, %rbp            # imm = 0x2710
-               	jne	0x421940 <kfun:#main(){}+0x180>
-               	movq	136(%rsp), %rax
+               	cmpq	%rbp, %r15
+               	jne	0x421b50 <kfun:#main(){}+0x180>
+               	movq	112(%rsp), %rax
@@@@
-               	js	0x4227c4 <kfun:#main(){}+0x1004>
-               	movq	48(%rsp), %rbp
-               	movq	296(%rbp), %rdi
+               	js	0x422a14 <kfun:#main(){}+0x1044>
+               	movq	48(%rsp), %r15
+               	movq	296(%r15), %rdi
@@@@
-               	callq	0x4298d0 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
-               	movq	%rax, %r15
+               	callq	0x42a120 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
+               	movq	%rax, %rbp
@@@@
-               	leaq	232840(%rip), %rax      # 0x45a750 <ktypeglobal:kotlin.Array#internal>
-               	movq	%rax, 16(%r15)
-               	movl	%r14d, 24(%r15)
-               	movq	%rcx, 64(%rsp)
+               	leaq	234239(%rip), %rax      # 0x45aed0 <ktypeglobal:kotlin.Array#internal>
+               	movq	%rax, 16(%rbp)
+               	movl	%r14d, 24(%rbp)
+               	movq	%rcx, 120(%rsp)
@@@@
-               	je	0x421b44 <kfun:#main(){}+0x384>
-               	nop
-               	movzbl	283521(%rip), %eax      # 0x466d78 <kotlin::mm::internal::gSuspensionRequested>
+               	je	0x421d63 <kfun:#main(){}+0x393>
+               	nopw	(%rax,%rax)
+               	movzbl	284921(%rip), %eax      # 0x467500 <kotlin::mm::internal::gSuspensionRequested>

@@ -122,64 +126,65 @@
@@@[(28, 35), (37, 38), (39, 48), (49, 53), (66, 72), (73, 79), (89, 90), (91, 92)]@@@
-               	movq	48(%rsp), %rbp
-               	movq	120(%rsp), %r14
-               	jmp	0x421aa5 <kfun:#main(){}+0x2e5>
+               	movq	48(%rsp), %r15
+               	movq	144(%rsp), %r14
+               	jmp	0x421cc5 <kfun:#main(){}+0x2f5>
+               	nopw	%cs:(%rax,%rax)
@@@@
-               	movaps	%xmm0, 96(%rsp)
@@@@
-               	movq	288(%rbp), %rax
-               	movq	%rax, 88(%rsp)
-               	leaq	80(%rsp), %rax
-               	movq	%rax, 288(%rbp)
+               	movaps	%xmm0, 64(%rsp)
+               	movq	288(%r15), %rax
+               	movq	%rax, 72(%rsp)
+               	leaq	64(%rsp), %rax
+               	movq	%rax, 288(%r15)
@@@@
-               	movq	%rax, 96(%rsp)
-               	movq	296(%rbp), %rdi
+               	movq	%rax, 80(%rsp)
+               	movq	296(%r15), %rdi
@@@@
-               	movq	88(%rsp), %rax
-               	movq	%rax, 288(%rbp)
-               	movl	24(%r15), %eax
+               	movq	72(%rsp), %rax
+               	movq	%rax, 288(%r15)
+               	movl	24(%rbp), %eax
@@@@
-               	jae	0x42268f <kfun:#main(){}+0xecf>
-               	movq	16(%r15), %rax
-               	movq	%rcx, 32(%r15,%r13,8)
+               	jae	0x4228da <kfun:#main(){}+0xf0a>
+               	movq	16(%rbp), %rax
+               	movq	%rcx, 32(%rbp,%r13,8)
@@@@
+               	movq	%rax, 288(%r15)
@@@@
-               	movaps	%xmm0, 160(%rsp)

@@ -187,167 +192,169 @@
@@@[(3, 4), (5, 6), (8, 10), (12, 22), (25, 29), (31, 41), (43, 56), (70, 74), (87, 89), (105, 107), (109, 111), (114, 117), (123, 127), (128, 136), (137, 151), (157, 169), (171, 175), (178, 182), (185, 187), (193, 197), (207, 213), (216, 230), (238, 242), (249, 251), (252, 254)]@@@
+               	movaps	%xmm0, 160(%rsp)
@@@@
+               	movq	288(%r15), %rax
@@@@
-               	movq	%rax, 288(%rbp)
+               	movq	%rax, 288(%r15)
@@@@
-               	movl	40(%rcx), %ebx
-               	testl	%ebx, %ebx
-               	js	0x4227ff <kfun:#main(){}+0x103f>
-               	movq	296(%rbp), %rdi
-               	leaq	31(,%rbx,8), %rsi
+               	movl	40(%rcx), %r14d
+               	testl	%r14d, %r14d
+               	js	0x422a4f <kfun:#main(){}+0x107f>
+               	movq	296(%r15), %rdi
+               	leaq	31(,%r14,8), %rsi
@@@@
-               	callq	0x4298d0 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
-               	movq	%rax, %r12
+               	callq	0x42a120 <kotlin::mm::internal::ObjectFactoryStorage<8ul, kotlin::gc::AllocatorWithGC<kotlin::gc::Allocator, kotlin::gc::ConcurrentMarkAndSweep::ThreadData> >::Producer::Insert(unsigned long)>
+               	movq	%rax, %rbx
@@@@
-               	movups	%xmm0, 8(%r12)
-               	movq	$0, 24(%r12)
-               	leaq	232235(%rip), %rcx      # 0x45a750 <ktypeglobal:kotlin.Array#internal>
-               	movq	%rcx, 16(%r12)
-               	movl	%ebx, 24(%r12)
+               	movups	%xmm0, 8(%rbx)
+               	movq	$0, 24(%rbx)
+               	leaq	233602(%rip), %rcx      # 0x45aed0 <ktypeglobal:kotlin.Array#internal>
+               	movq	%rcx, 16(%rbx)
+               	movl	%r14d, 24(%rbx)
@@@@
-               	movq	%r12, 152(%rsp)
-               	movq	%rbx, 352(%rsp)
-               	cmpq	%rbx, %r13
-               	je	0x422348 <kfun:#main(){}+0xb88>
-               	nopw	%cs:(%rax,%rax)
-               	nopl	(%rax)
-               	movb	282898(%rip), %al       # 0x466d78 <kotlin::mm::internal::gSuspensionRequested>
+               	movq	%rbx, 144(%rsp)
+               	movq	%r14, 352(%rsp)
+               	cmpq	%r14, %r13
+               	je	0x422592 <kfun:#main(){}+0xbc2>
+               	nopw	(%rax,%rax)
+               	movb	284282(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
@@@@
-               	movslq	8(%rax), %r15
-               	movl	278114(%rip), %eax      # 0x465b00 <state_global$kotlin.native.concurrent.TransferMode>
+               	movl	8(%rax), %r14d
+               	movl	279493(%rip), %eax      # 0x466280 <state_global$kotlin.native.concurrent.TransferMode>
@@@@
-               	movq	296(%rbp), %rdi
+               	movq	296(%r15), %rdi
@@@@
-               	movq	288(%rbp), %rax
+               	movq	288(%r15), %rax
@@@@
-               	movq	%rax, 288(%rbp)
+               	movq	%rax, 288(%r15)
@@@@
-               	callq	0x418f90 <WorkerLaunchpad>
+               	callq	0x4190e0 <WorkerLaunchpad>
+               	movslq	%r14d, %r12
@@@@
-               	callq	0x4396b0 <(anonymous namespace)::theState()>
-               	movq	%rax, %r14
+               	callq	0x43a390 <(anonymous namespace)::theState()>
+               	movq	%rax, %r15
@@@@
-               	movq	-64(%rax), %rbp
-               	movl	$1, %ebx
-               	xchgl	%ebx, 328(%rbp)
-               	movq	%r14, %rdi
+               	movq	-64(%rax), %rbx
+               	movl	$1, %ebp
+               	xchgl	%ebp, 328(%rbx)
+               	movq	%r15, %rdi
@@@@
-               	testq	%rbp, %rbp
-               	je	0x421dd0 <kfun:#main(){}+0x610>
-               	addq	$328, %rbp              # imm = 0x148
-               	movl	%ebx, %eax
-               	xchgl	%eax, (%rbp)
-               	testl	%ebx, %ebx
-               	jne	0x421dd0 <kfun:#main(){}+0x610>
+               	testq	%rbx, %rbx
+               	je	0x421ff0 <kfun:#main(){}+0x620>
+               	addq	$328, %rbx              # imm = 0x148
+               	movl	%ebp, %eax
+               	xchgl	%eax, (%rbx)
+               	testl	%ebp, %ebp
+               	jne	0x421ff0 <kfun:#main(){}+0x620>
@@@@
-               	je	0x421dd0 <kfun:#main(){}+0x610>
-               	movq	%rbp, %rdi
-               	callq	0x426110 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
-               	nopl	(%rax)
-               	movq	152(%r14), %rdi
-               	movq	%r15, %rax
+               	je	0x421ff0 <kfun:#main(){}+0x620>
+               	movq	%rbx, %rdi
+               	callq	0x426770 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
+               	nop
+               	movq	152(%r15), %rdi
+               	movq	%r12, %rax
@@@@
-               	je	0x421df0 <kfun:#main(){}+0x630>
-               	movq	%r15, %rax
+               	je	0x422010 <kfun:#main(){}+0x640>
+               	movq	%r12, %rax
@@@@
-               	jmp	0x421df9 <kfun:#main(){}+0x639>
-               	movl	%r15d, %eax
+               	jmp	0x422019 <kfun:#main(){}+0x649>
+               	movl	%r14d, %eax
@@@@
-               	movq	144(%r14), %rax
+               	movq	144(%r15), %rax
@@@@
-               	cmpl	%r15d, 8(%rbp)
-               	jne	0x421e44 <kfun:#main(){}+0x684>
+               	cmpl	%r14d, 8(%rbp)
+               	jne	0x422064 <kfun:#main(){}+0x694>
@@@@
-               	jne	0x421f20 <kfun:#main(){}+0x760>
-               	cmpl	%r15d, %esi
-               	je	0x421e76 <kfun:#main(){}+0x6b6>
+               	jne	0x422140 <kfun:#main(){}+0x770>
+               	cmpl	%r14d, %esi
+               	je	0x422095 <kfun:#main(){}+0x6c5>
@@@@
-               	je	0x421f20 <kfun:#main(){}+0x760>
-               	movslq	8(%rbp), %rsi
-               	movq	%rsi, %rax
-               	orq	%rdi, %rax
-               	shrq	$32, %rax
-               	je	0x421e30 <kfun:#main(){}+0x670>
-               	movq	%rsi, %rax
+               	je	0x422140 <kfun:#main(){}+0x770>
+               	movl	8(%rbp), %esi
+               	movslq	%esi, %rax
+               	movq	%rax, %rdx
+               	orq	%rdi, %rdx
+               	shrq	$32, %rdx
+               	je	0x422050 <kfun:#main(){}+0x680>
@@@@
-               	je	0x421f20 <kfun:#main(){}+0x760>
-               	movq	16(%rbp), %r15
+               	je	0x422140 <kfun:#main(){}+0x770>
+               	movq	16(%rbp), %r12
@@@@
-               	movl	260(%r14), %eax
+               	movl	260(%r15), %eax
@@@@
-               	movl	%ecx, 260(%r14)
+               	movl	%ecx, 260(%r15)

@@ -362,105 +369,104 @@
@@@[(29, 35), (43, 49), (50, 56), (58, 64), (65, 80), (83, 111), (113, 119), (120, 130), (132, 133), (134, 137), (138, 146), (150, 161), (162, 163)]@@@
-               	movl	4(%r13), %r8d
-               	movslq	%r8d, %rax
-               	movq	96(%r14), %rdi
+               	movl	4(%r13), %ebx
+               	movslq	%ebx, %rax
+               	movq	96(%r15), %rdi
@@@@
-               	movq	%rdx, %rbp
-               	movq	88(%r14), %rax
-               	movq	(%rax,%rbp,8), %rax
+               	movq	%rdx, %r14
+               	movq	88(%r15), %rax
+               	movq	(%rax,%r14,8), %rax
@@@@
-               	jne	0x421f77 <kfun:#main(){}+0x7b7>
-               	jmp	0x421fdc <kfun:#main(){}+0x81c>
-               	movl	%r8d, %eax
+               	jne	0x42219a <kfun:#main(){}+0x7ca>
+               	jmp	0x422206 <kfun:#main(){}+0x836>
+               	movl	%ebx, %eax
@@@@
-               	movl	%edx, %ebp
-               	movq	88(%r14), %rax
-               	movq	(%rax,%rbp,8), %rax
+               	movl	%edx, %r14d
+               	movq	88(%r15), %rax
+               	movq	(%rax,%r14,8), %rax
@@@@
-               	je	0x421fdc <kfun:#main(){}+0x81c>
-               	movq	(%rax), %rbx
-               	cmpl	8(%rbx), %r8d
-               	jne	0x421fa0 <kfun:#main(){}+0x7e0>
-               	testq	%rbx, %rbx
-               	jne	0x421fcf <kfun:#main(){}+0x80f>
-               	jmp	0x421fdc <kfun:#main(){}+0x81c>
-               	nop
+               	je	0x422206 <kfun:#main(){}+0x836>
+               	movq	(%rax), %rbp
+               	cmpl	8(%rbp), %ebx
+               	jne	0x4221bf <kfun:#main(){}+0x7ef>
+               	testq	%rbp, %rbp
+               	jne	0x4221ee <kfun:#main(){}+0x81e>
+               	jmp	0x422206 <kfun:#main(){}+0x836>
@@@@
-               	cmpq	%rbp, %rdx
-               	jne	0x421fdc <kfun:#main(){}+0x81c>
-               	cmpl	%ecx, %r8d
-               	je	0x421fca <kfun:#main(){}+0x80a>
-               	movq	%rbx, %rsi
-               	movq	(%rbx), %rbx
-               	testq	%rbx, %rbx
-               	je	0x421fdc <kfun:#main(){}+0x81c>
-               	movslq	8(%rbx), %rcx
-               	movq	%rcx, %rax
-               	orq	%rdi, %rax
-               	shrq	$32, %rax
-               	je	0x421f90 <kfun:#main(){}+0x7d0>
-               	movq	%rcx, %rax
+               	cmpq	%r14, %rdx
+               	jne	0x422206 <kfun:#main(){}+0x836>
+               	cmpl	%ecx, %ebx
+               	je	0x4221e9 <kfun:#main(){}+0x819>
+               	movq	%rbp, %rsi
+               	movq	(%rbp), %rbp
+               	testq	%rbp, %rbp
+               	je	0x422206 <kfun:#main(){}+0x836>
+               	movl	8(%rbp), %ecx
+               	movslq	%ecx, %rax
+               	movq	%rax, %rdx
+               	orq	%rdi, %rdx
+               	shrq	$32, %rdx
+               	je	0x4221b0 <kfun:#main(){}+0x7e0>
@@@@
-               	cmpq	%rbp, %rdx
-               	je	0x421f9b <kfun:#main(){}+0x7db>
-               	jmp	0x421fdc <kfun:#main(){}+0x81c>
+               	cmpq	%r14, %rdx
+               	je	0x4221bb <kfun:#main(){}+0x7eb>
+               	jmp	0x422206 <kfun:#main(){}+0x836>
@@@@
-               	je	0x421fdc <kfun:#main(){}+0x81c>
-               	addq	$8, %rbx
-               	movl	64(%rsp), %edi
-               	jmp	0x4221c0 <kfun:#main(){}+0xa00>
-               	movq	%r15, 344(%rsp)
+               	je	0x422206 <kfun:#main(){}+0x836>
+               	addq	$8, %rbp
+               	movl	136(%rsp), %ecx
+               	movq	128(%rsp), %rdx
+               	jmp	0x422400 <kfun:#main(){}+0xa30>
@@@@
-               	movl	%r8d, %ebx
@@@@
-               	movl	%ebx, 76(%rsp)
-               	movq	%rax, 128(%rsp)
+               	movl	%ebx, 156(%rsp)
@@@@
-               	leaq	120(%r14), %rdi
-               	movq	96(%r14), %rsi
-               	movq	112(%r14), %rdx
+               	movq	%rax, %rbx
+               	leaq	120(%r15), %rdi
+               	movq	96(%r15), %rsi
+               	movq	%r15, 40(%rsp)
+               	movq	112(%r15), %rdx
@@@@
-               	jne	0x422037 <kfun:#main(){}+0x877>
-               	movq	88(%r14), %r12
-               	movl	64(%rsp), %edi
-               	movq	128(%rsp), %rcx
-               	movq	%rbp, %rsi
-               	jmp	0x422149 <kfun:#main(){}+0x989>
+               	movq	%r12, 344(%rsp)
+               	jne	0x422257 <kfun:#main(){}+0x887>
+               	movq	40(%rsp), %r15
+               	movq	88(%r15), %r12
+               	jmp	0x422374 <kfun:#main(){}+0x9a4>
@@@@
+               	movq	%rbx, %r14

@@ -469,338 +475,348 @@
@@@[(3, 21), (28, 30), (31, 50), (52, 55), (59, 82), (83, 93), (97, 100), (102, 108), (110, 121), (122, 125), (126, 145), (146, 157), (158, 161), (162, 166), (167, 200), (207, 211), (215, 217), (240, 244), (246, 248), (249, 250), (251, 260), (261, 265), (278, 285), (287, 293), (294, 313), (314, 322), (323, 326), (327, 334), (335, 337), (338, 339), (340, 349), (355, 376), (378, 384), (386, 400), (406, 414), (415, 417), (419, 424), (427, 432), (437, 439), (440, 454), (458, 484), (487, 497), (499, 507), (508, 522), (528, 538), (539, 547), (548, 562), (568, 575)]@@@
-               	movl	76(%rsp), %r8d
-               	movq	104(%r14), %rbx
-               	movq	$0, 104(%r14)
-               	testq	%rbx, %rbx
-               	je	0x4220f3 <kfun:#main(){}+0x933>
-               	leaq	104(%r14), %rsi
-               	xorl	%edi, %edi
-               	jmp	0x4220b6 <kfun:#main(){}+0x8f6>
-               	nopl	(%rax,%rax)
+               	movq	40(%rsp), %rax
+               	movq	104(%rax), %rbp
+               	movq	$0, 104(%rax)
+               	testq	%rbp, %rbp
+               	je	0x422319 <kfun:#main(){}+0x949>
+               	movq	40(%rsp), %rax
+               	leaq	104(%rax), %rdi
+               	xorl	%ebx, %ebx
+               	jmp	0x4222d6 <kfun:#main(){}+0x906>
@@@@
-               	movq	%rax, (%rcx)
+               	movq	%rax, (%rsi)
@@@@
-               	movq	%rcx, (%rax)
-               	movq	%rdi, %rdx
-               	movq	%rdx, %rdi
-               	testq	%rbx, %rbx
-               	je	0x4220f3 <kfun:#main(){}+0x933>
-               	movq	%rbx, %rcx
-               	movq	(%rbx), %rbx
-               	movslq	8(%rcx), %rax
-               	movq	%rax, %rdx
+               	movq	%rsi, (%rax)
+               	movq	%rbx, %rdx
+               	movq	%rdx, %rbx
+               	testq	%rbp, %rbp
+               	je	0x422319 <kfun:#main(){}+0x949>
+               	movq	%rbp, %rsi
+               	movq	(%rbp), %rbp
+               	movl	8(%rsi), %eax
+               	movslq	%eax, %rcx
+               	movq	%rcx, %rdx
@@@@
-               	je	0x422090 <kfun:#main(){}+0x8d0>
+               	je	0x4222b0 <kfun:#main(){}+0x8e0>
+               	movq	%rcx, %rax
@@@@
-               	jne	0x42209e <kfun:#main(){}+0x8de>
-               	movq	(%rsi), %rax
-               	movq	%rax, (%rcx)
-               	movq	%rcx, (%rsi)
-               	movq	%rsi, (%r12,%rdx,8)
-               	cmpq	$0, (%rcx)
-               	je	0x4220ae <kfun:#main(){}+0x8ee>
-               	movq	%rcx, (%r12,%rdi,8)
-               	jmp	0x4220ae <kfun:#main(){}+0x8ee>
-               	movq	88(%r14), %rdi
-               	leaq	136(%r14), %rax
+               	jne	0x4222be <kfun:#main(){}+0x8ee>
+               	movq	(%rdi), %rax
+               	movq	%rax, (%rsi)
+               	movq	%rsi, (%rdi)
+               	movq	%rdi, (%r12,%rdx,8)
+               	cmpq	$0, (%rsi)
+               	je	0x4222ce <kfun:#main(){}+0x8fe>
+               	movq	%rsi, (%r12,%rbx,8)
+               	jmp	0x4222ce <kfun:#main(){}+0x8fe>
+               	movq	40(%rsp), %rax
+               	movq	88(%rax), %rdi
+               	addq	$136, %rax
@@@@
-               	je	0x42210d <kfun:#main(){}+0x94d>
-               	callq	0x413730 <free@plt>
-               	movl	76(%rsp), %r8d
-               	movq	%r15, 96(%r14)
-               	movq	%r12, 88(%r14)
+               	je	0x422332 <kfun:#main(){}+0x962>
+               	callq	0x413710 <free@plt>
+               	movq	40(%rsp), %rax
+               	movq	%r15, 96(%rax)
+               	movq	%r12, 88(%rax)
@@@@
-               	je	0x422133 <kfun:#main(){}+0x973>
+               	movq	%r14, %rbx
+               	je	0x422360 <kfun:#main(){}+0x990>
@@@@
-               	movq	%rdx, %rsi
-               	jmp	0x42213d <kfun:#main(){}+0x97d>
-               	movl	%r8d, %eax
+               	movq	%rdx, %r14
+               	jmp	0x42236f <kfun:#main(){}+0x99f>
+               	movl	156(%rsp), %eax
@@@@
-               	movl	%edx, %esi
-               	movl	64(%rsp), %edi
-               	movq	128(%rsp), %rcx
-               	movq	%rcx, %rbx
-               	addq	$8, %rbx
-               	movq	(%r12,%rsi,8), %rax
+               	movl	%edx, %r14d
+               	movq	40(%rsp), %r15
+               	movq	%rbx, %rbp
+               	addq	$8, %rbp
+               	movq	(%r12,%r14,8), %rax
@@@@
-               	movq	344(%rsp), %r15
-               	je	0x422170 <kfun:#main(){}+0x9b0>
+               	je	0x422393 <kfun:#main(){}+0x9c3>
@@@@
-               	movq	%rax, (%rcx)
-               	movq	(%r12,%rsi,8), %rax
-               	movq	%rcx, (%rax)
-               	jmp	0x4221b3 <kfun:#main(){}+0x9f3>
-               	movq	%r14, %rbp
-               	addq	$104, %rbp
-               	movq	104(%r14), %rax
-               	movq	%rax, (%rcx)
-               	movq	%rcx, 104(%r14)
+               	movq	%rax, (%rbx)
+               	movq	(%r12,%r14,8), %rax
+               	movq	%rbx, (%rax)
+               	jmp	0x4223dd <kfun:#main(){}+0xa0d>
+               	movq	%r15, %rdi
+               	addq	$104, %rdi
+               	movq	104(%r15), %rax
+               	movq	%rax, (%rbx)
+               	movq	%rbx, 104(%r15)
+               	movq	(%rbx), %rax
@@@@
-               	je	0x4221af <kfun:#main(){}+0x9ef>
-               	movq	96(%r14), %r8
-               	movslq	8(%rax), %rax
-               	movq	%rax, %rdx
-               	orq	%r8, %rdx
+               	je	0x4223d9 <kfun:#main(){}+0xa09>
+               	movq	96(%r15), %rsi
+               	movl	8(%rax), %eax
+               	movslq	%eax, %rcx
+               	movq	%rcx, %rdx
+               	orq	%rsi, %rdx
@@@@
-               	je	0x4221a2 <kfun:#main(){}+0x9e2>
+               	je	0x4223cd <kfun:#main(){}+0x9fd>
+               	movq	%rcx, %rax
@@@@
-               	divq	%r8
-               	jmp	0x4221a7 <kfun:#main(){}+0x9e7>
+               	divq	%rsi
+               	jmp	0x4223d1 <kfun:#main(){}+0xa01>
@@@@
-               	divl	%r8d
-               	movq	%rcx, (%r12,%rdx,8)
-               	movq	88(%r14), %r12
-               	movq	%rbp, (%r12,%rsi,8)
-               	addq	$1, 112(%r14)
-               	movq	152(%rsp), %r12
-               	movq	%r13, 8(%rbx)
-               	movl	$2, 80(%rsp)
-               	leaq	-2931(%rip), %rax       # 0x421660 <kfun:MultithreadedLoopsBenchmark.$<bridge-BNNN>runSumSharedIntArrayWorkers$lambda$1#static(kotlin.IntArray){}kotlin.Long#internal>
-               	movq	%rax, 88(%rsp)
-               	movq	144(%rsp), %rax
-               	movq	%rax, 96(%rsp)
-               	movq	%r13, 104(%rsp)
-               	movl	%edi, 112(%rsp)
-               	movq	112(%rsp), %rax
+               	divl	%esi
+               	movq	%rbx, (%r12,%rdx,8)
+               	movq	88(%r15), %r12
+               	movq	%rdi, (%r12,%r14,8)
+               	movq	112(%r15), %rax
+               	addq	$1, %rax
+               	movq	%rax, 112(%r15)
+               	movl	136(%rsp), %ecx
+               	movq	128(%rsp), %rdx
+               	movq	344(%rsp), %r12
+               	movq	%r13, 8(%rbp)
+               	movl	$2, 64(%rsp)
+               	leaq	-2979(%rip), %rax       # 0x421870 <kfun:MultithreadedLoopsBenchmark.$<bridge-BNNN>runSumSharedIntArrayWorkers$lambda$1#static(kotlin.IntArray){}kotlin.Long#internal>
+               	movq	%rax, 72(%rsp)
+               	movq	%rdx, 80(%rsp)
+               	movq	%r13, 88(%rsp)
+               	movl	%ecx, 96(%rsp)
+               	movq	96(%rsp), %rax
@@@@
-               	movq	%r15, %rdi
-               	callq	0x4399b0 <Worker::putJob((anonymous namespace)::Job, bool)>
+               	movq	%r12, %rdi
+               	callq	0x43a690 <Worker::putJob((anonymous namespace)::Job, bool)>
@@@@
-               	movq	%r14, %rdi
+               	movq	%r15, %rdi
@@@@
-               	movq	48(%rsp), %rbp
-               	je	0x4227bf <kfun:#main(){}+0xfff>
+               	movq	48(%rsp), %r15
+               	je	0x422a0a <kfun:#main(){}+0x103a>
@@@@
-               	movq	%rax, 288(%rbp)
+               	movq	%rax, 288(%r15)
@@@@
-               	movaps	%xmm0, 96(%rsp)
@@@@
-               	movq	288(%rbp), %rax
-               	movq	%rax, 88(%rsp)
-               	leaq	80(%rsp), %rax
-               	movq	%rax, 288(%rbp)
+               	movaps	%xmm0, 64(%rsp)
+               	movq	288(%r15), %rax
+               	movq	%rax, 72(%rsp)
+               	leaq	64(%rsp), %rax
+               	movq	%rax, 288(%r15)
@@@@
-               	movq	%rax, 96(%rsp)
-               	movq	296(%rbp), %rdi
+               	movq	%rax, 80(%rsp)
+               	movq	296(%r15), %rdi
@@@@
-               	movq	88(%rsp), %rax
-               	movq	%rax, 288(%rbp)
-               	movl	24(%r12), %eax
+               	movq	72(%rsp), %rax
+               	movq	%rax, 288(%r15)
+               	movq	144(%rsp), %rbx
+               	movl	24(%rbx), %eax
@@@@
-               	jae	0x42268f <kfun:#main(){}+0xecf>
-               	movq	16(%r12), %rax
-               	movq	%rcx, 32(%r12,%r13,8)
+               	jae	0x4228da <kfun:#main(){}+0xf0a>
+               	movq	16(%rbx), %rax
+               	movq	%rcx, 32(%rbx,%r13,8)
@@@@
-               	movq	352(%rsp), %rbx
-               	cmpq	%rbx, %r13
-               	jne	0x421c60 <kfun:#main(){}+0x4a0>
-               	jmp	0x422348 <kfun:#main(){}+0xb88>
-               	leaq	136(%r14), %r12
-               	movq	$0, 136(%r14)
-               	jmp	0x422066 <kfun:#main(){}+0x8a6>
-               	movl	24(%r12), %eax
-               	xorl	%r15d, %r15d
+               	movq	352(%rsp), %r14
+               	cmpq	%r14, %r13
+               	jne	0x421e80 <kfun:#main(){}+0x4b0>
+               	jmp	0x422592 <kfun:#main(){}+0xbc2>
+               	movq	40(%rsp), %rax
+               	leaq	136(%rax), %r12
+               	movq	$0, 136(%rax)
+               	jmp	0x422289 <kfun:#main(){}+0x8b9>
+               	movl	24(%rbx), %eax
+               	xorl	%ebp, %ebp
@@@@
-               	cmovsl	%r15d, %eax
-               	movq	%rax, 64(%rsp)
-               	cmpq	64(%rsp), %r15
-               	je	0x42266e <kfun:#main(){}+0xeae>
+               	cmovsl	%ebp, %eax
+               	movq	%rax, 128(%rsp)
+               	cmpq	128(%rsp), %rbp
+               	je	0x4228b9 <kfun:#main(){}+0xee9>
@@@@
-               	movb	281090(%rip), %al       # 0x466d78 <kotlin::mm::internal::gSuspensionRequested>
+               	nopl	(%rax)
+               	movb	282426(%rip), %al       # 0x467500 <kotlin::mm::internal::gSuspensionRequested>
@@@@
-               	je	0x42237f <kfun:#main(){}+0xbbf>
-               	callq	0x4262e0 <kotlin::mm::SuspendIfRequestedSlowPath()>
-               	movq	32(%r12,%r15,8), %rax
+               	je	0x4225cf <kfun:#main(){}+0xbff>
+               	callq	0x426960 <kotlin::mm::SuspendIfRequestedSlowPath()>
+               	movq	%rbp, 120(%rsp)
+               	movq	32(%rbx,%rbp,8), %rax
@@@@
-               	movslq	8(%rax), %r12
+               	movl	8(%rax), %r13d
@@@@
-               	movaps	%xmm0, 96(%rsp)
@@@@
-               	movq	288(%rbp), %rax
-               	movq	%rax, 88(%rsp)
-               	leaq	80(%rsp), %rax
-               	movq	%rax, 288(%rbp)
+               	movaps	%xmm0, 64(%rsp)
+               	movq	288(%r15), %rax
+               	movq	%rax, 72(%rsp)
+               	leaq	64(%rsp), %rax
+               	movq	%rax, 288(%r15)
@@@@
-               	je	0x4223e2 <kfun:#main(){}+0xc22>
-               	leaq	276254(%rip), %rdi      # 0x465af4 <state_global$kotlin.native.concurrent.FutureState>
-               	leaq	-39597(%rip), %rsi      # 0x418930 <kfun:kotlin.native.concurrent.FutureState.$init_global#internal>
-               	callq	0x43bab0 <CallInitGlobalPossiblyLock>
-               	movq	276151(%rip), %rdi      # 0x465aa0 <kvar:kotlin.native.concurrent.FutureState.$VALUES#internal>
-               	leaq	104(%rsp), %rsi
-               	callq	0x41b480 <kfun:kotlin.native.internal#valuesForEnum(kotlin.Array<0:0>){0§<kotlin.Enum<0:0>>}kotlin.Array<0:0>>
-               	movq	%rax, %r13
-               	movq	%rax, 104(%rsp)
-               	callq	0x4396b0 <(anonymous namespace)::theState()>
+               	je	0x422637 <kfun:#main(){}+0xc67>
+               	leaq	277577(%rip), %rdi      # 0x466274 <state_global$kotlin.native.concurrent.FutureState>
+               	leaq	-39874(%rip), %rsi      # 0x418a70 <kfun:kotlin.native.concurrent.FutureState.$init_global#internal>
+               	callq	0x43c840 <CallInitGlobalPossiblyLock>
+               	movslq	%r13d, %r15
+               	movq	277471(%rip), %rdi      # 0x466220 <kvar:kotlin.native.concurrent.FutureState.$VALUES#internal>
+               	leaq	88(%rsp), %rsi
+               	callq	0x41b620 <kfun:kotlin.native.internal#valuesForEnum(kotlin.Array<0:0>){0§<kotlin.Enum<0:0>>}kotlin.Array<0:0>>
+               	movq	%rax, 136(%rsp)
+               	movq	%rax, 88(%rsp)
+               	callq	0x43a390 <(anonymous namespace)::theState()>
@@@@
-               	movq	-64(%rax), %rbx
-               	movl	$1, %ebp
-               	xchgl	%ebp, 328(%rbx)
+               	movq	-64(%rax), %rbp
+               	movl	$1, %ebx
+               	xchgl	%ebx, 328(%rbp)
@@@@
-               	testq	%rbx, %rbx
-               	je	0x422450 <kfun:#main(){}+0xc90>
-               	addq	$328, %rbx              # imm = 0x148
-               	movl	%ebp, %eax
-               	xchgl	%eax, (%rbx)
-               	testl	%ebp, %ebp
-               	jne	0x422450 <kfun:#main(){}+0xc90>
+               	testq	%rbp, %rbp
+               	je	0x4226b0 <kfun:#main(){}+0xce0>
+               	addq	$328, %rbp              # imm = 0x148
+               	movl	%ebx, %eax
+               	xchgl	%eax, (%rbp)
+               	testl	%ebx, %ebx
+               	jne	0x4226b0 <kfun:#main(){}+0xce0>
@@@@
-               	je	0x422450 <kfun:#main(){}+0xc90>
-               	movq	%rbx, %rdi
-               	callq	0x426110 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
-               	nopl	(%rax)
+               	je	0x4226b0 <kfun:#main(){}+0xce0>
+               	movq	%rbp, %rdi
+               	callq	0x426770 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
+               	nop
@@@@
-               	movq	%r12, %rax
+               	movq	%r15, %rax
@@@@
-               	movq	%r15, 120(%rsp)
-               	je	0x422480 <kfun:#main(){}+0xcc0>
-               	movq	%r12, %rax
+               	je	0x4226d0 <kfun:#main(){}+0xd00>
+               	movq	%r15, %rax
@@@@
-               	jmp	0x422489 <kfun:#main(){}+0xcc9>
-               	nopl	(%rax)
-               	movl	%r12d, %eax
+               	jmp	0x4226d9 <kfun:#main(){}+0xd09>
+               	movl	%r13d, %eax
@@@@
-               	xorl	%r15d, %r15d
+               	xorl	%r12d, %r12d
@@@@
-               	je	0x4225c0 <kfun:#main(){}+0xe00>
-               	movq	(%rax), %rbx
-               	cmpl	%r12d, 8(%rbx)
-               	jne	0x4224c4 <kfun:#main(){}+0xd04>
-               	testq	%rbx, %rbx
-               	jne	0x4224fe <kfun:#main(){}+0xd3e>
-               	jmp	0x4225c0 <kfun:#main(){}+0xe00>
+               	je	0x422800 <kfun:#main(){}+0xe30>
+               	movq	(%rax), %rbp
+               	cmpl	%r13d, 8(%rbp)
+               	jne	0x422714 <kfun:#main(){}+0xd44>
+               	testq	%rbp, %rbp
+               	jne	0x42274e <kfun:#main(){}+0xd7e>
+               	jmp	0x422800 <kfun:#main(){}+0xe30>
@@@@
-               	jne	0x4225c0 <kfun:#main(){}+0xe00>
-               	cmpl	%r12d, %esi
-               	je	0x4224f5 <kfun:#main(){}+0xd35>
-               	movq	%rbx, %rbp
-               	movq	(%rbx), %rbx
-               	testq	%rbx, %rbx
-               	je	0x4225c0 <kfun:#main(){}+0xe00>
-               	movslq	8(%rbx), %rsi
-               	movq	%rsi, %rax
-               	orq	%rdi, %rax
-               	shrq	$32, %rax
-               	je	0x4224b0 <kfun:#main(){}+0xcf0>
-               	movq	%rsi, %rax
+               	jne	0x422800 <kfun:#main(){}+0xe30>
+               	cmpl	%r13d, %esi
+               	je	0x422745 <kfun:#main(){}+0xd75>
+               	movq	%rbp, %rbx
+               	movq	(%rbp), %rbp
+               	testq	%rbp, %rbp
+               	je	0x422800 <kfun:#main(){}+0xe30>
+               	movl	8(%rbp), %esi
+               	movslq	%esi, %rax
+               	movq	%rax, %rdx
+               	orq	%rdi, %rdx
+               	shrq	$32, %rdx
+               	je	0x422700 <kfun:#main(){}+0xd30>
@@@@
-               	je	0x4224bf <kfun:#main(){}+0xcff>
-               	jmp	0x4225c0 <kfun:#main(){}+0xe00>
-               	testq	%rbp, %rbp
-               	je	0x4225c0 <kfun:#main(){}+0xe00>
-               	movq	16(%rbx), %r15
+               	je	0x42270f <kfun:#main(){}+0xd3f>
+               	jmp	0x422800 <kfun:#main(){}+0xe30>
+               	testq	%rbx, %rbx
+               	je	0x422800 <kfun:#main(){}+0xe30>
+               	movq	16(%rbp), %r15
@@@@
-               	movq	-64(%rax), %rbx
-               	movl	$1, %ebp
-               	xchgl	%ebp, 328(%rbx)
-               	movq	%rdi, 144(%rsp)
+               	movq	-64(%rax), %rbp
+               	movl	$1, %ebx
+               	xchgl	%ebx, 328(%rbp)
+               	movq	%rdi, 112(%rsp)
@@@@
-               	testq	%rbx, %rbx
-               	je	0x422560 <kfun:#main(){}+0xda0>
-               	addq	$328, %rbx              # imm = 0x148
-               	movl	%ebp, %eax
-               	xchgl	%eax, (%rbx)
-               	testl	%ebp, %ebp
-               	jne	0x422560 <kfun:#main(){}+0xda0>
+               	testq	%rbp, %rbp
+               	je	0x4227b0 <kfun:#main(){}+0xde0>
+               	addq	$328, %rbp              # imm = 0x148
+               	movl	%ebx, %eax
+               	xchgl	%eax, (%rbp)
+               	testl	%ebx, %ebx
+               	jne	0x4227b0 <kfun:#main(){}+0xde0>
@@@@
-               	je	0x422560 <kfun:#main(){}+0xda0>
-               	movq	%rbx, %rdi
-               	callq	0x426110 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
-               	nopl	(%rax)
-               	movl	(%r15), %r15d
+               	je	0x4227b0 <kfun:#main(){}+0xde0>
+               	movq	%rbp, %rdi
+               	callq	0x426770 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
+               	nop
+               	movl	(%r15), %r12d
@@@@
-               	movq	-64(%rax), %rbx
-               	movl	$1, %ebp
-               	xchgl	%ebp, 328(%rbx)
-               	movq	144(%rsp), %rdi
+               	movq	-64(%rax), %rbp
+               	movl	$1, %ebx
+               	xchgl	%ebx, 328(%rbp)
+               	movq	112(%rsp), %rdi
@@@@
-               	testq	%rbx, %rbx
-               	je	0x4225c0 <kfun:#main(){}+0xe00>
-               	addq	$328, %rbx              # imm = 0x148
-               	movl	%ebp, %eax
-               	xchgl	%eax, (%rbx)
-               	testl	%ebp, %ebp
-               	jne	0x4225c0 <kfun:#main(){}+0xe00>
+               	testq	%rbp, %rbp
+               	je	0x422800 <kfun:#main(){}+0xe30>
+               	addq	$328, %rbp              # imm = 0x148
+               	movl	%ebx, %eax
+               	xchgl	%eax, (%rbp)
+               	testl	%ebx, %ebx
+               	jne	0x422800 <kfun:#main(){}+0xe30>
@@@@
-               	je	0x4225c0 <kfun:#main(){}+0xe00>
-               	movq	%rbx, %rdi
-               	callq	0x426110 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>
-               	nop
+               	je	0x422800 <kfun:#main(){}+0xe30>
+               	movq	%rbp, %rdi
+               	callq	0x426770 <kotlin::mm::ThreadSuspensionData::suspendIfRequestedSlowPath()>

@@ -808,42 +824,43 @@
@@@[(23, 34), (35, 39), (42, 50), (51, 59), (60, 62)]@@@
-               	cmpl	%r15d, 8(%r13)
-               	movq	48(%rsp), %rbp
-               	jbe	0x42268f <kfun:#main(){}+0xecf>
-               	movslq	%r15d, %rax
-               	movq	16(%r13,%rax,8), %rax
+               	movq	136(%rsp), %rcx
+               	cmpl	%r12d, 8(%rcx)
+               	movq	48(%rsp), %r15
+               	jbe	0x4228da <kfun:#main(){}+0xf0a>
+               	movslq	%r12d, %rax
+               	movq	16(%rcx,%rax,8), %rax
@@@@
-               	movq	88(%rsp), %rcx
-               	movq	%rcx, 288(%rbp)
+               	movq	72(%rsp), %rcx
+               	movq	%rcx, 288(%r15)
@@@@
-               	jae	0x422694 <kfun:#main(){}+0xed4>
-               	movq	120(%rsp), %r15
-               	addq	$1, %r15
-               	movl	%r12d, %edi
+               	jae	0x4228df <kfun:#main(){}+0xf0f>
+               	movq	120(%rsp), %rbp
+               	addq	$1, %rbp
+               	movl	%r13d, %edi
@@@@
-               	callq	0x43cec0 <Kotlin_Worker_consumeFuture>
-               	movq	152(%rsp), %r12
-               	cmpq	64(%rsp), %r15
-               	jne	0x422370 <kfun:#main(){}+0xbb0>
+               	callq	0x43dcd0 <Kotlin_Worker_consumeFuture>
+               	movq	144(%rsp), %rbx
+               	cmpq	128(%rsp), %rbp
+               	jne	0x4225c0 <kfun:#main(){}+0xbf0>
@@@@
-               	movq	%rax, 288(%rbp)
+               	movq	%rax, 288(%r15)

@@ -852,2409 +869,2410 @@
@@@[(15, 19), (60, 64), (82, 89), (101, 105), (130, 132), (161, 163)]@@@
-               	movl	%r12d, %edi
-               	callq	0x43cec0 <Kotlin_Worker_consumeFuture>
+               	movl	%r13d, %edi
+               	callq	0x43dcd0 <Kotlin_Worker_consumeFuture>
@@@@
-               	movl	%r12d, %edi
-               	callq	0x43cec0 <Kotlin_Worker_consumeFuture>
+               	movl	%r13d, %edi
+               	callq	0x43dcd0 <Kotlin_Worker_consumeFuture>
@@@@
-               	callq	0x43bc90 <ThrowException>
-               	callq	0x41b3e0 <kfun:kotlin.native.internal#ThrowNoWhenBranchMatchedException(){}kotlin.Nothing>
-               	callq	0x418df0 <ThrowWorkerAlreadyTerminated>
+               	callq	0x43ca20 <ThrowException>
+               	callq	0x41b580 <kfun:kotlin.native.internal#ThrowNoWhenBranchMatchedException(){}kotlin.Nothing>
+               	callq	0x418f40 <ThrowWorkerAlreadyTerminated>
+               	callq	0x41b050 <ThrowIllegalArgumentException>
@@@@
-               	jmp	0x422833 <kfun:#main(){}+0x1073>
-               	movq	296(%rbp), %rdi
+               	jmp	0x422a83 <kfun:#main(){}+0x10b3>
+               	movq	296(%r15), %rdi
@@@@
-               	movq	%r14, %rdi
+               	movq	40(%rsp), %rdi
@@@@
-               	nopl	(%rax)
+               	nop
