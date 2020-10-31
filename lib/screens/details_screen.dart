import 'package:firebase_auth_data_retrive/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(foodNotifier.currentFood.name),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.network(
                foodNotifier.currentFood.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                foodNotifier.currentFood.name,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                foodNotifier.currentFood.category,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: foodNotifier.currentFood.subIngredients
                    .map(
                      (ingredient) => Card(
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(
                            ingredient,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
