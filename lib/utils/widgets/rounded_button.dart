import 'package:flutter/material.dart';

import '../export_utilities.dart';
import 'heading.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.cardColor,
    this.fontColor,
    required this.text,
    this.onTap,
    this.enableBorder = false,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final Color? cardColor;
  final Color? fontColor;
  final String? text;
  final bool? enableBorder;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          border: enableBorder!
              ? Border.all(
                  color: borderColor ?? Colour.black,
                  width: borderWidth ?? 1,
                )
              : Border.all(
                  color: Colour.transparent,
                  width: 0,
                ),
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: SubHeading2(
          text: text,
          color: fontColor,
        ),
      ),
    );
  }
}
