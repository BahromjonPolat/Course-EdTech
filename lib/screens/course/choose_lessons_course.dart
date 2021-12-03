import 'package:course/components/importing_packages.dart';
import 'package:course/services/cloud/lesson_service.dart';
import 'package:flutter/cupertino.dart';

class ChooseLessonsCoursePage extends StatelessWidget {
  Course course;

  ChooseLessonsCoursePage(this.course, {Key? key}) : super(key: key);
  
  final LessonService _lessonService = LessonMethods();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: FutureBuilder(
      future: _lessonService.getLessonById(course.id),
      builder: (context,AsyncSnapshot<List<Lesson>> snap) {
        if (snap.hasData) {
          return Container(
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
                      TitleText(course.title, textAlign: TextAlign.center),
                      const SizedBox(width: 40.0),
                    ],
                  ),
                ),

                SizedBox(height: getUniqueHeight(16.0)),

                // COURSE LIST SECTION
                Flexible(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snap.data!.length + 1,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      Lesson lesson;
                      if (index != 0) {
                         lesson = snap.data![index -1];
                      } else {
                         lesson = snap.data![index];
                      }
                      return index == 0
                          ?
                          // MAIN CARD SECTION
                          MainCardMark(
                              image: ImagePath.courseHtml,
                              title: course.title,
                              description: course.subtitle,
                            )
                          : // SMALL CARD SECTION
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>  CourseMainPage(lesson)));
                            },
                            child: SmallCardMark(
                                image: ImagePath.courseHtml,
                                title: lesson.title,
                                description: "Advanced web applications",
                                margin:
                                    EdgeInsets.only(bottom: getUniqueHeight(16)),
                              
                              ),
                          );
                    },
                  ),
                )
              ],
            ),
          );
        } else if (snap.hasError) {
          return CustomTextWidget("Error");
        }
        return const CupertinoActivityIndicator();
      },
    ));
  }
}
