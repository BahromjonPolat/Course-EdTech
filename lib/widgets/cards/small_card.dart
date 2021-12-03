import 'package:course/components/importing_packages.dart';

class SmallCardMark extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final EdgeInsets? margin;

  const SmallCardMark(
      {required this.title,
      required this.image,
      required this.description,
      this.margin = EdgeInsets.zero,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ConstColor.kGreyBE),
          borderRadius: BorderRadius.circular(getUniqueWidth(8))),
      height: getUniqueHeight(88.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            image,
            height: getUniqueHeight(72.0),
            width: getUniqueWidth(78),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              getUniqueWidth(8),
              getUniqueHeight(17.5),
              getUniqueWidth(19),
              getUniqueHeight(17.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(title, size: 20),
                Container(
                  width: getUniqueWidth(222),
                  height: getUniqueHeight(11),
                  decoration: BoxDecoration(
                    color: ConstColor.kOrangeAccentF8,
                    borderRadius: BorderRadius.circular(
                      getUniqueHeight(5.5),
                    ),
                  ),
                  child: Container(
                    width: getUniqueWidth(220),
                    height: getUniqueHeight(9),
                    decoration: BoxDecoration(
                      color: ConstColor.kBlue65,
                      borderRadius: BorderRadius.circular(
                        getUniqueHeight(4.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
