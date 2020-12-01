import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String id;
  String name;
  String category;
  String imageUrl;
  List subIngredients;
  Timestamp createdAt;
  Food(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.subIngredients,
      this.createdAt});
  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    imageUrl = data['imageUrl'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
  }
}

class Orange {
  String id;
  String name;
  String category;
  String imageUrl;
  List subIngredients;
  Timestamp createdAt;
  Orange(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.subIngredients,
      this.createdAt});
  Orange.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    imageUrl = data['imageUrl'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
  }
}

