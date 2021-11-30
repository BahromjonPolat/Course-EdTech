import 'package:course/screens/auth/profile_page.dart';
import 'package:course/screens/auth/sign_in_page.dart';
import 'package:course/screens/auth/sign_up_page.dart';
import 'package:course/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ConstColor.kTransparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Ed Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ConstColor.kOrangeE35,
        fontFamily: "Rubik"
      ),
      home:  SplashScreenPage(),
    );
  }
}