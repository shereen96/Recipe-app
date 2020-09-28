import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/features/auth/auth.dart';
import 'package:food_app/features/auth/ui/screens/first.dart';
import 'package:food_app/features/auth/ui/screens/home.dart';
import 'package:food_app/features/auth/ui/screens/singup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController email_control = TextEditingController();
  TextEditingController password_control = TextEditingController();
  SharedPreferences prefs;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Form(
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
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'Login',
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a first name';
                        }
                        return null;
                      },
                      controller: email_control,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.alternate_email,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a first name';
                        }
                        return null;
                      },
                      controller: password_control,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 32),
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                       // validateAndSubmit(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Homepage();
                        }),
                      );
                    
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
                          'Login'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Dnon't have an account ?"),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xff6bceff)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return SignupPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) async {
    prefs = await Auth.auth.instializeSp();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String user_id = await Auth.auth
          .singIn(email_control.text, password_control.text) as String;
      if (user_id != null) {
        prefs.setString(spUserEmail, email_control.text);
        prefs.setString(userId, user_id);
        prefs.setBool(isLogged, true);
        prefs.setString(spUserPassword, password_control.text);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Homepage()),
            (Route<dynamic> route) => false);
      }
    }
  }
}

final String spUserEmail = 'userName';
final String spUserName = 'userEmail';
final String spUserPhone = 'userPhone';
final String spUserAddress = 'userAddress';
final String spUserPassword = 'userPassword';
final String userId = 'userId';
final String isLogged = 'isLogged';
