import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/models/suggestion.dart';

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({
    @required this.suggestionStream,
    @required this.snapshot,
    @required this.index,
    @required this.onTap,
  });

  final Function onTap;
  final StreamController<List<Suggestion>> suggestionStream;
  final AsyncSnapshot<List<Suggestion>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
