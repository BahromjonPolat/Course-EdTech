import 'package:course/components/importing_packages.dart';

abstract class AuthService {
  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<String> currentUser();

  Future<void> signOut();
}

class AuthMethods extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    UserCredential _credential = await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .whenComplete(() async {
      UserModel userModel = UserModel(
        _auth.currentUser!.uid,
        name,
        email,
        password,
        "default",
      );
      CloudStoreService service = CloudStoreMethods();
      await service.setUserData(userModel);
    });
    User user = _credential.user!;
    return user;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential _credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = _credential.user!;
    return user;
  }

  @override
  Future<String> currentUser() async {
    User user = _auth.currentUser!;
    if (user != null) {
      return user.uid;
    } else {
      return 'null';
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
