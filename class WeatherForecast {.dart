class WeatherForecast {
  double temperature;
  String conditions;

  WeatherForecast(this.temperature, this.conditions);

  double get celsius => temperature;

  double get fahrenheit => (temperature * 9 / 5) + 32;

  double get kelvin => temperature + 273.15;

  @override
  String toString() {
    return 'WeatherForecast(temperature: $temperature, conditions: $conditions)';
  }
}