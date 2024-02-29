import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);
  
  if (isPalindrome(number)) {
    print('$number is a palindrome.');
  } else {
    print('$number is not a palindrome.');
  }
}
