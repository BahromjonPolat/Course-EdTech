import 'package:course/components/importing_packages.dart';

class CustomTabButton extends StatelessWidget {
  String label;

  BorderRadius? borderRadius;
  Color? color;


  CustomTabButton({
    Key? key,
    required this.label,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: getUniqueHeight(42.0),
        decoration: BoxDecoration(
          color: ConstColor.kLightGrey,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: CustomTextWidget(
          label,
          size: getUniqueWidth(16.0),
          weight: FontWeight.w400,
          fontFamily: "Inter",
          color: color ?? ConstColor.kDarkGrey,

        ),
      ),
    );
  }

  static BorderRadius leftBorder() => BorderRadius.only(
        topLeft: _setRadius(),
        bottomLeft: _setRadius(),
      );

  static BorderRadius rightBorder() => BorderRadius.only(
        topRight: _setRadius(),
        bottomRight: _setRadius(),
      );

  static Radius _setRadius() => Radius.circular(getUniqueWidth(16.0));
}
