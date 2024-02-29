/*
Write a program to sort an inputted list in ascending order using a loop.
*/
void main() {
  // Input list
  List<int> numbers = [];

  // Reading input from the user
  print("Enter the numbers separated by spaces:");
  String input = stdin.readLineSync();
  List<String> inputs = input.split(" ");

  // Converting input strings to integers and adding them to the list
  for (String item in inputs) {
    numbers.add(int.parse(item));
  }

  // Sorting the list using a loop
  for (int i = 0; i < numbers.length - 1; i++) {
    for (int j = i + 1; j < numbers.length; j++) {
      if (numbers[i] > numbers[j]) {
        // Swap elements if they are in the wrong order
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }

  // Displaying the sorted list
  print("Sorted list in ascending order:");
  print(numbers);
}
