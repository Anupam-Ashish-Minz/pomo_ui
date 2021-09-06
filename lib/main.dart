import 'dart:async';
import 'package:flutter/material.dart';
/* import 'package:flutter_stopwatch_timer_demo/button_widget.dart'; */

void main() {
  runApp(Pomo());
}

class Pomo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Clock(),
              MyButton(title: "TOMOTO", color: Colors.red[700]),
              MyButton(title: "SHORT", color: Colors.grey[900]),
              MyButton(title: "LONG", color: Colors.grey[900]),
              MyButton(title: "RESET", color: Colors.grey[800]),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color? color;

  MyButton({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(275)),
          backgroundColor: MaterialStateProperty.all<Color?>(color),
        ),
        onPressed: () {},
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

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String time = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(time),
    );
  }
}

