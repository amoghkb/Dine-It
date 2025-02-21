import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../StateManagement/ModelClass.dart';
import 'FoodItems.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key});

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  var NamesofCatogory = ["Starters", "Main Course", "Desserts", "Beverages"];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return SizedBox(
            height: 180,
            child: GestureDetector(
              onTap: () {
                Provider.of<ModelClass>(context, listen: false)
                    .clickedPage(index);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Fooditems(),
                    ));
              },
              child: Card(
                color: Colors.red,
                child: Center(
                  child: Text(NamesofCatogory[index]),
                ),
              ),
            ));
      }, childCount: 4),
    );
  }
}
