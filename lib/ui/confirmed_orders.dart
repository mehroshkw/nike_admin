import 'package:flutter/material.dart';
import 'package:nike_admin/styles/colors.dart';
import 'package:nike_admin/widegts/price.dart';
import 'package:nike_admin/widegts/profilename.dart';
import 'package:nike_admin/widegts/subheading.dart';

import '../widegts/headingblack.dart';

class ConfirmOrders extends StatelessWidget {
  const ConfirmOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Confirmed Orders"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            ListTile(
                tileColor: AppColors.textblack,
                leading: CircleAvatar(backgroundImage: NetworkImage("https://static.nike.com/a/images/c_limit,w_400,f_auto/t_product_v1/2a7691e4-bff6-423e-aa5e-7dc264114e34/image.jpg")),
                title: subheading(subtext: "Order Number: 12263762"),
                // subtitle: price(pricetext: "Discount: 10%"),
                trailing: price(
                  pricetext: "\$180",
                )
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
                tileColor: AppColors.textblack,
                leading: CircleAvatar(backgroundImage: NetworkImage("https://static.nike.com/a/images/c_limit,w_400,f_auto/t_product_v1/2a7691e4-bff6-423e-aa5e-7dc264114e34/image.jpg")),
                title: subheading(subtext: "Order Number: 12263762"),
                // subtitle: price(pricetext: "Discount: 10%"),
                trailing: price(
                  pricetext: "\$180",
                )
            ),
            SizedBox(
              height: 5,
            ),

          ],
        ),
      ),
    );
  }
}
