import 'package:course/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
