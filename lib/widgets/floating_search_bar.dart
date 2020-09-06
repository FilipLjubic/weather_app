import 'package:flutter/material.dart';

class FloatingSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: const Color(0x99D2F6FF).withOpacity(0.55),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            leading: const Icon(
              Icons.location_on,
              color: Colors.black54,
            ),
            title: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                // set to current location
                hintText: "Enter a location",
                hintStyle: TextStyle(
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            // make it shine while its being held
            trailing: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black54,
              ),
              onPressed: () => print("settings"),
            ),
          ),
        ),
      ),
    );
  }
}
