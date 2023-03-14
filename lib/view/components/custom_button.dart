import 'package:black_tech_task_1/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.label,
      required this.screenWidth,
      required this.onPress})
      : super(key: key);

  String label;
  double screenWidth;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(vertical: screenHeight / 55),
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ))),
    );
  }
}
