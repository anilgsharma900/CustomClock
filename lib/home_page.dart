import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_view.dart';

/// Created by Anil Sharma on 25/09/21.

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dateTime = DateTime.now();
  var time = DateFormat('hh:mm').format(DateTime.now());
var formatedDate = DateFormat('EEE, d MMM').format(DateTime.now());

var timeZone = DateTime.now().timeZoneOffset.toString().split('.').first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child:
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Clock",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        time,
                        style: const TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      Text(
                        formatedDate,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                       const ClockView(),

                      const SizedBox(height: 40,),
                      const Text(
                        "Time Zone",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      Text(
                        "UTC+ $timeZone",
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
