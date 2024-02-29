/*
Write a program to convert a decimal number to binary using a loop.
*/
import 'dart:io';

void main() {
  int decimalNumber;

  print("Enter a decimal number:");
  decimalNumber = int.parse(stdin.readLineSync()!);

  String binary = convertDecimalToBinary(decimalNumber);

  print("Binary representation: $binary");
}

String convertDecimalToBinary(int decimalNumber) {
  String binary = "";

  while (decimalNumber > 0) {
    int remainder = decimalNumber % 2;

    binary = remainder.toString() + binary;

    decimalNumber ~/= 2;
  }

  return binary.isNotEmpty ? binary : "0";
}
