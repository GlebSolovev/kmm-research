/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.analysis.low.level.api.fir.sessions

import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.application.ModalityState
import com.intellij.openapi.project.Project
import com.intellij.openapi.util.ModificationTracker
import org.jetbrains.kotlin.analysis.low.level.api.fir.transformers.USE_STATE_KEEPER
import org.jetbrains.kotlin.analysis.project.structure.KtModule
import org.jetbrains.kotlin.fir.BuiltinTypes
import org.jetbrains.kotlin.fir.FirElementWithResolveState
import org.jetbrains.kotlin.fir.FirSession
import org.jetbrains.kotlin.fir.PrivateSessionConstructor
import org.jetbrains.kotlin.fir.resolve.ScopeSession
import org.jetbrains.kotlin.fir.symbols.FirBasedSymbol
import java.lang.ref.WeakReference
import java.util.concurrent.atomic.AtomicLong

@OptIn(PrivateSessionConstructor::class)
abstract class LLFirSession(
    val ktModule: KtModule,
    override val builtinTypes: BuiltinTypes,
    kind: Kind
) : FirSession(sessionProvider = null, kind) {
    abstract fun getScopeSession(): ScopeSession

    val project: Project
        get() = ktModule.project

    /**
     * Whether the [LLFirSession] is valid. The session should not be used if it is invalid.
     */
    @Volatile
    var isValid: Boolean = true
        private set

    /**
     * [markInvalid] should be called at the same time as the session is removed from [LLFirSessionCache]. Hence, session validity should be
     * managed by [LLFirSessionCache].
     */
    internal fun markInvalid() {
        isValid = false
    }

    fun invalidate() {
        val application = ApplicationManager.getApplication()
        if (application.isWriteAccessAllowed) {
            invalidateInWriteAction()
        } else {
            // We have to invalidate the session on the EDT per the contract of `LLFirSessionInvalidationService`. The timing here is not
            // 100% waterproof, but `LLFirSession.invalidate` is only a workaround for when FIR guards consistency protection (see KT-56503)
            // is turned off. The check restricts usage of `invalidate` to this scenario.
            check(!USE_STATE_KEEPER) {
                "Outside a write action, a session may only be invalidated directly when FIR guards are turned off."
            }

            // The lambda passed to `invokeLater` might survive beyond project disposal (especially in tests), so me must not capture a hard
            // reference to `this` that can leak `project`. A weak reference is appropriate because we do not need to invalidate the session
            // when it has already been collected.
            val weakSession = WeakReference(this)
            application.invokeLater(
                { weakSession.invalidateIfAlive() },

                // `ModalityState.any()` can be used because session invalidation does not modify PSI, VFS, or the project model.
                ModalityState.any(),
            )
        }
    }

    /**
     * Creates a [ModificationTracker] which tracks the validity of this session via [isValid].
     */
    fun createValidityTracker(): ModificationTracker = ValidityModificationTracker()

    private inner class ValidityModificationTracker : ModificationTracker {
        private var count = AtomicLong()

        override fun getModificationCount(): Long {
            if (isValid) return 0

            // When the session is invalid, we cannot simply return a static modification count of 1. For example, consider situations where
            // a cached value was created with an already invalid session (so it remembers the modification count of 1). Then, if we return
            // a static modification count of 1, the modification count never changes and the cached value misses that the session has been
            // invalidated. Hence, `count` is incremented on each modification count access.
            return count.incrementAndGet()
        }
    }
}

private fun LLFirSession.invalidateInWriteAction() {
    if (!isValid) return

    LLFirSessionInvalidationService.getInstance(project).invalidate(ktModule)
}

private fun WeakReference<LLFirSession>.invalidateIfAlive() = ApplicationManager.getApplication().runWriteAction {
    val session = get() ?: return@runWriteAction
    if (session.project.isDisposed) return@runWriteAction

    session.invalidateInWriteAction()
}

abstract class LLFirModuleSession(
    ktModule: KtModule,
    builtinTypes: BuiltinTypes,
    kind: Kind
) : LLFirSession(ktModule, builtinTypes, kind)

val FirElementWithResolveState.llFirSession: LLFirSession
    get() = moduleData.session as LLFirSession

val FirBasedSymbol<*>.llFirSession: LLFirSession
    get() = moduleData.session as LLFirSession