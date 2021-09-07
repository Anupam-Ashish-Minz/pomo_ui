import 'dart:async' show Timer;

import 'package:flutter/material.dart';
/* import 'package:flutter_stopwatch_timer_demo/button_widget.dart'; */

void main() {
  runApp(Pomo());
}

class Clock extends StatelessWidget {
  final Duration time;

  Clock(this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          time.inMinutes.toString() + ":" + (time.inSeconds % 60).ceil().toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}

class ClockContainer extends StatefulWidget {
  @override
  _ClockContainerState createState() => _ClockContainerState();
}

class MyButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function() setTimeout;

  MyButton({required this.title, required this.color, required this.setTimeout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(275)),
          backgroundColor: MaterialStateProperty.all<Color?>(color),
        ),
        onPressed: () { setTimeout(); } ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class Pomo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ClockContainer(),
        ),
      ),
    );
  }
}

class _ClockContainerState extends State<ClockContainer> {
  late Duration _remainingTime = Duration();

  Widget build(BuildContext context) {
    return Container(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Clock(_remainingTime),
          MyButton(title: "TOMOTO", color: Colors.red[700],  setTimeout: setTimeoutSeconds(60 * 25)),
          MyButton(title: "SHORT",  color: Colors.grey[900], setTimeout: setTimeoutSeconds(60 * 5)),
          MyButton(title: "LONG",   color: Colors.grey[900], setTimeout: setTimeoutSeconds(60 * 15)),
          MyButton(title: "RESET",  color: Colors.grey[800], setTimeout: setTimeoutSeconds(0)),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if(_remainingTime > Duration()) {
        setState(() {
          _remainingTime -= Duration(seconds: 1);
        });
      }
    });
  }

  void Function() setTimeoutSeconds (int timeoutSeconds) {
    return () {
      setState(() {
        _remainingTime = Duration(seconds: timeoutSeconds);
      });
    };
  }
}

