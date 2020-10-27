import 'package:firebase_auth_data_retrive/api/food_api.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(authNotifier.user != null
            ? authNotifier.user.displayName
            : "Unknown"),
        actions: [
          FlatButton(
            onPressed: () => singout(authNotifier),
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(foodNotifier.foodList[index].name),
            subtitle: Text(foodNotifier.foodList[index].category),
          );
        },
        itemCount: foodNotifier.foodList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
