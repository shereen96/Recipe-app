import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:food_app/features/firestore_operations/models/recipe.dart';

class Client {
  final String recipeCollection = 'Recipe';
  final String recipeFolder = 'RecipeImages';

  Client._();
  static final Client client = Client._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Firestore firestore = Firestore.instance;

  Future<String> uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      //   String fileName = file.path.split('/').last;
      // String recipeFolderPath = 'RecipeImages/$fileName';
      // DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          //.child(recipeFolderPath)
          .child('$recipeFolder/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (error) {
      print(error);
    }
  }

  uploadRecipe(Recipe recipe) async {
    try {
      DocumentReference documentReference =
          await firestore.collection(recipeCollection).add(recipe.toJson());
      assert(documentReference.documentID != null);
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllRecipe() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(recipeCollection)
          //  .where("catagorie", isEqualTo: "breakfast")
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getbreRecipe() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(recipeCollection)
          .where("catagorie", isEqualTo: 'breakfast')
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getLunRecipe() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(recipeCollection)
          .where("catagorie", isEqualTo: "Lunch")
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getDinnRecipe() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(recipeCollection)
          .where("catagorie", isEqualTo: "dinner")
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  updateRecipe(Recipe recipe) async {
    try {
      firestore
          .collection(recipeCollection)
          .document(recipe.documentId)
          .setData(recipe.toJson());
    } catch (error) {
      print(error);
    }
  }

  deleteRecipe(String documentId) async {
    try {
      firestore.collection(recipeCollection).document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }
}
