import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_admin/ui/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Splash(),
//     );
//   }
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var emails = prefs.getString("email");

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // home: AddData()
    // home: ImageHome(),
    // home: Maps(),
    // home: SignUpScreen(),
    // home: MyPhone(),
    home: Splash(),
    // home: emails == null ? Register() : HomePage(),
    // home: Contacts(),
  ));
}
