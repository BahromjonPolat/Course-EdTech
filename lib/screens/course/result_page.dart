import 'package:course/components/importing_packages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.kWhite,
      appBar: setCustomAppBar(title: "Result"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            ImagePath.result,
            width: MediaQuery.of(context).size.width,
            height: getUniqueHeight(253.0),
          ),
          SizedBox(height: getUniqueHeight(32.0)),
          CustomTextWidget("Congratulations", size: 24.0),
          SizedBox(height: getUniqueHeight(8.0)),
          CustomTextWidget(
            "Congratulations for getting \nall the answers correct!",
            textAlign: TextAlign.center,
            lineHeight: 1.3,
            color: ConstColor.kDarkGrey,
          ),
          const Spacer(),
          _showSocialNetworkButtons(),
          SizedBox(height: getUniqueHeight(40.0)),
        ],
      ),
    );
  }

  Row _showSocialNetworkButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          onPressed: () {},
          svgIcon: IconPath.facebook,
          size: 40,
        ),
        SizedBox(width: getUniqueWidth(8.0)),
        CustomIconButton(
          onPressed: () {},
          svgIcon: IconPath.instagram,
          size: 40,
        ),
        SizedBox(width: getUniqueWidth(8.0)),
        CustomIconButton(
          onPressed: () {},
          svgIcon: IconPath.google,
          size: 40,
        ),
      ],
    );
  }
}
