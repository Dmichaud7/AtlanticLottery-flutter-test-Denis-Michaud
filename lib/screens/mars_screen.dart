import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/planets.dart';

class MarsScreen extends StatefulWidget {
  @override
  _MarsScreenState createState() => _MarsScreenState();
}

class _MarsScreenState extends State<MarsScreen> {
  Future<Planets> fetchMars() async {
    String url = "https://neonfish.net/mars_api.json";
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      var a =Planets.fromJson(jsonDecode(response.body));
      print(a);
      return Planets.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Mars');
    } 
  }

  late Future<Planets> futurePlanets;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    futurePlanets = fetchMars();
    print(futurePlanets);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Planets>(
        future: futurePlanets,
        builder: (context, snapshot) {
         if(snapshot.hasData){
           return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[            
                Container(child:Image.network(snapshot.data!.image)),
                Container(child:Text(snapshot.data!.name)),
                Container(child: Visibility(visible: _isVisible, child: Text("Distance from earth to sun: " + snapshot.data!.distanceToSun),),),
                FloatingActionButton(onPressed: (){
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Text(_isVisible ? "Hide": "Show"),)
             ]);
         }else if (snapshot.hasError){
           return Text('${snapshot.error}');
         }
         return const CircularProgressIndicator();
      },),  
    );
  }
}

