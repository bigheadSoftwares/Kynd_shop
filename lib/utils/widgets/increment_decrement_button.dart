import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    Key? key,
    this.onTapInc,
    this.onTapDec,
    required this.number,
    this.color,
  }) : super(key: key);
  final Function()? onTapInc;
  final Function()? onTapDec;
  final int number;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: onTapDec,
          icon: Icon(
            Icons.remove,
            color: color ?? Colour.greenishBlue,
            size: 18,
          ),
        ),
        RoundContainer(
          borderColor: Colour.greenishBlue,
          borderWidth: 1,
          radius: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
            child: SubHeading2(
              '$number',
              color: Colour.greenishBlue,
              size: 12,
            ),
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: onTapInc,
          icon: Icon(
            Icons.add,
            color: color ?? Colour.greenishBlue,
            size: 18,
          ),
        ),
      ],
    );
  }
}
