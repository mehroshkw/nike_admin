import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nike_admin/styles/colors.dart';
import 'package:nike_admin/ui/order_details.dart';
import 'package:nike_admin/widegts/price.dart';
import 'package:nike_admin/widegts/priceblack.dart';
import 'package:nike_admin/widegts/profilename.dart';
import 'package:nike_admin/widegts/subheading.dart';

import '../models/order_model.dart';
import '../widegts/headingblack.dart';
import '../widegts/subblack.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Orders"),
        // centerTitle: true,
        backgroundColor: AppColors.textwhite,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child:  StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("orders").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (c, i) {
                  var result = snapshot.data!.docs[i];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return OrderDetails(
                          orderId: result['orderId'],
                          name: result['name'],
                          email: result['email'],
                          total: result['total'],
                          userId: result['userId'],
                        );
                      }));
                    },
                    child: Dismissible(
                      onDismissed: (_) {
                        // deleteUser(result.id);
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
                          // color: Color.fromARGB(162, 251, 253, 255),
                          color: AppColors.containerblue,
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

                                    // CircleAvatar(
                                    //   radius: 60,
                                    //   backgroundImage:  NetworkImage("${result['profileImage']}", ),
                                    //   // child: Image.network("${result['product_image']}", height: 150, width: 150,)
                                    // ),
                                    // SizedBox(width: 10,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          subhblack(
                                             subtext: 'Order#: ${result['orderId']}',
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            ("Name: ${result['name']}"),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            ("Email: ${result['email']}"),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            ("Address: ${result['address']}"),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            ("Phone: ${result['phone']}"),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          priceblack(
                                            pricetext: "Total Amount: \$ ${result['total']}",
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          // Text(
                                          //   ("Description: ${result['product_description']}"),
                                          // ),
                                          // SizedBox(
                                          //   height: 8.0,
                                          // ),
                                          // Text(
                                          //   ("Category: ${result['product_category']}"),
                                          // ),
                                          // SizedBox(
                                          //   height: 8.0,
                                          // ),
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
            return Center(child: CircularProgressIndicator(color: AppColors.textblack,));
          },
        ),
        // child: ListView(
        //   children: [
        //     Center(child: const ProfileName(subtext: "All Orders")),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     ListTile(
        //         tileColor: AppColors.textblack,
        //         leading: CircleAvatar(
        //             backgroundImage: NetworkImage("https://static.nike.com/a/images/c_limit,w_400,f_auto/t_product_v1/2a7691e4-bff6-423e-aa5e-7dc264114e34/image.jpg")),
        //         title: subheading(subtext: "Order Number: 12263762"),
        //         // subtitle: price(pricetext: "Discount: 10%"),
        //         trailing: price(
        //           pricetext: "\$180",
        //         )
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     ListTile(
        //         tileColor: AppColors.textblack,
        //         leading: CircleAvatar(backgroundImage: NetworkImage("https://static.nike.com/a/images/c_limit,w_400,f_auto/t_product_v1/2a7691e4-bff6-423e-aa5e-7dc264114e34/image.jpg")),
        //         title: subheading(subtext: "Order Number: 12263762"),
        //         // subtitle: price(pricetext: "Discount: 10%"),
        //         trailing: price(
        //           pricetext: "\$180",
        //         )
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     ListTile(
        //         tileColor: AppColors.textblack,
        //         leading: CircleAvatar(backgroundImage: NetworkImage("https://static.nike.com/a/images/c_limit,w_400,f_auto/t_product_v1/2a7691e4-bff6-423e-aa5e-7dc264114e34/image.jpg")),
        //         title: subheading(subtext: "Order Number: 12263762"),
        //         // subtitle: price(pricetext: "Discount: 10%"),
        //         trailing: price(
        //           pricetext: "\$180",
        //         )
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //
        //   ],
        // ),
      ),
    );
  }
}
