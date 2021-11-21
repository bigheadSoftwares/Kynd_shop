import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../logic/theme/theme_cubit.dart';
import '../export_utilites.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: textTheme(context).caption!.copyWith(
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color ?? theme(context).colorScheme.secondary,
            fontSize: size ?? font8,
          ),
    );
  }
}

// class SubHeading1 extends StatelessWidget {
//   const SubHeading1({
//     Key? key,
//     required this.text,
//     this.color,
//     this.centerText = false,
//     this.size,
//     this.fontWeight,
//     this.darkText = false,
//     this.lines,
//   }) : super(key: key);
//   final String? text;
//   final Color? color;
//   final bool centerText;
//   final double? size;
//   final FontWeight? fontWeight;
//   final bool darkText;
//   final int? lines;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text ?? '',
//       maxLines: lines,
//       style: textTheme(context).bodyText2!.copyWith(
//             fontSize: size ?? 14,
//             fontWeight: fontWeight ?? FontWeight.w400,
//             color: color ??
//                 (darkText
//                     ? theme(context).colorScheme.secondary
//                     : Colour.lightGrey),
//           ),
//       textAlign: centerText ? TextAlign.center : TextAlign.start,
//     );
//   }
// }

class SubHeading2 extends StatelessWidget {
  const SubHeading2({
    Key? key,
    required this.text,
    this.color,
    this.centerText = false,
    this.darkText = false,
    this.size,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);
  final String? text;
  final Color? color;
  final bool centerText;
  final bool darkText;
  final double? size;
  final FontWeight? fontWeight;

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: textTheme(context).subtitle1!.copyWith(
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: size,
            color: color ??
                (darkText == true
                    ? theme(context).colorScheme.secondary
                    : Colour.lightGrey),
          ),
      textAlign: textAlign,
    );
  }
}
