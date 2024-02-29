/*
Write a program to convert a binary number to decimal using a loop.
*/
import 'dart:io';

void main() {
  String binaryNumber;

  print("Enter a binary number:");
  binaryNumber = stdin.readLineSync()!;

  int decimal = convertBinaryToDecimal(binaryNumber);

  print("Decimal representation: $decimal");
}

int convertBinaryToDecimal(String binaryNumber) {
  int decimal = 0;

  for (int i = 0; i < binaryNumber.length; i++) {
    int digit = int.parse(binaryNumber[i]);

    decimal += digit * pow(2, binaryNumber.length - i - 1);
  }

  return decimal;
}
