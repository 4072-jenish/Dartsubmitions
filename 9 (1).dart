int findFrequency(List<int> arr, int target) {
  int frequency = 0;
  
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      frequency++;
    }
  }
  
  return frequency;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 2, 2, 3, 4, 2];
  int target = 2;
  
  int frequency = findFrequency(numbers, target);
  
  print("The frequency of $target in the array is: $frequency");
}
