import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'title.dart';

class ProductListBlock extends StatelessWidget {
  const ProductListBlock({
    Key? key,
    required this.title,
    this.onTap,
    this.list,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Widget? list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomTitle(title: title),
              InkWell(
                onTap: onTap,
                child: const SubHeading2(
                  'View All',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        sizedBoxHeight(15),
        SizedBox(
          height: 315,
          child: list,
        ),
      ],
    );
  }
}
