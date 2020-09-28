import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/features/auth/auth.dart';
import 'package:food_app/features/auth/ui/screens/login.dart';
import 'package:food_app/features/firestore_operations/models/user.dart';
import 'package:food_app/features/firestore_operations/repoisrore/clinte.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email, password;
  final _formKey = new GlobalKey<FormState>();
  final TextEditingController email_control = TextEditingController();
  TextEditingController password_control = TextEditingController();
  TextEditingController conpassword_control = TextEditingController();

  final TextEditingController name_control = TextEditingController();
  TextEditingController phone_control = TextEditingController();
  TextEditingController address_control = TextEditingController();
  SharedPreferences prefs;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff6bceff), Color(0xff6bceff)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: IconButton(
                            icon: Icon(
                              Icons.person_add,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null)),
                    //)
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: name_control,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a first name';
                        }
                        return null;
                      },
                      // decoration: InputDecoration(labelText: "First Name"),
                      //  onSaved: (value) => name_control = value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                    ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'Full Name',
                    //   ),

                    // ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),

                    //              child: TextFormField(
                    //                controller: _emailController,

                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },
                    //                decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //              hintText: 'Full Name',
                    //                ),
                    //             ),
                    child: TextFormField(
                      controller: phone_control,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a last name';
                        }
                        return null;
                      },
                      //    decoration: InputDecoration(labelText: "Last Name"),
                      // onSaved: (value) => _lastName = value,
                      // TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: email_control,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Email Address"),
                      //onSaved: (value) => email = value,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      // decoration: InputDecoration(
                      //   border: InputBorder.none,
                      //   hintText: 'Full Name',
                      // ),
                    ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'Email',
                    //   ),
                    //),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),

                    child: TextFormField(
                      controller: password_control,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                      //   obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      //onSaved: (value) => _password = value,
                    ),
                    // child: TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'Password',
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      validateAndSubmit(context);
                     
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff6bceff),
                              Color(0xFF00abff),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account ?"),
                  Text(
                    "Login",
                    style: TextStyle(color: Color(0xff6bceff)),
                  ),
                ],
              ),
              onTap: () {
                //  LoginPage
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ));
  }

  void validateAndSubmit(BuildContext context) async {
    prefs = await Auth.auth.instializeSp();

    if (_formKey.currentState.validate()) {
      //  if (password_control.text == conpassword_control.text) {
      _formKey.currentState.save();

      String user_id = await Auth.auth
          .signUp(email_control.text, password_control.text) as String;
      if (user_id != null) {
        prefs.setString(spUserEmail, email_control.text);
        prefs.setString(userId, user_id);
        prefs.setBool(isLogged, true);
        prefs.setString(spUserName, name_control.text);
        prefs.setString(spUserPhone, phone_control.text);
        prefs.setString(spUserPassword, password_control.text);

        UserModel userModel = UserModel(user_id, name_control.text,
            email_control.text, phone_control.text, password_control.text);
        Client.client.adduser(userModel);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      password_control.clear();
      conpassword_control.clear();
    }
  }
}
//}

final String spUserEmail = 'userName';
final String spUserName = 'userEmail';
final String spUserPhone = 'userPhone';
final String spUserAddress = 'userAddress';
final String spUserPassword = 'userPassword';
final String userId = 'userId';
final String isLogged = 'isLogged';


