import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          "Profile",
          style: GoogleFonts.rubik(
              fontSize: getUniqueHeight(24),
              fontWeight: FontWeight.w500,
              color: ConstColor.dark),
        ),
        leading: Padding(
          padding:  EdgeInsets.only(left: getUniqueWidth(17)),
          child: InkWell(
            child: SvgPicture.asset(IconPath.out_back),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: getUniqueHeight(53), left: getUniqueWidth(3.19), right: getUniqueWidth(3.19), bottom: getUniqueHeight(50.75)),
            height: 150.0,
            width: 148.99,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.circular(90),
                color: ConstColor.kLightGrey),
            child: Image.asset(ImagePath.profile),
          ),
          buttonMethod("Your Courses",context),// Keyingi Pageni yozib qo'yish kerak
          buttonMethod("Saved",context),// Keyingi Pageni yozib qo'yish kerak
          buttonMethod("Payment",context),// Keyingi Pageni yozib qo'yish kerak
          InkWell(
            child: Text(
              "Log out",
              style: GoogleFonts.rubik(fontSize: getUniqueHeight(14),color: ConstColor.darkGrey,fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  // Bu Keyingi pagega o'tadigan button uchun Metod
   buttonMethod(String title,context,{NextPage}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(getUniqueHeight(16)),
        alignment: Alignment.center,
        height: getUniqueHeight(80),
        width: getUniqueWidth(343),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ConstColor.kGreyBE)),
        child: Text(
          title,
          style: GoogleFonts.rubik(
              fontSize: getUniqueHeight(24),
              fontWeight: FontWeight.w500,
              color: ConstColor.dark),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
      },
    );
  }
}
