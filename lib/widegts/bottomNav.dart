import 'package:flutter/material.dart';
import 'package:nike_admin/styles/colors.dart';
import 'package:nike_admin/ui/home.dart';
import 'package:nike_admin/ui/notifications.dart';
import 'package:nike_admin/ui/profile.dart';
import 'package:nike_admin/ui/settings.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const NotificationScreen(),
    const Profile(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo.png",
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           // context, MaterialPageRoute(builder: (context) => HomeScreen())));
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const Notification()));
        //       },
        //       icon: Icon(
        //         Icons.notifications_active_outlined,
        //         color: AppColors.textblack,
        //       ))
        // ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //         ),
      //         child: Container(
      //           height: 120,
      //           width: 120,
      //           padding: const EdgeInsets.all(40),
      //           child: Image.asset(
      //             "assets/images/logo.png",
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Home'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Notifications'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('About Us'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home,
              color: Colors.white,
              size: 25,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.notifications_active,
              color: Colors.white,
              size: 25,
            )
                : const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.person_sharp,
              color: Colors.white,
              size: 25,
            )
                : const Icon(
              Icons.person_outline_sharp,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            )
                : const Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
