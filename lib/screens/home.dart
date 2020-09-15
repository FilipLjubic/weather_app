import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/screens/search.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/photo_helper.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/floating_search_bar.dart';
import 'package:weather_app/widgets/hourly_forecast_card.dart';
import 'package:weather_icons/weather_icons.dart';

/// TODO:
///       - add animations - staggered animations na horizontalni list view
///                        - progress HUD za kada refresha/searcha
///
///           - napravit da ne moze biti u landscape modeu

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String hintText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // image container
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // change with image you get from api (probably networkimage huh)
                  image: NetworkImage(PhotoHelper.instance.photo.largeImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // floating search bar
            FloatingSearchBar(
              onTap: () async {
                hintText = await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: SearchScreen(),
                  ),
                );

                setState(() {});
              },
              hintText: hintText,
            ),

            DraggableScrollableSheet(
              maxChildSize: 0.6,
              minChildSize: 0.25,
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
                      child: Text(
                        "TODAY",
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
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          HourlyForecastCard(
                            time: "11:00",
                            temperature: 20,
                            icon: WeatherIcons.day_sunny_overcast,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
