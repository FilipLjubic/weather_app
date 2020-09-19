import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/utils/cur_weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    await CurrentWeather.instance.updateWeatherByPosition();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  height: 40.0,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation(Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
