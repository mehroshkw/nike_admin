import 'package:flutter/material.dart';


class ReusablePrimaryButton extends StatelessWidget {
  ReusablePrimaryButton({
    Key? key, required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final String buttonText;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1.3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(buttonText,style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),),),
      ),
    );
  }
}