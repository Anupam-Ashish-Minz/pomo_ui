import 'package:flutter/material.dart';

void main() {
  runApp(Pomo());
}

class Pomo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(title: "TOMOTO", color: Colors.red),
              MyButton(title: "SHORT BREAK", color: Colors.grey[500]),
              MyButton(title: "LONG BREAK", color: Colors.grey[500]),
              MyButton(title: "RESET", color: Colors.grey[400]),
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
