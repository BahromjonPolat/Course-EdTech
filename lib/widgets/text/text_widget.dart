import 'package:course/components/const.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
  Color color;

  CustomTextWidget(
    this.text, {
    Key? key,
    this.size = 14.0,
    this.weight = FontWeight.normal,
    this.color = ConstColor.kGreen5B,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
