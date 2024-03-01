import 'dart:io';
class Vehicle {
  String make;
  String model;
  int year;
  Vehicle({required this.make, required this.model, required this.year});
  void accelerate() {
    print('The $make $model is accelerating.');
  }
  void brake() {
    print('The $make $model is braking.');
  }
}
void main() {
  Vehicle myCar = Vehicle(make: 'Volvo', model: 'XC 90', year: 2022);
  myCar.accelerate();
  myCar.brake();
}