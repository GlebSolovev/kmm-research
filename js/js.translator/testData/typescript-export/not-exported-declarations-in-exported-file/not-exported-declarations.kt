/** This file is generated by {@link :js:js.test:generateJsExportOnFileTestFilesForTS} task. DO NOT MODIFY MANUALLY */

// CHECK_TYPESCRIPT_DECLARATIONS
// RUN_PLAIN_BOX_FUNCTION
// SKIP_MINIFICATION
// SKIP_NODE_JS
// INFER_MAIN_MODULE
// MODULE: JS_TESTS
// WITH_STDLIB
// FILE: declarations.kt

@file:JsExport

package foo


interface ExportedInterface {
    .Ignore
    val baz: String

    .Ignore
    fun inter(): String

    .Ignore
    class NotExportableNestedInsideInterface

    .Ignore
    companion object {
        val foo: String ="FOO"
    }
}


class OnlyFooParamExported(val foo: String) : ExportedInterface {
    .Ignore
    constructor() : this("TEST")

    override val baz = "Baz"

    override fun inter(): String = "Inter"

    .Ignore
    val bar = "Bar"

    .Ignore
    inline fun <A, reified B> A.notExportableReified(): Boolean = this is B

    .Ignore
    suspend fun notExportableSuspend(): String = "SuspendResult"

    .Ignore
    fun notExportableReturn(): List<String> = listOf("1", "2")

    .Ignore
    val String.notExportableExentsionProperty: String
        get() = "notExportableExentsionProperty"

    .Ignore
    annotation class NotExportableAnnotation

    .Ignore
    value class NotExportableInlineClass(val value: Int)
}