import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(height: 180, child: Card(color: Colors.red));
        },
        itemCount: 20,
      ),
    );
  }
}
