import 'package:firebase_auth_data_retrive/crude_testting/crud.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/provider_notifier.dart';
import 'package:firebase_auth_data_retrive/screens/feed.dart';
import 'package:firebase_auth_data_retrive/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider<AuthNotifier>(
          create: (context) => AuthNotifier(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProvider<FoodNotifier>(
          create: (context) => FoodNotifier(),
        ),
        ChangeNotifierProvider<OrangeNotifier>(
          create: (context) => OrangeNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Consumer<AuthNotifier>(
      //   builder: (context, notifier, child) {
      //     return notifier.user != null ? Feed() : Login();
      //   },
      // ),

      home: TexEditField(),
    );
  }
}
