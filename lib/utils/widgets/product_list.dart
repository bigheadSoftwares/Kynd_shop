import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'product_card.dart';
import 'title.dart';

class ProductListBlock extends StatelessWidget {
  const ProductListBlock({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;

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
          height: 340,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            primary: false,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 14),
                child: ProductCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
