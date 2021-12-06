class Discuss {
  String? _id;
  String? _userId;
  String? _lessonId;
  String? _message;
  DateTime? _timestamp;

  Discuss(
    this._id,
    this._userId,
    this._lessonId,
    this._message,
    this._timestamp,
  );

  Discuss.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonId = json['lessonId'];
    _userId = json['userID'];
    _message = json['message'];
    _timestamp = json['timestamp'].toDate();
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'lessonId': _lessonId,
        'message': _message,
        'timestamp': _timestamp,
      };

  DateTime get timestamp => _timestamp!;

  String get message => _message!;

  String get lessonId => _lessonId!;

  String get userId => _userId!;

  String get id => _id!;
}
