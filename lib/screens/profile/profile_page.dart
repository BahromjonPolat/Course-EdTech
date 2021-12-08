import 'package:course/components/importing_packages.dart';
import 'package:course/screens/admin_panel/upload_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CloudStoreService _userService = CloudStoreMethods();
  late UserModel _currentUser;

  @override
  void initState() {
    super.initState();
    _userService
        .getUserData(FirebaseAuth.instance.currentUser!.uid)
        .then((value) {
      _currentUser = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      appBar: _buildAppBar(),
      body: _buildBody(context),
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
        padding: EdgeInsets.only(
          left: getUniqueWidth(17),
        ),
        child: InkWell(
          child: SvgPicture.asset(IconPath.out_back),
        ),
      ),
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
            bottom: getUniqueHeight(24.0),
          ),
          height: getUniqueHeight(140.0),
          width: getUniqueWidth(140.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: ConstColor.kBlue65,
                width: getUniqueWidth(4.0),
              ),
              borderRadius: BorderRadius.circular(
                getUniqueWidth(90.0),
              ),
              color: ConstColor.kLightGrey),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              getUniqueWidth(90.0),
            ),
            child: InkWell(
              onTap: _chooseImageFromGallery,
              child: _showDefaultImage()
            ),
          ),
        ),
        buttonMethod("Your Courses", context, nextPage: const OwnersCoursesPage()),
        // Keyingi Pageni yozib qo'yish kerak
        buttonMethod("Saved", context, nextPage: SavedAndPage()),
        // Keyingi Pageni yozib qo'yish kerak
        buttonMethod("Payment", context, nextPage: PaymentAndPage()),
        // Keyingi Pageni yozib qo'yish kerak
        CustomTextButton(onPressed: _onLogOutButtonPressed, label: "Log out")
      ],
    );
  }

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
          border: Border.all(color: ConstColor.kGreyBE),
        ),
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

  void _onLogOutButtonPressed() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                const Icon(Icons.exit_to_app, color: ConstColor.error),
                SizedBox(width: getUniqueWidth(16.0)),
                CustomTextWidget("Exit", weight: FontWeight.bold, size: 18.0),
              ],
            ),
            content: SizedBox(
              height: getUniqueHeight(100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    "Do you really want to exit? I you exit, your profile will be closed!",
                  ),
                  SizedBox(
                    height: getUniqueHeight(42.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            label: "No",
                            color: ConstColor.error,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: getUniqueWidth(16.0)),
                        Expanded(
                          child: CustomElevatedButton(
                            label: "Yes",
                            color: ConstColor.kGreen5B,
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignInPage()),
                                  (route) => false);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _chooseImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // _pickedFile = PickedFile(image!.path);
    String imageName = FirebaseAuth.instance.currentUser!.uid + ".jpg";
    Reference ref =
        FirebaseStorage.instance.ref('EdTechImages').child(imageName);

    UploadTask task = ref.putFile(File(image!.path));
    String url = await (await task.whenComplete(() {
      Fluttertoast.showToast(msg: "Image was uploaded");
    }))
        .ref
        .getDownloadURL();

    await _userService.updateUser({'imageUrl': url}).whenComplete(() {
      setState(() {});
    });
  }

  Image _showDefaultImage()=> Image.asset(ImagePath.profile);
}
