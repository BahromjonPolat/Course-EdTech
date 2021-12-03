class Lesson {
  String? _id;
  String? _title;
  String? _content;
  String? _courseId;
  String? _imageUrl;
  DateTime? _timestamp;

  Lesson(
    this._id,
    this._title,
    this._content,
    this._courseId,
    this._imageUrl,
    this._timestamp,
  );

  Lesson.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _courseId = json['courseId'];
    _imageUrl = json['imageUrl'];
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'content': _content,
        'courseId': _courseId,
        'imageUrl': _imageUrl,
        'timestamp': _timestamp,
      };

  String get imageUrl => _imageUrl!;

  String get courseId => _courseId!;

  String get content => _content!;

  String get title => _title!;

  String get id => _id!;

  DateTime get timestamp => _timestamp!;
}
