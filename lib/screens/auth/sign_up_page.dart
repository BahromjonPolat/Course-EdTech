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
                  height: SizeConfig.screenHeight / 2.36,
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight / 8.45,
                      bottom: SizeConfig.screenHeight / 50.75),
                  child: Image.asset(ImagePath.signUp),
                ),
                Positioned(
                  child: Container(
                    height: SizeConfig.screenHeight / 16.91,
                    width: SizeConfig.screenHeight / 16.91,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(IconPath.out_back),
                  ),
                  left: SizeConfig.screenWidth / 25,
                  top: SizeConfig.screenHeight / 11.6,
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth / 11.36,
                    bottom: SizeConfig.screenHeight / 101.5),
                height: SizeConfig.screenHeight / 25.75,
                width: SizeConfig.screenWidth / 1.09,
                child: returnText("Sign Up", SizeConfig.screenHeight / 33.83,
                    FontWeight.w500, ConstColor.dark)),
            Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth / 11.36,
                    bottom: SizeConfig.screenHeight / 50.75),
                height: SizeConfig.screenHeight / 38.66,
                width: SizeConfig.screenWidth / 1.09,
                child: returnText(
                    "Create your account",
                    SizeConfig.screenHeight / 54,
                    FontWeight.w400,
                    ConstColor.darkGrey)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenHeight / 50.75),
              child: currentTextform("Name", _namecontroller),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.screenHeight / 50.75),
              child: currentTextform("Email", _emailcontroller),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenHeight / 50.75),
              child: currentTextform(
                "Password",
                _passwordcontroller,
                Icons.remove_red_eye_outlined,
              ),
            ),
            InkWell(
              child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.screenHeight / 14.5,
                  width: SizeConfig.screenWidth / 1.09,
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight / 50.75),
                  decoration: BoxDecoration(
                    color: ConstColor.kOrangeE35,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: returnText("Sign up", SizeConfig.screenHeight / 50.75,
                      FontWeight.w500, ConstColor.kWhite)),
              onTap: _onSignUpButtonPressed,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth / 2.34,
                  0,
                  SizeConfig.screenWidth / 2.31,
                  SizeConfig.screenHeight / 12.68),
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
