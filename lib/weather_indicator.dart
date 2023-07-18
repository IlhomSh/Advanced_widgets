import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  final double cloudiness;
  double size;

  WeatherIndicator({Key? key, required this.cloudiness, this.size = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size < 100) size = 100;
    return CustomPaint(
      size: Size(size, size),
      painter: WeatherIconPainter(cloudiness),
    );
  }
}

class WeatherIconPainter extends CustomPainter {
  final double cloudiness;

  WeatherIconPainter(this.cloudiness);

  var ratio = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    ratio = size.width / 300;
    final cloudOpacity = _getCloudOpacity(cloudiness);

    Color cloudColor; //=Colors.grey.withOpacity(0);
    if (cloudOpacity == 0) {
      cloudColor = Colors.grey.withOpacity(0);
    } else if (cloudOpacity > 0.6) {
      cloudColor = Colors.grey.shade500;
    } else if (cloudOpacity > 0.9) {
      cloudColor = Colors.grey.shade800;
    } else {
      cloudColor = Colors.grey.shade300;
    }
    final sunPaint = Paint()
      ..color = Colors.yellow.withOpacity(1 - cloudOpacity)
      ..strokeCap = StrokeCap.round;

    final cloudPaint = Paint()
      ..color = cloudColor
      ..strokeCap = StrokeCap.round;
    final rainPaint = Paint()..color = Colors.blue.withOpacity(cloudOpacity);

    final sunRadius = 100 * ratio;
    var rectTop = size.height - 66 * ratio;
    var rectBottom = rectTop + 50 * ratio;

    var figureLeftEdge = 16.0;
    var figureRightEdge = size.width - 16.0;
    var figureCenter = size.width / 2;
    var cloudBaseRect = Rect.fromPoints(
      Offset(figureLeftEdge + 20 * ratio, rectTop),
      Offset(figureRightEdge - 20 * ratio, rectBottom),
    );
    var cloudBase = RRect.fromRectAndRadius(
      cloudBaseRect,
      const Radius.circular(10.0),
    );
    canvas.drawCircle(
        Offset(figureCenter - 20 * ratio, figureCenter + 10 * ratio),
        sunRadius,
        sunPaint);

    //Cloud
    canvas.drawCircle(
        Offset(figureLeftEdge + 40 * ratio, rectTop), 50.0 * ratio, cloudPaint);
    canvas.drawCircle(Offset(figureCenter - 20 * ratio, rectTop - 50 * ratio),
        75.0 * ratio, cloudPaint);
    canvas.drawCircle(
        Offset(figureRightEdge - 44 * ratio, rectTop - 12 * ratio),
        60.0 * ratio,
        cloudPaint);

    canvas.drawRRect(cloudBase, cloudPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double _getCloudOpacity(double value) {
    if (value < 0.7) {
      return 0.0;
    }

    return (10 / 3) * value - (7 / 3);
  }
}
