
fun readInput(prompt: String): Double? {
  print(prompt)
  return readLine()?.toDoubleOrNull()
}

fun findLargest(num1: Double, num2: Double, num3: Double): Double {
  return if (num1 >= num2) {
    if (num1 >= num3) num1 else num3
  } else {
    if (num2 >= num3) num2 else num3
  }
}

fun main() {
  val num1 = readInput("Enter the first number: ")
  val num2 = readInput("Enter the second number: ")
  val num3 = readInput("Enter the third number: ")

  if (num1 == null || num2 == null || num3 == null) {
    println("Invalid input. Please enter valid numbers.")
  } else {
    val largest = findLargest(num1, num2, num3)
    println("The largest number is $largest.")
  }
}