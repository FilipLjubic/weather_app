import 'package:flutter/material.dart';
import 'package:weather_app/utils/location_helper.dart';

class FloatingSearchBar extends StatefulWidget {
  final Function onTap;
  final String hintText;
  final Function onPressedIcon;

  FloatingSearchBar(
      {@required this.onTap, this.hintText, @required this.onPressedIcon});

  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar> {
  @override
  void initState() {
    super.initState();
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
          onTap: widget.onTap,
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
                    Text(widget.hintText ?? "Enter a location",
                        style: TextStyle(
                            fontFamily: "Montserrat", color: Colors.black26)),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black54,
                  ),
                  onPressed: widget.onPressedIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
