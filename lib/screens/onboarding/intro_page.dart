import 'package:course/components/importing_packages.dart';
import 'package:course/screens/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  /// Body qismi
  Stack _buildBody() {
    return Stack(
      children: [
        _showPageView(),
        _showIndicator(),
        _showButton(),
      ],
    );
  }

  /// Pastdagi button
  Positioned _showButton() {
    return Positioned(
        bottom: getUniqueHeight(50.0),
        left: getUniqueWidth(32.0),
        right: getUniqueWidth(32.0),
        child: CustomElevatedButton(
          onPressed:
              _currentIndex != 2 ? _onNextButtonPressed : _onSkipButtonPressed,
          label: _currentIndex != 2 ? "Next" : "Let's start",
        ));
  }

  Positioned _showIndicator() {
    return Positioned(
      bottom: getUniqueHeight(178),
      left: 0.0,
      right: 0.0,
      child: PageIndicator(3, _currentIndex),
    );
  }

  PageView _showPageView() {
    return PageView(
      controller: _pageController,
      children: List.generate(introPageComponents.length, (index) {
        Intro intro = introPageComponents[index];
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: IntroPageCenterLayout(
            intro.image,
            intro.title,
            intro.subtitle,
          ),
        );
      }),
      onPageChanged: (i) {
        setState(() {
          _currentIndex = i;
        });
      },
    );
  }

  AppBar _buildAppBar() => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0.0,
        backgroundColor: ConstColor.kTransparent,
        actions: [
          TextButton(
            onPressed: _onSkipButtonPressed,
            child: CustomTextWidget("Skip"),
          ),
        ],
      );

  void _onNextButtonPressed() {
    setState(() {
      _currentIndex++;
      _pageController.jumpToPage(_currentIndex);
    });
  }

  void _onSkipButtonPressed() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (FirebaseAuth.instance.currentUser != null) {
      _goToOtherPage(HomePage());
      await _pref.setBool("isStarted", true);
    } else {
      _goToOtherPage(SignInPage());
      await _pref.setBool("isStarted", true);
    }
  }

  void _goToOtherPage(Widget pageName) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => pageName),
    );
  }
}
