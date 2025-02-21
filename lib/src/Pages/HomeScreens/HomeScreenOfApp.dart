import 'package:dineit/src/Pages/HomeScreens/FoodSection/FoodMain.dart';
import 'package:dineit/src/Pages/HomeScreens/FoodSection/Tables.dart';
import 'package:flutter/material.dart';

class Homescreenofapp extends StatefulWidget {
  const Homescreenofapp({super.key});

  @override
  State<Homescreenofapp> createState() => _HomescreenofappState();
}

class _HomescreenofappState extends State<Homescreenofapp> {
  var selectedpage = 0;
  var pages = [Foodmain(), Tables()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: pages[selectedpage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.table_bar), label: "Tables"),
        ],
        backgroundColor: Color.fromRGBO(255, 244, 230, 1),
        type: BottomNavigationBarType.fixed,
        elevation: 11,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            selectedpage = value;
          });
        },
        currentIndex: selectedpage,
      ),
    );
  }
}
