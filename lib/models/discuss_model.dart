class Discuss {
  String? _id;
  String? _userId;
  String? _courseId;
  String? _message;
  DateTime? _timestamp;

  Discuss(
    this._id,
    this._userId,
    this._courseId,
    this._message,
    this._timestamp,
  );

  Discuss.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _courseId = json['courseId'];
    _userId = json['userID'];
    _message = json['message'];
    _timestamp = json['timestamp'].toDate();
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'courseId': _courseId,
        'message': _message,
        'timestamp': _timestamp,
      };

  DateTime get timestamp => _timestamp!;

  String get message => _message!;

  String get courseId => _courseId!;

  String get userId => _userId!;

  String get id => _id!;
}
