import 'package:flutter/material.dart';

class Fooditems extends StatefulWidget {
  const Fooditems({super.key});

  @override
  State<Fooditems> createState() => _FooditemsState();
}

class _FooditemsState extends State<Fooditems> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 11,
              color: Color.fromRGBO(242, 144, 87, 1),
              child: Center(
                child: Text(
                  "Item $index",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        },
        childCount: 20,
      ),
    );
  }
}
