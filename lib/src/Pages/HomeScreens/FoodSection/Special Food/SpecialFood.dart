import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'SpecialFoodDetails.dart';

class Specialfood extends StatelessWidget {
  const Specialfood({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("TodayFoodSpecial").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error loading data"));
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return SizedBox(
                width: 300,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Specialfooddetails()));
                  },
                  child: Card(
                    color: Color.fromRGBO(242, 144, 87, 1),
                    child: Center(
                        child: Text(
                      "${data['Name']}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
