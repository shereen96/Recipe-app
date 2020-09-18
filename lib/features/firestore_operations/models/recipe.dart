// class Catagorie {
//   String catagorie;
//   Recipe recipe;

//   Catagorie({this.catagorie, this.recipe});
//   toJson() {
//     Map<String, dynamic> map = {};
//     map['recipe'] = this.recipe.toJson();
//     return map;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  String documentId;
  String imageUrl;
  String catagorie;
  String name;
  String description;
  String ingredients;
  //Ingredients ingredients;

  Recipe(
      {this.documentId,
      this.imageUrl,
      this.name,
      this.ingredients,
      this.description,
      this.catagorie});

  Recipe.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    //.documentID;
    this.imageUrl = documentSnapshot.data['imageUrl'];
    this.name = documentSnapshot.data['name'];

    this.catagorie = documentSnapshot.data['catagorie'];
    this.ingredients = documentSnapshot.data['ingredients'];
    this.description = documentSnapshot.data['description'];
  }

  // Recipe.fromJson(Map map) {
  //   this.imageUrl = map['imageUrl'] ?? '';
  //   this.name = map['title'] ?? '';
  //   this.description = map['description'] ?? '';
  //   this.ingredients = Ingredients.fromJson(map['ingredients']);
  // }
  toJson() {
    Map<String, dynamic> map = {};

    map['imageUrl'] = this.imageUrl;
    map['name'] = this.name;
    map['catagorie'] = this.catagorie;
    map['ingredients'] = this.ingredients;
    map['description'] = this.description;
    //.toJson();
    return map;
  }
}

// class Ingredients {
//   String titel;
//   String amount;
//   Ingredients({this.titel, this.amount});
//   Ingredients.fromJson(Map map) {
//     this.titel = map['titel'];
//     this.amount = map['amount'];
//   }
//   toJson() {
//     return {'titel': this.titel, 'amount': this.amount};
//   }
// }
