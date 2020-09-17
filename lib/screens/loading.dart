import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location_helper.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final WeatherFactory wf = new WeatherFactory(openWeatherAPI);

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    await LocationHelper.instance.updateCurrentPisiton();
    Weather weather = await wf.currentWeatherByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);
    print(weather.areaName);
    print(weather.temperature.celsius);
    print(weather.tempFeelsLike.celsius);
    print(weather.humidity);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black12),
              child: Container(
                margin: const EdgeInsets.all(50.0),
                height: 150.0,
                width: 150.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset(
                  "images/cutie.png",
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Loading..",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Montserrat",
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
