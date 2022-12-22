import 'package:flutter/material.dart';

class CatModel{

  int? id;
  String? name;
  IconData? icon;
  // final Widget route;


  CatModel({this.id, this.icon, this.name,
    // required this.route
  });

}
var catList = [

  CatModel(
      id:0,
      icon: Icons.man,
      name:'Men',
    // route: AllProducts(),
  ),
  CatModel(
    id:1,
icon: Icons.woman,
    name:'Women',
    // route: AllProducts(),
  ),
  CatModel(
    id:2,
icon: Icons.child_care,
    name:'Kids',
    // route: AllProducts(),
  ),
//   CatModel(
//     id:3,
// icon: Icons.apps,
//     name:'More',
//     // route: AllProducts(),
//   ),
];