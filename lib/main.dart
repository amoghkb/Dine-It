import 'package:dineit/src/Pages/LandingPages/Welcome_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DineIt());
}

class DineIt extends StatefulWidget {
  const DineIt({super.key});

  @override
  State<DineIt> createState() => _DineItState();
}

class _DineItState extends State<DineIt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito-SemiBold.ttf"),
      home: Welcome_Page(),
    );
  }
}
