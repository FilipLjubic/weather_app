import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/screens/loading.dart';

// test

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load('.env');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weatheroo',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
