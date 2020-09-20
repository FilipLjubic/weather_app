import 'dart:async';
import 'dart:convert';
import 'package:darq/darq.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/suggestion.dart';
import 'constants.dart';

// Singleton class
class LocationHelper {
  Timer _timer;
  String previousQuery = "";
  Position currentPosition;

  static final _instance = LocationHelper._privateConstructor();
  LocationHelper._privateConstructor();

  static LocationHelper get instance => _instance;

  Future<void> updateCurrentPisiton() async {
    currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  Future<List<Suggestion>> _updateSuggestions(String query) async {
    previousQuery = query;
    http.Response response = await http.get(
        "https://autocomplete.geocoder.ls.hereapi.com/6.2/suggest.json?apiKey=$geocoderAPI&query=$query&maxresults=12");

    if (response.statusCode == 200) {
      // OK
      // create a list of suggestions
      List<dynamic> responseList = json.decode(response.body)['suggestions'];

      return responseList
          .where((element) => element != null)
          .map((response) => Suggestion.fromJson(response))
          .distinct((x) => x.country)
          .toList();
    } else {
      throw Exception('Failed to load suggestions!');
    }
  }

  void searchWithThrottle(
      String keyword, StreamController streamController) async {
    _timer?.cancel();
    if (keyword.isEmpty) {
      previousQuery = keyword;
      streamController.sink.add(null);
      return;
    }
    List<Suggestion> suggestions = [];
    if (keyword != previousQuery && keyword.isNotEmpty) {
      previousQuery = keyword;
      _timer = Timer.periodic(Duration(milliseconds: 350), (timer) async {
        streamController.sink.add(null); // triggers progress indicator
        suggestions = await _updateSuggestions(keyword);
        streamController.add(suggestions);
        _timer.cancel();
      });
    }
  }
}
