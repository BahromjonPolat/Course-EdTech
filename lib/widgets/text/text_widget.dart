import 'package:course/components/const.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
  Color color;
  String fontFamily;

  CustomTextWidget(
    this.text, {
    Key? key,
    this.size = 14.0,
    this.weight = FontWeight.normal,
    this.color = ConstColor.dark,
    this.fontFamily = "Rubik",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getUniqueWidth(size),
        color: color,
        fontWeight: weight,
        fontFamily: fontFamily,
      ),
    );
  }
}
