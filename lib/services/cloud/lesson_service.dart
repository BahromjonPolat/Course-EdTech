import 'package:course/components/importing_packages.dart';

abstract class LessonService {
  Future<List<Lesson>> getAllLessons();

  Future<List<Lesson>> getLessonById(String courseId);
}

class LessonMethods extends LessonService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Lesson>> getAllLessons() async {
    QuerySnapshot snapshot = await _fireStore.collection("EdTechLessons").get();
    List<Lesson> lessonList = snapshot.docs
        .map((e) => Lesson.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return lessonList;
  }

  @override
  Future<List<Lesson>> getLessonById(String courseId) async {
    QuerySnapshot snapshot = await _fireStore
        .collection("EdTechLessons")
        .where('courseId', isEqualTo: courseId)
        .get();
    List<Lesson> lesson = snapshot.docs
        .map((e) => Lesson.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return lesson;
  }
}
