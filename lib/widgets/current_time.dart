import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class CurrentTime extends StatelessWidget {
  const CurrentTime({
    @required this.currentTime,
  });

  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateTimeFormat.format(currentTime,
              format: 'D M j, Y'), // DAY MONTH day(num), year(num)
          style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
        Text(
          DateTimeFormat.format(currentTime,
              format: 'H:i'), // HOUR(0-24):minutes
          style: TextStyle(
              fontFamily: "Montserrat", fontSize: 32.0, color: Colors.black26),
        ),
      ],
    );
  }
}
