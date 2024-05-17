fun main() {
  print("Enter the length of side A: ")
  val sideA = readLine()?.toDoubleOrNull()
  print("Enter the length of side B: ")
  val sideB = readLine()?.toDoubleOrNull()
  print("Enter the length of side C: ")
  val sideC = readLine()?.toDoubleOrNull()

  if (sideA == null || sideB == null || sideC == null) {
    println("Invalid input. Please enter valid lengths of sides.")
  } else if (sideA + sideB <= sideC || sideB + sideC <= sideA || sideA + sideC <= sideB) {
    println("Invalid triangle. Please enter valid lengths of sides.")
  } else {
    val isEquilateral = sideA == sideB && sideB == sideC
    val isIsosceles = sideA == sideB || sideB == sideC || sideA == sideC
    val isScalene = sideA != sideB && sideB != sideC && sideA != sideC

    if (isEquilateral) {
      println("The triangle is equilateral.")
    } else if (isIsosceles) {
      println("The triangle is isosceles.")
    } else {
      println("The triangle is scalene.")
    }
  }
}
