import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      onTap: onTap,
      hPadding: 10,
      vPadding: 10,
      radius: 30,
      color: Colour.greenishBlue,
      width: double.infinity,
      child: Center(
        child: SubHeading1(
          title,
          color: Colour.white,
        ),
      ),
    );
  }
}
