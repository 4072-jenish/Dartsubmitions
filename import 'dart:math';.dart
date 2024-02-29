import 'dart:math';

class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);

  double findDistance(Location other) {
    double lat1 = this.latitude * pi / 180;
    double lat2 = other.latitude * pi / 180;
    double lon1 = this.longitude * pi / 180;
    double lon2 = other.longitude * pi / 180;
    double R = 6371; // Radius of the earth in km
    double dLat = (other.latitude - this.latitude) * pi / 180;
    double dLon = (other.longitude - this.longitude) * pi / 180;
    double a =
        pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c; // Distance in KM
  }

  String findDirection(Location other) {
    double lat1 = this.latitude;
    double lat2 = other.latitude;
    double lon1 = this.longitude;
    double lon2 = other.longitude;
    double dLon = (lon2 - lon1);

    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double brng = atan2(y, x);

    brng = (brng * 180 / pi + 360) % 360;
    if (brng < 0) {
      brng += 360;
    }
    if (brng >= 349 || brng < 11) {
      return 'North';
    } else if (brng >= 11 && brng < 349) {
      return 'South';
    } else if (brng >= 67 && brng < 113) {
      return 'East';
    } else if (brng >= 113 && brng < 247) {
      return 'West';
    } else if (brng >= 247 && brng < 293) {
      return 'North West';
    } else if (brng >= 293 && brng < 337) {
      return 'North East';
    } else if (brng >= 11 && brng < 67) {
      return 'South West';
    } else if (brng >= 247 && brng < 293) {
      return 'South East';
    } else {
      return 'Error: Invalid direction';
    }
  }
}

void main() {
  var currentLocation = Location(40.7128, -74.0060);
  var destinationLocation = Location(34.0522, -118.2437);
  print('Distance: ${currentLocation.findDistance(destinationLocation)} km');
  print('Direction: ${currentLocation.findDirection(destinationLocation)}');
}