import 'dart:math';

import 'package:flutter/material.dart';

/// Created by Anil Sharma on 25/09/21.

class CommonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    // 60 second - 360 degree , 1 sec - 6 deg
    // 60 minute - 360 deg , 1 min - 6 deg
    // 12 hours - 360 deg, 1 hr - 30deg and hour line will move after 1 min so 60 min -30deg, 0.5
///i * pi / 180 this is Radians formula degree * pi / 180
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var offset = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var paint = Paint()..color = Colors.indigo;

    var outLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var centerPointPaint = Paint()..color = Colors.black;

    var secondHandBrush = Paint()
      ..color = Colors.black
      ..shader = const RadialGradient(
        colors: [Colors.yellow, Colors.yellowAccent],
      ).createShader(Rect.fromCircle(center: offset, radius: radius))
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var minuteHandBrush = Paint()
      ..color = Colors.black
      ..shader = const RadialGradient(
        colors: [Colors.lightBlue, Colors.blue],
      ).createShader(Rect.fromCircle(center: offset, radius: radius))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var hourHandBrush = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(
        colors: [Colors.black12, Colors.black87],
      ).createShader(Rect.fromCircle(center: offset, radius: radius))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(offset, radius - 40, paint);
    canvas.drawCircle(offset, radius - 40, outLinePaint);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(offset, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(offset, Offset(minHandX, minHandY), minuteHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(offset, Offset(secHandX, secHandY), secondHandBrush);

    canvas.drawCircle(offset, 16, centerPointPaint);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 20;
    for (int i = 0; i <= 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      if (i%30 ==0 ) {
        centerPointPaint.strokeWidth = 4;
      }else{
        centerPointPaint.strokeWidth = 1;
      }
/// 1hr - 30deg, 60 - 360 , 1 line drwa -6deg, 360/12 = 30 line


      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), centerPointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
