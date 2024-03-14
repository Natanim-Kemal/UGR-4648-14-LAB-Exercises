class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  // Accessors
  String getName() {
    return this.name;
  }

  int getAge() {
    return this.age;
  }

  String getAddress() {
    return this.address;
  }

  // Modifiers
  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setAddress(String address) {
    this.address = address;
  }
}

class Student extends Person {
  int rollNumber;
  double marks;

  Student(String name, int age, String address, this.rollNumber, this.marks)
      : super(name, age, address);

  double calculateTotalMarks() {
    return this.marks;
  }

  double calculateAverage() {
    return this.marks / 2;
  }
}

void main() {
  // Exercise-1
  Person person1 = Person("Natanim", 21, "Addis Ababa");
  Person person2 = Person("Mary", 30, "Hawassa");

  print(person1.getName());
  print(person2.getAge());

  person1.setName("Chernet");
  person2.setAddress("Chuko");

  print(person1.getName());
  print(person2.getAddress());

  // Exercise-2
  Student student1 = Student("Tesfaye", 25, "Addis Ababa", 101, 85.5);
  Student student2 = Student("Yonas", 26, "Dire Dawa", 102, 90.0);

  print("Total marks of student1 is: ${student1.calculateTotalMarks()}");
  print("Average of student2 is: ${student2.calculateAverage()}");
}
