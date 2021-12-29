import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String msg,
  Color? backgroundColor,
  Color? textColor,
  int? showTime,
}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
    ..showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: showTime ?? 3000),
        backgroundColor: backgroundColor ?? Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        content: Text(
          msg,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 14),
        ),
      ),
    );
}
