import 'package:course/screens/onboarding/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/painting.dart';

class IntroPageCenterLayout extends StatelessWidget {
  String imageAsset;
  String title;
  String subtitle;

  IntroPageCenterLayout(this.imageAsset, this.title, this.subtitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(imageAsset),
        SizedBox(height: getUniqueHeight(16.0)),
        CustomTextWidget(title, size: 24.0, weight: FontWeight.w600),
        SizedBox(height: getUniqueHeight(8.0)),
        CustomTextWidget(
          subtitle,
          weight: FontWeight.w400,
          lineHeight: 1.4,
          color: ConstColor.darkGrey,
        ),
      ],
    );
  }
}
