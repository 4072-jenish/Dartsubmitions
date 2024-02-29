/*
Write a program to find the largest element in an array.
*/
void main() {
  List<int> numbers = [10, 20, 4, 45, 78, 35, 6, 90, 25, 50];

  int largest = findLargest(numbers);

  print('The largest element in the array is: $largest');
}

int findLargest(List<int> arr) {
  if (arr.isEmpty) {
    throw Exception("Array is empty");
  }

  int largest = arr[0];

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      largest = arr[i];
    }
  }

  return largest;
}
