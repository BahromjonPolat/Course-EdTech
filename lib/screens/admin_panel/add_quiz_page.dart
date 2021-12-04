import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';

class AddingQuizPage extends StatefulWidget {
  const AddingQuizPage({Key? key}) : super(key: key);

  @override
  _AddingQuizPageState createState() => _AddingQuizPageState();
}

class _AddingQuizPageState extends State<AddingQuizPage> {
  final _uuid = const Uuid();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _optionOne = TextEditingController();
  final TextEditingController _optionTwo = TextEditingController();
  final TextEditingController _optionThree = TextEditingController();

  String? _currentId = '';

  @override
  Widget build(BuildContext context) {
    // print(_courseId);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showCourses(),
            TextField(
              controller: _questionController,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Question"),
            ),
            const SizedBox(height: 6.0),
            TextField(
              controller: _answerController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Answer"),
            ),
            const SizedBox(height: 12.0),
            CustomTextWidget("Options", weight: FontWeight.w600, size: 18.0),
            const SizedBox(height: 12.0),
            TextField(
              controller: _optionOne,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Option 1"),
            ),
            const SizedBox(height: 6.0),
            TextField(
              controller: _optionTwo,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Option 2"),
            ),
            const SizedBox(height: 6.0),
            TextField(
              controller: _optionThree,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Option 3"),
            ),
            const SizedBox(height: 24.0),
            CustomElevatedButton(
                onPressed: _onAddButtonPressed, label: "Add Quiz"),
          ],
        ),
      ),
    );
  }

  SizedBox _showCourses() => SizedBox(
        height: 36.0,
        child: FutureBuilder(
          future: _getCourseList(),
          builder: (context, AsyncSnapshot<List<Course>> snap) {
            if (snap.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    Course lesson = snap.data![index];
                    return CustomTextButton(
                      color: _currentId == lesson.id
                          ? ConstColor.kOrangeE35
                          : ConstColor.darkGrey,
                      onPressed: () {
                        setState(() {
                          _currentId = lesson.id;
                        });
                      },
                      label: lesson.title,
                    );
                  });
            }
            if (snap.hasError) {
              return CustomTextWidget("Error");
            }

            return const CupertinoActivityIndicator();
          },
        ),
      );

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        hintText: hint,
        border: _setBorder(),
      );

  OutlineInputBorder _setBorder() => OutlineInputBorder();

  void _onAddButtonPressed() async {
    String id = _uuid.v4();
    String question = _questionController.text;
    String answer = _answerController.text.trim();
    String o1 = _optionOne.text.trim();
    String o2 = _optionTwo.text.trim();
    String o3 = _optionThree.text.trim();

    if (_currentId!.isEmpty ||
        question.isEmpty ||
        answer.isEmpty ||
        o1.isEmpty ||
        o2.isEmpty ||
        o3.isEmpty) {
      Fluttertoast.showToast(msg: "Please, fill all fields");
      return;
    }
    Quiz quiz = Quiz(id, _currentId, question, answer, [o1, o2, o3]);

    await _fireStore
        .collection("EdTechQuizzes")
        .doc(id)
        .set(quiz.toMap())
        .whenComplete(() {
      Fluttertoast.showToast(msg: "Added");

      _currentId = "";
      _answerController.clear();
      _optionThree.clear();
      _optionTwo.clear();
      _optionOne.clear();
      _questionController.clear();
    });
  }

  Future<List<Course>> _getCourseList() async {
    QuerySnapshot categories =
        await FirebaseFirestore.instance.collection('EdTechCourses').get();

    return categories.docs
        .map((e) => Course.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
