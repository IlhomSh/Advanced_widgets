import 'package:advanced_widgets/weather_indicator.dart';
import 'package:flutter/material.dart';

import 'decorated_text.dart';

class ScalableWeatherIndicator extends StatefulWidget {
  final double initialScale;

  const ScalableWeatherIndicator({Key? key,this.initialScale = 1.0}):super(key: key);

  @override
  _ScalableWeatherIndicatorState createState() =>
      _ScalableWeatherIndicatorState();
}

class _ScalableWeatherIndicatorState extends State<ScalableWeatherIndicator> {
  double scale = 1.0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isExpanded) {
            scale = 1.0;
          } else {
            scale = 2.0;
          }
          isExpanded = !isExpanded;
        });
      },
      child: Stack(
        children: [

          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: isExpanded ? 50 : 0,
            right: isExpanded ? 50 : 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 100 * scale,
              height: 100 * scale,
              child: WeatherIndicator(cloudiness: widget.initialScale),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: isExpanded ? (100*scale)+50 : 0,
            right: isExpanded ? (100*scale)+50 :0,
            child: Visibility(
              visible: isExpanded,
              child: InnerShadow(
                blur: 5,
                color: const Color(0xFF477C70),
                offset: const Offset(5, 5),
                 child: Text("Облачно 12 градус"),
                ),
            ),
            ),





        ],
      ),
    );
  }
}
