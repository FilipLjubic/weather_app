import 'package:flutter/material.dart';
import 'package:weather_app/utils/cur_weather.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    Key key,
    @required this.icon,
    @required this.time,
    @required this.temperature,
  }) : super(key: key);

  final String icon;
  final String time;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      shadowColor: Colors.black45,
      child: Container(
        margin: const EdgeInsets.only(left: 2.0),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            const SizedBox(
              height: 10.0,
            ),
            Image.network(
              CurrentWeather.createIconURL(icon),
              height: 30.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("$temperature°")
          ],
        ),
      ),
    );
  }
}
