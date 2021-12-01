import 'package:course/services/auth_service.dart';

import '../../components/importing_packages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final finalKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AuthService _authService = AuthMethods();
  bool eye = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                child: currentTextform("Name", _namecontroller, TextInputType.name,),
              ),
              Padding(
                padding: EdgeInsets.all(getUniqueHeight(14)),
                child: currentTextform("Email", _emailcontroller, TextInputType.emailAddress,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getUniqueHeight(14)),
                child: currentTextform(
                  "Password",
                  _passwordcontroller,
                  TextInputType.visiblePassword,
                  eye ?  Icons.remove_red_eye_outlined: Icons.remove_red_eye,
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
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => const SignInPage()));
                  },
                ),
              ),
            ],
          ),
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
  TextFormField currentTextform(
      String text,
      TextEditingController controller,
      TextInputType textInputType,
      [var icons]) {
    return TextFormField(

      validator: (text) {
        if (textInputType == TextInputType.emailAddress) {
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(controller.text)) {
            return "Email xato";
          }
        }
        else {
          if (text!.length < 4) {
           return "4 ta belgidan kam bo'lmasin";
       }
        }
      },
      controller: controller,
      keyboardType: textInputType,
      obscureText: textInputType == TextInputType.visiblePassword ? !eye: false,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.rubik(
            fontSize: SizeConfig.screenHeight / 58,
            fontWeight: FontWeight.w400,
            color: ConstColor.kDarkGrey),
        suffixIcon: IconButton(
          onPressed: () {
            eye = !eye;
            setState(() {});
          },
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

  void _onSignUpButtonPressed() async {
    String name = _namecontroller.text.trim();
    String email = _emailcontroller.text.trim().toLowerCase();
    String password = _passwordcontroller.text.trim();

    debugPrint('_SignUpPageState._onSignUpButtonPressed');
    debugPrint("$name  $email  $password" );


    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      try {
        await _authService
            .createUserWithEmailAndPassword(name, email, password)
            .then((value) {
          Fluttertoast.showToast(msg: value.uid);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint("Password is weak");
        } else if (e.code == 'email-already-in-use') {
          debugPrint("email-already-in-use");
          Fluttertoast.showToast(msg: "email-already-in-use",);

        }
      } catch (e) {
        debugPrint("$e");
      }
    }else{
       Fluttertoast.showToast(msg: "Please, fill all fields" );
       _passwordcontroller.clear();
       debugPrint("Hello world");
    }

    // try {
    //     await _authService
    //         .createUserWithEmailAndPassword(name, email, password)
    //         .then((value) {
    //       Fluttertoast.showToast(msg: value.uid);
    //     });
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       debugPrint("Password is weak");
    //     } else if (e.code == 'email-already-in-use') {
    //       debugPrint("email-already-in-use");
    //     }
    //   } catch (e) {
    //     debugPrint("e");
    //   }


    // if (name.isEmpty || email.isEmpty || password.isEmpty) {
    //   Fluttertoast.showToast(msg: "Please, fill all fields" );
    //   debugPrint("object");
    //   return;
    // }


  }
}
