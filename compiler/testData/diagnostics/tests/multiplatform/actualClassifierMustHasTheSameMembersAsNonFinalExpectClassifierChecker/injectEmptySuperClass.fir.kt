// MODULE: m1-common
// FILE: common.kt

expect open class Foo {
    fun existingMethod()
    val existingParam: Int
}

// MODULE: m2-jvm()()(m1-common)
// FILE: jvm.kt

open class InjectedEmptySuperClass()

// Hypothetically, it's more restricting than necessary. But technically, actual and expect scopes don't match (from some perspective).
// If it wasn't reported, it wouldn't be cool that once you add a member to InjectedSuperClass, Foo would become red
actual open class Foo : InjectedEmptySuperClass() {
    actual fun existingMethod() {}
    actual val existingParam: Int = 904
}
