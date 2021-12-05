import 'package:course/components/importing_packages.dart';

abstract class CloudStoreService {
  Future setUserData(UserModel userModel);

  Future<List<UserModel>> getAllUsers();

  Future<UserModel> getUserData(String uid);

  Future updateUser(Map<String, dynamic> map);
}

class CloudStoreMethods extends CloudStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final String _uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future setUserData(UserModel userModel) async {
    await _fireStore
        .collection("EdTechUsers")
        .doc(userModel.id)
        .set(userModel.toMap())
        .whenComplete(() {
      print("Ma'lumotlar joylandi");
    });
  }

  @override
  Future<UserModel> getUserData(String uid) async {
    DocumentSnapshot user = await _fireStore.doc("EdTechUsers/$uid").get();
    UserModel userModel =
        UserModel.fromJson(user.data() as Map<String, dynamic>);
    return userModel;
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot users = await _fireStore.collection("EdTechUsers").get();
    List<UserModel> allUsers = users.docs
        .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return allUsers;
  }

  @override
  Future updateUser(Map<String, dynamic> map) async {
    await _fireStore.doc("EdTechUsers/$_uid").update(map);
  }
}
