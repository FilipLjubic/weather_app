// Singleton class
import 'package:http/http.dart' as http;
import 'package:weather_app/models/photo.dart';
import 'dart:async';
import 'package:weather_app/utils/constants.dart';
import 'dart:convert';

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
      photo = Photo.fromJson(json.decode(response.body)['hits'][0]);
      print(photo.largeImageUrl);
    } else {
      throw Exception("Error getting image!");
    }
  }
}
