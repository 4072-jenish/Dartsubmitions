class WeatherApp {
  String location;
  double temperature;
  WeatherApp({required this.location, required this.temperature});
  void updateLocation(String newLocation) {
    location = newLocation;
    print('Location updated to $location');
  }
  void displayForecast(String forecast) {
    temperature = double.parse(forecast.split(' ')[1]);
    print('Forecast for $location: $forecast');
  }
}
void main() {
  final weatherApp = WeatherApp(location: 'New York', temperature: 20.0);
  weatherApp.updateLocation('Los Angeles');
  weatherApp.displayForecast('Partly cloudy, 75°F');
}