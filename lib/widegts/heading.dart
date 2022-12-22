import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class heading extends StatelessWidget {
  const heading({
    Key? key,
    required this.headingtext,
  }) : super(key: key);
  final String headingtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "$headingtext",
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.white,
            letterSpacing: .5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

// TextStyle(
//           color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22,
        
//           ),
