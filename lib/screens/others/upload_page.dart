
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';

import 'add_course_page.dart';
import 'add_lesson_page.dart';
import 'add_quiz_page.dart';

class UploadingPage extends StatefulWidget {
  const UploadingPage({Key? key}) : super(key: key);

  @override
  _UploadingPageState createState() => _UploadingPageState();
}

class _UploadingPageState extends State<UploadingPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _getBodyList()[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: ConstColor.kTransparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: CustomTextWidget(
          _titles[_currentIndex],
          weight: FontWeight.w700,
          size: 21.0,
        ),
      );

  final List<String> _titles = ["Add Course", "Add Lesson", "Add Quiz"];

  List<Widget> _getBodyList() => [
        const AddingCourse(),
        const AddingLessonPage(),
        const AddingQuizPage(),
      ];

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      );
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: "Course",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.play_lesson),
      label: "Lesson",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.quiz),
      label: "Quiz",
    ),
  ];
}
