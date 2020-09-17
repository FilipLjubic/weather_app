import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:weather_app/models/suggestion.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location_helper.dart';
import 'package:weather_app/utils/photo_helper.dart';
import 'package:weather_app/widgets/marginalized_progress_indicator.dart';
import 'package:weather_app/widgets/search_bar.dart';
import 'package:weather_app/widgets/suggestion_tile.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ignore: close_sinks
  StreamController<List<Suggestion>> _suggestionStream;
  TextEditingController textEditingController;
  stt.SpeechToText _speech;
  bool _available;
  bool _isListening = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initAvailability();
    textEditingController = TextEditingController();
    _suggestionStream = StreamController<List<Suggestion>>();
    textEditingController.addListener(() {
      LocationHelper.instance
          .searchWithThrottle(textEditingController.text, _suggestionStream);
    });
  }

  void _initAvailability() async {
    _available = await _speech.initialize(
      onStatus: (value) => print('onStatus: $value'),
      onError: (value) => print('onError: $value'),
    );
  }

  void _listen() async {
    if (_available) {
      _speech.listen(
        onResult: (result) => setState(() {
          textEditingController.text = result.recognizedWords;
        }),
        listenFor: Duration(minutes: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SearchBar(
                  textField: TextField(
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      setState(() {
                        _loading = true;
                      });

                      await PhotoHelper.instance.getPhoto(value);
                      setState(() {
                        _loading = false;
                      });
                      LocationHelper.instance.previousQuery = "";

                      return Navigator.pop(context, value);
                    },
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    ),
                    decoration: textFieldDecoration,
                  ),
                  icon: GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        _isListening = true;
                      });
                      _listen();
                    },
                    onTapUp: (_) => setState(() {
                      _isListening = false;
                      _speech.stop();
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                StreamBuilder<List<Suggestion>>(
                    stream: _suggestionStream.stream,
                    builder:
                        (context, AsyncSnapshot<List<Suggestion>> snapshot) {
                      if (_isListening) {
                        return Container(
                            margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height / 2),
                            child: SpinKitWave(
                              color: Colors.black12,
                              size: 30.0,
                              duration: Duration(milliseconds: 1200),
                            ));
                      } else if (LocationHelper
                              .instance.previousQuery.isEmpty &&
                          !snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 100.0),
                        );
                      } else if (!snapshot.hasData) {
                        return MarginalizedProgressIndicator();
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(top: 90.0),
                          child: ListView.builder(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 10.0),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 3.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: kElevationToShadow[1],
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: SuggestionTile(
                                suggestionStream: _suggestionStream,
                                index: index,
                                snapshot: snapshot,
                                onTap: () async {
                                  // If there's no city, show either country or whole label, depending if the label is too long or not
                                  String cityName = snapshot.data[index].city ??
                                      (snapshot.data[index].label.length > 25
                                          ? snapshot.data[index].country
                                          : snapshot.data[index].label);

                                  setState(() {
                                    _loading = true;
                                  });

                                  await PhotoHelper.instance.getPhoto(
                                      snapshot.data[index].city ??
                                          snapshot.data[index].country);

                                  setState(() {
                                    _loading = false;
                                  });

                                  LocationHelper.instance.previousQuery = "";

                                  return Navigator.pop(
                                    context,
                                    cityName,
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
