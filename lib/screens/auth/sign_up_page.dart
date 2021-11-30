import 'package:course/services/auth_service.dart';

import '../../components/importing_packages.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final finalKey = GlobalKey();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final AuthService _authService = AuthMethods();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: getUniqueHeight(253),
                  margin: EdgeInsets.only(
                      top: getUniqueHeight(102), bottom: getUniqueHeight(16)),
                  child: Image.asset(ImagePath.signUp),
                ),
                Positioned(
                  child: Container(
                    height: getUniqueHeight(48),
                    width: getUniqueWidth(48),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(IconPath.out_back),
                  ),
                  right: getUniqueHeight(290),
                  top: getUniqueHeight(60),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(
                    left: getUniqueWidth(32), bottom: getUniqueHeight(8)),
                height: SizeConfig.screenHeight / 25.75,
                width: SizeConfig.screenWidth / 1.09,
                child: returnText("Sign Up", getUniqueHeight(24),
                    FontWeight.w500, ConstColor.dark)),
            Container(
                margin: EdgeInsets.only(
                  left: getUniqueWidth(32),
                  bottom: getUniqueHeight(16),
                ),
                height: getUniqueHeight(21),
                width: getUniqueWidth(341),
                child: returnText("Create your account", getUniqueHeight(14),
                    FontWeight.w400, ConstColor.darkGrey)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getUniqueHeight(14)),
              child: currentTextform("Name", _namecontroller),
            ),
            Padding(
              padding: EdgeInsets.all(getUniqueHeight(14)),
              child: currentTextform("Email", _emailcontroller),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getUniqueHeight(14)),
              child: currentTextform(
                "Password",
                _passwordcontroller,
                Icons.remove_red_eye_outlined,
              ),
            ),
            InkWell(
              child: Container(
                  alignment: Alignment.center,
                  height: getUniqueHeight(56),
                  width: getUniqueWidth(343),
                  margin: EdgeInsets.symmetric(vertical: getUniqueHeight(16)),
                  decoration: BoxDecoration(
                    color: ConstColor.kOrangeE35,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: returnText("Sign up", getUniqueHeight(16),
                      FontWeight.w500, ConstColor.kWhite)),
              onTap: _onSignUpButtonPressed,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                getUniqueWidth(168),
                0,
                getUniqueWidth(165),
                getUniqueHeight(69),
              ),
              child: InkWell(
                child: returnText("Log in", SizeConfig.screenHeight / 58,
                    FontWeight.w500, ConstColor.darkGrey),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Text return qiluvchi Metod
  Text returnText(
      [String? currentText,
      double? fontsize,
      FontWeight? fontweight,
      Color? textColor]) {
    return Text(
      currentText!,
      style: GoogleFonts.rubik(
          fontSize: fontsize, fontWeight: fontweight, color: textColor),
      textAlign: TextAlign.center,
    );
  }

//Textform return qiluvchi Metod
  TextFormField currentTextform(String text, TextEditingController controller,
      [var icons]) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.rubik(
            fontSize: SizeConfig.screenHeight / 58,
            fontWeight: FontWeight.w400,
            color: ConstColor.kDarkGrey),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            icons,
            color: ConstColor.kDarkGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ConstColor.kGreyBE),
        ),
      ),
    );
  }

//Svg iconlarni Inkwell ichida return qiladigan metod
  svgiconsMethod(dynamic Svgpicture) {
    return InkWell(
      child: SvgPicture.asset(Svgpicture),
    );
  }

  void _onSignUpButtonPressed() async {
    String name = _namecontroller.text.trim();
    String email = _emailcontroller.text.trim().toLowerCase();
    String password = _passwordcontroller.text.trim();

    print('_SignUpPageState._onSignUpButtonPressed');
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please, fill all fields");
      print("object");
      return;
    }

    try {
      await _authService
          .createUserWithEmailAndPassword(name, email, password)
          .then((value) {
        Fluttertoast.showToast(msg: value.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password is weak");
      } else if (e.code == 'email-already-in-use') {
        print("email-already-in-use");
      }
    } catch (e) {
      print("e");
    }
  }
}
