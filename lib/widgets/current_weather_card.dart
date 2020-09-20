import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class CurrentWeatherCard extends StatelessWidget {
  final DateTime currentTime = DateTime.now();
  final String temperature;

  CurrentWeatherCard({this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black45,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: Column(
          children: [
            UpperCardRow(number: temperature),
            Divider(
              endIndent: MediaQuery.of(context).size.width / 10,
              indent: MediaQuery.of(context).size.width / 10,
              height: 30.0,
            ),
            MiddleCardRow(),
            Divider(
              endIndent: MediaQuery.of(context).size.width / 4,
              indent: MediaQuery.of(context).size.width / 4,
              height: 30.0,
            ),
            IconsRow()
          ],
        ),
      ),
    );
  }
}
