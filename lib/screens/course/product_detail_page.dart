import 'package:course/components/importing_packages.dart';

class ProductDetailPage extends StatelessWidget {
  Course course;

  ProductDetailPage(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: _buildAddCourseButton(context),
      body: Container(
        padding: EdgeInsets.fromLTRB(getUniqueWidth(16), getUniqueHeight(20),
            getUniqueWidth(16), getUniqueWidth(0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COURSE TITLE SECTION
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      IconPath.out_back,
                      fit: BoxFit.scaleDown,
                      height: getUniqueWidth(40),
                    ),
                    TitleText(course.title, textAlign: TextAlign.center),
                    const SizedBox(width: 40),
                  ],
                ),
              ),

              // IMAGE SECTION
              Container(
                margin: EdgeInsets.only(top: getUniqueHeight(16)),
                height: getUniqueHeight(257),
                child: Image.asset(
                  ImagePath.productDetail, //"assets/images/product_detail.png"
                  fit: BoxFit.scaleDown,
                ),
              ),

              Row(
                children: [
                  const Spacer(),
                  Chip(
                    label: Text(
                      "\$ ${course.price}",
                      style: TextStyle(
                          fontSize: getUniqueWidth(14),
                          fontWeight: FontWeight.w500,
                          color: ConstColor.kWhite),
                    ),
                    backgroundColor: ConstColor.kBlue65,
                  ),
                ],
              ),

              // ABOUT THE COURSE
              Padding(
                padding: EdgeInsets.only(
                    top: getUniqueHeight(24), bottom: getUniqueHeight(4)),
                child: const TitleText('About the course'),
              ),

              // ABOUT DESCRIPTION SECTION
              SizedBox(
                width: SizeConfig.screenWidth,
                child: CustomTextWidget(
                    course.about),
              ),

              // DURATION SECTION
              Padding(
                padding: EdgeInsets.only(
                    top: getUniqueHeight(24), bottom: getUniqueHeight(4)),
                child: CustomTextWidget(
                  "Duration",
                  size: 20,
                  color: ConstColor.kBlack,
                ),
              ),
              CustomTextWidget("1h 30min"),
             SizedBox(height: getUniqueHeight(64.0)),

              // ADD TO CART BUTTON SECTIO
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildAddCourseButton(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(
              left: getUniqueWidth(17),
              right: getUniqueWidth(17),
              bottom: getUniqueHeight(33),
            ),
            child:
                CustomElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> ChooseLessonsCoursePage(course)));
                }, label: "Add to card"),
          );
  }
}
