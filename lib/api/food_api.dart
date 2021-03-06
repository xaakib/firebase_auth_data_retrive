import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_data_retrive/model/movie_models.dart';
import 'package:firebase_auth_data_retrive/model/user.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/provider_notifier.dart';

login(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    FirebaseUser firebaseUser = authResult.user;
    if (firebaseUser != null) {
      print("Log In : $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

singup(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = user.displayName;
    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(updateInfo);

      await firebaseUser.reload();
      print("Sing up: $firebaseUser");

      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      authNotifier.setUser(currentUser);
    }
  }
}

singout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  if (firebaseUser != null) {
    authNotifier.setUser(firebaseUser);
  }
}

getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection("foods").getDocuments();
  List<Food> _foodList = [];
  snapshot.documents.forEach((document) {
    Food food = Food.fromMap(document.data);
    _foodList.add(food);
  });
  foodNotifier.foodList = _foodList;
}

//for orange collections
getOranges(OrangeNotifier orangeNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection("orange").getDocuments();
  List<Orange> _orangeList = [];
  snapshot.documents.forEach((document) {
    Orange orange = Orange.fromMap(document.data);
    _orangeList.add(orange);
  });
  orangeNotifier.orangeList = _orangeList;
}