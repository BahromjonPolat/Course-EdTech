import 'package:course/components/importing_packages.dart';
import 'package:course/screens/personal/addpayment_nopayment_page.dart';
import 'package:course/screens/personal/saved_notsaved_page.dart';
import 'package:course/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: getUniqueHeight(53),
              left: getUniqueWidth(3.19),
              right: getUniqueWidth(3.19),
              bottom: getUniqueHeight(50.75)),
          height: 150.0,
          width: 148.99,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 5),
              borderRadius: BorderRadius.circular(90),
              color: ConstColor.kLightGrey),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(getUniqueWidth(90.0)),
              child: Image.asset(ImagePath.profile)),
        ),
        buttonMethod("Your Courses", context, nextPage: OwnersCoursesPage()),
        // Keyingi Pageni yozib qo'yish kerak
        buttonMethod("Saved", context, nextPage: SavedAndPage()),
        // Keyingi Pageni yozib qo'yish kerak
        buttonMethod("Payment", context, nextPage: PaymentAndPage()),
        // Keyingi Pageni yozib qo'yish kerak
        CustomTextButton(onPressed: () {}, label: "Log out")
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
            padding: EdgeInsets.only(left: getUniqueWidth(17)),
            child: InkWell(
              child: SvgPicture.asset(IconPath.out_back),
            )));
  }

  // Bu Keyingi pagega o'tadigan button uchun Metod
  buttonMethod(String title, context, {Widget? nextPage}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getUniqueWidth(16),
          vertical: getUniqueHeight(8.0),
        ),
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
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextPage!));
      },
    );
  }
}
