import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);
  
  int factorial = calculateFactorial(number);
  
  print('The factorial of $number is: $factorial');
}

int calculateFactorial(int n) {
  int factorial = 1;
  
  for (int i = 2; i <= n; i++) {
    factorial *= i;
  }
  
  return factorial;
}
