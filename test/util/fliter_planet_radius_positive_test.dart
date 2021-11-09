import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';

main(){

  test("Filter planets radius by min", (){
    int expectedValue = 3;
    
    int results = PlanetListingModel().filterPlanetsByMinRadius(PlanetListingModel().planetsList , 3000).length;

    expect(expectedValue, results);
  });
}
