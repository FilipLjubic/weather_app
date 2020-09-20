import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/screens/search.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/cur_weather.dart';
import 'package:weather_app/utils/photo_helper.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/floating_search_bar.dart';
import 'package:weather_app/widgets/hourly_forecast_card.dart';

/// TODO:     - napravit da ne moze biti u landscape modeu
///           - updateat weather data kada se searcha novi grad

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String hintText;
  bool _loading = false;

  void _tapSearchBar() async {
    hintText = await Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: SearchScreen(),
      ),
    );

    setState(() {});
  }

  void _refresh() async {
    setState(() {
      _loading = true;
    });
    if (hintText == null) {
      await CurrentWeather.instance.updateWeatherByPosition();

      setState(() {
        _loading = false;
      });
      return;
    }

    await PhotoHelper.instance.getPhoto(hintText);

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(PhotoHelper.instance.photo.largeImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FloatingSearchBar(
                onTap: _tapSearchBar,
                hintText: hintText,
                onPressedIcon: _refresh,
              ),
              DraggableScrollableSheet(
                maxChildSize: 0.6,
                minChildSize: 0.24,
                initialChildSize: 0.3,
                builder: (context, scrollController) => Container(
                  decoration: draggableScrollableSheetDecoration,
                  child: ListView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Divider(
                        thickness: 2.0,
                        endIndent: MediaQuery.of(context).size.width / 3,
                        indent: MediaQuery.of(context).size.width / 3,
                        color: Colors.black12,
                      ),
                      CurrentWeatherCard(),
                      Container(
                        margin: const EdgeInsets.only(left: 26.0),
                        child: const Text(
                          "FORECAST",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        margin: const EdgeInsets.all(10.0),
                        child: AnimationLimiter(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: CurrentWeather.instance.forecast.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: HourlyForecastCard(
                                    time: DateTimeFormat.format(
                                        CurrentWeather
                                            .instance.forecast[index].date,
                                        format: 'H:i'),
                                    temperature: CurrentWeather.instance
                                        .forecast[index].temperature.celsius
                                        .round(),
                                    icon: CurrentWeather
                                        .instance.forecast[index].weatherIcon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
