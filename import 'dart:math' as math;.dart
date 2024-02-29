import 'dart:math' as math;

class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);

  double distanceTo(Location other) {
    var earthRadiusKm = 6371;

    var dLat = math.radians(other.latitude - latitude);
    var dLong = math.radians(other.longitude - longitude);

    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(math.radians(latitude)) *
            math.cos(math.radians(other.latitude)) *
            math.sin(dLong / 2) *
            math.sin(dLong / 2);
    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadiusKm * c;
  }

  String directionTo(Location other) {
    var dLon = other.longitude - longitude;
    var y = math.sin(dLat) * math.cos(other.latitude);
    var x =
        math.cos(latitude) * math.sin(other.latitude) -
            math.sin(latitude) * math.cos(other.latitude) * math.cos(dLon);

    var brng = math.atan2(y, x);
    brng = math.toDegrees(y < 0 ? brng - math.pi : brng + math.pi);

    return (brng.abs() > 180)
        ? '${(brng + 360).round()}°'
        : '${brng.round()}°';
  }
}