import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';


AppBar appBar(
  BuildContext context, {
  required String title,
  bool? automaticallyImplyLeading,
  Color? backgroundColor,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colour.transparent,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    title: Text(
      title,
      style: textTheme(context).bodyText1!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
    ),
    actions: actions,
  );
}
