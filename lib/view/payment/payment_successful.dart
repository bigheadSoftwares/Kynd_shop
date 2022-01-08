import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.greenishBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomImageWidget(
              image: Assets.check1,
              scale: 2,
            ),
            // sizedBoxHeight(20),
            // const SubHeading2(
            //   'Ref Id: 24223',
            //   size: 18,
            //   fontWeight: FontWeight.bold,
            //   color: Colour.white,
            // ),
            SubHeading2(
              'Payment Successful!',
              size: 26,
              fontWeight: FontWeight.bold,
              color: Colour.white.withOpacity(0.5),
            ),
            SubHeading2(
              'We are delighted to inform you that we received your payments',
              size: 16,
              fontWeight: FontWeight.bold,
              color: Colour.white.withOpacity(0.5),
              centerText: true,
            ),
            sizedBoxHeight(20),
            RoundContainer(
              onTap: () {
                pushReplacementNamed(context, Routes.myOrders);
              },
              hPadding: 20,
              vPadding: 10,
              radius: 30,
              borderColor: Colour.white,
              borderWidth: 1.5,
              child: const SubHeading2(
                'Go to My Orders',
                fontWeight: FontWeight.bold,
                color: Colour.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
