import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedAndPage extends StatelessWidget {
  const SavedAndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(
            left: getUniqueWidth(16.0),
            top: getUniqueHeight(11.67),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/arrow_back.svg",
              height: getUniqueHeight(40),
              width: getUniqueWidth(40),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Saved",
          style: TextStyle(
            color: ConstColor.kBlack,
            fontFamily: "Rubik",
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
