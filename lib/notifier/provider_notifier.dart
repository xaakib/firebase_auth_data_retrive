import 'dart:collection';

import 'package:firebase_auth_data_retrive/model/movie_models.dart';
import 'package:flutter/cupertino.dart';


class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _currentFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);
  Food get currentFood => _currentFood;
  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }
}


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

