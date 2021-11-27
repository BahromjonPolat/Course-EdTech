import 'package:course/components/const.dart';
import 'package:course/components/icon_path.dart';
import 'package:course/components/image_path.dart';
import 'package:course/components/importing_packages.dart';
import 'package:course/widgets/buttons/icon_button.dart';
import 'package:course/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: _buildScrollableBody(),
    );
  }

  CustomScrollView _buildScrollableBody() => CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
        ],
      );

  SliverAppBar _buildSliverAppBar() => SliverAppBar(
        backgroundColor: ConstColor.blue,
        elevation: 0.0,
        title: CustomTextWidget("HTML", size: getUniqueWidth(24.0)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        expandedHeight: getUniqueHeight(227.0),
        leading: CustomIconButton(
          onPressed: () {},
          svgIcon: IconPath.out_back, //
        ),
        bottom: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, getUniqueHeight(117.0)),
          child: Column(
            children: [
              CustomTextWidget(
                "Tags For Headers",
                size: 24.0,
                fontFamily: "Inter",
              ),
              SizedBox(height: getUniqueHeight(8.0)),
              CustomTextWidget(
                "3 of 11 lessons",
                weight: FontWeight.w400,
                color: ConstColor.darkGrey,
                fontFamily: "inter",
              ),

            ],
          ),
        ),
      );
}
