class Category {
  String? _id;
  String? _name;
  String? _imageUrl;

  Category(
    this._id,
    this._name,
    this._imageUrl,
  );

  Category.fromJson(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _imageUrl = map['imageUrl'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'imageUrl': _imageUrl,
        'name': _name,
      };

  String get imageUrl => _imageUrl!;

  String get name => _name!;

  String get id => _id!;
}
