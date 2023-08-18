/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.analysis.low.level.api.fir.sessions

import com.intellij.openapi.Disposable
import com.intellij.openapi.project.Project
import com.intellij.openapi.util.Disposer
import com.intellij.openapi.util.ModificationTracker
import org.jetbrains.kotlin.analysis.project.structure.KtModule
import org.jetbrains.kotlin.analysis.utils.collections.MapValueCleaner
import org.jetbrains.kotlin.fir.BuiltinTypes
import org.jetbrains.kotlin.fir.FirElementWithResolveState
import org.jetbrains.kotlin.fir.FirSession
import org.jetbrains.kotlin.fir.PrivateSessionConstructor
import org.jetbrains.kotlin.fir.resolve.ScopeSession
import org.jetbrains.kotlin.fir.symbols.FirBasedSymbol
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

    private val disposableLazy: Lazy<Disposable> = lazy(LazyThreadSafetyMode.PUBLICATION) {
        val disposable = object : Disposable {
            override fun dispose() {
                // Nothing to do here. The `Disposable` will be a parent for disposables that depend on the session's lifetime.
            }
        }

        // Some modules will have a corresponding IntelliJ `Module`, but it is hard to reach through the `KtModule` API, and it does not
        // exist for all `KtModule`s. Because sessions are invalidated (and subsequently cleaned up) when a module is removed and disposed,
        // it's not critical to have the IJ `Module` as a disposable parent.
        Disposer.register(project, disposable)

        disposable
    }

    val disposable: Disposable? get() = if (disposableLazy.isInitialized()) disposableLazy.value else null

    /**
     * Returns an already registered [Disposable] which is alive until the session is invalidated. It can be used as a parent disposable for
     * disposable session components, such as [resolve extensions][org.jetbrains.kotlin.analysis.api.resolve.extensions.KtResolveExtension].
     * When the session is invalidated or garbage-collected, all disposable session components will be disposed with this parent disposable.
     *
     * Because not all sessions have disposable components, this disposable is created and registered on-demand with the first call to
     * [requestDisposable]. This avoids polluting [Disposer] with unneeded disposables.
     */
    fun requestDisposable(): Disposable = disposableLazy.value

    /**
     * [LLFirSessionCleaner] performs cleanup after the session has been invalidated or reclaimed. It must not keep a strong reference to
     * its associated [LLFirSession], because otherwise the soft reference-based garbage collection of unused sessions will not work.
     *
     * @param disposable The associated [LLFirSession]'s [disposable]. Keeping a separate reference ensures that the disposable can be
     *  disposed even after the session has been reclaimed by the GC.
     */
    internal class LLFirSessionCleaner(private val disposable: Disposable?) : MapValueCleaner<LLFirSession> {
        override fun cleanUp(value: LLFirSession?) {
            value?.isValid = false
            disposable?.let { Disposer.dispose(it) }
        }
    }
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