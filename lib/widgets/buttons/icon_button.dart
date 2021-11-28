import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  VoidCallback onPressed;
  String svgIcon;
  double? size;

  CustomIconButton({
    required this.onPressed,
    required this.svgIcon,
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        svgIcon,
        height: getUniqueHeight(size ?? 24.0),
        width: getUniqueWidth(size ?? 24.0),
        // fit: BoxFit.none,
      ),
      // constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }
}
