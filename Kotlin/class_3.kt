data class Item(val name: String, val price: Double)

class ShoppingCart {
    private val items = mutableListOf<Item>()

    fun addItem(item: Item) {
        items.add(item)
    }

    fun removeItem(item: Item) {
        items.remove(item)
    }

    fun totalPrice(): Double {
        return items.sumOf { it.price }
    }
}

fun main() {
    val cart = ShoppingCart()
    val item1 = Item("Apple", 0.99)
    val item2 = Item("Banana", 0.59)

    cart.addItem(item1)
    cart.addItem(item2)
    println("Total price: ${cart.totalPrice()}")

    cart.removeItem(item1)
    println("Total price after removing item1: ${cart.totalPrice()}")
}