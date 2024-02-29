import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);

  int digitCount = countDigits(number);

  print('The number of digits in $number is: $digitCount');
}

int countDigits(int number) {
  int digitCount = 0;

  if (number == 0) {
    return 1;
  }

  while (number != 0) {
    digitCount++;
    number ~/= 10;
  }

  return digitCount;
}
