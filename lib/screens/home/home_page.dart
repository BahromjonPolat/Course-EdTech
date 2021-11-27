import 'package:flutter/material.dart';
import 'package:course/components/importing_packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
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
                    SvgPicture.asset('assets/icons/outlined_notification.svg',
                        height: getUniqueWidth(48)),
                  ],
                ),
              ),
            ),
            //SEARCH FIELD
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(vertical: getUniqueHeight(6)),
              child: TextFieldMark(hintText: "Search course", onPressed: _searchFunction)
            ),
            // CATEGORIES SECTION
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget("Category:"),
                _buildChip( "#CSS"),
                _buildChip( "#UX"),
                _buildChip( "#Swift"),
                _buildChip( "#UI"),
              ],
            ),
            CourseCard(
              color: ConstColor.kOrangeAccentF8,
              courseDescription: "Advanced mobile interface design",
              image: "assets/images/course_ui.png",
              addTime: "2 h 30 min",
              title: "UI",
              cost: "50",
            ),
          ],
        ),
      ),
    );
  }

  Chip _buildChip(text) {
    return Chip(
                padding: EdgeInsets.all(getUniqueWidth(7)),
                label: Text(
                 text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getUniqueWidth(12),
                      fontWeight: FontWeight.w500),
                ),
                backgroundColor: ConstColor.kBlue65,
              );
  }

  _searchFunction() {
    if(_textController.text.isNotEmpty){
      _textController.clear();
      debugPrint("Search: _searchText");
    }
  }
}
