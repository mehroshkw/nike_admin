import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class priceblack extends StatelessWidget {
  const priceblack({
    Key? key,
    required this.pricetext,
  }) : super(key: key);
  final String pricetext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "$pricetext",
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.black,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
