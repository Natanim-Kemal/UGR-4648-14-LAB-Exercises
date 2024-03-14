import 'dart:io';

void main() {
  // Exercise 1
  // declaring the variables
  String name = "Natanim Kemal";
  int age = 21;
  String favoriteColor = "Black";

  // printing the variables using string interpolation
  print(
      "My name is $name, I am $age years old, and my favorite color is $favoriteColor.");

  // Exercise 2
  const speedOfLight = 299792458;
  int? distance = int.parse(stdin.readLineSync()!);
  print("Input distance is $distance");
  double time = distance / speedOfLight;
  print("Time it takes to reach distance of $distance is $time");
}
