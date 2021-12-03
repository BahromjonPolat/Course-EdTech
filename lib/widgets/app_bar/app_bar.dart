import 'package:course/components/importing_packages.dart';

AppBar setCustomAppBar({String title = ""}) =>  AppBar(
  backgroundColor: ConstColor.kTransparent,
  elevation: 0.0,
  title: CustomTextWidget(
    title,
    size: getUniqueWidth(24.0),
    color: ConstColor.kDark,
  ),
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  centerTitle: true,
  leading: CustomIconButton(
    onPressed: () {},
    svgIcon: IconPath.out_back,
    size: 40,
  ),
);
