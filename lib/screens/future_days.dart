import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

/// TODO: - change fonts,
///       - make rich text ouf of some texts
///       - change font of tomorrow weather container and appbar
///       - add elipses on 2 edges
///       - make 7 text column into cards or give them elevation

class FutureDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text(
          "Next 7 days",
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // container of tomorrows weather
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [Colors.blue[50], Color(0xFF1487DA)],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tomorrow",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                      ),
                      Text(
                        "Mon, 10 Aug",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: BoxedIcon(
                      WeatherIcons.day_sunny_overcast,
                      size: 49.0,
                    ),
                    title: Text(
                      "20/17 °C",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "Sunny",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: BoxedIcon(
                              WeatherIcons.strong_wind,
                              size: 30.0,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "4 km/h",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: BoxedIcon(WeatherIcons.humidity,
                                size: 30.0, color: Colors.blue),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "43%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: BoxedIcon(
                              WeatherIcons.raindrops,
                              size: 30.0,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "25%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0, bottom: 6.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Zagreb, Hrvatska",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // column of next 7 days
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "mon",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "17/15°",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    children: [
                      BoxedIcon(WeatherIcons.day_cloudy),
                      SizedBox(width: 5.0),
                      Text("Cloudy"),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
