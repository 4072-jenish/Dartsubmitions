import 'dart:io';

void main() {
  stdout.write('Enter the number of terms: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> fibonacciSequence = generateFibonacci(n);

  print('The first $n terms of the Fibonacci sequence are: $fibonacciSequence');
}

List<int> generateFibonacci(int n) {
  List<int> fibonacciSequence = [];

  if (n >= 1) {
    fibonacciSequence.add(0);
  }
  if (n >= 2) {
    fibonacciSequence.add(1);
  }

  for (int i = 2; i < n; i++) {
    int nextTerm = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
    fibonacciSequence.add(nextTerm);
  }

  return fibonacciSequence;
}
