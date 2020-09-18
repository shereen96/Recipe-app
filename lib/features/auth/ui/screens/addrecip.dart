//import 'dart:html';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:food_app/features/auth/providers/userproider.dart';

import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<AddRecipe> {
  bool brakselected = false;
  bool lunselected = false;
  bool dinnselected = false;

  String _currText = '';

  // TextEditingController nameController = TextEditingController();
  // TextEditingController intgredientController = TextEditingController();
  // TextEditingController amountController = TextEditingController();
  // TextEditingController stepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RecipeProvider provider =
        Provider.of<RecipeProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              //ListView(

              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Publish',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(child: Consumer<RecipeProvider>(
                      builder: (context, value, child) {
                        String image = value.recipeImageUrl;
                        if (image == null) {
                          return Container(
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(40.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.black,
                                  ),
                                  onPressed: () async {
                                    try {
                                      PickedFile pickedFile =
                                          await ImagePicker().getImage(
                                              source: ImageSource.gallery);
                                      File file = File(pickedFile.path);
                                      Provider.of<RecipeProvider>(context,
                                              listen: false)
                                          .uploadImage(file);
                                      //   File file = File(pickedFile.path);
                                      // String imageUrl =
                                      //     await Client.client.uploadRecipeImage(file);
                                      // if (imageUrl == null) {
                                      //   print('object');
                                      //   Recipe recipe = Recipe(
                                      //     imageUrl: imageUrl,
                                      //   );
                                      // }
                                    } catch (error) {
                                      print('error');
                                    }
                                  }));
                        } else {
                          return Container(
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(40.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: CachedNetworkImage(
                                imageUrl: image,
                                height: 80,
                                width: 80,
                                // fit: BoxFit.fill,
                              ));

                          // return CachedNetworkImage(
                          //   imageUrl: image,
                          //   width: 20,
                          //   height: 20,
                          // );
                        }
                      },
                    )),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellowAccent,
                        border: Border.all(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Braekfast'),
                              Checkbox(
                                  value: brakselected,
                                  onChanged: (value) {
                                    setState(() {
                                      brakselected = value;
                                      if (value == true) {
                                        _currText = 'breakfast';
                                        provider.setRecipeCatagorie(_currText);
                                      }
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Lunch     '),
                              Checkbox(
                                  value: lunselected,
                                  onChanged: (value) {
                                    setState(() {
                                      lunselected = value;
                                      if (value == true) {
                                        _currText = 'Lunch';
                                        provider.setRecipeCatagorie(_currText);
                                      }
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Dinner    '),
                              Checkbox(
                                  value: dinnselected,
                                  onChanged: (value) {
                                    setState(() {
                                      dinnselected = value;
                                      if (value == true) {
                                        _currText = 'dinner';
                                        provider.setRecipeCatagorie(_currText);
                                      }
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
              ),

              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  onChanged: (value) {
                    provider.setRecipeName(value);
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  onChanged: (value) {
                    provider.setRecipeIngredients(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients',
                  ),
                ),
              ),

              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Recip',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  onChanged: (value) {
                    provider.setRecipeDiscrption(value);
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'step',
                  ),
                ),
              ),

              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Add'),
                    onPressed: () {
                      Provider.of<RecipeProvider>(context, listen: false)
                          .addNewRecipe();
                    },
                  )),

              SizedBox(
                height: 10,
                width: 10,
              )
            ],
          ),
        ]));
  }
}
