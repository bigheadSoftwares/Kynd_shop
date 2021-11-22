import 'package:flutter/material.dart';

import '../export_utilities.dart';

class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Colour.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(5, 8),
            blurRadius: 10,
            color: Color(0x26686A70),
          ),
        ],
      ),
      child: child,
    );
  }
}
