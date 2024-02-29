List<int> mergeSortedArrays(List<int> arr1, List<int> arr2) {
  List<int> mergedArray = [];

  int i = 0, j = 0;

  
  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      mergedArray.add(arr1[i]);
      i++;
    } else {
      mergedArray.add(arr2[j]);
      j++;
    }
  }

  
  while (i < arr1.length) {
    mergedArray.add(arr1[i]);
    i++;
  }

  
  while (j < arr2.length) {
    mergedArray.add(arr2[j]);
    j++;
  }

  return mergedArray;
}

void main() {
  List<int> arr1 = [1, 3, 5, 7, 9];
  List<int> arr2 = [2, 4, 6, 8, 10];
  
  print("Array 1: $arr1");
  print("Array 2: $arr2");
  
  List<int> mergedArray = mergeSortedArrays(arr1, arr2);
  
  print("\nMerged sorted array:");
  print(mergedArray);
}
