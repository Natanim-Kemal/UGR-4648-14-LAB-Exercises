class Rectangle(val length: Double, val width: Double) {
    fun perimeter(): Double {
        return 2 * (length + width)
    }

    fun area(): Double {
        return length * width
    }
}

fun main() {
    val rectangle = Rectangle(5.0, 3.0)
    println("Perimeter of the rectangle is ${rectangle.perimeter()}")
    println("Area of the rectangle is ${rectangle.area()}")
}