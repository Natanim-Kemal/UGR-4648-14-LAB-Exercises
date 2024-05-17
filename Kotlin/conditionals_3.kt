fun readInput(prompt: String): Int? {
    print(prompt)
    return readLine()?.toIntOrNull()
}

fun determineSeason(month: Int, day: Int): String {
    return when (month) {
        12 -> if (day < 21) "Fall" else "Winter"
        1, 2 -> "Winter"
        3 -> if (day < 20) "Winter" else "Spring"
        4, 5 -> "Spring"
        6 -> if (day < 21) "Spring" else "Summer"
        7, 8 -> "Summer"
        9 -> if (day < 22) "Summer" else "Fall"
        10, 11 -> "Fall"
        else -> "Invalid month"
    }
}

fun main() {
    val month = readInput("Enter the month (1-12): ")
    val day = readInput("Enter the day (1-31): ")

    if (month == null || day == null) {
        println("Invalid input. Please enter valid month and day.")
    } else {
        val season = determineSeason(month, day)
        println("The season is $season.")
    }
}