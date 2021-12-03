class Course {
  String? _id;
  String? _title;
  String? _subtitle;
  String? _categoryId;
  String? _about;
  String? _authorId;
  String? _imageUrl;
  int? _duration;
  double? _price;
  DateTime? _timestamp;

  Course(
    this._id,
    this._title,
    this._subtitle,
    this._about,
    this._categoryId,
    this._authorId,
    this._imageUrl,
    this._duration,
    this._price,
    this._timestamp,
  );

  Course.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _imageUrl = json['imageUrl'];
    _duration = json['duration'];
    _price = json['price'];
    _timestamp = json['timestamp'].toDate();
    _categoryId = json['categoryId'];
    _authorId = json['authorId'];
    _about = json['about'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'subtitle': _subtitle,
        'imageUrl': _imageUrl,
        'duration': _duration,
        'price': _price,
        'timestamp': _timestamp,
        'authorId': _authorId,
        'categoryId': _categoryId,
        'about': _about,
      };

  String get id => _id!;

  String get title => _title!;

  double get price => _price!;

  int get duration => _duration!;

  String get imageUrl => _imageUrl!;

  String get subtitle => _subtitle!;

  DateTime get timestamp => _timestamp!;

  String get categoryId => _categoryId!;

  String get authorId => _authorId!;

  String get about => _about!;
}
