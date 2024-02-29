List<int> removeDuplicates(List<int> arr) {
  
  Set<int> uniqueSet = {};

  
  List<int> result = [];

  
  for (int i = 0; i < arr.length; i++) {
    
    if (!uniqueSet.contains(arr[i])) {
      uniqueSet.add(arr[i]);
      result.add(arr[i]);
    }
  }

  return result;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 2, 3, 4, 2];
  
  print("Original array:");
  print(numbers);
  
  List<int> result = removeDuplicates(numbers);
  
  print("\nArray after removing duplicates:");
  print(result);
}
