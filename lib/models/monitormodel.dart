//model class for people information
import 'package:flutter/cupertino.dart';

class PeopleOne{
  String id;
  String name;
  final Widget route;
  PeopleOne({required this.id, required this.name, required this.route});

//constructure for class

/* factory to convert json string to model data
   factory PeopleOne.fromJSON(Map<String, dynamic> json){
     return PeopleOne(
       id: json["id"],
       name: json["name"],
       address: json["address"]
     );
   } */
}