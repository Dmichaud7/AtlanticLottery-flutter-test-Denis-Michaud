import 'package:flutter/material.dart';
import 'screens/mars_screen.dart';
import 'screens/planet_listing_screen.dart';
import 'screens/webview_screen.dart';

void main() {
  runApp(ALCTestApp());
}

class ALCTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALC Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  // App Screens
  static List<Widget> _screenOptions = <Widget>[
    MarsScreen(),
    PlanetListingScreen(),
    WebviewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALC Mobile Test App'),
      ),
      body: Center(
        child: _screenOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Mars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Planet Listing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Webview',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Colors.amber[800], // Change colour as needed / if needed.
        onTap: _onItemTapped,
      ),
    );
  }
}
