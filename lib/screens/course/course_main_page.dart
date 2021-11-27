import 'package:flutter/material.dart';

class CourseMainPage extends StatefulWidget {
  const CourseMainPage({Key? key}) : super(key: key);

  @override
  _CourseMainPageState createState() => _CourseMainPageState();
}

class _CourseMainPageState extends State<CourseMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollableBody(),
    );
  }

  CustomScrollView _buildScrollableBody() => CustomScrollView(
    slivers: [
      
    ],
  );
}
