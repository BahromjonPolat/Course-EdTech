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
              fontSize: getUniqueHeight(24),
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
            Container(
              height: getUniqueHeight(190),
              width: getUniqueWidth(343),
              margin: EdgeInsets.fromLTRB(
                getUniqueWidth(16),
                getUniqueHeight(28),
                getUniqueWidth(16),
                getUniqueHeight(16),
              ),
              child: Image.asset(ImagePath.setting),
            ),
            buttonMethod(
                "Notifications", IconPath.circleNotification, true, ""),
            Padding(
              padding: EdgeInsets.only(left: getUniqueHeight(16)),
              child: Text(
                "Account information",
                style: GoogleFonts.rubik(
                    fontSize: getUniqueHeight(20),
                    fontWeight: FontWeight.w500,
                    color: ConstColor.dark),
              ),
            ),
            buttonMethod("Name", IconPath.circleAccount, false,
                userEmail), // UserEmailni o'rniga  firebasedagi nameni ulash kerak
            buttonMethod("Email", IconPath.circleMail, false,
                userEmail), // UserEmailni o'rniga  firebasedagi emailni ulash kerak
            buttonMethod("Password", IconPath.circlePassword, false,
                userEmail), // UserEmailni o'rniga  firebasedagi password o'zgargan vaqtni ulash kerak
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

// Bu listtile buttonlari uchun Metod
  buttonMethod(String text, var icon, bool switchmi, String subt, 
      [var NextPage]) { //NextPagega keyingi pageni ulash kerak
    return Container(
      margin: EdgeInsets.all(getUniqueHeight(16)),
      alignment: Alignment.center,
      height: getUniqueHeight(82),
      width: getUniqueWidth(343),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ConstColor.kGreyBE)),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.rubik(
              fontSize: getUniqueHeight(20),
              fontWeight: FontWeight.w500,
              color: ConstColor.dark),
        ),
        subtitle: subt != ""
            ? Text(
                subt,
                style: GoogleFonts.rubik(
                    fontSize: getUniqueHeight(14),
                    fontWeight: FontWeight.w400,
                    color: ConstColor.dark),
              )
            : null,
        leading: SvgPicture.asset(icon),
        trailing: switchmi
            ? switchMethod()
            : IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextPage(),
            ),
          );
        },
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
