import '/utils/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  const LocationScreen({Key? key, required this.locationData})
      : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var temperature;
  var cityName;
  var condition;
  @override
  void initState() {
    super.initState();
    this.updateUi(widget.locationData);
    print('location data ${widget.locationData}');
  }

  void updateUi(dynamic weatherData) {
    temperature = (weatherData['main']['temp']).toInt();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'at $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
