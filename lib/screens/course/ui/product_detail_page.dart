import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB( getUniqueWidth(16),
        getUniqueHeight(20),
        getUniqueWidth(16),
        getUniqueWidth(0)),
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
                  const TitleText("HTML", textAlign: TextAlign.center),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // IMAGE SECTION
            Container(
              margin: EdgeInsets.only(top: getUniqueHeight(16)),
              height: getUniqueHeight(257),
              child: Image.asset(
                ImagePath.productDetail,//"assets/images/product_detail.png"
                fit: BoxFit.scaleDown,
              ),
            ),

            Row(
              children: [
               const  Spacer(),
                Chip(
                  label: Text(
                    "\$ 50",
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
              padding: EdgeInsets.only(top: getUniqueHeight(24), bottom: getUniqueHeight(4)),
              child: const TitleText('About the course'),
            ),

            // ABOUT DESCRIPTION SECTION
            SizedBox(width: SizeConfig.screenWidth,
              child: CustomTextWidget(
                  "You can launch a new career in web development today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust."),
            ),

            // DURATION SECTION
            Padding(
              padding: EdgeInsets.only(top: getUniqueHeight(24), bottom: getUniqueHeight(4)),
              child: CustomTextWidget("Duration", size: 20, color: ConstColor.kBlack,),
            ),
            CustomTextWidget("1h 30min"),
            const Spacer(),
            
            // ADD TO CART BUTTON SECTION
            Padding(
              padding: EdgeInsets.only(
                left: getUniqueWidth(17),
                right: getUniqueWidth(17),
                bottom: getUniqueHeight(33),
              ),
              child: CustomElevatedButton(onPressed: () {}, label: "Add to card"),
            )
          ],
        ),
      ),
    );
  }
}