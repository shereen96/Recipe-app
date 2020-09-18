import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/providers/userproider.dart';
import 'package:food_app/features/firestore_operations/models/recipe.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RecipeProvider>(context, listen: false).getbreRecipe();
    return Consumer<RecipeProvider>(builder: (context, value, child) {
      List<Recipe> breakRecipe = value.breakRecipe;
      if (breakRecipe.isEmpty) {
        return Center(
          child: Text('data'),
        );
      } else {
        return ListView(children: <Widget>[
          Column(children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Feed',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: breakRecipe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //             children: <Widget>[
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/main.jpg'),
                                ),
                                SizedBox(
                                  height: 0,
                                  width: 10,
                                ),
                                Text('Shereen')
                              ],
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                onPressed: null)
                          ],
                        ),
                        Container(
                          height: 320,
                          width: 800,
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellowAccent),
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
                        ),
                      ]);
                    }))
          ])
        ]);
      }
    });
  }
}
