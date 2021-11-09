import 'package:flutter/material.dart';

class PlanetDisplay extends StatelessWidget {
  final String? name;
  final double? radius;

  const PlanetDisplay({
    Key? key,
    this.name,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name!),
          Text(radius.toString()),
        ],
      ),
    );
  }
}
