class Intro {
  final String _image;
  final String _title;
  final String _subtitle;

  Intro(this._image, this._title, this._subtitle);

  String get subtitle => _subtitle;

  String get title => _title;

  String get image => _image;
}