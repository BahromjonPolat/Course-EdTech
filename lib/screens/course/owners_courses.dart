import 'package:course/components/importing_packages.dart';

class OwnersCoursesPage extends StatelessWidget {
  const OwnersCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          getUniqueWidth(16),
          getUniqueHeight(20),
          getUniqueWidth(16),
          getUniqueHeight(0),
        ),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // COURSE TITLE SECTION
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconPath.out_back,
                    fit: BoxFit.scaleDown,
                    height: getUniqueWidth(40),
                  ),
                  const TitleText("Your Courses", textAlign: TextAlign.center),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            SizedBox(height: getUniqueHeight(16)),

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
                    onPressed: (){},
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
