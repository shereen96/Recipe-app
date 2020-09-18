import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/providers/userproider.dart';
import 'package:food_app/features/firestore_operations/models/recipe.dart';
import 'package:provider/provider.dart';

class First1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RecipeProvider>(context, listen: false).getAllRecipe();
    Provider.of<RecipeProvider>(context, listen: false).getLunRecipe();
    Provider.of<RecipeProvider>(context, listen: false).getDinnRecipe();
    Provider.of<RecipeProvider>(context, listen: false).getbreRecipe();
    return Consumer<RecipeProvider>(
      builder: (context, value, child) {
        List<Recipe> lunRecipe = value.lunRecipe;
        List<Recipe> allRecipe = value.allRecipe;
        List<Recipe> dinnRecipe = value.dinnRecipe;
        List<Recipe> breakRecipe = value.breakRecipe;
        if (allRecipe.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(children: <Widget>[
            Column(children: <Widget>[
              Container(
                height: 320,
                width: 400,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellowAccent),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/unnamed.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      'الافطار',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellowAccent),
                ),
                height: 150.0,
                child: new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: breakRecipe.length,
                  // itemCount: allRecipe.where(() => false).length,
                  // itemCount: 10,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      child: new Card(
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              new Container(
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        breakRecipe[index].imageUrl),
                                    //  AssetImage(allRecipe[index].imageUrl),
                                    //  const AssetImage('assets/images/main.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),

                                //new Text('Item $index'),
                              ),
                              Text(breakRecipe[index].name)
                            ],
                          )),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView(
                                children: <Widget>[
                                  Container(
                                      color: Colors.black87,
                                      padding: EdgeInsets.all(8),
                                      height: 600,
                                      //alignment: Alignment.center,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                              child: Column(
                                            children: <Widget>[
                                              Text(
                                                'التفاصيل ',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                              ),
                                              Container(
                                                height: 180,
                                                width: 180,
                                                child: Image(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          breakRecipe[index]
                                                              .imageUrl),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          )),
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    breakRecipe[index].name,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'الاسم',
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.blueAccent,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      breakRecipe[index]
                                                          .ingredients,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'المكونات',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Colors.blueAccent,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      breakRecipe[index]
                                                          .description,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'الخطوات',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Colors.blueAccent,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              );
                              // return
                            });
                      },
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                //padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      'الغداء',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent),
                  ),
                  height: 150.0,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: lunRecipe.length,
                      // itemCount: allRecipe.where(() => false).length,
                      // itemCount: 10,
                      itemBuilder: (context, index) {
                        return new GestureDetector(
                            child: new Card(
                                elevation: 5.0,
                                child: Column(
                                  children: <Widget>[
                                    new Container(
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              lunRecipe[index].imageUrl),
                                          //  AssetImage(allRecipe[index].imageUrl),
                                          //  const AssetImage('assets/images/main.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                      //new Text('Item $index'),
                                    ),
                                    Text(lunRecipe[index].name)
                                  ],
                                )),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ListView(
                                      children: <Widget>[
                                        Container(
                                            color: Colors.black87,
                                            padding: EdgeInsets.all(8),
                                            height: 600,
                                            //alignment: Alignment.center,
                                            child: Column(
                                              children: <Widget>[
                                                Center(
                                                    child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'التفاصيل ',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.amber,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      height: 180,
                                                      width: 180,
                                                      child: Image(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                                lunRecipe[index]
                                                                    .imageUrl),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          lunRecipe[index].name,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'الاسم',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors
                                                                .blueAccent,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            lunRecipe[index]
                                                                .ingredients,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'المكونات',
                                                            style: TextStyle(
                                                              fontSize: 25,
                                                              color: Colors
                                                                  .blueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            lunRecipe[index]
                                                                .description,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'الخطوات',
                                                            style: TextStyle(
                                                              fontSize: 25,
                                                              color: Colors
                                                                  .blueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ]),
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    );
                                    // return
                                  });
                            });
                      })),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      'العشاء',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent),
                  ),
                  height: 150.0,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dinnRecipe.length,
                      // itemCount: allRecipe.where(() => false).length,
                      // itemCount: 10,
                      itemBuilder: (context, index) {
                        return new GestureDetector(
                            child: new Card(
                                elevation: 5.0,
                                child: Column(
                                  children: <Widget>[
                                    new Container(
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              dinnRecipe[index].imageUrl),
                                          //  AssetImage(allRecipe[index].imageUrl),
                                          //  const AssetImage('assets/images/main.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                      //new Text('Item $index'),
                                    ),
                                    Text(dinnRecipe[index].name)
                                  ],
                                )),
                            onTap: () {
                              //showModal(context){
                              //changeSystemColor(Colors.pink);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ListView(
                                      children: <Widget>[
                                        Container(
                                            color: Colors.black87,
                                            padding: EdgeInsets.all(8),
                                            height: 600,
                                            //alignment: Alignment.center,
                                            child: Column(
                                              children: <Widget>[
                                                Center(
                                                    child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'التفاصيل ',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.amber,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      height: 180,
                                                      width: 180,
                                                      child: Image(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                                dinnRecipe[
                                                                        index]
                                                                    .imageUrl),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          dinnRecipe[index]
                                                              .name,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'الاسم',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors
                                                                .blueAccent,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            dinnRecipe[index]
                                                                .ingredients,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'المكونات',
                                                            style: TextStyle(
                                                              fontSize: 25,
                                                              color: Colors
                                                                  .blueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            dinnRecipe[index]
                                                                .description,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'الخطوات',
                                                            style: TextStyle(
                                                              fontSize: 25,
                                                              color: Colors
                                                                  .blueAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ]),
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    );
                                    // return
                                  });
                            });
                      })),
            ])
          ]);
          // );
        }
      },
    );
  }
}
