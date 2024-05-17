fun factorial(n: Int): Long {
  return if (n == 0) 1 else n * factorial(n - 1)
}

fun main() {
  val num = 5
  val result = factorial(num)
  println("The factorial of $num is $result.")
}