import 'dart:async';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _goToPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(ImagePath.splash),
            SizedBox(height: getUniqueHeight(16.0)),
            CustomTextWidget(
              "CodeFactory",
              size: 40.0,
              weight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }

  void _goToPage() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    bool isStarted = _pref.getBool("isStarted") ?? false;
    if (!isStarted) {
      _setNavigator(const IntroPage());
    } else if (FirebaseAuth.instance.currentUser == null) {
      _setNavigator(const SignInPage());
    } else {
      _setNavigator(const HomePage());
    }
  }

  void _setNavigator(Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
