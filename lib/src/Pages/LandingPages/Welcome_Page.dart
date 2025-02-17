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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Landing_Images/landingPageLogo.png"),
            Center(
                child: Text(
              "Where Every Bite Tells a Story!",
              style: TextStyle(fontSize: 19),
            )),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(11),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(242, 144, 87, 1))),
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ))),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerLogin()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
