import 'package:flutter/material.dart';

class callpage extends StatefulWidget {
  const callpage({super.key});

  @override
  State<callpage> createState() => _callpageState();
}

class _callpageState extends State<callpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "calls",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
