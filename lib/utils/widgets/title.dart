import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SubHeading1(
      title,
      color: Colour.darkBlue,
      size: 18,
      fontWeight: FontWeight.w500,
    );
  }
}
