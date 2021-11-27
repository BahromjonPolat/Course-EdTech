import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  VoidCallback onPressed;
  String svgIcon;

  CustomIconButton({
    required this.onPressed,
    required this.svgIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(svgIcon),

    );
  }
}
