bool arraysAreEqual(List<int> arr1, List<int> arr2) {
  
  if (arr1.length != arr2.length) {
    return false;
  }
  for (int i = 0; i < arr1.length; i++) {
    if (arr1[i] != arr2[i]) {
      return false;
    }
  }

  
  return true;
}

void main() {
  List<int> array1 = [1, 2, 3, 4, 5];
  List<int> array2 = [1, 2, 3, 4, 5];
  
  print("Array 1: $array1");
  print("Array 2: $array2");
  
  if (arraysAreEqual(array1, array2)) {
    print("The arrays are equal.");
  } else {
    print("The arrays are not equal.");
  }
}
