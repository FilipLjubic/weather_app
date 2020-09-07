import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    Key key,
    @required this.icon,
    @required this.time,
    @required this.temperature,
  }) : super(key: key);

  final IconData icon;
  final String time;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
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
            BoxedIcon(icon),
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
