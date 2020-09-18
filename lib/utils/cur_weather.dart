import 'package:weather/weather.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location_helper.dart';

class CurrentWeather {
  static final _instance = CurrentWeather._privateConstructor();
  CurrentWeather._privateConstructor();

  WeatherFactory wf = WeatherFactory(openWeatherAPI);
  // could have just created a Weather object but decided this would be easier to read since it would be shorter code (just like forecast)
  int temperature, minTemperature, maxTemperature, humidity, wind, rain;
  String weatherIconURL;
  String weatherDescription;
  List<Weather> forecast;

  static CurrentWeather get instance => _instance;

  Future<void> updateWeatherByPosition() async {
    await LocationHelper.instance.updateCurrentPisiton();

    Weather weather = await wf.currentWeatherByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);

    temperature = weather.temperature.celsius.round();
    minTemperature = weather.tempMin.celsius.round();
    maxTemperature = weather.tempMax.celsius.round();
    humidity = weather.humidity.round();
    wind = weather.windSpeed.round();
    rain = weather.rainLast3Hours.round();
    weatherIconURL =
        "http://openweathermap.org/img/wn/${weather.weatherIcon}.png";
    weatherDescription = weather.weatherMain;

    forecast = await wf.fiveDayForecastByLocation(
        LocationHelper.instance.currentPosition.latitude,
        LocationHelper.instance.currentPosition.longitude);
  }
}
