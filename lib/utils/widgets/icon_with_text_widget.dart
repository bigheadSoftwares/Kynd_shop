import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.iconColor,
    this.textColor,
    this.textSize,
    this.fontWeight,
  }) : super(key: key);

  final String icon;
  final String text;
  final double? iconSize;
  final double? textSize;
  final Color? iconColor;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: ImageIcon(
        AssetImage(icon),
        size: iconSize ?? 10,
        color: iconColor ?? Colour.black,
      ),
      title: Text(
        text,
        style: textTheme(context).bodyText2!.copyWith(
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: textSize ?? 12,
              color: textColor ?? Colour.lightGrey,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
