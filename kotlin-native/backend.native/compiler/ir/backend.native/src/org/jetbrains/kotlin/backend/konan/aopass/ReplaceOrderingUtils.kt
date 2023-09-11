/*
 * Copyright 2010-2022 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.backend.konan.aopass

import llvm.LLVMValueRef
import llvm.LLVMAtomicOrdering
import llvm.LLVMGetOrdering
import llvm.LLVMSetOrdering

internal fun LLVMValueRef.replaceAnyOrdering(to: LLVMAtomicOrdering): Boolean {
    LLVMSetOrdering(this, to)
    return true
}

internal fun LLVMValueRef.replaceNotAtomicOrdering(to: LLVMAtomicOrdering): Boolean {
    if (LLVMGetOrdering(this) == LLVMAtomicOrdering.LLVMAtomicOrderingNotAtomic) {
        LLVMSetOrdering(this, to)
        return true
    }
    return false
}
