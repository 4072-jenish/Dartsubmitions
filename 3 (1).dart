/*Write a program to find the average of all elements in an array.
*/
double findAverage(List<double> array) {
  if (array.isEmpty) {
    throw ArgumentError("Array must not be empty");
  }

  double sum = 0;
  for (var number in array) {
    sum += number;
  }

  return sum / array.length;
}

void main() {
  List<double> numbers = [1, 2, 3, 4, 5];
  double average = findAverage(numbers);
  print("The average is: $average");
}
