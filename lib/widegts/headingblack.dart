import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class headingblack extends StatelessWidget {
  const headingblack({
    Key? key,
    required this.subtext,
  }) : super(key: key);
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "$subtext",
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.black,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
