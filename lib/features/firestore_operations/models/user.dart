import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String user_id, name, email, phone, password;

  UserModel(this.user_id, this.name, this.email, this.phone, this.password);

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.user_id = documentSnapshot.data['user_id'];
    this.name = documentSnapshot.data['name'];
    this.email = documentSnapshot.data['email'];
    this.phone = documentSnapshot.data['phone'];
    this.password = documentSnapshot.data['password'];
  }

  toJson() {
    return {
      'user_id': this.user_id,
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
      'password': this.password,
    };
  }
}
