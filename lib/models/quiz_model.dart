class Quiz {
  String? _id;
  String? _courseId;
  String? _question;
  String? _answer;
  List<String>? _option;


  Quiz(this._id, this._courseId, this._question, this._answer, this._option);

  Quiz.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _courseId = json['courseId'];
    _courseId = json['question'];
    _answer = json['answer'];
    _option = json['option'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'question': _question,
        'answer': _answer,
        'option': _option,
        'courseId': _courseId,
      };

  String get id => _id!;

  String get question => _question!;

  List<String> get option => _option!;

  String get answer => _answer!;

  String get courseId => _courseId!;
}
