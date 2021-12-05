import 'package:course/components/importing_packages.dart';

abstract class DiscussService {
  Future setDiscuss();

  Future<List<Discuss>> getDiscussList(String courseId);

}

class DiscussMethods extends DiscussService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Discuss>> getDiscussList(String courseId) async {
    QuerySnapshot snapshot = await _fireStore
        .collection('EdTechDiscusses')
        .orderBy('timestamp')
        .where('courseId', isEqualTo: courseId)
        .get();

    List<Discuss> discussList = snapshot.docs
        .map((e) => Discuss.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return discussList;
  }

  @override
  Future setDiscuss() {
    // TODO: implement setDiscuss
    throw UnimplementedError();
  }
}
