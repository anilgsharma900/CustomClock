import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'clock_painter.dart';

/// Created by Anil Sharma on 25/09/21.

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

@override
void initState(){
  Timer.periodic(const Duration(seconds: 1), (timer) {
    setState(() {

    });
  });

  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: CommonPainter(),
        ),
      ),
    );
  }


}
