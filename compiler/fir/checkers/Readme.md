# FIR Checkers

## Checkers structure

There are four kinds of checkers:
- [DeclarationChecker](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/declaration/FirDeclarationChecker.kt)
- [ExpressionChecker](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/expression/FirExpressionChecker.kt)
- [FirTypeChecker](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/type/FirTypeChecker.kt)
- [FirControlFlowChecker](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/cfa/FirControlFlowChecker.kt)

First, tree kinds are typed and may be restricted to checking only a specific type of declarations/expressions/type refs. To simplify work with checkers for different FIR elements, there is a number of typed typealiases:
- Declarations: [FirDeclarationCheckerAliases.kt](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/declaration/FirDeclarationCheckerAliases.kt)
- Expressions: [FirExpressionCheckerAliases.kt](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/expression/FirExpressionCheckerAliases.kt)
- Type refs: [FirTypeCheckerAliases.kt](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/type/FirTypeCheckerAliases.kt)

Last kind of checkers, `FirControlFlowChecker`, is for checkers which perform Control Flow Analysis (CFA) and supposed to work with every declaration that has its own Control Flow Graph (CFG)

## Checkers contracts

All checkers are supposed to satisfy the following contracts:
1. checker is stateless
2. checker is independent
3. checker is specific as it possble
4. checker should try to avoid traversing subtree of the element it checks

Those contracts imply the following:
1. Usually a checker is an `object` without any state
2. Each checker should work correctly even if all other checkers are disabled
3. If a checker is ment to check only simple functions, there is no need to parameterize it with `FirDeclaration` and check if declaration is `FirSimpleFunction`. Just parameterize the checker itself with `FirSimpleFunction`
    - this is needed not only for simplification of code, but also for the sake of performance. Typed checkers are run only on elements with a suitable type. So if you declared `FirRegularClassChecker`  it never will be run for `FirAnonymousObject`
4. If a checker supposed to check anonymous initializers, it's better to create `FirAnonymousInitializerChecker` which will be separately run for each `init` block in class than creating `FirClassChecker` which will manually iterate over each `init` block in this class. There are several reasons for that:
    - mechanism for diagnostic suppression is implemented in checkers dispatcher, so reporting something on a sub element may cause false-positive diagnostic, if there was `@Suppress` annotation between root element (passed to checker) and sub element. There is a mechanism to fix it, but it's not recommended to use
    - checkers with smaller scope increase IDE performance because they require less element to resove in order to check something

## Checkers pipeline

All checkers are collected in special containers, named [DeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/declaration/DeclarationCheckers.kt), [ExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/expression/ExpressionCheckers.kt) and [TypeCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/checkers/type/TypeCheckers.kt). Those containers have fields with sets of checkers for each possible type of checker of corresponding kind

There are a number of different containers for checkers
- Common checkers, which always run on any platform
    - [CommonDeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/CommonDeclarationCheckers.kt)
    - [CommonExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/CommonExpressionCheckers.kt)
    - [CommonTypeCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/CommonTypeCheckers.kt)
- Checkers for each specific platform (lays in corresponding `:compiler:fir:checkers:checkers.platform` modules)
    - JVM:
        - [JvmDeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.jvm/src/org/jetbrains/kotlin/fir/analysis/jvm/checkers/JvmDeclarationCheckers.kt)
        - [JvmExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.jvm/src/org/jetbrains/kotlin/fir/analysis/jvm/checkers/JvmExpressionCheckers.kt)
        - [JvmTypeCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.jvm/src/org/jetbrains/kotlin/fir/analysis/jvm/checkers/JvmTypeCheckers.kt)
    - JS:
        - [JsDeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.js/src/org/jetbrains/kotlin/fir/analysis/js/checkers/JsDeclarationCheckers.kt)
        - [JsExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.js/src/org/jetbrains/kotlin/fir/analysis/js/checkers/JsExpressionCheckers.kt)
    - Native:
        - [NativeDeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.native/src/org/jetbrains/kotlin/fir/analysis/native/checkers/NativeDeclarationCheckers.kt)
        - [NativeExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.native/src/org/jetbrains/kotlin/fir/analysis/native/checkers/NativeExpressionCheckers.kt)
- Extended checkers. Those checkers are disabled by default and can be enabled with `-Xuse-fir-extended-checkers` compiler flag. This group includes experimental and not very perfrmant checkers, which are not crucial for regular compilation
    - [ExtendedDeclarationCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/ExtendedDeclarationCheckers.kt)
    - [ExtendedExpressionCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/ExtendedExpressionCheckers.kt)
    - [ExtendedTypeCheckers](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/ExtendedTypeCheckers.kt)

