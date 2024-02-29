/*
Write a program to count the number of even and odd elements in an array
*/
void main countEvenOdd(List<int> array) {
  int evenCount = 0;
  int oddCount = 0;
  
  for (var number in array) {
    if (number % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }
  
  print("Number of even elements: $evenCount");
  print("Number of odd elements: $oddCount");
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  countEvenOdd(numbers);
}
