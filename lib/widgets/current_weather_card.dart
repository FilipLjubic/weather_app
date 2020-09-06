import 'package:flutter/material.dart';
import 'package:weather_app/widgets/current_time.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherCard extends StatelessWidget {
  final DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.black45,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: Column(
          children: [
            Row(
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
            ),
            Divider(
              endIndent: MediaQuery.of(context).size.width / 10,
              indent: MediaQuery.of(context).size.width / 10,
              height: 30.0,
            ),
            Row(
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
            ),
            Divider(
              endIndent: MediaQuery.of(context).size.width / 4,
              indent: MediaQuery.of(context).size.width / 4,
              height: 30.0,
            ),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}

class RoundPropertyIcon extends StatelessWidget {
  const RoundPropertyIcon({
    @required this.propertyLabel,
    @required this.property,
    @required this.icon,
    @required this.color,
    @required this.backgroundColor,
  });

  final Text propertyLabel, property;
  final IconData icon;
  final Color color, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: BoxedIcon(
                  icon,
                  color: color,
                  size: 16.0,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            propertyLabel,
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        property,
      ],
    );
  }
}
