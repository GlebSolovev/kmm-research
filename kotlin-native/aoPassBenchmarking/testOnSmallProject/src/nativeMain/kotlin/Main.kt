const val BENCHMARK_SIZE = 10000

// Source: kotlin-native/performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt
class ForLoopsBenchmark {

    private val uLongArray = ULongArray(BENCHMARK_SIZE) {
        it.toULong()
    }

    fun uLongArrayLoop(): ULong {
        var sum: ULong = 0u
        for (e in uLongArray) {
            sum += e
        }
        return sum
    }
}

fun main() {
    ForLoopsBenchmark().uLongArrayLoop()
}
