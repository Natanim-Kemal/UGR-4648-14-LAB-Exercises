import 'dart:io';
import 'dart:core';

// Exercise 1
void exercise1() {
  String userInput = stdin.readLineSync()!;

  try {
    int number = int.parse(userInput);
    print('User input is $number');
  } catch (e) {
    print('Invalid input. Please enter a valid number.');
  }
}

// Exercise 2
int divide(int num1, int num2) {
  try {
    return num1 ~/ num2;
  } catch (e) {
    print('Error: Cannot divide by zero.');
    return -1;
  }
}

// Exercise 3
void readFile(String filePath) {
  try {
    String fileContents = File(filePath).readAsStringSync();
    print(fileContents);
  } on FileSystemException catch (e) {
    print('Error: $e');
  }
}
