import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/feed.dart';
import 'screens/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider(
          builder: (context) => AuthNotifier(),
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
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Feed() : Login();
        },
      ),
    );
  }
}
