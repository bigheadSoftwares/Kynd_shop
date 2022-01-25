import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class CutMrp extends StatelessWidget {
  const CutMrp({
    Key? key,
    required this.mrp,
    this.size,
  }) : super(key: key);
  final int mrp;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SubHeading2(
          'MRP: ',
          size: size ?? 12,
          color: Colour.lightGrey,
        ),
        Text(
          '\$ $mrp',
          style: TextStyle(
            fontSize: size ?? 12,
            color: Colour.lightGrey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
