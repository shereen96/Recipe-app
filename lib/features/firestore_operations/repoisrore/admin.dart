import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/features/firestore_operations/models/recipe.dart';
import 'package:food_app/features/firestore_operations/repoisrore/clinte.dart';

class Admin {
  Admin._();
  static final Admin admin = Admin._();

  Future<List<Recipe>> getAllRecipe() async {
    List<DocumentSnapshot> document = await Client.client.getAllRecipe();
    List<Recipe> recipe =
        document.map((e) => Recipe.fromDocumentSnapshot(e)).toList();
    return recipe;
  }

  Future<List<Recipe>> getLunRecipe() async {
    List<DocumentSnapshot> document = await Client.client.getLunRecipe();
    List<Recipe> recipe =
        document.map((e) => Recipe.fromDocumentSnapshot(e)).toList();
    return recipe;
  }

  Future<List<Recipe>> getDinnRecipe() async {
    List<DocumentSnapshot> document = await Client.client.getDinnRecipe();
    List<Recipe> recipe =
        document.map((e) => Recipe.fromDocumentSnapshot(e)).toList();
    return recipe;
  }

  Future<List<Recipe>> getbreRecipe() async {
    List<DocumentSnapshot> document = await Client.client.getbreRecipe();
    List<Recipe> recipe =
        document.map((e) => Recipe.fromDocumentSnapshot(e)).toList();
    return recipe;
  }
}
//Future<List<DocumentSnapshot>> getLunRecipe() async {
