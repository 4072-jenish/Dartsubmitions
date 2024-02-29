import 'dart:io';

void main() {
  stdout.write('Enter a string: ');
  String input = stdin.readLineSync()!;

  if (isPalindrome(input)) {
    print('$input is a palindrome.');
  } else {
    print('$input is not a palindrome.');
  }
}

bool isPalindrome(String str) {
  int length = str.length;

  for (int i = 0; i < length ~/ 2; i++) {
    if (str[i] != str[length - i - 1]) {
      return false;
    }
  }

  return true;
}
