import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../LandingPages/Customer_Login.dart';
import 'Special Food/FoodItems.dart';
import 'Special Food/SpecialFood.dart';

class Foodmain extends StatefulWidget {
  const Foodmain({super.key});

  @override
  State<Foodmain> createState() => _FoodmainState();
}

class _FoodmainState extends State<Foodmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Color.fromRGBO(242, 144, 87, 1),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomerLogin()));
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(11),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(242, 144, 87, 1)),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.person,
                    size: 25,
                  ),
                );
              },
            ),
            backgroundColor: Color.fromRGBO(255, 244, 230, 1),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                "assets/images/Landing_Images/appbar.png",
                fit: BoxFit.cover,
              ),
              title: Text(
                "Dine It",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
            ),
          ),

          // Special Food Section
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 200, child: Specialfood()),
          )),

          // Grid Section (SliverGrid)
          Fooditems(),
        ],
      ),
    );
  }
}
