import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../StateManagement/ModelClass.dart';

class Fooditems extends StatefulWidget {
  const Fooditems({super.key});

  @override
  State<Fooditems> createState() => _FooditemsState();
}

class _FooditemsState extends State<Fooditems> {
  @override
  Widget build(BuildContext context) {
    // Get the selected category index from the provider
    final itemNumber = Provider.of<ModelClass>(context).PageCount;

    // Category names array to map index to category
    var categoryNames = ["Starters", "Main Course", "Desserts", "Beverages"];

    // Get the category name based on the selected index
    String selectedCategory = categoryNames[itemNumber ?? 0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 244, 230, 1),
        elevation: 0,
        centerTitle: true,
        title: Text(selectedCategory),
      ),
      backgroundColor: Color.fromRGBO(255, 244, 230, 1),
      body: StreamBuilder(
        // Fetch data for the selected category from Firestore
        stream: FirebaseFirestore.instance
            .collection("FoodItems")
            .doc("Fnxh37TsloeSorg7Xvo0") // Document ID
            .collection(selectedCategory) // Sub-collection name
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something Went Wrong"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text("No items available in this category"));
          }

          var foodItems = snapshot.data!.docs;

          return GridView.builder(
            itemCount: foodItems.length, // Correct the itemCount
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final foodData = foodItems[index].data() as Map<String, dynamic>;

              return Card(
                color: Colors.pinkAccent,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(foodData['Name']),
                  subtitle: Text("Price: ₹${foodData['price']}"),
                  trailing: const Icon(Icons.food_bank),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
