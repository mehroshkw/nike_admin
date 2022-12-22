import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_admin/widegts/profilename.dart';

import '../styles/colors.dart';
import '../widegts/headingblack.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingblack(subtext: "Terms & Conditions"),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.textwhite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to the NIKE community!  You are reading these Terms because you are using a NIKE website, digital experience, social media platform, mobile app, wearable technology, or one of our other products or services, all of which are part of NIKE’s Platform (“Platform”).  You may access the Platform through a computer, mobile phone, tablet, console, or other technology, which we refer to here as a “Device”.  Your carrier's normal rates and fees apply to your Device.",
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
              ProfileName(subtext: "1. Ground Rules"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Eligibility.  You are only eligible to use the Platform if you are of legal age in your country/region or if you have consent from your parent or guardian.  There may be certain age restrictions for specific Platform services in various countries or regions. \n \n ",
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
              ProfileName(subtext: "2. Ownership of Content"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Except for User Content (defined below), all of the content on our Platform - including text, software, scripts, code, designs, graphics, photos, sounds, music, videos, applications, interactive features, articles, news stories, sketches, animations, stickers, general artwork and other content - is owned by NIKE or others we license Content from, and is protected by copyright, trademark, patent and other laws.",
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
              ProfileName(subtext: "3. Copyright Agreement"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please consult your legal advisor before filing a notice with us because there may be penalties for false claims.  NIKE may terminate the accounts of Platform users found to infringe third party copyrights. \n \n If you believe that your work has been improperly copied to the Platform, such that it constitutes infringement, please provide us with the following information",
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
              ProfileName(subtext: "4. User Code if Conduct"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Only post User Content to the Platform if you have all permissions and rights needed to make that User Content available, including from any individuals who appear or are mentioned in your User Content. \n \n Do not do anything that may expose NIKE or its users to any type of harm, including anything that may disrupt, damage, disable, tamper with, overburden or limit the functionality of the Platform. \n \n Do not post any advertising, solicitation or commercial content on the Platform or accept payment from a third party in exchange for performing commercial activity on the Platform.",
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
      ),
    );
  }
}
