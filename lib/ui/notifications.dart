import 'package:flutter/material.dart';
import 'package:nike_admin/styles/colors.dart';

import '../widegts/headingblack.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Notifications"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body:  ListView.separated(
          itemCount: _values.length,
          padding: const EdgeInsets.all(5.0),
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
                // confirmDismiss: (DismissDirection direction) async {
                //   return await showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: const Text("Delete Confirmation"),
                //         content: const Text("Are you sure you want to delete this item?"),
                //         actions: <Widget>[
                //           ElevatedButton(
                //               onPressed: () => Navigator.of(context).pop(true),
                //               child: const Text("Delete")
                //           ),
                //           ElevatedButton(
                //             onPressed: () => Navigator.of(context).pop(false),
                //             child: const Text("Cancel"),
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // },
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.startToEnd) {
                  print("Mark as Read");
                } else {
                  print('Remove Notification');
                }

                setState(() {
                  _values.removeAt(index);
                });
              },
              child: ListTile(
                leading: Icon(Icons.circle_notifications_outlined, size: 40, color: AppColors.textblack,),
                title: Text(_values[index]),
                subtitle: Text('Description here'),
              ),
            );
          }
      ),
    );
  }
}
