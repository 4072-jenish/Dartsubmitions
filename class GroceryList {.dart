class GroceryList {
  final Map<String, int> _items;

  GroceryList([Map<String, int> items = const {}]) : _items = items;

  void add(String item, [int quantity = 1]) {
    if (_items.containsKey(item)) {
      _items[item] += quantity;
    } else {
      _items[item] = quantity;
    }
  }

  bool remove(String item) {
    if (_items.containsKey(item)) {
      _items.remove(item);
      return true;
    }
    return false;
  }

  List<String> getKeys() {
    return _items.keys.toList();
  }

  List<int> getValues() {
    return _items.values.toList();
  }

  @override
  String toString() {
    return _items.entries.map((entry) => '${entry.key}: ${entry.value}').join(', ');
  }
}

void main() {
  final groceryList = GroceryList();
  groceryList.add('Apples');
  groceryList.add('Bananas', 3);
  groceryList.add('Oranges', 4);
  print(groceryList); // Output: Apples: 1, Bananas: 3, Oranges: 4
  groceryList.remove('Apples');
  print(groceryList); // Output: Bananas: 3, Oranges: 4
}