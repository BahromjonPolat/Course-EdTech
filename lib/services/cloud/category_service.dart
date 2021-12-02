import 'package:course/components/importing_packages.dart';

abstract class CategoryService {
  Future<List<Category>> getAllCategories();
}

class CategoryMethod extends CategoryService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Category>> getAllCategories() async {
    QuerySnapshot snapshot =
        await _fireStore.collection("EdTechCategories").get();
    List<Category> categories = snapshot.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return categories;
  }
}
