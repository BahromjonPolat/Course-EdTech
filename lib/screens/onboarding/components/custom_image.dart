import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String assetImageName;

  CustomImage(this.assetImageName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetImageName,
      width: MediaQuery.of(context).size.width,
      height: getUniqueHeight(264.0),
    );
  }
}
