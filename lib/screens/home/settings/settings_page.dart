import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String userEmail = "";
  bool switchvalue = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      appBar: AppBar(
        backgroundColor: ConstColor.kWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.rubik(
              fontSize: getUniqueWidth(24.0),
              fontWeight: FontWeight.w500,
              color: ConstColor.dark),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getUniqueWidth(17)),
          child: InkWell(
            child: SvgPicture.asset(IconPath.out_back),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getUniqueWidth(16.0),
                bottom: getUniqueHeight(8.0),
                top: getUniqueHeight(24.0),
                right: getUniqueWidth(16.0),
              ),
              child: Image.asset(
                ImagePath.setting,
                height: getUniqueHeight(190.0),
                width: getUniqueWidth(343.0),
              ),
            ),
            buttonMethod(
                "Notifications", IconPath.circleNotification, true, ""),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(16.0),
                vertical: getUniqueWidth(8.0),
              ),
              child: Text(
                "Account information",
                style: GoogleFonts.rubik(
                    fontSize: getUniqueHeight(20),
                    fontWeight: FontWeight.w500,
                    color: ConstColor.dark),
              ),
            ),
            buttonMethod(
                "Name", IconPath.circleAccount, false, "Juana Antonieta"),
            // UserEmailni o'rniga  firebasedagi nameni ulash kerak
            buttonMethod(
                "Email", IconPath.circleMail, false, "juanita123@gmail.com"),
            // UserEmailni o'rniga  firebasedagi emailni ulash kerak
            buttonMethod("Password", IconPath.circlePassword, false,
                "changed 2 weeks ago"),
            // UserEmailni o'rniga  firebasedagi password o'zgargan vaqtni ulash kerak
          ],
        ),
      ),
    );
  }

// Bu listtile buttonlari uchun Metod
  buttonMethod(String title, String icon, bool isSwitch, String subtitle,
      {Scaffold? nextPage}) {
    //NextPagega keyingi pageni ulash kerak
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getUniqueWidth(16.0),
        vertical: getUniqueHeight(8.0),
      ),
      child: SizedBox(
        height: getUniqueHeight(82.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: getUniqueHeight(8.16),
            horizontal: getUniqueWidth(16.0),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getUniqueWidth(16.0)),
              side: const BorderSide(color: ConstColor.kGreyBE)),
          title: Text(
            title,
            style: GoogleFonts.rubik(
                fontSize: getUniqueWidth(20),
                fontWeight: FontWeight.w500,
                color: ConstColor.dark),
          ),
          subtitle: subtitle != ""
              ? Text(
                  subtitle,
                  style: GoogleFonts.rubik(
                    fontSize: getUniqueWidth(14),
                    fontWeight: FontWeight.w400,
                    color: ConstColor.darkGrey,
                  ),
                )
              : null,
          leading: SvgPicture.asset(icon),
          trailing: isSwitch
              ? switchMethod()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nextPage ?? const HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }

  //Bu listtile uchun switch Funksiyasi
  Switch switchMethod() {
    return Switch(
      activeColor: ConstColor.kGreen5B,
      value: switchvalue,
      onChanged: (value) {
        setState(() {
          switchvalue = value;
        });
      },
    );
  }
}
