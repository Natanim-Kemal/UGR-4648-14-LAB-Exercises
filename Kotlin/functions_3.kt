fun hasUniqueChars(str: String): Boolean {
    return str.length == str.toSet().size
}

fun main() {
    val testString = "Hello"
    val result = hasUniqueChars(testString)
    println("Does the string '$testString' have all unique characters? $result")
}