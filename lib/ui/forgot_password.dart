import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nike_admin/widegts/subblack.dart';
import '../models/auth_controller.dart';
import '../widegts/reusable_button.dart';
import '../widegts/reusable_textfield.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
        title: subhblack(subtext: "Change Password",)
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ReusableTextField(
                  labelText: 'Email',
                  controller: authController.emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                ReusablePrimaryButton(
                  onTap: () {
                    // authController.loginUser();
                    authController.sendpasswordresetemail(authController.emailController.text);
                    Fluttertoast.showToast(
                        msg: "Sending You Password Reset Link.....",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  buttonText: 'Verify Email',
                ),
              ],
            ),
          )),
    );
  }
}