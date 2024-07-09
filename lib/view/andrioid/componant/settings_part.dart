import 'package:flutter/material.dart';

class settingpage extends StatefulWidget {
  const settingpage({super.key});

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "settings",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
