import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:food_app/features/firestore_operations/models/recipe.dart';
import 'package:food_app/features/firestore_operations/repoisrore/admin.dart';
import 'package:food_app/features/firestore_operations/repoisrore/clinte.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> allRecipe = [];
  List<Recipe> lunRecipe = [];
  List<Recipe> dinnRecipe = [];
  List<Recipe> breakRecipe = [];
  String recipeImageUrl;
  String recipeName;
  String recipeIngredients;
  String recipeDiscrption;
  String recipeCatagorie;

  uploadImage(File file) async {
    String url = await Client.client.uploadImage(file);
    this.recipeImageUrl = url;
    notifyListeners();
  }

  setRecipeName(String name) {
    this.recipeName = name;
    notifyListeners();
  }

  setRecipeIngredients(String ingredients) {
    this.recipeIngredients = ingredients;
    notifyListeners();
  }

  setRecipeDiscrption(String discrption) {
    this.recipeDiscrption = discrption;
    notifyListeners();
  }

  setRecipeCatagorie(String catagorie) {
    this.recipeCatagorie = catagorie;
    notifyListeners();
  }

  addNewRecipe() async {
    try {
      Recipe recipe = Recipe(
        imageUrl: this.recipeImageUrl,
        name: this.recipeName,

        catagorie: this.recipeCatagorie,
        //imageUrl: this.recipeImageUrl,
        ingredients: this.recipeIngredients,
        description: this.recipeDiscrption,
      );
      String recipeId = await Client.client.uploadRecipe(recipe);
      assert(recipeId != null);
      getAllRecipe();
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
    }

    //}
  }

  getAllRecipe() async {
    allRecipe = await Admin.admin.getAllRecipe();
    notifyListeners();
  }

  getLunRecipe() async {
    lunRecipe = await Admin.admin.getLunRecipe();
    notifyListeners();
  }

  getDinnRecipe() async {
    dinnRecipe = await Admin.admin.getDinnRecipe();
    notifyListeners();
  }

  getbreRecipe() async {
    breakRecipe = await Admin.admin.getbreRecipe();
    notifyListeners();
  }

  updateRecipe(Recipe recipe) async {
    await Client.client.updateRecipe(recipe);
    getAllRecipe();
  }

  // deleteRecipe(String documantid) async {
  //   await Client.client.deleteRecipe(documantid);
  //   //getAllRecipe();
  // }
}
