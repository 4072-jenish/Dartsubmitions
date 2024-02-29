class Restaurant {
  Map<String, double> menuItems;
  Map<String, int> orderItems;

  Restaurant() {
    menuItems = {
      'Burger': 10.0,
      'Pizza': 15.0,
      'Salad': 8.0,
      'Soda': 2.0,
    };
    orderItems = {};
  }

  void order(String item, int quantity) {
    if (menuItems.containsKey(item)) {
      if (orderItems.containsKey(item)) {
        orderItems[item] += quantity;
      } else {
        orderItems[item] = quantity;
      }
    } else {
      throw ArgumentError('$item is not a valid menu item');
    }
  }

  void pay(double amount) {
    if (amount >= totalCost) {
      orderItems.clear();
      print('Thank you for your payment of $amount. Your order will be ready shortly.');
    } else {
      throw ArgumentError('$amount is not sufficient to cover the total cost of your order');
    }
  }

  double get totalCost => orderItems.entries.map((e) => e.key.price * e.value).reduce((a, b) => a + b);

  @override
  String toString() {
    return 'Restaurant(menuItems: $menuItems, orderItems: $orderItems)';
  }
}