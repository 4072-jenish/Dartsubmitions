/*
Write a program to find the LCM (Least Common Multiple) of two inputted numbers using a loop.
*/
import 'dart:io';

void main() {
  int num1, num2;

  print("Enter the first number:");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  num2 = int.parse(stdin.readLineSync()!);

  int lcm = findLCM(num1, num2);

  print("LCM of $num1 and $num2 is $lcm");
}

int findLCM(int num1, int num2) {
  int max = (num1 > num2) ? num1 : num2;

  while (true) {
    if (max % num1 == 0 && max % num2 == 0) {
      return max;
    }

    max++;
  }
}
