import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
        bottom: getUniqueHeight(40.0),
        left: getUniqueWidth(16.0),
        right: getUniqueWidth(16.0),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            "1 of20",
            size: 16.0,
            color: ConstColor.kDarkGrey,
            weight: FontWeight.w400,
          ),
          SizedBox(height: getUniqueHeight(8.0)),
          CustomTextWidget(
            "Which tag for\n the biggest header?",
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
          _setButton(),
          SizedBox(height: getUniqueHeight(16.0)),
          _setButton(),
          SizedBox(height: getUniqueHeight(16.0)),
          _setButton(),
          SizedBox(height: getUniqueHeight(67.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(17.0)),
            child: CustomElevatedButton(onPressed: () {}, label: "Continue"),
          ),
        ],
      ),
    );
  }

  OutlinedButton _setButton() => OutlinedButton(
        onPressed: () {},
        child: CustomTextWidget("A. Hello"),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: _setBorderRadius(),
            side: const BorderSide(width: 1.0, color: ConstColor.kDarkGrey),
          ),
          alignment: Alignment.centerLeft,
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            getUniqueHeight(58.0),
          ),
        ),
      );

  Border _setBorder() => Border.all(width: 0.5, color: ConstColor.kDarkGrey);

  BorderRadius _setBorderRadius() => BorderRadius.circular(getUniqueWidth(8.0));
}
