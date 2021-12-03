import 'package:course/components/importing_packages.dart';

abstract class QuizService {
  Future<void> setNewQuiz(Quiz quiz);

  Future<List<Quiz>> getQuizList(String lessonId);
}

class QuizMethod extends QuizService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<void> setNewQuiz(Quiz quiz) async {
    await _fireStore.collection("EdTechQuizzes").doc(quiz.id).set(quiz.toMap());
  }

  @override
  Future<List<Quiz>> getQuizList(String lessonId) async {
    QuerySnapshot<Map<String, dynamic>> quizList = await _fireStore
        .collection("EdTechQuizzes")
        .where('courseId', isEqualTo: lessonId)
        .get();


    List<Quiz> quizzes =
        quizList.docs.map((e) => Quiz.fromJson(e.data())).toList();


    return quizzes;
  }
}
