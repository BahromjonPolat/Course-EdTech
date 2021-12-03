import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingCourse extends StatefulWidget {
  const AddingCourse({Key? key}) : super(key: key);

  @override
  _AddingCourseState createState() => _AddingCourseState();
}

class _AddingCourseState extends State<AddingCourse> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();
  String? _categoryId = '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _percentController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  // String _categoryName = "Item";

  // @override
  // void initState() {
  //   super.initState();
  //   _getCategories().then((value) {
  //     _category = value[0];
  //     setState(() {
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _showCategories(),
          _setLessonInfoFields(),

          // _buildDropdownButton()
        ],
      ),
    );
  }

  _setLessonInfoFields() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Title"),
            ),
             TextField(
              controller: _subtitleController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Subtitle"),
            ),

            TextField(
              controller: _aboutController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Description"),
            ),
            TextField(
              controller: _imageController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              // textCapitalization: TextCapitalization.sentences,
              decoration: _setInputDecoration("Image url"),
            ),
            SizedBox(height: getUniqueHeight(12.0)),
            CustomElevatedButton(onPressed: _onAddButtonPressed, label: "Add Course")
          ],
        ),
      );

  void _onAddButtonPressed() async {
    String id = _uuid.v4();
    String title = _titleController.text;
    String subtitle = _subtitleController.text;
    int amount = 24;
    String description = _aboutController.text;
    String imageUrl = _imageController.text;
    double percent = 97;
    double price = 300;

    if (title.isEmpty || description.isEmpty || imageUrl.isEmpty) {
      Fluttertoast.showToast(msg: "Plesae, fill all fields");
      return;
    }

    Course course = Course(
      id,
      title,
      subtitle,
      description,
      'categoryId',
      'authorId',
      imageUrl,
      180,
      32.0,
      DateTime.now(),
    );
    await _fireStore
        .collection('EdTechCourses')
        .doc(id)
        .set(course.toMap())
        .whenComplete(() {
      Fluttertoast.showToast(msg: "Course was added");
      _titleController.clear();
      _aboutController.clear();
      _subtitleController.clear();
      _imageController.clear();
    });
  }

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        hintText: hint,
      );

  

  _showCategories() => FutureBuilder(
      future: _getCategories(),
      builder: (context, AsyncSnapshot<List<Category>> snap) {
        if (snap.hasData) {
          // _category = snap.data![0];
          return Row(
            children: List.generate(snap.data!.length, (index) {
              Category category = snap.data![index];
              return TextButton(
                  style: TextButton.styleFrom(
                    primary: _categoryId == category.id
                        ? ConstColor.darkGrey
                        : ConstColor.kOrangeE35,
                    // side: BorderSide()
                  ),
                  onPressed: () {
                    setState(() {
                      _categoryId = category.id;
                    });
                  },
                  child: Text(category.name));
            }),
          );
        } else if (snap.hasError) {
          return Center(child: CustomTextWidget("Error"));
        }

        return const Center(child: CupertinoActivityIndicator(radius: 24.0));
      });

  Future<List<Category>> _getCategories() async {
    QuerySnapshot categories = await _fireStore
        .collection('EdTechCategories')
        .get();

    return categories.docs
        .map((e) => Category.fromJson({
              'id': e['id'],
              'name': e['name'],
              'imageUrl': e['imageUrl'],
            }))
        .toList();
  }
}
