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
  final textFieldController = TextEditingController();
  StreamController<List<Suggestion>> _suggestionStream;

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
    _suggestionStream.close();
  }

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
                  controller: textFieldController,
                  onChanged: (value) {
                    LocationHelper.instance
                        .searchWithThrottle(value, _suggestionStream);
                  },
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
              ),
              StreamBuilder(
                  stream: _suggestionStream.stream,
                  builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      return ListView.builder(
                        padding:
                            const EdgeInsets.only(bottom: 10.0, top: 100.0),
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
                              return Navigator.pop(
                                context,
                                textFieldController.text,
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
                            title: Text(snapshot.data[index].label),
                            subtitle: Text(snapshot.data[index].country ?? " "),
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
