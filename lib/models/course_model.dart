class Course {
  String? _id;
  String? _title;
  String? _subtitle;
  String? _imageUrl;
  int? _duration;
  double? _price;


  Course.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _imageUrl = json['imageUrl'];
    _duration = json['duration'];
    _price = json['price'];
  }

  Map<String, dynamic> toMap() => {
    'id': _id,
    'title': _title,
    'subtitle': _subtitle,
    'imageUrl': _imageUrl,
    'duration': _duration,
    'price': _price,
  };

  String get id => _id!;

  String get title => _title!;

  double get price => _price!;

  int get duration => _duration!;

  String get imageUrl => _imageUrl!;

  String get subtitle => _subtitle!;
}