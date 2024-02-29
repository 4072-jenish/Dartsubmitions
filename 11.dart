import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);

  int sumOfDigits = calculateSumOfDigits(number);

  print('The sum of digits in $number is: $sumOfDigits');
}

int calculateSumOfDigits(int number) {
  int sum = 0;

  while (number != 0) {
    int digit = number % 10;
    sum += digit;
    number ~/= 10;
  }

  return sum;
}
