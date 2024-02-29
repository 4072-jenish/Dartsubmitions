int findSmallest(List<int> arr) {

  if (arr.isEmpty) {
    throw ArgumentError("Array is empty");
  }
  
  
  int smallest = arr[0];

  
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < smallest) {
      smallest = arr[i];
    }
  }

  return smallest;
}

void main() {
  List<int> numbers = [12, 3, 7, 15, 9, 5];
  
  print("Array:");
  print(numbers);
  
  int smallest = findSmallest(numbers);
  
  print("\nThe smallest element in the array is: $smallest");
}
