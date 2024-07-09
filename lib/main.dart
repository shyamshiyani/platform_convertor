import 'package:flutter/material.dart';
import 'package:platform_convertor/provider/bottom_provider.dart';
import 'package:platform_convertor/provider/contact_Provider.dart';
import 'package:platform_convertor/provider/image_provider.dart';
import 'package:platform_convertor/provider/stepper_provider.dart';
import 'package:platform_convertor/provider/switch_onoff.dart';
import 'package:platform_convertor/view/andrioid/componant/chat_part.dart';
import 'package:platform_convertor/view/andrioid/componant/chatpage_.dart';
import 'package:platform_convertor/view/andrioid/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SwitchProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StepperProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ContactProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => imageprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'chat_page': (context) => const chatpage(),
        'chat': (context) => ChatScreen(),
      },
    ),
  ));
}
