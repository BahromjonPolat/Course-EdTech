import '../../components/importing_packages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              height: SizeConfig.screenHeight / 2.36,
              margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight / 8.45,
                  bottom: SizeConfig.screenHeight / 50.75),
              child: Image.asset(ImagePath.login),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth / 11.36,
                    bottom: SizeConfig.screenHeight / 101.5),
                height: SizeConfig.screenHeight / 25.75,
                width: SizeConfig.screenWidth / 1.09,
                child: returnText("Log in", SizeConfig.screenHeight / 33.83,
                    FontWeight.w500, ConstColor.dark)),
            Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth / 11.36,
                    bottom: SizeConfig.screenHeight / 101.5),
                height: SizeConfig.screenHeight / 38.66,
                width: SizeConfig.screenWidth / 1.09,
                child: returnText(
                    "Log in with social networks",
                    SizeConfig.screenHeight / 54,
                    FontWeight.w400,
                    ConstColor.darkGrey)),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth / 2.85,
                  right: SizeConfig.screenWidth / 3.76),
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
              padding: EdgeInsets.all(SizeConfig.screenHeight / 50.75),
              child: currentTextform("Email", _emailcontroller),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenHeight / 50.75),
              child: currentTextform(
                "Password",
                _passwordcontroller,
                Icons.remove_red_eye,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth / 2.99,
                vertical: SizeConfig.screenHeight / 50.75,
              ),
              child: InkWell(
                child: returnText(
                    "Forgot Password?",
                    SizeConfig.screenHeight / 58,
                    FontWeight.w500,
                    ConstColor.darkGrey),
                onTap: () {},
              ),
            ),
            InkWell(
              child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.screenHeight / 14.5,
                  width: SizeConfig.screenWidth / 1.09,
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight / 50.75),
                  decoration: BoxDecoration(
                    color: ConstColor.kOrangeE35,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: returnText("Log in", SizeConfig.screenHeight / 50.75,
                      FontWeight.w500, ConstColor.kWhite)),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth / 2.34,
                  0,
                  SizeConfig.screenWidth / 2.31,
                  SizeConfig.screenHeight / 12.68),
              child: InkWell(
                child: returnText("Sign up", SizeConfig.screenHeight / 58,
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
          borderSide: const BorderSide(color: ConstColor.kGreyBE),
        ),
      ),
    );
  }

  svgiconsMethod(dynamic Svgpicture) {
    return InkWell(
      child: SvgPicture.asset(Svgpicture),
    );
  }
}
