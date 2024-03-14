import 'dart:math';

class Rectangle {
  num width;
  num height;

  Rectangle(this.width, this.height);

  num calculateArea() => width * height;

  num calculatePerimeter() => 2 * (width + height);
}

class Product {
  String name;
  num price;
  num quantity;

  Product(this.name, this.price, this.quantity);

  num calculateTotalCost() => price * quantity;
}

abstract class Shape {
  num calculateArea();
}

class Circle extends Shape {
  num radius;

  Circle(this.radius);

  @override
  num calculateArea() => pi * pow(radius, 2);
}

class Square extends Shape {
  num side;

  Square(this.side);

  @override
  num calculateArea() => pow(side, 2);
}
