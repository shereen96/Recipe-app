// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:food_app/features/auth/ui/screens/singup.dart';

// class Auth {
//   Auth._();
//   static final Auth auth = Auth._();
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences prefs;
//   Future<SharedPreferences> instializeSp() async {
//     if (prefs == null) {
//       prefs = await SharedPreferences.getInstance();
//       return prefs;
//     } else {
//       return prefs;
//     }
//   }

//   createNewUser(SignupPage userData) async {
//     try {
//       prefs = await instializeSp();

//       AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
//           email: userData.email, password: password);
//       FirebaseUser user = authResult.user;
//       if (user != null) {
//         prefs.setString(spUserName, user.displayName ?? '');
//         prefs.setString(userId, userId);
//         prefs.setBool(isLogged, true);
//       }
//     } catch (error) {
//       print("erre");
//     }
//   }

//   singIn(String email, String password) async {
//     try {
//       prefs = await instializeSp();
//       AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser user = authResult.user;
//       if (user != null) {
//         prefs.setString(spUserName, user.displayName ?? '');
//         prefs.setString(userId, userId);
//         prefs.setBool(isLogged, true);
//       }
//     } catch (error) {
//       print("erre");
//     }
//   }

//   singOut() async {}
// }

// final String spUserName = 'UserName';
// final String userId = 'userId';
// final String isLogged = 'isLogged';
