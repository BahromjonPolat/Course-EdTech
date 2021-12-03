import 'package:course/components/importing_packages.dart';
import 'package:course/services/cloud/lesson_service.dart';
import 'package:flutter/cupertino.dart';

class IntroductionPage extends StatelessWidget {
  Lesson lesson;
  IntroductionPage(this.lesson, {Key? key}) : super(key: key);

  late double _width;
  final LessonService _lessonService = LessonMethods();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: FutureBuilder(
        future: _lessonService.getLessonById(""),
        builder: (context, snap) {
        if (snap.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getUniqueHeight(24.0)),
              _showVideo(),
              SizedBox(height: getUniqueHeight(24.0)),
              CustomTextWidget("Introduction", size: 20.0),
              SizedBox(height: getUniqueHeight(4.0)),
              CustomTextWidget(
                lesson.content,
                weight: FontWeight.w400,
                color: ConstColor.kDarkGrey,
                lineHeight: 1.4,
              )
            ],
          );
        }
        if (snap.hasError) {
          return CustomTextWidget("Error");
        }
        return const CupertinoActivityIndicator();
      },)
    );
  }

  _showVideo() => Container(
        height: getUniqueHeight(194.0),
        width: _width,
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(getUniqueWidth(8.0)),
        decoration: BoxDecoration(
            color: ConstColor.kBlueAccentE6,
            borderRadius: BorderRadius.circular(getUniqueWidth(8.0)),
            image: const DecorationImage(
              image: AssetImage(ImagePath.courseHtml),
            )),
        child: CustomIconButton(
          svgIcon: IconPath.play,
          onPressed: () {},
          size: 48.0,
        ),
      );

  final String _content = """You can launch a new career in web develop-
ment today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, 
a lot of determination, and a teacher you trust.
Once the form data has been validated on the client-side, it is okay to submit the form. And, since we covered validation in the previous article, we're ready to submit! This article looks at what happens when a user submits a form — where does the data go, and how do we handle it when it gets there? We also look at some of the security concerns.
""";
}
