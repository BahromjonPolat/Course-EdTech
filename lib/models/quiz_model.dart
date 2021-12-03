class Quiz {
  String? _id;
  String? _courseId;
  String? _question;
  String? _answer;
  List<String>? _options;


  Quiz(this._id, this._courseId, this._question, this._answer, this._options);

  Quiz.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _courseId = json['courseId'];
    _courseId = json['_question'];
    _answer = json['answer'];
    _options = json['options'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'question': _question,
        'answer': _answer,
        'option': _options,
        'courseId': _courseId,
      };

  String get id => _id!;

  String get question => _question!;

  List<String> get options => _options!;

  String get answer => _answer!;

  String get courseId => _courseId!;
}
