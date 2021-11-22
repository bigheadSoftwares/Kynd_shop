import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';
import 'custom_button.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.buttonColor,
    this.textColor,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      backgroundColor: buttonColor ?? Colour.green,
      radius: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading)
              const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
            if (isLoading) sizedBoxWidth(10),
            Text(
              text!,
              style: textTheme(context).bodyText2!.copyWith(
                  color: textColor ?? Colour.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
