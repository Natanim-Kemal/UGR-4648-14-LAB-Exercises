// Exercise 1
int sum(int num1, int num2) {
  return num1 + num2;
}

void main() {
  print(sum(10, 20));
}

// Exercise 2
bool isPrime(int num) {
  if (num <= 1) {
    return false;
  }

  for (int i = 2; i <= num ~/ i; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}

void checkPrimeRange(int start, int end) {
  for (int i = start; i <= end; i++) {
    if (isPrime(i)) {
      print(i);
    }
  }
}

// Exercise 3
String reverseString(String input) {
  String reversed = "";
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}
