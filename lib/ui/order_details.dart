import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nike_admin/widegts/heading.dart';
import 'package:nike_admin/widegts/headingblack.dart';
import 'package:nike_admin/widegts/subheading.dart';

import '../styles/colors.dart';
import '../widegts/profilename.dart';
import '../widegts/subblack.dart';

class OrderDetails extends StatefulWidget {
  String? orderId;
  String? name;
  String? email;
  String? userId;
  String? total;
  OrderDetails({
    required this.orderId,
    required this.name,
    required this.email,
    required this.userId,
    required this.total,
});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Order Details"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("orders").doc(widget.orderId).collection('cart').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (c, i) {
                var result = snapshot.data!.docs[i];
                return Column(
                  children: [
                    ExpansionTile(
                      leading: Image.network('${result['productImage']}'),
                      title:  subhblack(subtext: '${result['productName']}'),
                      subtitle:  Text('\$${result['productPrice']}'),
                      trailing: Icon(

                        _customTileExpanded
                            ? Icons.arrow_drop_down_circle
                            : Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      children:  <Widget>[
                        ListTile(
                          title: Text('${result['productStyle']}'),
                          trailing: Text('${result['productCategory']}'),
                          subtitle: Text('${result['productDescription']}'),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                    ),
                    // Text("${result['productName']}"),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    //   padding:  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    //   width: width,
                    //   height:height/3,
                    //   decoration: BoxDecoration(
                    //     color: AppColors.textblack,
                    //     borderRadius: BorderRadius.circular(20)
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           subheading(subtext: "${widget.orderId}")
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                    //

                  ],
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator(color: AppColors.textblack,));
        },
      ),
    );
  }
}
