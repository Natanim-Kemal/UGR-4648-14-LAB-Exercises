fun isPrime(num: Int): Boolean {
  if (num <= 1) {
    return false
  }
  var i = 2
  while (i * i <= num) {
    if (num % i == 0) {
      return false
    }
    i++
  }
  return true
}

fun findPrimesInRange(start: Int, end: Int): List<Int> {
  val primes = mutableListOf<Int>()
  var num = start
  while (num <= end) {
    if (isPrime(num)) {
      primes.add(num)
    }
    num++
  }
  return primes
}

fun main() {
  val start = 10
  val end = 50
  val primes = findPrimesInRange(start, end)
  println("The prime numbers between $start and $end are: ${primes.joinToString(", ")}")
}
