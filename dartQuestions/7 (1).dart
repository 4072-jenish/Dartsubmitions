class TicketBookingSystem {
  List<String> seats = List.generate(10, (index) => '${index + 1}');
  Map<String, double> prices = {'adult': 20.0, 'child': 10.0, 'senior': 15.0};
  Map<String, String> bookings = {};
  TicketBookingSystem({required this.seats, required this.prices});
  void reserve(String seat, String category, String name) {
    if (seats.contains(seat)) {
      if (!bookings.containsKey(seat)) {
        bookings[seat] = '$name ($category)';
        print('$seat reserved for $name ($category).');
      } else {
        print('$seat is already reserved.');
      }
    } else {
      print('Invalid seat number.');
    }
  }
  void cancel(String seat) {
    if (bookings.containsKey(seat)) {
      bookings.remove(seat);
      print('$seat cancelled.');
    } else {
      print('$seat is not reserved.');
    }
  }
  double getPrice(String category) {
    if (prices.containsKey(category)) {
      return prices[category]!;
    } else {
      print('Invalid category.');
      return -1;
    }
  }
}

void main() {
  final bookingSystem = TicketBookingSystem(seats: [], prices: {'adult': 25.0, 'child': 12.0, 'senior': 20.0});
  bookingSystem.reserve('1', 'adult', 'John Doe');
  bookingSystem.reserve('2', 'child', 'Jane Doe');
  bookingSystem.cancel('1');
  print('Price for adult ticket: ${bookingSystem.getPrice('adult')}');
}