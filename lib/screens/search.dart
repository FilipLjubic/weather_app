import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_bar.dart';

// TODO: - search sa suggestionima za autocomplete - typeahead
///      - speech to text mic opcija

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Center(
            child: Container(
              child: SearchBar(),
            ),
          ),
        ),
      ),
    );
  }
}
