import 'package:geolocator/geolocator.dart';

// Singleton class
class LocationHelper {
  LocationHelper._privateConstructor();

  static final _instance = LocationHelper._privateConstructor();

  static LocationHelper get instance => _instance;

  Position currentPosition;

  void updateCurrentPisiton() async {
    currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(currentPosition);
  }
}
