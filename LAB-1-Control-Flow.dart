import 'dart:io';

void main() {
  // Exercise 1
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print("$number is even");
  } else {
    print("$number is odd");
  }

  // Exercise 2
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // Exercise 4
  stdout.write("Enter operation (+, -, *, /): ");
  String operation = stdin.readLineSync()!;
  stdout.write("Enter first number: ");
  num num1 = double.parse(stdin.readLineSync()!);
  stdout.write("Enter second number: ");
  num num2 = double.parse(stdin.readLineSync()!);
  num result;
  switch (operation) {
    case "+":
      result = num1 + num2;
      break;
    case "-":
      result = num1 - num2;
      break;
    case "*":
      result = num1 * num2;
      break;
    case "/":
      result = num1 / num2;
      break;
    default:
      stdout.writeln("Invalid operation");
      return;
  }
  stdout.writeln("$num1 $operation $num2 = $result");

  // Exercise 5
  stdout.write("Enter grade (0-100): ");
  int grade = int.parse(stdin.readLineSync()!);
  String letterGrade;
  switch (grade / 10) {
    case 10:
    case 9:
      letterGrade = "A";
      break;
    case 8:
      letterGrade = "B";
      break;
    case 7:
      letterGrade = "C";
      break;
    case 6:
      letterGrade = "D";
      break;
    default:
      letterGrade = "F";
  }
  print("Grade $grade is $letterGrade");
}
