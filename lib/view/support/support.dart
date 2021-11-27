import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Support',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            sizedBoxHeight(screenHeight(context) * 0.1),
            Image.asset(
              Assets.support,
              width: screenWidth(context) * 0.3,
            ),
            sizedBoxHeight(screenHeight(context) * 0.05),
            const Heading2(
              'Support 24/7',
              fontWeight: FontWeight.bold,
            ),
            sizedBoxHeight(screenHeight(context) * 0.02),
            const SubHeading1(
              'For any support request regards your orders please feel free to speak with us at below',
              color: Colour.subtitleColor,
              fontWeight: FontWeight.w300,
              centerText: true,
            ),
            sizedBoxHeight(screenHeight(context) * 0.2),
            const SubHeading2(
              'Call us - +91 7838597650',
              fontWeight: FontWeight.bold,
            ),
            const SubHeading2(
              'Mail us - liquor@gmail.com',
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
