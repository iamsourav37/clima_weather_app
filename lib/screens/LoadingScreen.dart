import 'dart:convert';

import 'package:clima/services/Location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String apiKey = "4c15e5152554d721a2d364658112e7cf";
  late final lat;
  late final long;
  String api =
      "api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid={API key}";

  String tmp =
      "http://api.openweathermap.org/data/2.5/weather?lat=23.797138333333336&lon=87.36568333333335&appid=4c15e5152554d721a2d364658112e7cf";

  void fetchLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var response = await http.get(Uri.parse(tmp));
    print("Response type : ${response.runtimeType}, response : $response");
    var data = jsonDecode(response.body);
    print("data type: ${data.runtimeType}, data : $data");
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
        child: ElevatedButton(
          onPressed: () {
            getData();
          },
          child: Text("get data"),
        ),
      ),
    );
  }
}
