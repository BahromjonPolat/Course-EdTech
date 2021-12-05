import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';

class QuizPage extends StatefulWidget {
  List quizList;

  QuizPage(this.quizList, {Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List _quizList;

  late final int _lenOfList;

  @override
  void initState() {
    super.initState();
    _quizList = widget.quizList;
    _lenOfList = _quizList.length;
  }

  int _currentIndex = 0;
  int _pressedButtonIndex = -1;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setCustomAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(
        top: getUniqueHeight(32.0),
        // bottom: getUniqueHeight(40.0),
        left: getUniqueWidth(16.0),
        right: getUniqueWidth(16.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              "${_currentIndex + 1} of $_lenOfList",
              size: 16.0,
              color: ConstColor.kDarkGrey,
              weight: FontWeight.w400,
            ),
            SizedBox(height: getUniqueHeight(8.0)),
            CustomTextWidget(
              _quizList[_currentIndex]['question'],
              lineHeight: 1.4,
              size: 24.0,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getUniqueHeight(16.0)),
            Container(
              height: getUniqueHeight(191.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(16.0),
                vertical: getUniqueHeight(8.0),
              ),
              decoration: BoxDecoration(
                color: ConstColor.kOrangeAccentF8,
                borderRadius: _setBorderRadius(),
                border: _setBorder(),
              ),
              child: Image.asset(ImagePath.testQuestion),
            ),
            SizedBox(height: getUniqueHeight(16.0)),
            _setButton("A. ${_quizList[_currentIndex]['option'][0]}", 0),
            SizedBox(height: getUniqueHeight(16.0)),
            _setButton("B. ${_quizList[_currentIndex]['option'][1]}", 1),
            SizedBox(height: getUniqueHeight(16.0)),
            _setButton("C. ${_quizList[_currentIndex]['option'][2]}", 2),
            SizedBox(height: getUniqueHeight(27.0)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(17.0),
                vertical: getUniqueHeight(40.0),
              ),
              child: CustomElevatedButton(
                  onPressed: _onContinueButtonPressed, label: "Continue"),
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton _setButton(String option, index) => OutlinedButton(
        onPressed: () {
          setState(() {
            _pressedButtonIndex = index;
          });
        },
        child: CustomTextWidget(option),
        style: OutlinedButton.styleFrom(
          backgroundColor: _pressedButtonIndex == index
              ? ConstColor.kLightGrey
              : ConstColor.kTransparent,
          side: BorderSide(
            width: getUniqueWidth(_pressedButtonIndex == index ? 2.0 : 1.0),
            color: _pressedButtonIndex == index
                ? ConstColor.kOrangeE35
                : ConstColor.darkGrey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: _setBorderRadius(),
          ),
          alignment: Alignment.centerLeft,
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            getUniqueHeight(58.0),
          ),
        ),
      );

  void _onContinueButtonPressed() {
    if (_pressedButtonIndex == -1) {
      Fluttertoast.showToast(msg: "Please, choose one of options");
      return;
    }

    if (_quizList[_currentIndex]['answer'] ==
        _quizList[_currentIndex]['option'][_pressedButtonIndex]) {
      _counter++;
    }

    if (_currentIndex != _lenOfList - 1) {
      _currentIndex++;
      _pressedButtonIndex = -1;

    } else if (_currentIndex == _lenOfList - 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultPage(_counter, _lenOfList),
          ));
    }

    setState(() {});
  }

  Border _setBorder() => Border.all(width: 0.5, color: ConstColor.kDarkGrey);

  BorderRadius _setBorderRadius() => BorderRadius.circular(getUniqueWidth(8.0));
}
