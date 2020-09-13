import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/suggestion.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location_helper.dart';
import 'package:weather_app/widgets/marginalized_progress_indicator.dart';
import 'package:weather_app/widgets/search_bar.dart';
import 'package:weather_app/widgets/suggestion_tile.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  StreamController<List<Suggestion>> _suggestionStream;
  TextEditingController textEditingController;
  stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    _suggestionStream = StreamController<List<Suggestion>>();
    _speech = stt.SpeechToText();
    textEditingController.addListener(() {
      LocationHelper.instance
          .searchWithThrottle(textEditingController.text, _suggestionStream);
    });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (value) => print('onStatus: $value'),
        onError: (value) => print('onError: $value'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          _speech.listen(
            onResult: (result) => setState(() {
              textEditingController.text = result.recognizedWords;
            }),
          );
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

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
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SearchBar(
                textField: TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    LocationHelper.instance
                        .searchWithThrottle(value, _suggestionStream);
                  },
                  onSubmitted: (value) {
                    _suggestionStream.close();
                    LocationHelper.instance.previousQuery = "";
                    print(value);
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
                icon: IconButton(
                  icon: const Icon(
                    Icons.mic,
                    color: Colors.black,
                  ),
                  onPressed: _listen,
                ),
              ),
              StreamBuilder<List<Suggestion>>(
                  stream: _suggestionStream.stream,
                  builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
                    if (LocationHelper.instance.previousQuery.isEmpty &&
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
    );
  }
}
