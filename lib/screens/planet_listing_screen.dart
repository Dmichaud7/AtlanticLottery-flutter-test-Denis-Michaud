import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';
// import 'package:flutter_application_1/models/planet_model.dart';
// import 'package:flutter_application_1/widgets/planet_display.dart';
import 'package:flutter_application_1/widgets/todays_display.dart';
import 'package:intl/intl.dart';

class PlanetListingScreen extends StatefulWidget {
  const PlanetListingScreen({Key? key}) : super(key: key);

  @override
  State<PlanetListingScreen> createState() => _PlanetListingScreenState();
}

class _PlanetListingScreenState extends State<PlanetListingScreen> with TickerProviderStateMixin{
  PlanetListingModel model = PlanetListingModel();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,

  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn,);

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    DateTime dt = DateTime.parse(model.getFormattedDate());
    String formattedDate = DateFormat('MM dd yyyy').format(dt);
    PlanetListingModel planetListingModel = PlanetListingModel();
    planetListingModel.filterPlanetDecendingOrderByRadius(planetListingModel.planetsList);
   
    return Scaffold(
      body: Column(
        children: [
          
          Container(child: FadeTransition(opacity: _animation, child: TodaysDisplay(date: formattedDate),),),
          
          Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: planetListingModel.planetsList.length,
                itemBuilder: (BuildContext context, int index, ) {
                  return Container(
                    height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(planetListingModel.planetsList[index].toString())         
                      ],
                    ),
                    );
                },
              ),
              ),
        ],
      ),
    );
  }
}