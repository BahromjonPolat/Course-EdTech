import 'package:course/components/image_path.dart';
import 'package:course/components/importing_packages.dart';
import 'package:course/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentAndPage extends StatelessWidget {
  PaymentAndPage({Key? key}) : super(key: key);

  bool _isPayment = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 11.67,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/arrow_back.svg",
                      height: getUniqueWidth(40),
                      width: getUniqueWidth(40),
                      fit: BoxFit.none,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Payment",
                    style: TextStyle(
                      color: ConstColor.kDarkGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: getUniqueWidth(40.0)),
                ],
              ),
            ),
            SizedBox(
              height: getUniqueHeight(127),
            ),
            Container(
              child: SvgPicture.asset(
                _isPayment ? ImagePath.paymentAdded : ImagePath.noPayment,
                height: getUniqueHeight(253),
                width: getUniqueWidth(375),
              ),
            ),
            SizedBox(
              height: getUniqueHeight(32),
            ),
            Text(
              _isPayment ? "Payment method added" : "No payment method",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getUniqueHeight(8),
            ),
            Container(
              height: getUniqueHeight(42),
              width: getUniqueWidth(190),
              child: CustomTextWidget(
                _isPayment
                    ? "You can buy the course now. Continue to payment"
                    : "You don't have any payment method",
              ),
            ),
            SizedBox(
              height: getUniqueHeight(32),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 33.00,
              ),
              child: CustomElevatedButton(
                onPressed: () {},
                label: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
