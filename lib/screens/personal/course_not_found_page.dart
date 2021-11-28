import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class CourseNotFound extends StatelessWidget {
  const CourseNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getUniqueWidth(15),
                    top: getUniqueHeight(60),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/arrow_back.svg",
                      height: getUniqueWidth(40),
                      width: getUniqueWidth(40),
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getUniqueHeight(16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(15.0),
              ),
              child: TextFieldMark(
                //onPressed: () {},
                hintText: "Cooking",
              ),
            ),
            SizedBox(
              height: getUniqueHeight(31),
            ),
            Container(
              child: const Image(
                image: AssetImage(
                  "assets/images/not_found.png",
                ),
              ),
            ),
            SizedBox(
              height: getUniqueHeight(32),
            ),
            const Text(
              "Course not found",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getUniqueHeight(8),
            ),
            Container(
              height: getUniqueHeight(42),
              width: getUniqueWidth(195),
              child: CustomTextWidget(
                "Try searching the course with a defferent keyword",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
