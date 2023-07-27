/*
 * Copyright 2010-2017 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.jetbrains.kotlin.ir.util

import org.jetbrains.kotlin.ir.ObsoleteDescriptorBasedAPI
import org.jetbrains.kotlin.ir.linkage.IrProvider
import org.jetbrains.kotlin.ir.symbols.IrSymbol

class ExternalDependenciesGenerator(
    private val symbolTable: SymbolTable,
    private val irProviders: List<IrProvider>
) {
    @OptIn(ObsoleteDescriptorBasedAPI::class)
    fun generateUnboundSymbolsAsDependencies() {
        generateUnboundSymbolsAsDependencies(irProviders, symbolTable.descriptorExtension)
    }
}

fun <T : StarSymbolTableExtension> generateUnboundSymbolsAsDependencies(
    irProviders: List<IrProvider>,
    symbolTableExtension: T,
    symbolExtractor: T.() -> Set<IrSymbol> = StarSymbolTableExtension::allUnboundSymbols,
    initialSymbols: Set<IrSymbol> = emptySet(),
    onSymbol: (IrSymbol) -> Unit = {}
) {
    // There should be at most one DeclarationStubGenerator (none in closed world?)
    irProviders.filterIsInstance<DeclarationStubGenerator>().singleOrNull()?.run { unboundSymbolGeneration = true }

    // Deserializing a reference may lead to new unbound references, so we loop until none are left.
    var unbound = initialSymbols
    do {
        val prevUnbound = unbound
        unbound = symbolTableExtension.symbolExtractor()
        for (symbol in unbound) {
            // Symbol could get bound as a side effect of deserializing other symbols.
            if (!symbol.isBound) {
                irProviders.firstNotNullOfOrNull { provider -> provider.getDeclaration(symbol) }
                onSymbol(symbol)
            }
        }
        // We wait for the unbound to stabilize on fake overrides.
    } while (unbound != prevUnbound)
}
