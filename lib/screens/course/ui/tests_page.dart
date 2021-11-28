import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestsPage extends StatelessWidget {
  TestsPage({Key? key}) : super(key: key);

  late double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(height: getUniqueHeight(16.0)),
        _setTestLayout(),
        _setTestLayout(),
        _setTestLayout(),
      ]),
    );
  }

  Container _setTestLayout() => Container(
        height: getUniqueHeight(463.0),
        width: _width,
        margin: EdgeInsets.symmetric(vertical: getUniqueHeight(8.0)),
        padding: EdgeInsets.only(
          top: getUniqueHeight(24.0),
          bottom: getUniqueHeight(32.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getUniqueWidth(8.0)),
            border: Border.all(width: 1.0, color: ConstColor.kDarkGrey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.test,
              height: getUniqueHeight(197.0),
              width: _width,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: getUniqueHeight(16.0),
                  left: getUniqueWidth(24.0),
                  // bottom: getUniqueHeight(0.0),
                  right: getUniqueWidth(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      "Quiz 1",
                      color: ConstColor.kOrangeE35,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: getUniqueHeight(4.0)),
                    CustomTextWidget("Tags For Headers", size: 20.0),
                    SizedBox(height: getUniqueHeight(8.0)),
                    CustomTextWidget(
                      _content,
                      weight: FontWeight.w400,
                      color: ConstColor.kDarkGrey,
                      lineHeight: 1.4,
                    ),
                    const Spacer(),
                    CustomElevatedButton(onPressed: (){}, label: "Begin"),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  final String _content =
      "Let’s put your memory on this topic test. Solve tasks and check your knowledge.";
}
