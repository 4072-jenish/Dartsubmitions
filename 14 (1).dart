List<int> rotateRight(List<int> arr, int positions) {
  // Calculate the effective number of rotations (taking modulo to handle cases where positions > arr.length)
  int effectiveRotations = positions % arr.length;

  // Create a new list to store the rotated array
  List<int> rotatedArray = [];

  // Perform the rotation
  for (int i = 0; i < arr.length; i++) {
    int newIndex = (i + arr.length - effectiveRotations) % arr.length;
    rotatedArray.add(arr[newIndex]);
  }

  return rotatedArray;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int positions = 2; // Number of positions to rotate right
  
  print("Original array:");
  print(numbers);
  
  List<int> rotatedArray = rotateRight(numbers, positions);
  
  print("\nArray after rotating right by $positions positions:");
  print(rotatedArray);
}
