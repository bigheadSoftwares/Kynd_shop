import 'package:flutter/material.dart';

import '../export_utilities.dart';


Future<DateTime?> pickDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Colour.white,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
          colorScheme: ColorScheme.light(
            primary: Colour.blue.withOpacity(0.8),
            secondary: Colour.blue,
          ),
        ),
        child: child!,
      );
    },
  );
  return pickedDate;
}
