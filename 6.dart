import 'dart:io';

void main() {
  stdout.write('Enter the first number: ');
  int firstNumber = int.parse(stdin.readLineSync()!);
  
  stdout.write('Enter the second number: ');
  int secondNumber = int.parse(stdin.readLineSync()!);
  
  int sum = sumOfPrimes(firstNumber, secondNumber);
  
  print('The sum of all prime numbers between $firstNumber and $secondNumber is: $sum');
}

int sumOfPrimes(int start, int end) {
  int sum = 0;
  
  for (int i = start; i <= end; i++) {
    if (isPrime(i)) {
      sum += i;
    }
  }
  
  return sum;
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  
  return true;
}
