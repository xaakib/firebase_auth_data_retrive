import 'package:firebase_auth_data_retrive/api/food_api.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
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
      body: Center(
        child: Text(
          "Feed",
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
