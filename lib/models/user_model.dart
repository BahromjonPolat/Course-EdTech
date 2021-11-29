class UserModel {
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _imageUrl;


  UserModel(this._id, this._name, this._email, this._password, this._imageUrl);

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

  String get imageUrl => _imageUrl!;

  String get password => _password!;

  String get email => _email!;

  String get name => _name!;

  String get id => _id!;
}