At the beginning of the compilation initialization phase collects all required checker containers and collects it inside a session component named [CheckersComponent](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/CheckersComponent.kt). When the time of checker phase comes, compiler [creates](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/entrypoint/src/org/jetbrains/kotlin/fir/pipeline/analyse.kt#L23) an instance of [AbstractDiagnosticCollector](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/collectors/AbstractDiagnosticCollector.kt), which is responsible to run all checkers. `DiagnosticCollector` traverses the whole given FIR tree collects `CheckerContext` during this traversal and runs all checkers on each element, which suites by type of element.

## Checker Context

[CheckerContext](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/checkers/context/CheckerContext.kt) contains all information which can be used by checkers, including
- `session` and `scopeSession`
- list of `containingDeclarations`
- various information about the body which is analyzed
- stack of implicit receivers
- information about suppressed diagnostics

`CheckerContext` is ment to be read-only for checkers

## Diagnostic reporting

All diagnostics which can be reported by the compiler are collected in [FirErrors](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/gen/org/jetbrains/kotlin/fir/analysis/diagnostics/FirErrors.kt), [FirJvmErrors](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.jvm/gen/org/jetbrains/kotlin/fir/analysis/diagnostics/jvm/FirJvmErrors.kt), [FirJsErrors](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.js/gen/org/jetbrains/kotlin/fir/analysis/diagnostics/js/FirJsErrors.kt) and [FirNativeErrors](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.native/gen/org/jetbrains/kotlin/fir/analysis/diagnostics/native/FirNativeErrors.kt) objects. Those diagnostics are auto-generated based on the diagnostic description in one of a diagnostic list in [checkers-component-generator](https://github.com/JetBrains/kotlin/tree/master/compiler/fir/checkers/checkers-component-generator/src/org/jetbrains/kotlin/fir/checkers/generator/diagnostics)

The generation is needed, because Analysis API (AA), which is used in IDE, generates separate class for each compiler diagnostic with proper conversions of arguments for parametrized diagnostics. And the goal of code generator is to automatically generate those classes and conversions. To run diagnostics generation use `Generators -> Generate FIR Checker Components and FIR/IDE Diagnostics` run configuration.

Diagnostics messages still should be added manually to [FirErrorsDefaultMessages](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/src/org/jetbrains/kotlin/fir/analysis/diagnostics/FirErrorsDefaultMessages.kt), [FirJvmErrorsDefaultMessages](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.jvm/src/org/jetbrains/kotlin/fir/analysis/diagnostics/jvm/FirJvmErrorsDefaultMessages.kt), [FirJsErrorsDefaultMessages](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.js/src/org/jetbrains/kotlin/fir/analysis/diagnostics/js/FirJsErrorsDefaultMessages.kt) and [FirNativeErrorsDefaultMessages](https://github.com/JetBrains/kotlin/blob/master/compiler/fir/checkers/checkers.native/src/org/jetbrains/kotlin/fir/analysis/diagnostics/native/FirNativeErrorsDefaultMessages.kt) respectively. Guidelines for diagnostic messages are described in the header of `FirErrorsDefaultMessages`

For reporting diagnostics, each checker takes an instance of [DiagnosticReporter](https://github.com/JetBrains/kotlin/blob/master/compiler/frontend.common/src/org/jetbrains/kotlin/diagnostics/DiagnosticReporter.kt) as a parameter. For actual reporting, utilities from [KtDiagnosticReportHelpers](https://github.com/JetBrains/kotlin/blob/master/compiler/frontend.common/src/org/jetbrains/kotlin/diagnostics/KtDiagnosticReportHelpers.kt) should be used. Such complexity with extension functions is needed to automatically resolve several issues:
- ensuring that each diagnostics reported on elements without a source are not swallowed
- reducing boilerplate for two convenient steps: creating a diagnostic from the factory and reporting of this diagnostic

## FIR contracts at checker stage

In CLI mode compiler runs checkers only after it analyzed the whole world till final FIR phase (`BODY_RESOLVE`). But IDE uses lazy resolve, so there can be a situation when some files are analyzed to `BODY_RESOLVE` and other files are not analyzed at all. This means that in checker one can not rely on the fact that some FIR elements should be resolved to some specific phase. The only exception is following: **If some element was passed directly to checker then it is guaranteed that this element is resolved to `BODY_RESOLVE` phase**. If some declaration is received somewhere from outside (from type, symbol provider or scope), then it can be resolved to any phase.

So, to avoid possible problems with accessing some information from FIR elements which was not yet calculated in AA mode, there are the following restrictions and recommendations:
- Access to `FirBasedSymbol<*>.fir` is prohibited. One can not extract any FIR element from the corresponding symbol
- Instead of that, if some information about declaration is needed (e.g., list of supertypes for some class symbol), special accessors from that symbol should be used (they are declared as members of symbols). Those accessors call lazy resolution to minimally required phase and after that extract required information from FIR
