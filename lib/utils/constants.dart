import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:number_slide_animation/number_slide_animation_widget.dart';
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

class UpperCardRow extends StatefulWidget {
  @override
  _UpperCardRowState createState() => _UpperCardRowState();
}

class _UpperCardRowState extends State<UpperCardRow> {
  DateTime currentTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrentTime(currentTime: currentTime),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumberSlideAnimation(
              number: '21',
              textStyle: TextStyle(
                fontSize: 50.0,
                color: Colors.black87,
                fontFamily: "Montserrat",
              ),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.bounceIn,
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
          "Min: 20°",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey[100],
          ),
          child: Icon(
            Icons.wb_sunny,
            size: 25.0,
          ),
        ),
        Text(
          "Max: 30°",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}

BoxDecoration draggableScrollableSheetDecoration = const BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40.0),
    topRight: Radius.circular(40.0),
  ),
);

InputDecoration textFieldDecoration = InputDecoration(
  border: InputBorder.none,
  hintText: "Enter a location",
  hintStyle: TextStyle(
    fontFamily: "Montserrat",
  ),
);

String geocoderAPI = DotEnv().env['GEOCODER_API'];

String pixabayAPI = DotEnv().env['PIXABAY_API'];
