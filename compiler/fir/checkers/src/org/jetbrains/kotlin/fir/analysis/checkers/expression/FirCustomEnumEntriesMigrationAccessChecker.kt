/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.fir.analysis.checkers.expression

import org.jetbrains.kotlin.builtins.StandardNames
import org.jetbrains.kotlin.config.LanguageFeature
import org.jetbrains.kotlin.descriptors.ClassKind
import org.jetbrains.kotlin.diagnostics.DiagnosticReporter
import org.jetbrains.kotlin.diagnostics.reportOn
import org.jetbrains.kotlin.fir.FirSession
import org.jetbrains.kotlin.fir.analysis.checkers.classKind
import org.jetbrains.kotlin.fir.analysis.checkers.context.CheckerContext
import org.jetbrains.kotlin.fir.analysis.checkers.getContainingClassSymbol
import org.jetbrains.kotlin.fir.analysis.diagnostics.FirErrors
import org.jetbrains.kotlin.fir.containingClassLookupTag
import org.jetbrains.kotlin.fir.declarations.FirRegularClass
import org.jetbrains.kotlin.fir.declarations.utils.isCompanion
import org.jetbrains.kotlin.fir.expressions.FirPropertyAccessExpression
import org.jetbrains.kotlin.fir.expressions.FirResolvedQualifier
import org.jetbrains.kotlin.fir.references.toResolvedPropertySymbol
import org.jetbrains.kotlin.fir.resolve.toSymbol
import org.jetbrains.kotlin.fir.symbols.impl.FirPropertySymbol
import org.jetbrains.kotlin.fir.types.ConeClassLikeType
import org.jetbrains.kotlin.fir.types.coneTypeSafe

object FirCustomEnumEntriesMigrationAccessChecker : FirPropertyAccessExpressionChecker() {
    override fun check(expression: FirPropertyAccessExpression, context: CheckerContext, reporter: DiagnosticReporter) {
        if (context.languageVersionSettings.supportsFeature(LanguageFeature.PrioritizedEnumEntries)) return
        val referencedSymbol = expression.calleeReference.toResolvedPropertySymbol() ?: return
        if (referencedSymbol.name != StandardNames.ENUM_ENTRIES) return

        val session = context.session
        if (expression.isExtensionWithEnumClassQualifier() ||
            expression.isCallViaCompanionOnEnumClassQualifier(referencedSymbol, session)
        ) {
            reporter.reportOn(expression.source, FirErrors.DEPRECATED_ACCESS_TO_ENUM_ENTRY_COMPANION_PROPERTY, context)
        } else if (expression.isCallToExternalEntriesInsideEnum(referencedSymbol, session, context)) {
            reporter.reportOn(expression.source, FirErrors.DEPRECATED_ACCESS_TO_ENTRY_PROPERTY_FROM_ENUM, context)
        }
    }

    private fun FirPropertyAccessExpression.isExtensionWithEnumClassQualifier(): Boolean {
        val receiver = extensionReceiver as? FirResolvedQualifier ?: return false
        return receiver.symbol?.classKind == ClassKind.ENUM_CLASS
    }

    private fun FirPropertyAccessExpression.isCallViaCompanionOnEnumClassQualifier(
        symbol: FirPropertySymbol,
        session: FirSession,
    ): Boolean {
        val parentClassSymbol = symbol.containingClassLookupTag()?.toSymbol(session) ?: return false
        if (!parentClassSymbol.isCompanion) return false

        val grandParentClassSymbol = parentClassSymbol.getContainingClassSymbol(session) ?: return false
        if (grandParentClassSymbol.classKind != ClassKind.ENUM_CLASS) return false

        val dispatchReceiver = dispatchReceiver as? FirResolvedQualifier ?: return false

        return dispatchReceiver.symbol == grandParentClassSymbol &&
                dispatchReceiver.coneTypeSafe<ConeClassLikeType>()?.lookupTag?.toSymbol(session) == parentClassSymbol
    }

    private fun FirPropertyAccessExpression.isCallToExternalEntriesInsideEnum(
        symbol: FirPropertySymbol,
        session: FirSession,
        context: CheckerContext,
    ): Boolean {
        val parentClassSymbol = symbol.containingClassLookupTag()?.toSymbol(session)
        if (parentClassSymbol?.classKind == ClassKind.ENUM_CLASS) return false

        return explicitReceiver == null && context.containingDeclarations.any {
            it is FirRegularClass && it.classKind == ClassKind.ENUM_CLASS
        }
    }
}
