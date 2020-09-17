// Singleton class
import 'package:http/http.dart' as http;
import 'package:weather_app/models/photo.dart';
import 'dart:async';
import 'package:weather_app/utils/constants.dart';
import 'dart:convert';
import 'dart:math';

class PhotoHelper {
  PhotoHelper._privateConstructor();
  int hits = 0;
  Photo photo = Photo(
      largeImageUrl:
          "https://www.dnevno.hr/wp-content/uploads/2020/05/zagreb-2.jpg");

  static final _instance = PhotoHelper._privateConstructor();

  static PhotoHelper get instance => _instance;

  Future<void> getPhoto(String query) async {
    http.Response response = await http.get(
        'https://pixabay.com/api/?key=$pixabayAPI&q=$query&image_type=photo&orientation=vertical&category=buildings');
    if (response.statusCode == 200) {
      List<dynamic> listOfHits = json.decode(response.body)['hits'];
      if (listOfHits.length == 0) {
        // could have just repeated getPhoto() but would have to change function to take category which would be an enum but it would have made the code less readable imo
        response = await http.get(
            "https://pixabay.com/api/?key=$pixabayAPI&q=nature&image_type=photo&orientation=vertical");
        Random rng = Random();
        listOfHits = json.decode(response.body)['hits'];
        int index = rng.nextInt(listOfHits.length);

        photo = Photo.fromJson(listOfHits[index]);
      } else {
        Random rng = Random();
        int index = rng.nextInt(listOfHits.length);
        photo = Photo.fromJson(listOfHits[index]);
      }
    } else {
      throw Exception("Error getting image!");
    }
  }
}
