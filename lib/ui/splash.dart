import 'package:flutter/material.dart';
import 'package:nike_admin/ui/login.dart';
import 'package:nike_admin/widegts/bottomNav.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<Splash> {
  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var emails = prefs.getString("email");
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
          // context, MaterialPageRoute(builder: (context) => HomeScreen())));
            context,
            // MaterialPageRoute(builder: (context) => Login()))
            MaterialPageRoute(builder: (context) => emails == null ? Login() : BottomNav()))
    );
  }
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //         () => Navigator.pushReplacement(
    //       // context, MaterialPageRoute(builder: (context) => HomeScreen())));
    //         context,
    //         MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Color(0xff88A9C7),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network('https://i.pinimg.com/236x/5f/ae/a8/5faea8c06ea06a11aa41f9334e3dac94.jpg'),
      ),
    );
  }
}
