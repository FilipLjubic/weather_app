import 'package:flutter/material.dart';

class CurrentWeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.black45,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Icon(
          Icons.wb_sunny,
          size: 50.0,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "It's",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Sunny",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "now",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
        trailing: RichText(
          text: TextSpan(
            text: '20 ',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: "°C",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
