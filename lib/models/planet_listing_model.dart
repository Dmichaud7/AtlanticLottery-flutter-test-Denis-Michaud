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

  //Function that check if two dates are at the same time
  bool isSameTimeOfDay(DateTime date1, DateTime date2) {
    return date1.hour == date2.hour && date1.minute == date2.minute;
  }

  //Function the removes planet if the radius is smaller them min
  List<Planet> filterPlanetsByMinRadius(List<Planet> planets, double minRadius) {
    planets.removeWhere((p) => p.radius < minRadius);
    return planets;
  }
  int as = 1;
  
  //Function that sort the list in decending order by radius
  List<Planet> filterPlanetDecendingOrderByRadius(List<Planet> planets){
    planets.sort((b,a) => a.radius.compareTo(b.radius));
    return planets;
  }


}
