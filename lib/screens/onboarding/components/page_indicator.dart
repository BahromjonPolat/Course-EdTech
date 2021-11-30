import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  int currentIndex;
  int length;

  PageIndicator(this.length, this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(length, (index) => _setPageIndicatorLayout(index)),
    );
  }

  _setPageIndicatorLayout(int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: getUniqueWidth(6.0)),
        height: getUniqueHeight(6.0),
        width: getUniqueHeight(currentIndex == index ? 16.0 : 6),
        decoration: BoxDecoration(
          color: currentIndex == index ? ConstColor.blue : ConstColor.nonActive,
          borderRadius: BorderRadius.circular(getUniqueWidth(4.0)),
        ),
      );
}
