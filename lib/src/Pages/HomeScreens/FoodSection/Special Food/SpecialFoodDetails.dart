import 'package:flutter/material.dart';

class Specialfooddetails extends StatefulWidget {
  const Specialfooddetails({super.key});

  @override
  State<Specialfooddetails> createState() => _SpecialfooddetailsState();
}

class _SpecialfooddetailsState extends State<Specialfooddetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: Center(
        child: Text("Today Special"),
      ),
    );
  }
}
