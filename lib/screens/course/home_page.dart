import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: bodyList[currentIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  List<Widget> bodyList = [
    HomeScreen(),
    ProfilePage(),
    SettingsPage()
  ];
  Widget buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getUniqueWidth(16)),
          topRight: Radius.circular(getUniqueWidth(16)),
        ),
        border: Border.all(width: 1, color: ConstColor.kGreyBE),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getUniqueWidth(15)),
          topRight: Radius.circular(getUniqueWidth(15)),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (v) => setState(() => currentIndex = v),
          unselectedItemColor: ConstColor.kGreyBE,
          selectedItemColor: ConstColor.kOrangeE35,
          // unselectedLabelStyle: ,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                  child: SvgPicture.asset(
                    IconPath.courses,
                    color: currentIndex == 0
                        ? ConstColor.kOrangeE35
                        : ConstColor.kGreyBE,
                  ),
                ),
                label: "Courses"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                  child: SvgPicture.asset(
                    IconPath.profile,
                    color: currentIndex == 1
                        ? ConstColor.kOrangeE35
                        : ConstColor.kGreyBE,
                  ),
                ),
                label: "Profile"),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                    top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                child: SvgPicture.asset(
                  IconPath.settings,
                  color: currentIndex == 2
                      ? ConstColor.kOrangeE35
                      : ConstColor.kGreyBE,
                ),
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
