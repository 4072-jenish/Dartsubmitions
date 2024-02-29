import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);

  int digitSum = calculateDigitSum(number);

  print('The sum of digits of $number until it is a single digit is: $digitSum');
}

int calculateDigitSum(int number) {
  while (number >= 10) {
    int sum = 0;
    
    while (number > 0) {
      sum += number % 10;
      number ~/= 10;
    }

    number = sum;
  }

  return number;
}
