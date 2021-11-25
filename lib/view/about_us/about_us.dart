import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'About Us',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        children: <Widget>[
          const Heading2(
            'What is Lorem Ipsum?',
            size: 14,
          ),
          const SubHeading2(
            Constants.loremIpsum,
            size: 12,
            color: Colour.subtitleColor,
          ),
          sizedBoxHeight(16),
          const Heading2(
            'Where can I get some?',
            size: 14,
          ),
          const SubHeading2(
            Constants.loremIpsum,
            size: 12,
            color: Colour.subtitleColor,
          ),
        ],
      ),
    );
  }
}
