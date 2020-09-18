import 'package:weather/weather.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location_helper.dart';

class CurrentWeather {
  static final _instance = CurrentWeather._privateConstructor();
  CurrentWeather._privateConstructor();

  WeatherFactory wf = WeatherFactory(openWeatherAPI);
  Weather weather;
  String weatherIconURL;
  List<Weather> forecast;

  static CurrentWeather get instance => _instance;

  Future<void> updateWeatherByPosition() async {
    await LocationHelper.instance.updateCurrentPisiton();

    weather = await wf.currentWeatherByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);

    weatherIconURL =
        "http://openweathermap.org/img/wn/${weather.weatherIcon}.png";

    forecast = await wf.fiveDayForecastByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);
  }
}