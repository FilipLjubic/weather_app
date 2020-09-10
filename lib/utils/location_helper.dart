import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/suggestion.dart';

import 'constants.dart';

// Singleton class
class LocationHelper {
  List<Suggestion> suggestions = [];
  LocationHelper._privateConstructor();

  static final _instance = LocationHelper._privateConstructor();

  static LocationHelper get instance => _instance;

  Position currentPosition;

  void updateCurrentPisiton() async {
    currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(currentPosition);
  }

  Future<void> getSuggestions(query) async {
    http.Response response = await http.get(
        "https://autocomplete.geocoder.ls.hereapi.com/6.2/suggest.json?apiKey=$geocoderAPI&query=$query&maxresults=12");

    if (response.statusCode == 200) {
      // OK
      // create a list of suggestions
      List<dynamic> responseList = json.decode(response.body)['suggestions'];
      List<Suggestion> suggestions = [];
      for (int i = 0; i < responseList.length; i++) {
        Suggestion suggestion = Suggestion.fromJson(responseList[i]);
        suggestions.add(suggestion);
      }
      print(suggestions[1].label);
    } else {
      throw Exception('Failed to load!');
    }
  }

  // retrieve location details when user selects a suggestion using look-up by Id
}
