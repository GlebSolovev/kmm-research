/*
 * Copyright 2010-2022 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.backend.konan.aopass

import llvm.LLVMValueRef
import llvm.LLVMAtomicOrdering

enum class AtomicOrderingPassMode {
    BASELINE {
        override fun replaceOrdering(inst: LLVMValueRef) = false
    },

    UNORDERED {
        override fun replaceOrdering(inst: LLVMValueRef) = inst.replaceNotAtomicOrdering(
            to = LLVMAtomicOrdering.LLVMAtomicOrderingUnordered
        )
    },

    MONOTONIC {
        override fun replaceOrdering(inst: LLVMValueRef) = inst.replaceNotAtomicOrdering(
            to = LLVMAtomicOrdering.LLVMAtomicOrderingUnordered
        )
    },

    SEQ_CONST {
        override fun replaceOrdering(inst: LLVMValueRef) = inst.replaceNotAtomicOrdering(
            to = LLVMAtomicOrdering.LLVMAtomicOrderingSequentiallyConsistent
        )
    },

    ALL_TO_NOT_ATOMIC {
        override fun replaceOrdering(inst: LLVMValueRef) = inst.replaceAnyOrdering(
            to = LLVMAtomicOrdering.LLVMAtomicOrderingNotAtomic
        )
    },

    ALL_TO_SEQ_CONST {
        override fun replaceOrdering(inst: LLVMValueRef) = inst.replaceAnyOrdering(
            to = LLVMAtomicOrdering.LLVMAtomicOrderingSequentiallyConsistent
        )
    };

    abstract fun replaceOrdering(inst: LLVMValueRef): Boolean
}
