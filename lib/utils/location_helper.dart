import 'dart:async';
import 'dart:convert';
import 'package:darq/darq.dart';
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
          .distinct((x) => x.country)
          .toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  void searchWithThrottle(
      String keyword, StreamController streamController) async {
    _timer?.cancel();
    List<Suggestion> suggestions = [];
    if (keyword != _previousQuery && keyword.isNotEmpty) {
      _previousQuery = keyword;
      _timer = Timer.periodic(Duration(milliseconds: 350), (timer) async {
        suggestions = await updateSuggestions(keyword);
        streamController.add(suggestions);
        _timer.cancel();
      });
    }
  }

  // retrieve location details when user selects a suggestion using look-up by Id
}
