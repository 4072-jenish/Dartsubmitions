import 'dart:io';

void main() {
  stdout.write('Enter the first number: ');
  int n = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the second number: ');
  int n1 = int.parse(stdin.readLineSync()!);

  int sum = calculateSum(n, n1);

  print('The sum of all numbers between $n and $n1 is: $sum');
}

int calculateSum(int a, int b) {
  int sum = 0;

  int smaller = a < b ? a : b;
  int larger = a > b ? a : b;

  for (int i = smaller; i <= larger; i++) {
    sum += i;
  }

  return sum;
}
