import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/food_notifier.dart';
import 'package:firebase_auth_data_retrive/screens/movie_screen.dart';
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieScreen(),

      // Consumer<AuthNotifier>(
      //   builder: (context, notifier, child) {
      //     return notifier.user != null ? Feed() : Login();
      //   },
      // ),
    );
  }
}
