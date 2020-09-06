import 'package:flutter/material.dart';
import 'package:weather_app/widgets/current_time.dart';
import 'package:weather_app/widgets/round_property_icon.dart';
import 'package:weather_icons/weather_icons.dart';

class IconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundPropertyIcon(
          propertyLabel: Text(
            "wind",
            style: TextStyle(
              color: Colors.black26,
              fontFamily: "Montserrat",
              fontSize: 13.0,
            ),
          ),
          property: Text(
            "4 km/h",
            style: TextStyle(
              color: Colors.black45,
              fontFamily: "Montserrat",
              fontSize: 12.0,
            ),
          ),
          backgroundColor: Colors.green[50],
          color: Colors.green,
          icon: WeatherIcons.strong_wind,
        ),
        RoundPropertyIcon(
          propertyLabel: Text(
            "humidity",
            style: TextStyle(
              color: Colors.black26,
              fontFamily: "Montserrat",
              fontSize: 13.0,
            ),
          ),
          property: Text(
            "43 %",
            style: TextStyle(
              color: Colors.black45,
              fontFamily: "Montserrat",
              fontSize: 12.0,
            ),
          ),
          backgroundColor: Colors.blue[50],
          color: Colors.blue,
          icon: WeatherIcons.humidity,
        ),
        RoundPropertyIcon(
          propertyLabel: Text(
            "rain",
            style: TextStyle(
              color: Colors.black26,
              fontFamily: "Montserrat",
              fontSize: 13.0,
            ),
          ),
          property: Text(
            "16 %",
            style: TextStyle(
              color: Colors.black45,
              fontFamily: "Montserrat",
              fontSize: 12.0,
            ),
          ),
          backgroundColor: Colors.red[50],
          color: Colors.red,
          icon: WeatherIcons.umbrella,
        ),
      ],
    );
  }
}

class UpperCardRow extends StatelessWidget {
  const UpperCardRow({
    @required this.currentTime,
  });

  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrentTime(currentTime: currentTime),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '20',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black87,
                fontFamily: "Montserrat",
              ),
            ),
            Text(
              "°C",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Montserrat",
                color: Colors.black38,
              ),
            )
          ],
        ),
        Text(
          "Sunny",
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
        ),
      ],
    );
  }
}

class MiddleCardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Max: 30°",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        Icon(
          Icons.wb_sunny,
          size: 25.0,
        ),
        Text(
          "Min: 20°",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}
