import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    Key? key,
    required this.title,
    required this.amount,
    this.isBold = false,
    this.size,
    this.color,
  }) : super(key: key);
  final String title;
  final String amount;
  final bool? isBold;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SubHeading2(
            title,
            size: size ?? 12,
            color: color,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.w500,
          ),
          SubHeading2(
            '${Constants.rupee}$amount',
            size: size ?? 12,
            color: color,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
