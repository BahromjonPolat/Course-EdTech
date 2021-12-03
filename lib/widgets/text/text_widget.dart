import 'package:course/components/importing_packages.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
  Color color;
  String fontFamily;
  double lineHeight;
  TextAlign textAlign;

  CustomTextWidget(
    this.text, {
    Key? key,
    this.size = 14.0,
    this.weight = FontWeight.normal,
    this.color = ConstColor.kDark,
    this.fontFamily = "Rubik",
    this.lineHeight = 1.0,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
