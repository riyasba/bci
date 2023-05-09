import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  TextfieldWidget(
      {super.key,
      required this.email,
      required this.number,
      required this.password,
      required this.title,
      required this.description});
  String title;
  String password;
  String number;
  String email;
  String description;
  dynamic controller;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
