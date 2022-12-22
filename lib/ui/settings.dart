import 'package:flutter/material.dart';
import 'package:nike_admin/ui/aboutus.dart';
import 'package:nike_admin/ui/contactus.dart';
import 'package:nike_admin/ui/notifications.dart';
import 'package:nike_admin/ui/privacy.dart';
import 'package:nike_admin/ui/termncond.dart';
import 'package:nike_admin/widegts/subblack.dart';

import '../styles/colors.dart';
import '../widegts/headingblack.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          GestureDetector(
              child: ListTile(
                leading: Icon(Icons.circle_notifications_outlined, color: Colors.black, size: 30,),
                title: subhblack(subtext: "Notifications"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                tileColor: Colors.white,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
              }
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              child: ListTile(
                leading: Icon(Icons.dataset_outlined, color: Colors.black, size: 30,),
                title: subhblack(subtext: "About Us"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                tileColor: Colors.white,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              }
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              child: ListTile(
                leading: Icon(Icons.lock_clock_outlined, color: Colors.black, size: 30,),
                title: subhblack(subtext: "Privacy Policy"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                tileColor: Colors.white,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              }
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              child: ListTile(
                leading: Icon(Icons.texture_outlined, color: Colors.black, size: 30,),
                title: subhblack(subtext: "Terms & Conditions"),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                tileColor: Colors.white,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditions()));
              }
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}