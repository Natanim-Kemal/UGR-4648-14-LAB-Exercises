import 'dart:math';

void main() {
  // Exercise 1
  var hobbies = <String>['reading', 'hiking', 'cooking'];
  print(hobbies.isEmpty);
  hobbies.add('swimming');
  hobbies.sort();
  print(hobbies.remove('reading'));
  print(hobbies);

  // Exercise 2
  var randomList = List.generate(10, (_) => Random().nextInt(100));
  var uniqueList = Set.from(randomList);
  print(uniqueList.toList());

  // Exercise 3
  var studentMarks = <String, List<int>>{
    'John': [78, 82, 90],
    'Jane': [85, 76, 92]
  };
  studentMarks.putIfAbsent('Alice', () => []);
  studentMarks['Alice']?.addAll([88, 79, 95]);
  studentMarks.forEach((name, marks) =>
      print('$name: ${marks.reduce((a, b) => a + b) ~/ marks.length}'));
  print(studentMarks.containsKey('Jane'));

  // Exercise 4
  var shoppingCart = <String, int>{'book': 2, 'pencil': 5, 'eraser': 1};
  shoppingCart['pen'] = 3;
  var totalPrice = shoppingCart.keys
      .map((item) => item.endsWith('book') ? 15 : 2)
      .reduce((a, b) => a * b);
  print(totalPrice);
  shoppingCart.remove('pen');
  print(shoppingCart);

  var john = Student('John', [88, 79, 95]);
  print(john.getAverageMark());
}

// Exercise 5
class Student {
  final String name;
  final List<int> marks;

  Student(this.name, this.marks);

  double getAverageMark() => marks.reduce((a, b) => a + b) / marks.length;
}
