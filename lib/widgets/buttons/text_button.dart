import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;
  Color color;

  CustomTextButton(
      {required this.onPressed,
      required this.label,
      this.color = ConstColor.darkGrey,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: CustomTextWidget(
          label,
          color: color,
          weight: FontWeight.w600,
        ));
  }
}
