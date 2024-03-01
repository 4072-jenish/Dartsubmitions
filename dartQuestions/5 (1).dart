class ShoppingCart {
  Map<String, int> items = {};
  Map<String, double> prices = {};
  ShoppingCart({required this.items, required this.prices});
  void addItem(String item, int quantity) {
    if (items.containsKey(item)) {
      items[item] = items[item]! + quantity;
    } else {
      items[item] = quantity;
    }
    print('$item has been added to the cart $quantity times.');
  }
  void removeItem(String item) {
    if (items.containsKey(item)) {
      items.remove(item);
      print('$item has been removed from the cart.');
    } else {
      print('$item is not in the cart.');
    }
  }
  void applyDiscount(double discount) {
    if (discount > 0 && discount <= 1) {
      prices.forEach((key, value) {
        prices[key] = value * (1 - discount);
      });
      print('Discount of $discount has been applied to all items in the cart.');
    } else {
      print('Invalid discount value.');
    }
  }
  double checkout() {
    double total = 0;
    items.forEach((key, value) {
      total += prices[key]! * value;
    });
    return total;
  }
}
void main() {
  final cart = ShoppingCart(items: {'apple': 5, 'banana': 3}, prices: {'apple': 1.0, 'banana': 0.5});
  cart.addItem('orange', 4);
  cart.removeItem('banana');
  cart.applyDiscount(0.1);
  print('Total cost: ${cart.checkout()}');
}