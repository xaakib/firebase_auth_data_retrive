import 'dart:collection';

import 'package:firebase_auth_data_retrive/model/orange.dart';
import 'package:flutter/material.dart';

class OrangeNotifier with ChangeNotifier {
  List<Orange> _orangeList = [];
  Orange _currentOrange;

  UnmodifiableListView<Orange> get orangeList =>
      UnmodifiableListView(_orangeList);
  Orange get currentOrange => _currentOrange;
  set orangeList(List<Orange> orangeList) {
    _orangeList = orangeList;
    notifyListeners();
  }

  set currentOrange(Orange orange) {
    _currentOrange = orange;
    notifyListeners();
  }
}
