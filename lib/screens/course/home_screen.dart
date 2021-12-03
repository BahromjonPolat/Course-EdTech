import 'package:course/components/importing_packages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(16)),
            child: Column(
              children: [
                // HEADER SECTION
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: getUniqueWidth(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: getUniqueWidth(16),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: getUniqueHeight(16)),
                            Text(
                              "Juana Antonietta",
                              style: TextStyle(
                                  fontSize: getUniqueWidth(32),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        //Container(width: getUniqueWidth(48),  height: getUniqueHeight(48),color: Colors.grey,)
                        SvgPicture.asset(
                            'assets/icons/outlined_notification.svg',
                            height: getUniqueWidth(48)),
                      ],
                    ),
                  ),
                ),

                //SEARCH FIELD
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(top: getUniqueHeight(6)),
                  child: TextFieldMark(
                      hintText: "Search course", check: true),
                ),

                // CATEGORIES SECTION
                Container(
                  height: getUniqueHeight(24),
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(
                      top: getUniqueHeight(12), bottom: getUniqueHeight(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget("Category:"),
                      _buildChip("#CSS"),
                      _buildChip("#UX"),
                      _buildChip("#Swift"),
                      _buildChip("#UI"),
                    ],
                  ),
                ),

                // COURSE CARD SECTION
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        color: index % 2 == 0
                            ? ConstColor.kOrangeAccentF8
                            : ConstColor.kBlueAccentE6,
                        courseDescription: "Advanced mobile interface design",
                        image: "assets/images/course_ui.png",
                        addTime: "2 h 30 min",
                        title: "UI",
                        cost: "50",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
  }

    Widget _buildChip(text) {
    return Container(
      height: getUniqueHeight(24),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: getUniqueHeight(3),
        horizontal: getUniqueWidth(11),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: ConstColor.kWhite,
            fontSize: getUniqueWidth(12),
            fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        color: ConstColor.kBlue65,
        borderRadius: BorderRadius.circular(
          getUniqueWidth(12),
        ),
      ),
    );
  }
}
