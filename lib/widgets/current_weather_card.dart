import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

class CurrentWeatherCard extends StatelessWidget {
  final DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.black45,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateTimeFormat.format(currentTime,
                          format: 'D M j, Y'), // DAY MONTH day(num), year(num)
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Text(
                      DateTimeFormat.format(currentTime,
                          format: 'H:i'), // HOUR(0-24):minutes
                      style: TextStyle(fontSize: 32.0, color: Colors.black26),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '20 ',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "°C",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.wb_sunny,
                  size: 50.0,
                )
              ],
            ),
            Divider(
              endIndent: MediaQuery.of(context).size.width / 10,
              indent: MediaQuery.of(context).size.width / 10,
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

//ListTile(
//   contentPadding:
//       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//   leading:
//   title: Padding(
//     padding: const EdgeInsets.only(left: 8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "It's",
//           style: TextStyle(fontSize: 15.0),
//         ),
//         Text(
//           "Sunny",
//           style: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "now",
//           style: TextStyle(fontSize: 15.0),
//         ),
//       ],
//     ),
//   ),
//   trailing: RichText(
//     text: TextSpan(
//       text:
//       children: [
//         TextSpan(
// text:
//         ),
//       ],
//     ),
//   ),
// ),
