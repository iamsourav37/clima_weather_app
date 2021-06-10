import 'package:clima/services/Location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String apiKey = "ndyZ8IV21f22nME2RMU3mQow6B3w0KZy";
  late final lat;
  late final long;
  String api =
      "http://api.accuweather.com/locations/v1/cities/geoposition/search.json?q=40.78, -77.89&apikey={your key}";

  void fetchLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("clima app"),
      ),
    );
  }
}
