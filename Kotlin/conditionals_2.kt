fun readInput(prompt: String): Double? {
  print(prompt)
  return readLine()?.toDoubleOrNull()
}

fun calculatePay(hours: Double, rate: Double): Double {
  val overtimeHours = if (hours > 40) hours - 40 else 0.0
  val regularPay = hours.coerceAtMost(40) * rate
  val overtimePay = overtimeHours * rate * 1.5
  return regularPay + overtimePay
}

fun main() {
  val hours = readInput("Enter the number of hours worked: ")
  val rate = readInput("Enter the hourly rate: ")

  if (hours == null || rate == null) {
    println("Invalid input. Please enter valid hours and rate.")
  } else {
    val totalPay = calculatePay(hours, rate)
    println("The total salary is $totalPay")
  }
}