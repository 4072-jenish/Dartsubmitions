/*
Write a program to find the largest and smallest numbers in an inputted list using a loop
*/

import 'dart:io';

void main() {
  stdout.write('Enter the numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  if (numbers.isEmpty) {
    print('No numbers provided.');
    return;
  }

  int largest = numbers[0];
  int smallest = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
    if (numbers[i] < smallest) {
      smallest = numbers[i];
    }
  }

  print('The largest number is: $largest');
  print('The smallest number is: $smallest');
}
