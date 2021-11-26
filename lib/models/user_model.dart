
class UserModel {
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _imageUrl;


  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toMap() => {
    'id': _id,
    'name': _name,
    'email': _email,
    'password': _password,
    'imageUrl': _imageUrl,
  };
}

