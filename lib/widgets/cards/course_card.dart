import 'package:course/components/importing_packages.dart';

class CourseCard extends StatelessWidget {
  Color color;
  String courseDescription;
  String image;
  String title;
  String addTime;
  String cost;
  VoidCallback? onPressed;

  CourseCard(
      {required this.color,
      required this.courseDescription,
      required this.image,
      required this.title,
      required this.addTime,
      required this.cost,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed!,
      child: Container(
        margin: EdgeInsets.only(bottom: getUniqueHeight(16)),
        height: getUniqueHeight(304),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ConstColor.kGreyBE),
          borderRadius: BorderRadius.circular(
            getUniqueWidth(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: getUniqueHeight(194),
              padding: EdgeInsets.only(
                top: getUniqueHeight(16),
              ),
              child: Stack(
                children: [
                  Image.asset(image),
                  Positioned(
                    right: getUniqueWidth(16),
                    bottom: getUniqueHeight(8),
                    child: Chip(
                      label: Text(
                        "\$ $cost",
                        style: TextStyle(
                          fontSize: getUniqueWidth(14),
                          fontWeight: FontWeight.w500,
                          color: ConstColor.kWhite,
                        ),
                      ),
                      backgroundColor: ConstColor.kBlue65,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    getUniqueWidth(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                getUniqueWidth(16),
                getUniqueWidth(14),
                getUniqueWidth(16),
                getUniqueWidth(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addTime,
                    style: TextStyle(
                      color: ConstColor.kGreen5B,
                      fontSize: getUniqueWidth(12),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: getUniqueHeight(3)),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: getUniqueWidth(24),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: getUniqueHeight(5.9)),
                  Text(
                    courseDescription,
                    style: TextStyle(
                      fontSize: getUniqueWidth(14),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
