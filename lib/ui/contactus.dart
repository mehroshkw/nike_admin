import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_admin/widegts/subblack.dart';
import 'package:nike_admin/widegts/subheading.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
                Text("Contact Us",

        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.white,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
            fontSize: 34,
          ),
        )
                )
            ],
          ),
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            child: Container(
                padding: EdgeInsets.all(12),
                width: width,
                height: height / 1.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
                        subhblack(subtext: "+11 223 323344343"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline)),
                        subhblack(subtext: "contact.nike@email.com"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined)),
                        subhblack(subtext: "London, UK"),
                      ],
                    ),
                    TextField(
                        decoration: new InputDecoration(
                            labelText: "Name",
                            suffixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black)
                            )
                        )
                    ),
                    TextField(
                        decoration: new InputDecoration(
                            labelText: "Email",
                            suffixIcon: Icon(Icons.email),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black)
                            )
                        )
                    ),
                    TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: new InputDecoration(
                            labelText: "Message",
                            suffixIcon: Icon(Icons.message_outlined),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black)
                            )
                        )
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width / 2.5,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            child: subheading(
                              subtext: "Send",
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black))),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
