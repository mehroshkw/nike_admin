
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../widegts/headingblack.dart';
import '../widegts/profilename.dart';

class AllProducts extends StatefulWidget {
  AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  TextEditingController product_nameC = TextEditingController();
  TextEditingController product_priceC = TextEditingController();
  TextEditingController product_materialC = TextEditingController();
  TextEditingController product_descriptionC = TextEditingController();
  TextEditingController product_categoryC = TextEditingController();
  void updateUser(
      {String? id,
        String? product_name,
        String? product_price,
        String? product_material,
        String? product_image,
        String? product_description,
        String? product_category,
        String? address}) async {
    Map<String, Object> userProfile = {};
    if (product_name == "") {
    } else {
      userProfile['product_name'] = product_name!;
    }
    if (product_price == "") {
    } else {
      userProfile['product_price'] = product_price!;
    }
    if (product_material == "") {
    } else {
      userProfile['product_material'] = product_material!;
    }
    if (product_image == "") {
    } else {
      userProfile['product_image'] = product_image!;
    }
    if (product_description == "") {
    } else {
      userProfile['product_description'] = product_description!;
    }
    if (product_category == "") {
    } else {
      userProfile['product_category'] = product_category!;
    }
    await firestore.collection("products").doc(id).update(userProfile);
  }

  void deleteUser(String id) async {
    await firestore.collection("products").doc(id).delete();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Products"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (c, i) {
                var result = snapshot.data!.docs[i];
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            // title: Text("What Do you Wanna Do?"),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Icon(Icons.edit),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black
                                  ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                                title: Column(
                                                  children: [
                                                    Text("Update Data"),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextFormField(
                                                      controller: product_nameC,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          "${result['product_name']}"),
                                                    ),
                                                    TextFormField(
                                                      controller: product_priceC,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          "\$ ${result['product_price']}"),
                                                    ),
                                                    TextField(
                                                      controller: product_materialC,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          "${result['product_material']}"),
                                                    ),
                                                    TextFormField(
                                                      controller: product_categoryC,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          "${result['product_category']}"),
                                                    ),
                                                    TextFormField(
                                                      controller: product_descriptionC,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          "${result['product_description']}"),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            updateUser(
                                                                id: result.id,
                                                                product_name: product_nameC.text,
                                                                product_price: product_priceC.text,
                                                                product_category: product_categoryC.text,
                                                                product_material: product_materialC.text,
                                                                product_description: product_descriptionC.text);
                                                            Navigator.of(context,
                                                                rootNavigator:
                                                                true)
                                                                .pop();
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.black
                                                          ),
                                                          child: Text("Update"),

                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.black
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("Cancel"),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                            );
                                          }
                                      );
                                    },
                                ),
                                ElevatedButton(
                                  child: Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Confirm"),
                                          content:
                                          const Text("Are you sure you want to delete?"),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: ()
                                        {
                                          Navigator.of(context).pop(true);
                                          deleteUser(result.id);
                                        },


                                              child: const Text("DELETE"),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(false),
                                              child: const Text("CANCEL"),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black
                                  ),
                                ),
                              ],
                            )
                        );
                      },
                    );
                  },
                  child: Dismissible(
                    onDismissed: (_) {
                      deleteUser(result.id);
                    },
                    direction: DismissDirection.horizontal,
                    background: Icon(Icons.delete_forever_rounded),
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm"),
                            content:
                            const Text("Are you sure you want to delete?"),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("DELETE"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black
                              ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("CANCEL"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    key: UniqueKey(),
                    child: Card(
                        elevation: 4,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: Colors.black,
                            width: 1
                          )
                        ),
                        color: Color.fromARGB(162, 251, 253, 255),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // CircleAvatar(
                              //   radius: 20.0,
                              //   child: IconButton(
                              //       onPressed: () {
                              //         showDialog(
                              //             context: context,
                              //             builder: (_) {
                              //               return AlertDialog(
                              //                   title: Column(
                              //                     children: [
                              //                       Text("Update Data"),
                              //                       SizedBox(
                              //                         height: 10,
                              //                       ),
                              //                       TextFormField(
                              //                         controller: product_nameC,
                              //                         decoration: InputDecoration(
                              //                             labelText:
                              //                             "${result['product_name']}"),
                              //                       ),
                              //                       TextFormField(
                              //                         controller: product_priceC,
                              //                         decoration: InputDecoration(
                              //                             labelText:
                              //                             "${result['product_price']}"),
                              //                       ),
                              //                       TextField(
                              //                         controller: product_materialC,
                              //                         decoration: InputDecoration(
                              //                             labelText:
                              //                             "${result['product_material']}"),
                              //                       ),
                              //                       TextFormField(
                              //                         controller: product_categoryC,
                              //                         decoration: InputDecoration(
                              //                             labelText:
                              //                             "${result['product_category']}"),
                              //                       ),
                              //                       TextFormField(
                              //                         controller: product_descriptionC,
                              //                         decoration: InputDecoration(
                              //                             labelText:
                              //                             "${result['product_description']}"),
                              //                       ),
                              //                       Row(
                              //                         mainAxisAlignment:
                              //                         MainAxisAlignment
                              //                             .spaceEvenly,
                              //                         children: [
                              //                           ElevatedButton(
                              //                             onPressed: () {
                              //                               updateUser(
                              //                                   id: result.id,
                              //                                   product_name: product_nameC.text,
                              //                                   product_price: product_priceC.text,
                              //                                   product_category: product_categoryC.text,
                              //                                   product_material: product_materialC.text,
                              //                                   product_description: product_descriptionC.text);
                              //                               Navigator.of(context,
                              //                                   rootNavigator:
                              //                                   true)
                              //                                   .pop();
                              //                             },
                              //                             child: Text("Update"),
                              //                           ),
                              //                           ElevatedButton(
                              //                             onPressed: () {
                              //                               Navigator.pop(context);
                              //                             },
                              //                             child: Text("Cancel"),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ],
                              //                   )
                              //               );
                              //             }
                              //             );
                              //       },
                              //       icon: Icon(Icons.edit_note)),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  CircleAvatar(
                                      radius: 60,
                                      backgroundImage:  NetworkImage("${result['product_image']}", ),
                                      // child: Image.network("${result['product_image']}", height: 150, width: 150,)
                                    ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          ("Name: ${result['product_name']}"),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          ("Price: \$ ${result['product_price']}"),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          ("Style: ${result['product_material']}"),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          ("Description: ${result['product_description']}"),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          ("Category: ${result['product_category']}"),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}