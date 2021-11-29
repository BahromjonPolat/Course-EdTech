import 'package:course/components/const.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final String fontFamily;
  final double lineHeight;
  final TextAlign textAlign;

  const TitleText(
    this.text, {
    Key? key,
    this.size = 24.0,
    this.weight = FontWeight.w500,
    this.color = ConstColor.kDark,
    this.fontFamily = "Rubik",
    this.lineHeight = 1.0,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: getUniqueWidth(size),
        color: color,
        fontWeight: weight,
        fontFamily: fontFamily,
        height: getUniqueHeight(lineHeight),
      ),
    );
  }
}
