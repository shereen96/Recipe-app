import 'package:flutter/material.dart';
import 'package:food_app/features/auth/providers/userproider.dart';
import 'package:food_app/features/auth/ui/screens/login.dart';
import 'package:provider/provider.dart';

import 'features/auth/ui/screens/addrecip.dart';
import 'features/auth/ui/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipeProvider>(
      create: (BuildContext context) {
        return RecipeProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginPage(),
      ),
    );
  }
}
