import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: SearchBar(),
          ),
        ),
      ),
    );
  }
}
