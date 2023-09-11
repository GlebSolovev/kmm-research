// /*
//  * Copyright 2010-2022 JetBrains s.r.o. and Kotlin Programming Language contributors.
//  * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
//  */

// package org.jetbrains.kotlin.backend.konan.aopass

// import llvm.*
// import org.jetbrains.kotlin.backend.konan.BitcodePostProcessingContext
// import org.jetbrains.kotlin.backend.konan.llvm.*
// import org.jetbrains.kotlin.backend.konan.llvm.getBasicBlocks
// import org.jetbrains.kotlin.backend.konan.llvm.getFunctions
// import org.jetbrains.kotlin.backend.konan.llvm.getInstructions

// private fun isLoadOrStoreInst(inst: LLVMValueRef): Boolean = 
//         LLVMIsALoadInst(inst) != null || LLVMIsAStoreInst(inst) != null

// private fun isSuitableType(inst: LLVMValueRef): Boolean = inst.type.run {
//     isFloatingPoint() || isInteger() || isPointer()
// }

// private fun isByteSized(inst: LLVMValueRef, llvmTargetData: LLVMTargetDataRef): Boolean =
//         LLVMSizeOfTypeInBits(llvmTargetData, inst.type) % 8L == 0L

// private fun isPowerOfTwoSized(inst: LLVMValueRef, llvmTargetData: LLVMTargetDataRef): Boolean {
//     val sizeInBits = LLVMSizeOfTypeInBits(llvmTargetData, inst.type)
//     return sizeInBits != 0L && (sizeInBits and (sizeInBits - 1)) == 0L
// }

// internal fun changeAtomicOrdering(module: LLVMModuleRef, llvmTargetData: LLVMTargetDataRef) {
//     var replacedAccessesCount = 0

//     getFunctions(module)
//             .flatMap { function ->
//                 getBasicBlocks(function)
//             }
//             .flatMap { block -> getInstructions(block) }
//             .filter { inst ->
//                 isLoadOrStoreInst(inst)
//                         && isSuitableType(inst)
//                         && isByteSized(inst, llvmTargetData)
//                         && isPowerOfTwoSized(inst, llvmTargetData)
//             }
//             .forEach { inst ->
//                 LLVMSetOrdering(inst, LLVMAtomicOrdering.LLVMAtomicOrderingSequentiallyConsistent)
//                 replacedAccessesCount++
//             }

//     println("[aopass] replaced accesses: $replacedAccessesCount")
// }
