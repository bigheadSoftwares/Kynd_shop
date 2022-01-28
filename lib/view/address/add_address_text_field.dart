import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/export_utilities.dart';

class AddAddressTextField extends StatelessWidget {
  const AddAddressTextField({
    Key? key,
    required this.controller,
    this.validator,
    required this.label,
    this.onTap,
    this.readOnly = false,
    this.textInputFormatter,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SubHeading1(
          label,
          color: Colour.subtitleColor,
          size: 16,
        ),
        TextFormField(
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          cursorHeight: 20,
          cursorColor: Colour.greenishBlue,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          validator: validator,
          keyboardType: keyboardType == TextInputType.number
              ? keyboardType
              : TextInputType.visiblePassword,
          inputFormatters: textInputFormatter,
          decoration: InputDecoration(
            isDense: true,
            errorStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            border: UnderlineInputBorder(
              borderRadius: radius(10),
              borderSide: const BorderSide(
                color: Colour.subtitleColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: radius(10),
              borderSide: const BorderSide(
                color: Colour.greenishBlue,
              ),
            ),
          ),
        )
      ],
    );
  }
}
