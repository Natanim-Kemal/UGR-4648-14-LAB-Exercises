class Triangle(val side1: Double, val side2: Double, val side3: Double) {
    fun isEquilateral(): Boolean {
        return side1 == side2 && side2 == side3
    }

    fun isIsosceles(): Boolean {
        return side1 == side2 || side1 == side3 || side2 == side3
    }

    fun isScalene(): Boolean {
        return side1 != side2 && side1 != side3 && side2 != side3
    }
}

fun main() {
    val triangle = Triangle(3.0, 4.0, 5.0)
    println("Is the triangle equilateral? ${triangle.isEquilateral()}")
    println("Is the triangle isosceles? ${triangle.isIsosceles()}")
    println("Is the triangle scalene? ${triangle.isScalene()}")
}