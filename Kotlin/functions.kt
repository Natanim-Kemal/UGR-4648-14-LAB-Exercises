fun sortArray(array: IntArray): IntArray {
  array.sort()
  return array
}

fun main() {
  val array = intArrayOf(5, 2, 8, 3, 1)
  val sortedArray = sortArray(array)
  println("Sorted array: ${sortedArray.joinToString(", ")}")
}