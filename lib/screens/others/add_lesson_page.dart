import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingLessonPage extends StatefulWidget {
  const AddingLessonPage({Key? key}) : super(key: key);

  @override
  _AddingLessonPageState createState() => _AddingLessonPageState();
}

class _AddingLessonPageState extends State<AddingLessonPage> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();
  String? _categoryId = '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
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
          _dropdownButton(),
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
              controller: _descriptionController,
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
            ElevatedButton(
                onPressed: _onAddButtonPressed,
                child: CustomTextWidget("Add Lesson"))
          ],
        ),
      );

  void _onAddButtonPressed() async {
    String id = _uuid.v4();
    String title = _titleController.text;
    int amount = 24;
    String description = _descriptionController.text;
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
      'subtitle',
      'categoryId',
      'authorId',
      imageUrl,
      180,
      32.0,
      DateTime.now(),
    );
    await _fireStore
        .collection('VideoLessonCourseList')
        .doc(id)
        .set(course.toMap())
        .whenComplete(() {
      Fluttertoast.showToast(msg: "Lesson was added");
      _titleController.clear();
      _descriptionController.clear();
      _imageController.clear();
    });
  }

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        hintText: hint,
      );

  DropdownButton<Category> _buildDropdownButton() {
    return DropdownButton<Category>(
      // value: _category,
      items: [
        _setDropDownMenuItem(Category("1", "Programming", "_imageUrl")),
        _setDropDownMenuItem(Category("2", "Design", "_imageUrl")),
        _setDropDownMenuItem(Category("3", "SMM", "_imageUrl")),
      ],
      onChanged: (v) {
        // _category = v;
      },
    );
  }

  DropdownMenuItem<Category> _setDropDownMenuItem(Category category) =>
      DropdownMenuItem(
        child: CustomTextWidget("Hello"),
        value: category,
        onTap: () {},
      );

  _dropdownButton() => FutureBuilder(
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
        .collection('VideoLessonCategories')
        .orderBy('timestamp')
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
