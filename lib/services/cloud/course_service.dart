import 'package:course/components/importing_packages.dart';

abstract class CourseService {
  Future<void> setNewCourse(Course course);

  Future<List<Course>> getAllCourses();
}

class CourseMethod extends CourseService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future setNewCourse(Course course) async {
    await _fireStore
        .collection("EdTechCourses")
        .doc(course.id)
        .set(course.toMap())
        .whenComplete(() {});
  }

  @override
  Future<List<Course>> getAllCourses() async {
    QuerySnapshot<Map<String, dynamic>> courses =
        await _fireStore.collection("EdTechCourses").orderBy('timestamp').get();
    return courses.docs.map((e) => Course.fromJson(e.data())).toList();
  }
}
