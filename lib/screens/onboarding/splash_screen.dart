import 'dart:async';

import 'package:course/components/image_path.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

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
            Image.asset(
              ImagePath.splash,
              height: getUniqueHeight(264.0),
              width: MediaQuery.of(context).size.width,
            ),
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

  void _goToPage() {
    if (FirebaseAuth.instance.currentUser != null) {
      _setNavigator(const HomePage());
    }
  }

  void _setNavigator(Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
