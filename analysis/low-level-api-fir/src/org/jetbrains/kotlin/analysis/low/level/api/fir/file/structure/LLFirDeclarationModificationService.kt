/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.analysis.low.level.api.fir.file.structure

import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.project.Project
import com.intellij.psi.PsiComment
import com.intellij.psi.PsiElement
import com.intellij.psi.PsiWhiteSpace
import com.intellij.util.messages.Topic
import org.jetbrains.kotlin.analysis.low.level.api.fir.LLFirInternals
import org.jetbrains.kotlin.analysis.low.level.api.fir.file.structure.LLFirDeclarationModificationService.ModificationType
import org.jetbrains.kotlin.analysis.providers.analysisMessageBus
import org.jetbrains.kotlin.idea.KotlinLanguage
import org.jetbrains.kotlin.psi.KtAnnotated
import org.jetbrains.kotlin.psi.KtCodeFragment

/**
 * This service is responsible for processing incoming [PsiElement] changes to reflect them on FIR tree.
 *
 * For local changes (in-block modification), this service will do all required work.
 *
 * In case of non-local changes (out-of-block modification), this service will publish event to [OUT_OF_BLOCK_MODIFICATION_EVENT_LISTENER]
 * topic so all interested consumers should implement [LLFirOutOfBlockModificationEventListener] and subscribe by [subscribe].
 */
@LLFirInternals
class LLFirDeclarationModificationService(val project: Project) : Disposable {
    sealed class ModificationType {
        object NewElement : ModificationType()
        object Unknown : ModificationType()
    }

    /**
     * This method should be called during some [PsiElement] modification.
     * This method must be called from write action.
     *
     * Will publish event to [OUT_OF_BLOCK_MODIFICATION_EVENT_LISTENER] in case of out-of-block modification.
     *
     * @param element is an element that we want to modify, remove or add.
     * Some examples:
     * * [element] is [KtNamedFunction][org.jetbrains.kotlin.psi.KtNamedFunction] if we
     * dropped body ([KtBlockExpression][org.jetbrains.kotlin.psi.KtBlockExpression]) of this function
     * * [element] is [KtBlockExpression][org.jetbrains.kotlin.psi.KtBlockExpression] if we replaced one body-expression with another one
     * * [element] is [KtBlockExpression][org.jetbrains.kotlin.psi.KtBlockExpression] if added a body to the function without body
     *
     * @param modificationType additional information to make more accurate decisions
     *
     * @see subscribe
     */
    fun elementModified(element: PsiElement, modificationType: ModificationType = ModificationType.Unknown) {
        ApplicationManager.getApplication().assertIsWriteThread()

        when (val changeType = calculateChangeType(element, modificationType)) {
            is ChangeType.Invisible -> {}
            is ChangeType.InBlock -> invalidateAfterInBlockModification(changeType.blockOwner)
            is ChangeType.OutOfBlock -> {
                project.analysisMessageBus.syncPublisher(OUT_OF_BLOCK_MODIFICATION_EVENT_LISTENER).onOutOfBlockModification(element)
            }
        }
    }

    /**
     * @return the psi element (ancestor of the changedElement) which should be re-highlighted or null if unsure
     */
    fun changeHighlightingDirtyScopeFor(changedElement: PsiElement): PsiElement? {
        return nonLocalDeclarationForLocalChange(changedElement)
    }

    /**
     * @see elementModified
     */
    fun subscribe(listener: LLFirOutOfBlockModificationEventListener, disposable: Disposable = this) {
        project.analysisMessageBus.connect(disposable).subscribe(OUT_OF_BLOCK_MODIFICATION_EVENT_LISTENER, listener)
    }

    override fun dispose() {}

    companion object {
        @Topic.ProjectLevel
        private val OUT_OF_BLOCK_MODIFICATION_EVENT_LISTENER: Topic<LLFirOutOfBlockModificationEventListener> =
            Topic(LLFirOutOfBlockModificationEventListener::class.java, Topic.BroadcastDirection.TO_CHILDREN, true)

        fun getInstance(project: Project): LLFirDeclarationModificationService =
            project.getService(LLFirDeclarationModificationService::class.java)
    }
}

private fun calculateChangeType(element: PsiElement, modificationType: ModificationType): ChangeType = when {
    // If PSI is not valid, well something bad happened, OOBM won't hurt
    !element.isValid -> ChangeType.OutOfBlock
    element is PsiWhiteSpace || element is PsiComment -> ChangeType.Invisible
    // TODO improve for Java KTIJ-21684
    element.language !is KotlinLanguage -> ChangeType.OutOfBlock
    else -> {
        val inBlockModificationOwner = nonLocalDeclarationForLocalChange(element)
        if (inBlockModificationOwner != null && (element.parent != inBlockModificationOwner || modificationType != ModificationType.NewElement)) {
            ChangeType.InBlock(inBlockModificationOwner)
        } else {
            ChangeType.OutOfBlock
        }
    }
}

private fun nonLocalDeclarationForLocalChange(psi: PsiElement): KtAnnotated? {
    return psi.getNonLocalReanalyzableContainingDeclaration() ?: psi.containingFile as? KtCodeFragment
}

private sealed class ChangeType {
    object OutOfBlock : ChangeType()
    object Invisible : ChangeType()
    class InBlock(val blockOwner: KtAnnotated) : ChangeType()
}
