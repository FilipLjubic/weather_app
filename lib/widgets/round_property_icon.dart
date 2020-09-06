import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

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
