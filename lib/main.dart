import 'package:advanced_widgets/profile_color.dart';
import 'package:advanced_widgets/scalable_weather_indicator.dart';
import 'package:advanced_widgets/weather_indicator.dart';
import 'package:flutter/material.dart';

import 'decorated_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileColor(
        mainColor: Colors.blue,
        child: Builder(builder: (themeContext) {
          return Scaffold(
              backgroundColor: ProfileColor.of(themeContext)!.mainColor,
              appBar: AppBar(
                title: Text('Weather App'),
              ),
              body:
                  const ScalableWeatherIndicator(
                    initialScale: 0.76,
                  ),


              );
        }),
      ),
    );
  }
}
