import 'package:flutter/material.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/floating_search_bar.dart';
import 'package:weather_icons/weather_icons.dart';

/// TODO: - make it beautiful
///       - add animations - staggered animations na horizontalni list view
///                        - animations package - za searchbar Container transform
///                                             - fadethrough za refresh
///
///       - posto sam poceo strugglat sa designom idem odrediti sta ce zapravo aplikacija imati
/// imati ce:
///           - hourly forecast 24 sata - kartice s vremenom, ikonicom i stupnjevima, on select bude obojano okolo
///           - forecast sljedeceg tjedna na drugom screenu - min/max, ikonica i main
///           - refresh kad scrollas gore
///           - search sa suggestionima za autocomplete
///           - speech to text mic opcija
///           - settings :- celsius / fahrenheit
///                       - forecast update period
///                       - add locations - da naucim system preferences
///                       - snackbar/toast - flutter styled toast
///           - napravit da ne moze biti u portrait landscape modeu

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // image container
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // change with image you get from api (probably networkimage huh)
                  image: AssetImage("images/zagreb.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // floating search bar
            FloatingSearchBar(),

            DraggableScrollableSheet(
              maxChildSize: 0.6,
              minChildSize: 0.25,
              initialChildSize: 0.3,
              builder: (context, scrollController) => Container(
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
                      height: 100.0,
                      margin: const EdgeInsets.all(10.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("11:00"),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  BoxedIcon(WeatherIcons.day_sunny_overcast),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("20°")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
