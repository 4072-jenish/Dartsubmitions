class Restaurant {
  Map<String, double> menuItems = {
    'burger': 8.0,
    'fries': 4.0,
    'salad': 6.0,
    'soda': 2.0,
  };
  Map<String, List<String>> orders = {};
  Restaurant({required this.menuItems, required this.orders});
  void placeOrder(String table, List<String> items) {
    orders[table] = items;
    print('Order placed for table $table: $items');
  }
  double calculateBill(String table) {
    double total = 0.0;
    if (orders.containsKey(table)) {
      for (String item in orders[table]!) {
        total += menuItems[item]!;
      }
      print('Total bill for table $table: $total');
      return total;
    } else {
      print('No order placed for table $table.');
      return -1.0;
    }
  }
}
void main() {
  final restaurant = Restaurant(menuItems: {'burger': 10.0, 'fries': 5.0, 'salad': 8.0, 'soda': 3.0});
  restaurant.placeOrder('Table 1', ['burger', 'fries']);
  restaurant.calculateBill('Table 1');
}