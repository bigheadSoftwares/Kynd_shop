import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onConfirm,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final VoidCallback onConfirm;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SubHeading1(title),
      content: SubHeading2(
        subtitle ?? '',
        color: Colour.subtitleColor,
        size: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: radius(8),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => pop(context),
          child: const SubHeading2(
            'Cancel',
            color: Colour.red,
            size: 14,
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const SubHeading2(
            'Confirm',
            size: 14,
            color: Colour.greenishBlue,
          ),
        ),
      ],
    );
  }
}