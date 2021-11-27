import 'package:course/components/importing_packages.dart';
import 'package:course/screens/course/components/tab_button.dart';
import 'package:course/screens/course/ui/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseMainPage extends StatefulWidget {
  const CourseMainPage({Key? key}) : super(key: key);

  @override
  _CourseMainPageState createState() => _CourseMainPageState();
}

class _CourseMainPageState extends State<CourseMainPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      body: _buildScrollableBody(),
    );
  }

  Padding _buildScrollableBody() => Padding(
        padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(16.0)),
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            _showHeader(),
            IntroductionPage(),
          ],
        ),
      );

  SliverAppBar _buildSliverAppBar() => SliverAppBar(
        backgroundColor: ConstColor.kTransparent,
        elevation: 0.0,
        expandedHeight: getUniqueHeight(42.0),
        title: CustomTextWidget(
          "HTML",
          size: getUniqueWidth(24.0),
          color: ConstColor.kDark,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        leading: CustomIconButton(
          onPressed: () {},
          svgIcon: IconPath.out_back,
          size: 40,
        ),
      );

  SliverToBoxAdapter _showHeader() => SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(height: getUniqueHeight(32.0)),
            CustomTextWidget(
              "Tags For Headers",
              size: getUniqueWidth(24.0),
              fontFamily: "Inter",
            ),
            SizedBox(height: getUniqueHeight(8.0)),
            CustomTextWidget(
              "3 of 11 lesson",
              weight: FontWeight.w400,
              fontFamily: "Inter",
            ),
            SizedBox(height: getUniqueHeight(8.0)),
            _showButtons()
          ],
        ),
      );

  Row _showButtons() {
    return Row(
            children: [
              CustomTabButton(
                label: "Lesson",
                onPressed: () {},
                borderRadius: CustomTabButton.leftBorder(),
                color: ConstColor.kDark,
              ),
              SizedBox(width: getUniqueWidth(4.0)),
              CustomTabButton(label: "Tests", onPressed: () {}),
              SizedBox(width: getUniqueWidth(4.0)),
              CustomTabButton(
                label: "Discuss",
                onPressed: () {},
                borderRadius: CustomTabButton.rightBorder(),
              ),
            ],
          );
  }
}
