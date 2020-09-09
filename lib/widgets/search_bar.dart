import 'package:flutter/material.dart';

// TODO: - search sa suggestionima za autocomplete - typeahead
///      - speech to text mic opcija

ValueNotifier<String> searchTextNotifier = ValueNotifier<String>("");

class SearchBar extends StatelessWidget {
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
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: TextField(
            onChanged: (value) => searchTextNotifier.value = value,
            onSubmitted: (value) => Navigator.pop(context, value),
            autofocus: true,
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
              Icons.mic,
              color: Colors.black,
            ),
            onPressed: () => print("mic"),
          ),
        ),
      ),
    );
  }
}
