int maxProduct(List<int> arr) {
  if (arr.length < 2) {
    throw ArgumentError("Array must contain at least two elements");
  }

  int maxProduct = arr[0] * arr[1];

  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      int product = arr[i] * arr[j];
      if (product > maxProduct) {
        maxProduct = product;
      }
    }
  }

  return maxProduct;
}

void main() {
  List<int> numbers = [1, 3, 5, 2, 7, 4];
  
  print("Array:");
  print(numbers);
  
  int result = maxProduct(numbers);
  
  print("\nThe maximum product of any two elements in the array is: $result");
}
