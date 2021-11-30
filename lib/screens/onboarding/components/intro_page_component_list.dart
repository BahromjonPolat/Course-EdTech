import 'package:course/components/image_path.dart';
import 'package:course/models/intro_model.dart';

const String _subtitle =
    "Quarantine is the perfect time to spend your \nday learning something new, from anywhere!";
List<Intro> _components = [
  Intro(
    ImagePath.intro1,
    "Learn anytime and anywhere",
    _subtitle,
  ),
  Intro(
    ImagePath.intro2,
    "Find a course for you",
    _subtitle,
  ),
  Intro(
    ImagePath.intro3,
    "Improve your skills",
    _subtitle,
  ),
];

List<Intro> get introPageComponents => _components;
