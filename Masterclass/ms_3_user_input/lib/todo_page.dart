// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController myController = TextEditingController();

  String greetingMessage = "";

  void greetUser() {
    String username = myController.text;
    setState(() {
      greetingMessage = "Hello " + username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greetingMessage),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Type your name.."),
            ),
            ElevatedButton(onPressed: greetUser, child: Text("Tap"))
          ],
        ),
      ),
    ));
  }
}
