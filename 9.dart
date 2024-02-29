import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);

  int reversedNumber = reverseNumber(number);

  print('The reversed number is: $reversedNumber');
}

int reverseNumber(int number) {
  int reversedNumber = 0;

  while (number != 0) {
    int digit = number % 10;
    reversedNumber = reversedNumber * 10 + digit;
    number ~/= 10;
  }

  return reversedNumber;
}
