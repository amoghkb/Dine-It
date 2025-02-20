import 'package:dineit/src/Pages/LandingPages/Customer_SignUp.dart';
import 'package:flutter/material.dart';

import 'Customer_Login.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: Stack(
        children: [
          // Background Column
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Landing_Images/landingPageLogo.png"),
                SizedBox(height: 10),
                Text(
                  "Where Every Bite Tells a Story!",
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(11),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(242, 144, 87, 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSignup(),));
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerLogin(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.blue, // Added color for better UX
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -50, // Move slightly outside the screen
            right: -69, // Move slightly outside the right side
            child: Image.asset(
              "assets/images/Landing_Images/pizza.png",
              width: 250,
              height: 300, // Adjust size
            ),
          ),
          Positioned(
            top: 735, // Move slightly outside the screen
            right: 200, // Move slightly outside the right side
            child: Image.asset(
              "assets/images/Landing_Images/forks.png",
              width: 250,
              height: 250, // Adjust size
            ),
          ),
        ],
      ),
    );
  }
}
