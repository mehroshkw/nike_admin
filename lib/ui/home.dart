import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_admin/models/monitormodel.dart';
import 'package:nike_admin/ui/allproducts.dart';
import 'package:nike_admin/ui/confirmed_orders.dart';
import 'package:nike_admin/ui/new_product.dart';
import 'package:nike_admin/ui/notifications.dart';
import 'package:nike_admin/ui/orders.dart';
import 'package:nike_admin/ui/stats.dart';
import 'package:nike_admin/ui/users.dart';
import 'package:nike_admin/widegts/heading.dart';
import 'package:nike_admin/widegts/profilename.dart';
import 'package:nike_admin/widegts/subblack.dart';
import 'package:nike_admin/widegts/subheading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profileModel.dart';
import '../widegts/price.dart';
import '../widegts/profilenameBlack.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<PeopleOne>? peoplelist;
  var uid = '';
  var nameFromFS = '';
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid')!;
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      ProfileModel profileModel = ProfileModel.fromMap(value.data());
      print(profileModel.email);
      // emailFromFs = profileModel.email.toString();
      // phoneFromFs = profileModel.phone.toString();
      nameFromFS = profileModel.name.toString();
      // addressFromFs = profileModel.address.toString();
      // profileImage = profileModel.profileImage.toString();
      setState(() {});

    });
  }

  @override
  void initState() {
    getUser();
    print(nameFromFS);
    peoplelist = [
      PeopleOne(id: "1", name: "Products", route: AllProducts()),
      PeopleOne(id: "2", name: "Users",route: Users()),
      PeopleOne(id: "3", name: "Orders", route: Orders()),
      // PeopleOne(id: "4", name: "Confirmed Orders", route: ConfirmOrders()),
      PeopleOne(id: "5", name: "Add New Product",route: NewProduct()),
      // PeopleOne(id: "6", name: "Statistics", route: Stats()),
      // PeopleOne(id: "7", name: "ABC", route: NotificationScreen()),
      // PeopleOne(id: "8", name: "XYZ",route: NotificationScreen()),
    ]; //list of peoples using PeopleOne model class, you can convert from JSON too

    //OR to convert from JSON

    /*
    peoplelist = List<PeopleOne>.from(
      jsonstring.map((dataone){
          return PeopleOne.fromJSON(dataone);
          //return of factory of PeopleOne
      })
    );
   */

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final  height = MediaQuery.of(context).size.height;
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var result = firestore.collection("users").snapshots();

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),

                    child: Container(
                            color: Colors.black,
                            height: height / 3.0,
                            width: width,
                            // color: Colors.black,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(

                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          price(pricetext:  "Welcome Back"),
                                      heading(
                                          headingtext: "   Mehrosh Khan",
                                              ),
                                        ],
                                      ),
                                )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 5,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                subheading(subtext: "Total Users"),
                                                StreamBuilder<QuerySnapshot>(
                                                  stream: firestore.collection("users").snapshots(),
                                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                                  if (snapshot.hasError) {
                                                  return const Text(
                                                  'Oops, something went wrong.');
                                                  }
                                                  else if(snapshot.hasData) {
                                                    return subheading(subtext: " ${snapshot.data!.docs.length}");
                                                  }
                                                    else{
                                                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                                                }
                                                  }
                                                ),
                                              ],
                                            )
                                        ),
                                        Expanded(
                                            flex: 5,
                                            child:  Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                subheading(subtext: "Total Orders"),
                                                StreamBuilder<QuerySnapshot>(
                                                    stream: firestore.collection("orders").snapshots(),
                                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                                      if (snapshot.hasError) {
                                                        return const Text(
                                                            'Oops, something went wrong.');
                                                      }
                                                      else if(snapshot.hasData) {
                                                        return subheading(subtext: " ${snapshot.data!.docs.length}");
                                                      }
                                                      else{
                                                        return Center(child: CircularProgressIndicator(color: Colors.white,),);
                                                      }
                                                    }
                                                ),
                                              ],
                                            ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child:  Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              subheading(subtext: "Total Products"),
                                              StreamBuilder<QuerySnapshot>(
                                                  stream: firestore.collection("products").snapshots(),
                                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                                    if (snapshot.hasError) {
                                                      return const Text(
                                                          'Oops, something went wrong.');
                                                    }
                                                    else if(snapshot.hasData) {
                                                      return subheading(subtext: " ${snapshot.data!.docs.length}");
                                                    }
                                                    else{
                                                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                                                    }
                                                  }
                                              ),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child:  Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              subheading(subtext: "Delivered Orders"),
                                              StreamBuilder<QuerySnapshot>(
                                                  stream: firestore.collection("orders").snapshots(),
                                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                                    if (snapshot.hasError) {
                                                      return const Text(
                                                          'Oops, something went wrong.');
                                                    }
                                                    else if(snapshot.hasData) {
                                                      return subheading(subtext: " ${snapshot.data!.docs.length}");
                                                    }
                                                    else{
                                                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                                                    }
                                                  }
                                              ),
                                            ],
                                          )
                                      )
                                    ],
                                  ),)
                              ],
                            ),
                          ),
                  ),
                ),
                Container(
                  height: height/2,
                  child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: peoplelist!.map((people) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => people.route
                            ),
                          );
                        },
                        child: Card(

                            elevation: 10, //shadow elevation for card
                            margin: EdgeInsets.all(8),
                            child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20, left: 1, right: 1),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black, width: 8),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        subhblack(subtext: people.name),
                                              ])
                                      )
                            )
                        ),
                      );
                      }
                      ).toList(),
                    ),
                ),
                // SizedBox(
                //   height: 2,
                // )
              ],
            ),
    ),
        )
    );
  }
}
