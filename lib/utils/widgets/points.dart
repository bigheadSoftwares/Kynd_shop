import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class Points extends StatelessWidget {
  const Points({
    Key? key,
    required this.points,
  }) : super(key: key);

  final double points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 1, 6, 1),
      decoration: BoxDecoration(
        borderRadius: radius(20),
        gradient: LinearGradient(
          colors: <Color>[
            Colour.greenishBlue,
            Colour.greenishBlue.withOpacity(0.6),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colour.greenishBlue,
            radius: 12,
            child: Image.asset(
              Assets.coin,
              scale: 2,
            ),
          ),
          sizedBoxWidth(2),
          SubHeading2(
            '$points Pts',
            color: Colour.white,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}