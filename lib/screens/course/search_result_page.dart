import 'package:course/components/importing_packages.dart';
import 'package:flutter/cupertino.dart';

class SearchResultPage extends StatefulWidget {
  final String? searchText;

  const SearchResultPage({required this.searchText, Key? key})
      : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final CourseService _courseService = CourseMethod();

  final CategoryService _categoryService = CategoryMethod();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FutureBuilder(
        future: _courseService.getOnlyCourses(
            searchText: widget.searchText.toString()),
        builder: (context, snap) {
          if (snap.hasData) {
            return buildResultFound(snap);
          }
          if (snap.hasError) {
            return CustomTextWidget("Error");
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }

  Container buildResultFound(snap) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getUniqueWidth(16)),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SEARCH FIELD SECTION
          SafeArea(
            child: Container(
              height: getUniqueHeight(56),
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.fromLTRB(
                getUniqueWidth(0),
                getUniqueHeight(30),
                getUniqueWidth(0),
                getUniqueHeight(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconPath.out_back,
                    fit: BoxFit.none,
                    height: getUniqueWidth(48),
                  ),
                  Container(
                    width: getUniqueWidth(287),
                    padding: EdgeInsets.zero,
                    child:
                        TextFieldMark(hintText: "Search course", check: false),
                  ),
                ],
              ),
            ),
          ),

          // RESULT TEXT SECTION
          Padding(
            padding: EdgeInsets.only(
              bottom: getUniqueHeight(32),
            ),
            child: Text(
              "${snap.data!.length} Results for ${widget.searchText}",
              style: TextStyle(
                  fontSize: getUniqueWidth(24), fontWeight: FontWeight.w500),
            ),
          ),

          // FLEXIBLE SECTION
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snap.data!.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                Course course = snap.data![index];
                return CourseCard(
                  color: index % 2 == 0
                      ? ConstColor.kOrangeAccentF8
                      : ConstColor.kBlueAccentE6,
                  courseDescription: course.subtitle,
                  image: "assets/images/${course.imageUrl}.png",
                  addTime: "2 h 30 min",
                  title: course.title,
                  cost: "${course.price}",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(course),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
