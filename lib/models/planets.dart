class Planets {
  final String name;
  final String distanceToSun;
  final String image;

  Planets({required this.name, required this.distanceToSun, required this.image});

  factory Planets.fromJson(Map<String, dynamic> json) {
    
    var extra = json["extra"];

    return Planets(
      name: json["planetName"],
      distanceToSun: extra["distanceToSun"].toString(),
      image: json["imageThumbnail"],
    );
  }
}
