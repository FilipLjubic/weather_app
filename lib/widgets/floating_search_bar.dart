import 'package:flutter/material.dart';
import 'package:weather_app/screens/search.dart';

class FloatingSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: const Color(0x99D2F6FF).withOpacity(0.55),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SearchScreen(),
            ),
          ),
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 50.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text("Enter a location",
                        style: TextStyle(
                            fontFamily: "Montserrat", color: Colors.black26)),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                  onPressed: () => print("settings"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
