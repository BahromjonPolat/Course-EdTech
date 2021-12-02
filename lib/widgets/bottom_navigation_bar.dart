import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getUniqueWidth(16)),
          topRight: Radius.circular(getUniqueWidth(16)),
        ),
        border: Border.all(
          width: getUniqueWidth(1),
          color: ConstColor.kGreyBE,
        ),
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
