class Planet {
  final String name;
  final double radius;

  Planet(this.name, this.radius);
  
  @override
  String toString() {
    return '$name - radius: $radius';
  }
}
