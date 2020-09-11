import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/suggestion.dart';

import 'constants.dart';

// Singleton class
class LocationHelper {
  LocationHelper._privateConstructor();
  Timer _timer;
  String _previousQuery;

  static final _instance = LocationHelper._privateConstructor();

  static LocationHelper get instance => _instance;

  Position currentPosition;

  void updateCurrentPisiton() async {
    currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(currentPosition);
  }

  Future<List<Suggestion>> updateSuggestions(query) async {
    _previousQuery = query;
    http.Response response = await http.get(
        "https://autocomplete.geocoder.ls.hereapi.com/6.2/suggest.json?apiKey=$geocoderAPI&query=$query&maxresults=12");

    if (response.statusCode == 200) {
      // OK
      // create a list of suggestions
      List<dynamic> responseList = json.decode(response.body)['suggestions'];

      return responseList
          .map((response) => Suggestion.fromJson(response))
          .toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<List<Suggestion>> searchWithThrottle(String keyword) async {
    _timer?.cancel();
    List<Suggestion> suggestions = [];
    if (keyword != _previousQuery && keyword.isNotEmpty) {
      _previousQuery = keyword;
      _timer = Timer.periodic(Duration(milliseconds: 350), (timer) async {
        suggestions = await updateSuggestions(keyword);
        _timer.cancel();
        return suggestions;
      });
    }
    print(suggestions);
    return suggestions;
  }

  // retrieve location details when user selects a suggestion using look-up by Id
}
