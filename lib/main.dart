import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dineit/StateManagement/ModelClass.dart';
import 'package:dineit/firebase_options.dart';
import 'package:dineit/src/Pages/HomeScreens/HomeScreenOfApp.dart';
import 'package:dineit/src/Pages/LandingPages/Welcome_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ModelClass(),
      )
    ],
    child: DineIt(),
  ));
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
        home: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(242, 144, 87, 1),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Something Went Wrong"),
                ),
              );
            } else if (snapshot.hasData) {
              return Homescreenofapp();
            } else {
              return Welcome_Page();
            }
          },
        ));
  }
}
