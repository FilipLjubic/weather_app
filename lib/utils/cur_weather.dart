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

  static String createIconURL(String icon) {
    return "http://openweathermap.org/img/wn/$icon.png";
  }

  static CurrentWeather get instance => _instance;

  Future<void> updateWeatherByPosition() async {
    await LocationHelper.instance.updateCurrentPisiton();

    weather = await wf.currentWeatherByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);

    weatherIconURL = createIconURL(weather.weatherIcon);

    forecast = await wf.fiveDayForecastByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);
  }

  Future<void> updateWeatherByCityName(String cityName) async {
    try {
      this.weather = await wf.currentWeatherByCityName(cityName);

      print(CurrentWeather.instance.weather.temperature.celsius
          .round()
          .toString());
      this.weatherIconURL = createIconURL(weather.weatherIcon);

      this.forecast = await wf.fiveDayForecastByCityName(cityName);
    } catch (e) {
      await updateWeatherByPosition();
    }
  }
}
