import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingLessonPage extends StatefulWidget {
  const AddingLessonPage({Key? key}) : super(key: key);

  @override
  _AddingLessonPageState createState() => _AddingLessonPageState();
}

class _AddingLessonPageState extends State<AddingLessonPage> {
  final Uuid _uuid = const Uuid();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String _currentId = "";

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  SingleChildScrollView _buildBody() => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(16.0)),
          child: Column(
            children: [
              _showCourses(),
              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: _setInputDecoration("Title"),
              ),
              TextFormField(
                controller: _contentController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: 10,
                textCapitalization: TextCapitalization.sentences,
                decoration: _setInputDecoration("Content"),
              ),

              const SizedBox(height: 24.0),
              CustomElevatedButton(onPressed: _onAddButtonPressed, label: "Add Lesson")
            ],
          ),
        ),
      );

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        hintText: hint,
      );

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

  Future<List<Course>> _getCourseList() async {
    QuerySnapshot categories =
        await FirebaseFirestore.instance.collection('EdTechCourses').get();

    return categories.docs
        .map((e) => Course.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  void _onAddButtonPressed() async {
    String id = _uuid.v4();
    String title = _titleController.text.trim();
    String content = _contentController.text;

    if (_currentId.isEmpty || title.isEmpty || content.isEmpty) {
      Fluttertoast.showToast(msg: "Please, fill all fields");
      return;
    }

    Lesson lesson = Lesson(
      id,
      title,
      content,
      _currentId,
      'scrum',
      DateTime.now(),
    );

    FirebaseFirestore.instance
        .collection("EdTechLessons")
        .doc(id)
        .set(lesson.toMap())
        .whenComplete(() {
          Fluttertoast.showToast(msg: "Lesson was added");
          _currentId = "";
          _titleController.clear();
          _contentController.clear();
    });
  }
}
