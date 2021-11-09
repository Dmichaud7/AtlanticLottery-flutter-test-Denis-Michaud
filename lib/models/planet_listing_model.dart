import 'package:flutter_application_1/models/planet_model.dart';

class PlanetListingModel {
  // OPTIONS:
  // 1) Use the following hard coded list below to display data
  // 2) Expand the list below to include additional relevant data
  // 3) Fetch data remotely for the list
  List<Planet> planetsList = [
    Planet('Mercury', 2439.7),
    Planet('Uranus', 25362),
    Planet('Venus', 6051.8),
    Planet('Saturn', 58232),
  ];

  String getFormattedDate() {
    DateTime now = DateTime.now();
    return now.toString();
  }

  bool isSameTimeOfDay(DateTime date1, DateTime date2) {
    return date1.hour == date2.hour && date1.minute == date2.minute;
  }

  List<Planet> filterPlanetsByMinRadius(List<Planet> planets, double minRadius) {
    planets.removeWhere((p) => p.radius < minRadius);
    return planets;
  }


}
