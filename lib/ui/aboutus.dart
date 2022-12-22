import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_admin/widegts/profilename.dart';

import '../styles/colors.dart';
import '../widegts/headingblack.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "About Us"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),

            Text(
              "Nike, Inc., formerly (1964–78) Blue Ribbon Sports, American sportswear company headquartered in Beaverton, Oregon. It was founded in 1964 as Blue Ribbon Sports by Bill Bowerman, a track-and-field coach at the University of Oregon, and his former student Phil Knight. They opened their first retail outlet in 1966 and launched the Nike brand shoe in 1972. The company was renamed Nike, Inc., in 1978 and went public two years later.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileName(subtext: "History"),
            SizedBox(
              height: 10,
            ),
            Text(
              "Climatic evidence suggests that people were probably protecting their feet from frigid conditions by about 50,000 years ago. Changes in foot shape and toe strength indicate that people were using footwear with substantial soles by about 40,000 years ago. However, the earliest examples of actual footwear, a pair of sandals found in California (U.S.), date to only about 9,000 years ago. \n \n During the Kassite period (c. 1600–1200 BCE) in Mesopotamia, soft shoes were introduced by mountain people on the border of Iran who ruled Babylonia during that time. This first type of shoe was a simple wraparound of leather, with the basic construction of a moccasin, held together on the foot with rawhide lacings. Greek women often went barefoot or wore sandals, but indoors they sometimes wore soft closed shoes, which became luxurious in the Hellenistic period, with white or red the preferred colours. Until the 5th century BCE, when Greek influence became dominant, the Etruscans wore a high, laced shoe with a turned-up toe. The Romans, who established shoe guilds, developed shaped shoes fitted for the left or right foot. Their footwear was differentiated according to sex and rank.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileName(subtext: "Materials"),
            SizedBox(
              height: 10,
            ),
            Text(
              "Since time immemorial, shoes have been made of leather. The luxury leather used in the finest men’s and women’s shoes is calf. The most versatile leather, used for many kinds of shoes, is side leather, made from cattle hide and called side because the large hide is cut down the middle lengthwise into two sides for handling. \n \n Kid leather, made from goatskin, is used for women’s dress shoes and men’s slippers. Sheepskin is used in linings and slippers. Reptile leathers (alligator, lizard, and snake) are used in women’s and some men’s shoes. Cordovan (a small muscle layer obtained from horsehide) is a heavy leather used in men’s shoes. Patent leather, usually made from cattle hide, is given a hard, glossy surface finish. Suede is made from any of several leathers (calf, kid, or cattle hide) by buffing the inner surface to produce a napped finish.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
