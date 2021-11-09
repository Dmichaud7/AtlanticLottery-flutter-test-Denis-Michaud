import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';

main(){

  
  //Negative Test to see if the time of two Dates are not the same it should return false
  test("Is the same time of the day negative test", (){
    bool expectedValue = false;
    
    DateTime time = DateTime(1999);
    DateTime now = DateTime.now();

    bool result = PlanetListingModel().isSameTimeOfDay(time, now);

    expect(expectedValue, result);
  });
}