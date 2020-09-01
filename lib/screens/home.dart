import 'package:flutter/material.dart';
import 'package:weather_app/screens/future_days.dart';

/// TODO: - fix search bar
///       - fix draggablescrollview
///       - make it beautiful
///       - add animations

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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: const Color(0x99D2F6FF).withOpacity(0.55),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30.0),
                    leading: const Icon(
                      Icons.location_on,
                      color: Colors.black54,
                    ),
                    title: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // set to current location
                        hintText: "Enter a location",
                      ),
                    ),
                    // make it shine while its being held
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.black54,
                      ),
                      onPressed: () => print("mic"),
                    ),
                  ),
                ),
              ),
            ),
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
                    Card(
                      elevation: 2.0,
                      shadowColor: Colors.black45,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Icon(
                          Icons.wb_sunny,
                          size: 50.0,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "It's",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "Sunny",
                                style: TextStyle(fontSize: 22.0),
                              ),
                              Text(
                                "now",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                        trailing: RichText(
                          text: TextSpan(
                            text: '20 ',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                            children: [
                              TextSpan(
                                text: "°C",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
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
