--- ../../benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/linuxX64/baseline/bincode/mainfun_bincode.asm	2023-07-19 02:49:22.330616326 +0200
+++ ../../benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/linuxX64/unordered/bincode/mainfun_bincode.asm	2023-07-19 03:01:07.850394817 +0200
@@ -10,7 +10,7 @@
                	movaps	%xmm0, 48(%rsp)
                	movaps	%xmm0, 32(%rsp)
                	movq	$0, 24(%rsp)
-               	leaq	231234(%rip), %rax      # 0x458ee0 <ktypeglobal:SwitchBenchmark#internal>
+               	leaq	236706(%rip), %rax      # 0x45a620 <ktypeglobal:SwitchBenchmark#internal>
                	orq	$3, %rax
                	movq	%rax, 16(%rsp)
                	movq	%fs:0, %rax
@@ -22,16 +22,16 @@
                	movq	%rax, 288(%rbp)
                	movabsq	$17179869184, %r14      # imm = 0x400000000
                	movq	%r14, 48(%rsp)
-               	movb	267630(%rip), %al       # 0x461d58 <kotlin::mm::internal::gSuspensionRequested>
+               	movb	273174(%rip), %al       # 0x4634e0 <kotlin::mm::internal::gSuspensionRequested>
                	testb	$1, %al
-               	je	0x4207f3 <kfun:#main(){}+0x83>
-               	callq	0x424520 <kotlin::mm::SuspendIfRequestedSlowPath()>
-               	movl	262903(%rip), %eax      # 0x460af0 <state_global$<root>$/home/loewe/tabs/kmm-research/kotlin-native/aoPassBenchmarking/benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/Main.kt>
+               	je	0x4209d3 <kfun:#main(){}+0x83>
+               	callq	0x424b50 <kotlin::mm::SuspendIfRequestedSlowPath()>
+               	movl	268439(%rip), %eax      # 0x462270 <state_global$<root>$/home/loewe/tabs/kmm-research/kotlin-native/aoPassBenchmarking/benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/Main.kt>
                	cmpl	$2, %eax
-               	je	0x420811 <kfun:#main(){}+0xa1>
-               	leaq	262891(%rip), %rdi      # 0x460af0 <state_global$<root>$/home/loewe/tabs/kmm-research/kotlin-native/aoPassBenchmarking/benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/Main.kt>
-               	leaq	-316(%rip), %rsi        # 0x4206d0 <kfun:$init_global#internal>
-               	callq	0x439c40 <CallInitGlobalPossiblyLock>
+               	je	0x4209f1 <kfun:#main(){}+0xa1>
+               	leaq	268427(%rip), %rdi      # 0x462270 <state_global$<root>$/home/loewe/tabs/kmm-research/kotlin-native/aoPassBenchmarking/benchmarkAnalysis/Ring::Switch.testDenseIntSwitch/Main.kt>
+               	leaq	-316(%rip), %rsi        # 0x4208b0 <kfun:$init_global#internal>
+               	callq	0x43a970 <CallInitGlobalPossiblyLock>
                	leaq	16(%rsp), %rax
                	movq	%rax, 56(%rsp)
                	xorps	%xmm0, %xmm0
@@ -54,7 +54,7 @@
                	movq	24(%rsp), %r13
                	movq	%r13, 88(%rsp)
                	testq	%r13, %r13
-               	je	0x4209bc <kfun:#main(){}+0x24c>
+               	je	0x420ba4 <kfun:#main(){}+0x254>
                	movq	%r13, 120(%rsp)
                	movq	72(%rsp), %rax
                	movq	%rbp, 8(%rsp)
@@ -63,55 +63,56 @@
                	xorl	%r12d, %r12d
                	testl	%ebp, %ebp
                	cmovsl	%r12d, %ebp
-               	jmp	0x4208d8 <kfun:#main(){}+0x168>
+               	jmp	0x420abc <kfun:#main(){}+0x16c>
                	movl	$5, %edi
                	nopl	(%rax,%rax)
                	addq	$1, %r12
                	leaq	136(%rsp), %rsi
-               	callq	0x415d90 <kfun:kotlin#<Int-box>(kotlin.Int){}kotlin.Any>
+               	callq	0x415df0 <kfun:kotlin#<Int-box>(kotlin.Int){}kotlin.Any>
                	movl	8(%rax), %eax
-               	addl	%eax, 8(%r14)
+               	addl	8(%r14), %eax
+               	movl	%eax, 8(%r14)
                	cmpq	%r12, %rbp
-               	je	0x420999 <kfun:#main(){}+0x229>
-               	movzbl	267376(%rip), %eax      # 0x461d58 <kotlin::mm::internal::gSuspensionRequested>
+               	je	0x420b81 <kfun:#main(){}+0x231>
+               	movzbl	272916(%rip), %eax      # 0x4634e0 <kotlin::mm::internal::gSuspensionRequested>
                	testb	$1, %al
-               	je	0x4208f1 <kfun:#main(){}+0x181>
-               	callq	0x424520 <kotlin::mm::SuspendIfRequestedSlowPath()>
+               	je	0x420ad5 <kfun:#main(){}+0x185>
+               	callq	0x424b50 <kotlin::mm::SuspendIfRequestedSlowPath()>
                	movl	16(%r13,%r12,4), %r15d
                	movq	%rbx, %rax
                	cmpl	$2, -68(%rbx)
-               	je	0x420915 <kfun:#main(){}+0x1a5>
+               	je	0x420af9 <kfun:#main(){}+0x1a9>
                	leaq	-68(%rbx), %rdi
-               	leaq	192(%rip), %rsi         # 0x4209d0 <kfun:Blackhole.$init_thread_local#internal>
-               	callq	0x439d50 <CallInitThreadLocal>
+               	leaq	188(%rip), %rsi         # 0x420bb0 <kfun:Blackhole.$init_thread_local#internal>
+               	callq	0x43aa80 <CallInitThreadLocal>
                	movl	$3, %edi
-               	callq	0x424a90 <LookupTLS>
+               	callq	0x425110 <LookupTLS>
                	movq	(%rax), %r14
                	movq	%r14, 128(%rsp)
                	addl	$1, %r15d
                	cmpl	$21, %r15d
-               	ja	0x4208b6 <kfun:#main(){}+0x146>
+               	ja	0x420a96 <kfun:#main(){}+0x146>
                	movl	$1, %edi
-               	leaq	138640(%rip), %rcx      # 0x4426d0 <_IO_stdin_used+0x110>
+               	leaq	141800(%rip), %rcx      # 0x443510 <_IO_stdin_used+0x110>
                	movslq	(%rcx,%r15,4), %rax
                	addq	%rcx, %rax
                	jmpq	*%rax
                	movl	$4, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$3, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$2, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$435, %edi              # imm = 0x1B3
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$9, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$6, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$31, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movl	$7, %edi
-               	jmp	0x4208c0 <kfun:#main(){}+0x150>
+               	jmp	0x420aa0 <kfun:#main(){}+0x150>
                	movq	40(%rsp), %rax
                	movq	8(%rsp), %rcx
                	movq	%rax, 288(%rcx)
@@ -123,6 +124,6 @@
                	popq	%r15
                	popq	%rbp
                	retq
-               	callq	0x41a670 <kfun:kotlin.native.internal#ThrowUninitializedPropertyAccessException(kotlin.String){}kotlin.Nothing>
-               	nopw	%cs:(%rax,%rax)
+               	callq	0x41a7e0 <kfun:kotlin.native.internal#ThrowUninitializedPropertyAccessException(kotlin.String){}kotlin.Nothing>
+               	nopl	(%rax)
 
