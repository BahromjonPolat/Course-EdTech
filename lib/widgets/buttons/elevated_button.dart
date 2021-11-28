import 'package:course/components/const.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;

  CustomElevatedButton({
    required this.onPressed,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: getUniqueWidth(16.0),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: ConstColor.kOrangeE35,
        elevation: 0.0,
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          getUniqueHeight(56.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getUniqueWidth(16.0)),
        ),
      ),
    );
  }
}