import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String title;
  String category;
  String poster;
  String download;
  String introduction;
  List subIngredients;
  Food({
    this.title,
    this.category,
    this.poster,
    this.download,
    this.introduction,
    this.subIngredients,
  });
  Food.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    download = data['download'];
    category = data['category'];
    poster = data['poster'];
    subIngredients = data['subIngredients'];
    introduction = data['introduction'];
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
