import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/models/suggestion.dart';
import 'package:weather_app/utils/location_helper.dart';
import 'package:weather_app/utils/photo_helper.dart';

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({
    @required this.suggestionStream,
    @required this.snapshot,
    @required this.index,
  });

  final StreamController<List<Suggestion>> suggestionStream;
  final AsyncSnapshot<List<Suggestion>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        // If there's no city, show either country or whole label, depending if the label is too long or not

        String cityName = snapshot.data[index].city ??
            (snapshot.data[index].label.length > 25
                ? snapshot.data[index].country
                : snapshot.data[index].label);

        //TODO: dodat query za sliku
        await PhotoHelper.instance.getPhoto(
            snapshot.data[index].city ?? snapshot.data[index].country);

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
    );
  }
}
