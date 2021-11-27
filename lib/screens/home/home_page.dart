import 'package:course/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Column(children: [

        // HEADER SECTION
        SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(getUniqueWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, fsfs",
                      style: TextStyle(
                          fontSize: getUniqueWidth(16), fontWeight: FontWeight.w400),
                    ),
                     SizedBox(height: getUniqueHeight(16)),
                     Text(
                      "Juana Antonietta",
                      style: TextStyle(
                          fontSize: getUniqueWidth(32), fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                //Container(width: getUniqueWidth(48),  height: getUniqueHeight(48),color: Colors.grey,)
                SvgPicture.asset('assets/icons/outlined_notification.svg', height: getUniqueWidth(48)),
              ],
            ),
          ),
        ),
        //SEARCH FIELD
        Padding(
          padding: EdgeInsets.all(16),
        )
      ],),
    );
  }
}
