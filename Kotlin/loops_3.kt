fun isPalindrome(num: Int): Boolean {
    var reversed = 0
    var remainder: Int
    var original = num

    while (original != 0) {
        remainder = original % 10
        reversed = reversed * 10 + remainder
        original /= 10
    }

    return num == reversed
}

fun main() {
    print("Enter a number: ")
    val num = readLine()?.toIntOrNull()
    if (num != null) {
        val result = isPalindrome(num)
        println("Is the number $num a palindrome? $result")
    } else {
        println("Invalid input. Please enter a valid number.")
    }
}