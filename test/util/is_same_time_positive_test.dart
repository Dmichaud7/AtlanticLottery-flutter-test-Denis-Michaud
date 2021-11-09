import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';

main(){

  //Positive Test to see if the time of two Dates are the same it should return true
  test("Is the same time of the day positive test", (){
    bool expectedValue = true;

    DateTime time = DateTime(1999);

    bool result = PlanetListingModel().isSameTimeOfDay(time, time);

    expect(expectedValue, result);
  });
}