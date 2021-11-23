import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

AppBar appBar(
  BuildContext context, {
  required String title,
  bool? automaticallyImplyLeading,
  double? elevation,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colour.blue,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    elevation: elevation,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colour.white,
      ),
      onPressed: () => pop(context),
    ),
    title: Text(
      title,
      style: textTheme(context).bodyText1!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colour.white,
          ),
    ),
    actions: actions,
  );
}

