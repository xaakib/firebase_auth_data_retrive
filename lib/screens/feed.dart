import 'package:firebase_auth_data_retrive/api/food_api.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/food_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/orange_notifier.dart';
import 'package:firebase_auth_data_retrive/screens/details_screen.dart';
import 'package:firebase_auth_data_retrive/screens/testDetails.dart';
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
    OrangeNotifier orangeNotifier =
        Provider.of<OrangeNotifier>(context, listen: false);
    getOranges(orangeNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    OrangeNotifier orangeNotifier = Provider.of<OrangeNotifier>(context);

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
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.red,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(foodNotifier.foodList[index].name.toString()),
                    leading: Image.network(
                      foodNotifier.foodList[index].imageUrl.toString(),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    subtitle:
                        Text(foodNotifier.foodList[index].category.toString()),
                    onTap: () {
                      foodNotifier.currentFood = foodNotifier.foodList[index];
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return DetailsScreen();
                      }));
                    },
                  ),
                );
              },
              itemCount: foodNotifier.foodList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                );
              },
            ),
          ),
          Container(
            height: 300,
            color: Colors.blue,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title:
                        Text(orangeNotifier.orangeList[index].name.toString()),
                    leading: Image.network(
                      orangeNotifier.orangeList[index].imageUrl.toString(),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Text(
                        orangeNotifier.orangeList[index].category.toString()),
                    onTap: () {
                      orangeNotifier.currentOrange =
                          orangeNotifier.orangeList[index];
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return TestDetails();
                      }));
                    },
                  ),
                );
              },
              itemCount: orangeNotifier.orangeList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
