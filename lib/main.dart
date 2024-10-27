import 'package:flutter/material.dart';
import 'package:hello_world/colors.dart';
import 'package:hello_world/responsive/responsive_layout.dart';
import 'package:hello_world/screens/mobile_screen_layout.dart';
import 'package:hello_world/screens/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        webScreenLayout:  WebScreenLayout(),
        mobileScreenLayout:  MobileScreenLayout(),
      ));
      
      }
}
