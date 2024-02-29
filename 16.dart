/*
Write a program to find the GCD (Greatest Common Divisor) of two inputted numbers using a loop.
*/
import 'dart:io';

void main() {
  
  int a, b;


  print("Enter the first number:");
  a = int.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  b = int.parse(stdin.readLineSync()!);


  int gcd = findGCD(a, b);

  print("GCD of $a and $b is $gcd");
}

int findGCD(int a, int b) {
  
  if (a < b) {
    int temp = a;
    a = b;
    b = temp;
  }

  while (b != 0) {
    int remainder = a % b;
    
    a = b;
    b = remainder;
  }

  
  return a;
}
