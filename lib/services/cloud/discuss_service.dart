import 'package:course/components/importing_packages.dart';

abstract class DiscussService {
  Future setDiscuss(Discuss discuss);

  Future<List<Discuss>> getDiscussList(String lessonId);
}

class DiscussMethods extends DiscussService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Discuss>> getDiscussList(String lessonId) async {
    QuerySnapshot snapshot = await _fireStore
        .collection('EdTechDiscusses')
        .orderBy('timestamp')
        .where('courseId', isEqualTo: lessonId)
        .get();

    List<Discuss> discussList = snapshot.docs
        .map((e) => Discuss.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return discussList;
  }

  @override
  Future setDiscuss(Discuss discuss) async {
    await _fireStore
        .collection("EdTechDiscusses")
        .doc(discuss.id)
        .set(discuss.toMap());
  }
}
