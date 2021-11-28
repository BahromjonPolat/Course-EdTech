import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/rendering.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(16)),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SEARCH FIELD SECTION
            SafeArea(
              child: Container(
                height: getUniqueHeight(56),
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.fromLTRB(
                  getUniqueWidth(0),
                  getUniqueHeight(30),
                  getUniqueWidth(0),
                  getUniqueHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      IconPath.out_back,
                      fit: BoxFit.none,
                      height: getUniqueWidth(48),
                    ),
                    Container(
                      width: getUniqueWidth(287),
                      padding: EdgeInsets.zero,
                      child: TextFieldMark(hintText: "Search course"),
                    ),
                  ],
                ),
              ),
            ),

            // RESULT TEXT SECTION
            Padding(
              padding: EdgeInsets.only(
                bottom: getUniqueHeight(32),
              ),
              child: Text(
                "2 Results",
                style: TextStyle(
                    fontSize: getUniqueWidth(24), fontWeight: FontWeight.w500),
              ),
            ),

            // FLEXIBLE SECTION
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CourseCard(
                    color: index % 2 == 0
                        ? ConstColor.kOrangeAccentF8
                        : ConstColor.kBlueAccentE6,
                    courseDescription: "Advanced mobile interface design",
                    image: "assets/images/course_ui.png",
                    addTime: "2 h 30 min",
                    title: "UI",
                    cost: "50",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
