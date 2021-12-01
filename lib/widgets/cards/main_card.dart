import 'package:course/components/importing_packages.dart';

class MainCardMark extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MainCardMark(
      {required this.title,
      required this.image,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ConstColor.kGreyBE),
        borderRadius: BorderRadius.circular(
          getUniqueWidth(8),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: getUniqueHeight(16.0),
      ),
      height: getUniqueHeight(440.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CARD IMACE SECTION
          Container(
            decoration: BoxDecoration(
              color: ConstColor.kOrangeAccentF8,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  getUniqueWidth(8),
                ),
              ),
            ),
            height: getUniqueHeight(334.0),
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  height: getUniqueHeight(276.0),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: getUniqueWidth(8.0),
                    bottom: getUniqueHeight(8.0),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        IconPath.play,
                        fit: BoxFit.scaleDown,
                        height: getUniqueHeight(48.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // CARD TITLE SECTION
          Padding(
            padding: EdgeInsets.fromLTRB(
              getUniqueWidth(16),
              getUniqueHeight(24),
              getUniqueWidth(16),
              getUniqueHeight(8),
            ),
            child: TitleText(title),
          ),

          // CARD DESCRIPTION SECTION
          Padding(
            padding: EdgeInsets.only(left: getUniqueWidth(16)),
            child: CustomTextWidget(
              description,
              color: ConstColor.kDarkGrey,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
