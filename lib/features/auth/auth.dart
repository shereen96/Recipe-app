import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/features/firestore_operations/models/user.dart';
import 'package:food_app/features/firestore_operations/repoisrore/clinte.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/features/auth/ui/screens/singup.dart';

class Auth {
  Auth._();
  static final Auth auth = Auth._();
  factory Auth() {
    return auth;
  }
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;
  Future<SharedPreferences> instializeSp() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs;
    }
  }

  FirebaseAuth initAuth() {
    if (auth == null) {
      firebaseAuth = FirebaseAuth.instance;
      return firebaseAuth;
    } else {
      return firebaseAuth;
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      firebaseAuth = initAuth();
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      return user.uid;
    } catch (error) {
      print(error);
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    firebaseAuth = initAuth();
    FirebaseUser user = await firebaseAuth.currentUser();
    return user;
  }

  signOut() async {
    try {
      prefs = await instializeSp();
      firebaseAuth = initAuth();
      prefs.clear();

      return firebaseAuth.signOut();
    } catch (error) {
      print(error);
    }
  }

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

  singIn(String email, String password) async {
    try {
      firebaseAuth = initAuth();
//       prefs = await instializeSp();

      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      if (user != null) {
        UserModel userModel = await Client.client.getuserdata(user.uid);

        //prefs.setString(spUserAddress, userModel.address);
        prefs.setString(spUserName, userModel.name);
        //prefs.setString(spUserPhone, userModel.phone);
      }
      return user.uid;
    }

//         prefs.setString(spUserName, user.displayName ?? '');
//         prefs.setString(userId, userId);
//        prefs.setBool(isLogged, true);
//       }
    catch (error) {
      print("erre");
    }
//   }

//   singOut() async {}
// }

// final String spUserName = 'UserName';
// final String userId = 'userId';
// final String isLogged = 'isLogged';
  }
}

final String spUserEmail = 'userName';
final String spUserName = 'userEmail';
final String spUserPhone = 'userPhone';
final String spUserPassword = 'userPassword';
final String userId = 'userId';
final String isLogged = 'isLogged';
