class Quiz {
  String? _id;
  String? _lessonId;
  String? _question;
  String? _answer;
  List<String>? _options;


  Quiz(this._id, this._lessonId, this._question, this._answer, this._options);

  Quiz.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonId = json['lessonId'];
    _lessonId = json['_question'];
    _answer = json['answer'];
    _options = json['options'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'question': _question,
        'answer': _answer,
        'option': _options,
        'lessonId': _lessonId,
      };

  String get id => _id!;

  String get question => _question!;

  List<String> get options => _options!;

  String get answer => _answer!;

  String get lessonId => _lessonId!;
}
