import 'package:flutter/material.dart';

class Fooditems extends StatefulWidget {
  const Fooditems({super.key});

  @override
  State<Fooditems> createState() => _FooditemsState();
}

class _FooditemsState extends State<Fooditems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Food Course"),
      ),
    );
  }
}
