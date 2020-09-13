import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/screens/search.dart';
import 'package:weather_app/utils/location_helper.dart';

class FloatingSearchBar extends StatefulWidget {
  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar> {
  String hintText;

  @override
  void initState() {
    super.initState();
    hintText = "Enter a location";

    // ovo ce se raditi u loadingu
    LocationHelper.instance.updateCurrentPisiton();
  }

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
          onTap: () async {
            hintText = await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: SearchScreen(),
              ),
            );
            if (hintText != null) {
              if (hintText.isEmpty) {
                hintText = "Enter a location";
              }
              setState(() {});
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 55.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      width: 16.0,
                    ),
                    Text(hintText,
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
