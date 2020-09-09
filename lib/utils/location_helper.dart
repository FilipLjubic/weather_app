import 'package:geolocator/geolocator.dart';

// Singleton class
class LocationHelper {
  LocationHelper._privateConstructor();

  static final instance = LocationHelper._privateConstructor();

  Position currentPosition;

  void updateCurrentPisiton() async {
    currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(currentPosition);
  }
}
