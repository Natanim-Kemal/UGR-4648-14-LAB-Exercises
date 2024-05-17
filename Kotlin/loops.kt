fun sumEvenNumbers(): Int {
  var sum = 0
  for (i in 1..50) {
    if (i % 2 == 0) {
      sum += i
    }
  }
  return sum
}

fun main() {
  val sum = sumEvenNumbers()
  println("The sum of all even numbers from 1 to 50 is $sum.")
}