import 'package:course/screens/auth/sign_up_page.dart';

import '../../components/importing_packages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _authService = AuthMethods();

  final finalKey = GlobalKey();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getUniqueHeight(253),
              margin: EdgeInsets.only(
                  top: getUniqueHeight(96), bottom: getUniqueHeight(16)),
              child: Image.asset(ImagePath.login),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: getUniqueWidth(33), bottom: getUniqueHeight(8)),
                height: getUniqueHeight(32),
                width: getUniqueWidth(341),
                child: returnText("Log in", getUniqueHeight(24),
                    FontWeight.w500, ConstColor.dark)),
            Container(
                margin: EdgeInsets.only(
                    left: getUniqueWidth(33), bottom: getUniqueHeight(8)),
                height: getUniqueHeight(21),
                width: getUniqueWidth(341),
                child: returnText("Log in with social networks",
                    getUniqueHeight(14), FontWeight.w400, ConstColor.darkGrey)),
            Padding(
              padding: EdgeInsets.only(
                  left: getUniqueWidth(131.5), right: getUniqueWidth(116.93)),
              child: SizedBox(
                width: SizeConfig.screenWidth / 2.60,
                height: SizeConfig.screenHeight / 20.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    svgiconsMethod(IconPath.facebook),
                    svgiconsMethod(IconPath.instagram),
                    svgiconsMethod(IconPath.google),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                getUniqueHeight(16),
              ),
              child: currentTextform("Email", _emailcontroller),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(16),
              ),
              child: currentTextform(
                "Password",
                _passwordcontroller,
                Icons.remove_red_eye,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getUniqueWidth(122),
                vertical: getUniqueHeight(16),
              ),
              child: InkWell(
                child: returnText(
                    "Forgot Password?",
                    getUniqueHeight(14),
                    FontWeight.w500,
                    ConstColor.darkGrey),
                onTap: () {},
              ),
            ),
            InkWell(
              child: Container(
                  alignment: Alignment.center,
                  height: getUniqueHeight(56),
                  width: getUniqueWidth(343),
                  margin:
                      EdgeInsets.only(bottom: getUniqueHeight(16)),
                  decoration: BoxDecoration(
                    color: ConstColor.kOrangeE35,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: returnText("Log in", getUniqueHeight(16),
                      FontWeight.w500, ConstColor.kWhite)),
              onTap: _onSignInButtonPressed,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                 getUniqueWidth(155),
                0,
                getUniqueWidth(155),
                getUniqueHeight(69),),
              child: InkWell(
                child: returnText("Sign up", SizeConfig.screenHeight / 58,
                    FontWeight.w500, ConstColor.darkGrey),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                },
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
          borderSide: const BorderSide(color: ConstColor.kGreyBE),
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

  void _onSignInButtonPressed() async {
    String email = _emailcontroller.text.trim();
    String password = _passwordcontroller.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please, Fill all fields");
      return;
    }
    try {
      await _authService
          .signInWithEmailAndPassword(email, password)
          .whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
