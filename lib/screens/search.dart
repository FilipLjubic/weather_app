import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              SearchBar(),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 2.0, top: 10.0),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: kElevationToShadow[1],
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        return Navigator.pop(context, searchTextNotifier.value);
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey[100],
                        ),
                        child: Icon(
                          Icons.location_city,
                          color: Colors.black54,
                        ),
                      ),
                      title: ValueListenableBuilder(
                        valueListenable: searchTextNotifier,
                        builder: (context, value, child) => RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: value,
                                style: TextStyle(color: Colors.black)),
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
