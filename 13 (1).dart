List<int> rotateLeft(List<int> arr, int positions) {
  
  int effectiveRotations = positions % arr.length;

  
  List<int> rotatedArray = [];

  
  for (int i = effectiveRotations; i < arr.length + effectiveRotations; i++) {
    rotatedArray.add(arr[i % arr.length]);
  }

  return rotatedArray;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int positions = 2; 
  
  print("Original array:");
  print(numbers);
  
  List<int> rotatedArray = rotateLeft(numbers, positions);
  
  print("\nArray after rotating left by $positions positions:");
  print(rotatedArray);
}
