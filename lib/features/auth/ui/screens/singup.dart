import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/features/auth/auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _registerFormKey = GlobalKey<FormState>();
  // final FirebaseRepository firebaseRepository = FirebaseRepository();

  String _firstName = '';
  String _lastName = '';
  String email = '';
  String _password = '';
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // final TextEditingController _emailController = TextEditingController();
    // final TextEditingController _passwordController = TextEditingController();
    // final TextEditingController _nameController = TextEditingController();
    // bool _success;
    // String _userEmail;

    return Scaffold(
        body: Container(
      child: Form(
        key: _registerFormKey,
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
                    child:
                        // Container(
                        // child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //children: <Widget>[
                        Container(
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a first name';
                        }
                        return null;
                      },
                      // decoration: InputDecoration(labelText: "First Name"),
                      onSaved: (value) => _firstName = value,
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a last name';
                        }
                        return null;
                      },
                      //    decoration: InputDecoration(labelText: "Last Name"),
                      onSaved: (value) => _lastName = value,
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email Address"),
                      onSaved: (value) => email = value,
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      onSaved: (value) => _password = value,
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
                      //                    validateAndRegisterUser;
                      // setState(() {

                      // });
                      //  Navigator.pushNamed(context, '/');
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
}
// validateAndRegisterUser() async {
//     final form = _registerFormKey.currentState;
//     form.save();
//     // Validate information was correctly entered
//     if (form.validate()) {
//       print('Form was successfully validated');
//       print('Registering user: First Name: $_firstName | Last Name: $_lastName Email: | $_email Password: $_password');
//       // Call the login method with the enter information
//       registerUserWithEmailAndPassword();
//     }
//   }

//   void registerUserWithEmailAndPassword() async {
//     try {
//       FirebaseUser newUser =
//           await Provider.of<AuthService>(context, listen: false)
//               .registerUserWithEmailAndPassword(
//                   firstName: _firstName,
//                   lastName: _lastName,
//                   email: _email,
//                   password: _password);
//       if(newUser != null) {
//         print('Registered user: ${newUser.uid} | Name: ${newUser.displayName} | Email: ${newUser.email} | Password: $_password}');
//         // Create a new user in the database
//         firebaseRepository.createUserInDatabaseWithEmail(newUser);
//         /// Make sure user was also signed in after registration
//         FirebaseUser currentUser = await Provider.of<AuthService>(context, listen: false).getUser();
//         if(currentUser != null) {
//           print('Registered user was signed in: ${currentUser.uid}');
//           List<MessageCard> personalMessages = await firebaseRepository.getPersonalMessages(currentUser);
//           for(MessageCard messageCard in personalMessages) {
//             print(messageCard);
//           }
//         }
//         else {
//           print('User was registered but not signed in!');
//         }
