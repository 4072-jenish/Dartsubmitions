class ShoppingCart {
  List<String> items;
  double totalCost;

  ShoppingCart() {
    items = [];
    totalCost = 0.0;
  }

  void addItem(String item, double price) {
    items.add(item);
    totalCost += price;
  }

  bool removeItem(String item) {
    if (items.contains(item)) {
      items.remove(item);
      
      totalCost -= calculateItemCost(item);
      return true;
    } else {
      return false;
    }
  }

  double calculateItemCost(String item) {
   
    Map<String, double> itemCosts = {
      'Apple': 1.0,
      'Banana': 0.5,
      'Orange': 0.8,
    
    };

    return itemCosts[item] ?? 0.0;
  }

  @override
  String toString() {
    return 'ShoppingCart(items: $items, totalCost: $totalCost)';
  }
}