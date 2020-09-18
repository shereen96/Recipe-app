// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   String name = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Card(
//                   elevation: 8.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             GestureDetector(
//                               child: Icon(
//                                 Icons.search,
//                                 color: Colors.black54,
//                               ),
//                               onTap: () {},
//                             ),
//                             SizedBox(
//                               width: 10.0,
//                             ),
//                             Expanded(
//                               child: TextField(
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: "Search..."),
//                                   onChanged: (value) {
//                                     name = value;
//                                     if (value == null) {
//                                       print("ok");
//                                     }
//                                   }               // },
//                                   // onSubmitted: (String place) {
//                                   //   if (place.isNotEmpty) {

//                                   //   performSearch(place);
//                                   //  }
//                                   //},
//                                   ),
//                             ),
//                           ])),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0.0, 0.0),
//                   child: Text(
//                     'Categories  ',
//                     style: TextStyle(
//                       fontFamily: 'Big Caslon FB',
//                       fontSize: 26,
//                       color: const Color(0xff000000),
//                       fontWeight: FontWeight.w700,
//                       height: 1.8461538461538463,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 600,
//                   width: double.infinity,
//                   child: mycatag(),
//                 )

//                 //  mycatag()),
//               ]),
//           //  mycatag()
//         ],
//       ),
//       //)
//     );
//   }
// }

// class mycatag extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // body: StreamBuilder<QuerySnapshot>(
//         //     stream: (name != "" && name != null)
//         //         ? Firestore.instance
//         //             .collection('items')
//         //             .where("searchKeywords", arrayContains: name)
//         //             .snapshots()
//         //         : Firestore.instance.collection("items").snapshots(),
//         //     builder: (context, snapshot) {
//         //       return (snapshot.connectionState == ConnectionState.waiting)
//         //           ? Center(child: CircularProgressIndicator())
//         //           : ListView.builder(
//         //               itemCount: snapshot.data.documents.length,
//         //               itemBuilder: (context, index) {
//         //                 DocumentSnapshot data = snapshot.data.documents[index];
//         //                 return Card(
//         //                   child: Row(
//         //                     children: <Widget>[
//         //                       Image.network(
//         //                         data['imageUrl'],
//         //                         width: 150,
//         //                         height: 100,
//         //                         fit: BoxFit.fill,
//         //                       ),
//         //                       SizedBox(
//         //                         width: 25,
//         //                       ),
//         //                       Text(
//         //                         data['name'],
//         //                         style: TextStyle(
//         //                           fontWeight: FontWeight.w700,
//         //                           fontSize: 20,
//         //                         ),
//         //                       ),
//         //                     ],
//         //                   ),
//         //                 );
//         //               },
//         //             );
//         //     })
//         //   body: ListView(children: <Widget>[
//         // //ListView.builder(
//         // // itemCount:
//         // // //titles.length,
//         // // itemBuilder: (context, index) {
//         // Column(
//         //   children: <Widget>[
//         //     Card(
//         //       color: Colors.yellowAccent,
//         //       child: ListTile(
//         //         leading: IconButton(icon: Icon(Icons.launch), onPressed: null),
//         //         title: Text('soup'),
//         //       ),
//         //     ),
//         //     Card(
//         //       color: Colors.yellowAccent,
//         //       child: ListTile(
//         //         leading:
//         //             IconButton(icon: Icon(Icons.free_breakfast), onPressed: null),
//         //         title: Text('salad'),
//         //       ),
//         //     ),
//         //     Card(
//         //       color: Colors.yellowAccent,
//         //       child: ListTile(
//         //         leading: IconButton(icon: Icon(Icons.launch), onPressed: null),
//         //         title: Text('meet'),
//         //       ),
//         //     ),

//         //],
//         //)
//         //]
//         //)
//         );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? Firestore.instance
                .collection('recipeCollection')
                .where("name", isEqualTo: name)
                //arrayContains: name)
                .snapshots()
            : Firestore.instance.collection("recipeCollection").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Text('data'),
                          // Image.network(

                          //   // data['imageUrl'],
                          //   // width: 150,
                          //   // height: 100,
                          //   // fit: BoxFit.fill,
                          // ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
