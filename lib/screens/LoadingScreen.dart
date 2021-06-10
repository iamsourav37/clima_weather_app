import 'dart:convert';

import 'package:clima/services/Location.dart';
import 'package:clima/services/Networking.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey";
    print("our api url : $apiUrl");
    NetworkHelper networkHelper = NetworkHelper(url: apiUrl);
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("get data"),
        ),
      ),
    );
  }
}
