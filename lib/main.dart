import 'package:course/components/const.dart';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Ed Tech',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        primaryColor: ConstColor.kOrangeE35
      ),
      home: HomePage(),
    );
  }
}
