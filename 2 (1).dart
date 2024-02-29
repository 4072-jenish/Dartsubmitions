/*
Write a program to find the sum of all elements in an array.
*/
void main() {
  List<int> array = [1, 2, 3, 4, 5];
  int sum = findSum(array);
  print("The sum of the elements in the array is: $sum");
}

int findSum(List<int> array) {
  int sum = 0;
  for (int i = 0; i < array.length; i++) {
    sum += array[i];
  }
  return sum;
}
