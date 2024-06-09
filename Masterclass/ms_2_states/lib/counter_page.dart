// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // variable
  int _counter = 0;
  // method
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // UI (User Interface)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times:"),
            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                onPressed: _incrementCounter, child: Text("Increment"))
          ],
        ),
      ),
    );
  }
}
