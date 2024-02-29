bool isArraySorted(List<int> arr) {
  
  if (arr.length < 2) {
    return true;
  }
  
  
  for (int i = 0; i < arr.length - 1; i++) {

    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }

  
  return true;
}

void main() {
  List<int> sortedArray = [1, 2, 3, 4, 5];
  List<int> unsortedArray = [5, 3, 1, 4, 2];
  
  print("Is sortedArray sorted? ${isArraySorted(sortedArray)}");
  print("Is unsortedArray sorted? ${isArraySorted(unsortedArray)}");
}
