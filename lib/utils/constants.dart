import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/utils/cur_weather.dart';
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
            "${CurrentWeather.instance.weather.windSpeed.round()} km/h",
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
            "${CurrentWeather.instance.weather.humidity.round()} %",
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
            "${CurrentWeather.instance.weather.rainLast3Hours.round()} mm",
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
  final String number;
  UpperCardRow({this.number});

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
            Text(
              widget.number,
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
          CurrentWeather.instance.weather.weatherMain,
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
          "Min: ${CurrentWeather.instance.weather.tempMin.celsius.round()}°",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.lime[50],
          ),
          child: Image.network(CurrentWeather.instance.weatherIconURL),
        ),
        Text(
          "Max: ${CurrentWeather.instance.weather.tempMax.celsius.round()}°",
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

String openWeatherAPI = DotEnv().env['OPEN_WEATHER_API'];
