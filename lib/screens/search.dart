import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/models/suggestion.dart';
import 'package:weather_app/utils/location_helper.dart';
import 'package:weather_app/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  StreamController<List<Suggestion>> _suggestionStream;

  @override
  void initState() {
    super.initState();
    _suggestionStream = StreamController<List<Suggestion>>();
  }

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
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SearchBar(
                textField: TextField(
                  onChanged: (value) {
                    LocationHelper.instance
                        .searchWithThrottle(value, _suggestionStream);
                  },
                  onSubmitted: (value) {
                    _suggestionStream.close();
                    LocationHelper.instance.previousQuery = "";
                    return Navigator.pop(context, value);
                  },
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
              ),
              StreamBuilder<List<Suggestion>>(
                  stream: _suggestionStream.stream,
                  builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
                    if (LocationHelper.instance.previousQuery.isEmpty &&
                        !snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.only(top: 100.0),
                      );
                    } else if (!snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 100.0,
                            left: MediaQuery.of(context).size.width / 2 - 30),
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(top: 90.0),
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, top: 10.0),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 3.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: kElevationToShadow[1],
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: ListTile(
                              onTap: () {
                                // If there's no city, show either index or whole label, depending if the label is too long or not
                                String cityName = snapshot.data[index].city ??
                                    (snapshot.data[index].label.length > 25
                                        ? snapshot.data[index].country
                                        : snapshot.data[index].label);
                                _suggestionStream.close();
                                LocationHelper.instance.previousQuery = "";
                                return Navigator.pop(
                                  context,
                                  cityName,
                                );
                              },
                              leading: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[100],
                                ),
                                child: Icon(
                                  Icons.location_city,
                                  color: Colors.black54,
                                ),
                              ),
                              title: snapshot.data[index].city == null
                                  ? Text("${snapshot.data[index].label}")
                                  : Text("${snapshot.data[index].city}"),
                              subtitle: snapshot.data[index].country == null
                                  ? null
                                  : Text("${snapshot.data[index].country}"),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
