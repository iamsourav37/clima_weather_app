import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/Location.dart';
import 'package:clima/services/Networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/LocationScreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String apiKey = "4c15e5152554d721a2d364658112e7cf";
  late double lat;
  late double long;
  late String apiUrl;

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    this.lat = location.latitude;
    this.long = location.longitude;
    this.apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url: apiUrl);
    var weatherData = await networkHelper.getData();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationData: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgImage.jpeg"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Colors.white.withOpacity(1), BlendMode.darken),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SpinKitSquareCircle(
          color: Colors.greenAccent,
          size: 100,
        ),
      ),
    );
  }
}
