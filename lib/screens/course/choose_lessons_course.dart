import 'package:course/components/importing_packages.dart';

class ChooseLessonsCoursePage extends StatelessWidget {
  const ChooseLessonsCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          getUniqueWidth(16.0),
          getUniqueHeight(20.0),
          getUniqueWidth(16.0),
          getUniqueWidth(0.0),
        ),
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
                    height: getUniqueWidth(40.0),
                  ),
                  const TitleText("HTML", textAlign: TextAlign.center),
                  const SizedBox(width: 40.0),
                ],
              ),
            ),

            SizedBox(height: getUniqueHeight(16.0)),

            // COURSE LIST SECTION
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return index == 0
                      ?
                      // MAIN CARD SECTION
                      const MainCardMark(
                          image: ImagePath.courseHtml,
                          title: "HTML",
                          description: "Advanced web applications",
                        )
                      : // SMALL CARD SECTION
                      SmallCardMark(
                          image: ImagePath.courseHtml,
                          title: "HTML",
                          description: "Advanced web applications",
                        margin: EdgeInsets.only(bottom: getUniqueHeight(16)),
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
