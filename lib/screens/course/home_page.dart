import 'package:flutter/cupertino.dart';
import 'package:course/components/importing_packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CourseService _courseService = CourseMethod();

  final CategoryService _categoryService = CategoryMethod();

  final TextEditingController _textController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: _pageList()[_currentIndex],
        bottomNavigationBar: _bottomNavBar());
  }

  SingleChildScrollView _buildBody() {
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
                    SvgPicture.asset('assets/icons/outlined_notification.svg',
                        height: getUniqueWidth(48)),
                  ],
                ),
              ),
            ),

            //SEARCH FIELD
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(top: getUniqueHeight(6)),
              child: TextFieldMark(hintText: "Search course"),
            ),

            // CATEGORIES SECTION
            _showCategories(),

            // COURSE CARD SECTION
            SizedBox(
              height: getUniqueHeight(500),
              child: FutureBuilder(
                future: _courseService.getAllCourses(),
                builder: (context, AsyncSnapshot<List<Course>> snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 3,
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
                    );
                  }

                  if (snap.hasError) {
                    return CustomTextWidget("Error");
                  }
                  return const CupertinoActivityIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _showCategories() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getUniqueHeight(24),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
          top: getUniqueHeight(12), bottom: getUniqueHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget("Category:"),
          Flexible(
              child: FutureBuilder(
            future: _categoryService.getAllCategories(),
            builder: (context, AsyncSnapshot<List<Category>> snap) {
              if (snap.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      Category category = snap.data![index];

                      return _buildChip(category.name);
                    });
              } else if (snap.hasError) {
                return CustomTextWidget("Error");
              }

              return const CupertinoActivityIndicator();
            },
          ))
        ],
      ),
    );
  }

  Widget _buildChip(text) {
    return Container(
      height: getUniqueHeight(24),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: getUniqueWidth(8.0)),
      padding: EdgeInsets.symmetric(
        vertical: getUniqueHeight(3),
        horizontal: getUniqueWidth(11),
      ),
      child: Text(
        "#$text",
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

  _searchFunction() {
    if (_textController.text.isNotEmpty) {
      _textController.clear();
      debugPrint("Search: _searchText");
    }
  }

  Container _bottomNavBar() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getUniqueWidth(16)),
            topRight: Radius.circular(getUniqueWidth(16)),
          ),
          border: Border.all(width: 1, color: ConstColor.kGreyBE),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getUniqueWidth(15)),
            topRight: Radius.circular(getUniqueWidth(15)),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (v) => setState(() => _currentIndex = v),
            unselectedItemColor: ConstColor.kGreyBE,
            selectedItemColor: ConstColor.kOrangeE35,
            // unselectedLabelStyle: ,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                    child: SvgPicture.asset(
                      IconPath.courses,
                      color: _currentIndex == 0
                          ? ConstColor.kOrangeE35
                          : ConstColor.kGreyBE,
                    ),
                  ),
                  label: "Courses"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                    child: SvgPicture.asset(
                      IconPath.profile,
                      color: _currentIndex == 1
                          ? ConstColor.kOrangeE35
                          : ConstColor.kGreyBE,
                    ),
                  ),
                  label: "Profile"),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                      top: getUniqueHeight(18), bottom: getUniqueHeight(8)),
                  child: SvgPicture.asset(
                    IconPath.settings,
                    color: _currentIndex == 2
                        ? ConstColor.kOrangeE35
                        : ConstColor.kGreyBE,
                  ),
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      );

  List<Widget> _pageList() => [
        _buildBody(),
        ProfilePage(),
        SettingsPage(),
      ];
}
