import 'package:flutter/material.dart';
import 'package:weather_app/screens/future_days.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/floating_search_bar.dart';

/// TODO: - fix draggablescrollview
///       - make it beautiful
///       - add animations
///
///       - posto sam poceo strugglat sa designom idem odrediti sta ce zapravo aplikacija imati
/// imati ce:
///           - wind km/h, humidity %, rain mm (staviti u card u ikonice ispod svega)
///           - hourly forecast 24 sata - kartice s vremenom, ikonicom i stupnjevima, on select bude obojano okolo
///           - forecast sljedeceg tjedna na drugom screenu - min/max, ikonica i main
///           - refresh kad scrollas gore
///           - search sa suggestionima za autocomplete
///           - speech to text mic opcija

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
              maxChildSize: 0.5,
              minChildSize: 0.2,
              initialChildSize: 0.3,
              builder: (context, scrollController) => Container(
                child: ListView(
                  controller: scrollController,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 3.0,
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
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
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
