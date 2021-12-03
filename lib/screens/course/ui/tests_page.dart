import 'package:course/components/importing_packages.dart';
import 'package:course/services/cloud/quiz_service.dart';
import 'package:flutter/cupertino.dart';

class TestsPage extends StatefulWidget {
  String lessonId;

  TestsPage(this.lessonId, {Key? key}) : super(key: key);

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  late double _width;

  late BuildContext _context;

  final QuizService _service = QuizMethod();

  late List _quizList;

  late String _courseId;

  @override
  void initState() {
    super.initState();
    _courseId = widget.lessonId;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _width = MediaQuery.of(context).size.width;

    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(height: getUniqueHeight(16.0)),
        FutureBuilder(
            future: _getQuizList(),
            builder: (context, AsyncSnapshot<List<dynamic>> snap) {
              if (snap.hasData) {
                _quizList = snap.data!;
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      var quiz = snap.data![index];
                      return _setTestLayout(quiz, index);
                    });
              } else if (snap.hasError) {
                return const Text("Error");
              }

              return const CupertinoActivityIndicator();
            })
      ]),
    );
  }

  Container _setTestLayout(dynamic data, int index) => Container(
        height: getUniqueHeight(463.0),
        width: _width,
        margin: EdgeInsets.symmetric(vertical: getUniqueHeight(8.0)),
        padding: EdgeInsets.only(
          top: getUniqueHeight(24.0),
          bottom: getUniqueHeight(32.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getUniqueWidth(8.0)),
            border: Border.all(width: 1.0, color: ConstColor.kDarkGrey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.test,
              height: getUniqueHeight(197.0),
              width: _width,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: getUniqueHeight(16.0),
                  left: getUniqueWidth(24.0),
                  // bottom: getUniqueHeight(0.0),
                  right: getUniqueWidth(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      "Quiz ${index + 1}",
                      color: ConstColor.kOrangeE35,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: getUniqueHeight(4.0)),
                    CustomTextWidget(data['question'], size: 20.0),
                    SizedBox(height: getUniqueHeight(8.0)),
                    CustomTextWidget(
                      data['question'],
                      weight: FontWeight.w400,
                      color: ConstColor.kDarkGrey,
                      lineHeight: 1.4,
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                        onPressed: () {
                          _onBeginButtonPressed(_quizList);
                        },
                        label: "Begin"),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Future<List<dynamic>> _getQuizList() async {
    var snap = await FirebaseFirestore.instance
        .collection("EdTechQuizzes")
        .where('courseId', isEqualTo: _courseId)
        .get();

    return snap.docs;
  }

  void _onBeginButtonPressed(List list) {
    Navigator.push(_context, MaterialPageRoute(builder: (_) => QuizPage(list)));
  }

  final String _content =
      "Let’s put your memory on this topic test. Solve tasks and check your knowledge.";
}
