import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';

class CourseMainPage extends StatefulWidget {
  Lesson lesson;
  String courseTitle;

  CourseMainPage(
    this.lesson, {
    Key? key,
    required this.courseTitle,
  }) : super(key: key);

  @override
  _CourseMainPageState createState() => _CourseMainPageState();
}

class _CourseMainPageState extends State<CourseMainPage> {
  late Lesson _lesson;
  late String _title;
  final LessonService _lessonService = LessonMethods();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _lesson = widget.lesson;
    _title = widget.courseTitle;
  }

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
          pages()[_currentIndex],
        ],
      ));

  // FutureBuilder<List<Lesson>> futureBuilder() {
  //   return FutureBuilder(
  //       future: _lessonService.getLessonById(_course.id),
  //       builder: (context, AsyncSnapshot<Lesson> snap) {
  //         if (snap.hasData) {
  //           Lesson lesson = snap.data!;
  //           return CustomScrollView(
  //             slivers: [
  //               _buildSliverAppBar(),
  //               _showHeader(),
  //               IntroductionPage(lesson),
  //             ],
  //           );
  //         } else if (snap.hasError) {
  //           return CustomTextWidget("Error");
  //         }
  //
  //         return const CupertinoActivityIndicator();
  //       },
  //     );
  // }

  SliverAppBar _buildSliverAppBar() => SliverAppBar(
        floating: true,
        backgroundColor: ConstColor.kWhite,
        elevation: 0.0,
        expandedHeight: getUniqueHeight(42.0),
        title: CustomTextWidget(
          _title,
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
              _lesson.title,
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
        _customTabButton("Lesson", CustomTabButton.leftBorder(), 0),
        SizedBox(width: getUniqueWidth(4.0)),
        _customTabButton("Tests", BorderRadius.circular(0.0), 1),
        SizedBox(width: getUniqueWidth(4.0)),
        _customTabButton("Discuss", CustomTabButton.rightBorder(), 2),
      ],
    );
  }

  _customTabButton(String label, BorderRadius borderRadius, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _changeIndex(index);
        },
        child: CustomTabButton(
          label: label,
          borderRadius: borderRadius,
          color: _currentIndex == index ? ConstColor.dark : ConstColor.darkGrey,
        ),
      ),
    );
  }

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages() => [
        IntroductionPage(_lesson),
        TestsPage(_lesson.courseId),
        const DiscussPage(),
      ];
}
