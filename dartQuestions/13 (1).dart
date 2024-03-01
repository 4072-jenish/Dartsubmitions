class VehicleRentalSystem {
  Map<String, double> vehicles = {
    'car': 50.0,
    'truck': 75.0,
    'van': 100.0,
  };
  Map<String, DateTime> rentals = {};
  VehicleRentalSystem({required this.vehicles, required this.rentals});
  void rent(String vehicleType, DateTime startDate) {
    if (vehicles.containsKey(vehicleType)) {
      rentals[vehicleType] = startDate;
      print('$vehicleType rented at $startDate');
    } else {
      print('Invalid vehicle type');
    }
  }
  void returnVehicle(String vehicleType, DateTime endDate) {
    if (rentals.containsKey(vehicleType)) {
      double rentalRate = vehicles[vehicleType]!;
      Duration rentalDuration = endDate.difference(rentals[vehicleType]!);
      double rentalCost = rentalRate * rentalDuration.inHours;
      print('$vehicleType returned at $endDate. Rental cost: $rentalCost');
      rentals.remove(vehicleType);
    } else {
      print('Invalid vehicle type');
    }
  }
}
void main() {
  final rentalSystem = VehicleRentalSystem(vehicles: {'car': 50.0, 'truck': 75.0, 'van': 100.0}, rentals: {});
  DateTime startDate = DateTime.now();
  DateTime endDate = startDate.add(Duration(hours: 2));
  rentalSystem.rent('car', startDate);
  rentalSystem.returnVehicle('car', endDate);
}